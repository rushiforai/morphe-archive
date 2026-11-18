package app.waylo.patches.podcastaddict

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.waylo.patches.podcastaddict.Constants.COMPATIBILITY_PODCAST_ADDICT
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS = "Lapp/waylo/extension/podcastaddict/PlaylistSwipeToRemove;"
private const val HOST_INTERFACE = "Lapp/waylo/extension/podcastaddict/PlaylistRemoveHost;"
private const val HOST_METHOD = "swipeRemoveAt"

// The drag-sort list stores its floating drag view in a field typed FrameLayout in build 21719 (2026.7)
// and plain View in later builds. It is the list's only field of either type.
private val FLOAT_VIEW_TYPES = setOf("Landroid/widget/FrameLayout;", "Landroid/view/View;")

@Suppress("unused")
val playlistSwipeToRemovePatch = patch(
    name = "Swipe to remove from playlist",
    description = "Swipe an episode left or right in the Playlist to remove it from the playlist. " +
            "Swiping between the Playlist tabs no longer works, tapping the tab titles does.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PODCAST_ADDICT)

    extendWith("extensions/extension.mpe")

    execute {
        // Since 2026.14.1 the Playlist is a RecyclerView, without the drag-sort ListView.
        if (classDefByOrNull(DRAG_SORT_LIST_CLASS) == null) {
            patchRecyclerPlaylist()
            return@execute
        }

        // ---------------------------------------------------------------------------------
        // 1. Hook the touch handling of the drag-sort list.
        //
        // The list has a field for its floating drag view, which is non-null only while an
        // episode is being dragged to reorder it. It is passed along so a swipe never takes over
        // from a reorder drag. It is the list's only field of the types in FLOAT_VIEW_TYPES.
        // ---------------------------------------------------------------------------------
        val floatViewField = mutableClassDefBy(DRAG_SORT_LIST_CLASS)
            .instanceFields
            .filter { field -> field.type in FLOAT_VIEW_TYPES }
            .let { candidates ->
                candidates.singleOrNull()
                    ?: throw PatchException(
                        "Expected exactly one floating view field in the drag-sort list, found " +
                                candidates.map { "${it.name}:${it.type}" }
                    )
            }

        fun MutableMethod.hookTouch(extensionMethod: String) {
            // The injected code uses a non-range invoke, which only takes registers v0..v15.
            val secondParameter = p0Register + 1
            require(secondParameter <= 15) {
                "Cannot hook $name: parameter register p1 is v$secondParameter (> v15)"
            }

            val free = findFreeRegister(0, p0Register, secondParameter)

            addInstructionsWithLabels(
                0,
                """
                    iget-object v$free, p0, $floatViewField
                    invoke-static { p0, p1, v$free }, $EXTENSION_CLASS->$extensionMethod(Landroid/widget/ListView;Landroid/view/MotionEvent;Landroid/view/View;)Z
                    move-result v$free
                    if-eqz v$free, :patch_continue
                    return v$free
                    :patch_continue
                    nop
                """
            )
        }

        DragSortInterceptTouchFingerprint.method.hookTouch("onIntercept")
        DragSortTouchFingerprint.method.hookTouch("onTouch")

        // ---------------------------------------------------------------------------------
        // 2. Tell the extension which list is the Playlist.
        //
        // Only the Playlist registers a remove listener on its list, and that listener class
        // gets the host interface below. setRemoveListener(listener) is called on the list (p0).
        // ---------------------------------------------------------------------------------
        DragSortSetRemoveListenerFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1 }, $EXTENSION_CLASS->onRemoveListenerSet(Landroid/widget/ListView;Ljava/lang/Object;)V"
        )

        // ---------------------------------------------------------------------------------
        // 3. Reset recycled rows.
        //
        // getView(position, convertView, parent). The adapter's own rows are recycled, so a row
        // that was swiped away must be restored before it is shown again. p2 is a high register
        // in this large method, so a range invoke is required.
        // ---------------------------------------------------------------------------------
        PlaylistAdapterGetViewFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p2 .. p2 }, $EXTENSION_CLASS->resetRow(Landroid/view/View;)V"
        )

        // ---------------------------------------------------------------------------------
        // 4. Add the host method to the Playlist's remove listener class.
        //
        // It removes the episode through the Playlist fragment's own dequeue method, the same
        // method the "Remove from Playlist" menu item calls. The adapter items are episode ids.
        // ---------------------------------------------------------------------------------
        val fragmentType = PlaylistDequeueFingerprint.originalClassDef.type
        val dequeueName = PlaylistDequeueFingerprint.originalMethod.name
        val adapterType = PlaylistAdapterClassFingerprint.originalClassDef.type
        val removeListenerType = DragSortSetRemoveListenerFingerprint.originalMethod
            .parameterTypes.first().toString()

        // True when the playlist type is 0, the type that has no "Remove from Playlist".
        val noRemoveField = PlaylistTypeFingerprint.instructionMatches.first().fieldReference
        val noRemoveFieldSmali = "${noRemoveField.definingClass}->${noRemoveField.name}:${noRemoveField.type}"

        val adapterField = mutableClassDefBy(fragmentType)
            .instanceFields
            .singleOrNull { field -> field.type == adapterType }
            ?: throw PatchException("Playlist fragment has no single field of the adapter type $adapterType")

        val listenerClass = classDefByOrNull { classDef ->
            !AccessFlags.INTERFACE.isSet(classDef.accessFlags) &&
                    classDef.interfaces.contains(removeListenerType) &&
                    classDef.fields.any { field -> field.type == fragmentType }
        } ?: throw PatchException(
            "No class implements the remove listener $removeListenerType and holds the fragment $fragmentType"
        )

        mutableClassDefBy(listenerClass).apply {
            interfaces.add(HOST_INTERFACE)

            val fragmentField = instanceFields.singleOrNull { field -> field.type == fragmentType }
                ?: throw PatchException("Remove listener class has no single field of the fragment type $fragmentType")

            methods.add(
                ImmutableMethod(
                    type,
                    HOST_METHOD,
                    listOf(ImmutableMethodParameter("I", null, null)),
                    "V",
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    // v0..v3 + p0 (this) + p1 (position).
                    MutableMethodImplementation(6),
                ).toMutable().apply {
                    addInstructionsWithLabels(
                        0,
                        """
                            iget-object v0, p0, $fragmentField
                            iget-boolean v1, v0, $noRemoveFieldSmali
                            if-nez v1, :end
                            iget-object v1, v0, $adapterField
                            if-eqz v1, :end
                            if-ltz p1, :end
                            invoke-virtual { v1 }, Landroid/widget/ArrayAdapter;->getCount()I
                            move-result v2
                            if-ge p1, v2, :end
                            invoke-virtual { v1, p1 }, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;
                            move-result-object v1
                            if-eqz v1, :end
                            invoke-static { v1 }, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;
                            move-result-object v1
                            invoke-virtual { v0, v1 }, $fragmentType->$dequeueName(Ljava/util/Set;)V
                            :end
                            return-void
                        """
                    )
                }
            )
        }
    }
}

/**
 * The Playlist on 2026.14.1 and later: a RecyclerView based list. The swipe runs the long press
 * menu's "Remove" (see RecyclerSwipe and ContextMenuAction), so only two things are hooked: the
 * list's touch handling, and the Playlist fragment assigning its list, to register it.
 */
private fun patchRecyclerPlaylist() {
    val fragmentType = PlaylistFragmentTagFingerprint.originalClassDef.type
    val listField = classDefBy(fragmentType).fields
        .filter { field -> !AccessFlags.STATIC.isSet(field.accessFlags) && field.type.endsWith("RecyclerView;") }
        .let { candidates ->
            candidates.singleOrNull() ?: throw PatchException(
                "Expected exactly one RecyclerView field in the Playlist fragment, found ${candidates.map { it.name }}"
            )
        }

    fun Instruction.assignsList() = opcode == Opcode.IPUT_OBJECT &&
            ((this as ReferenceInstruction).reference as FieldReference).let { field ->
                field.definingClass == fragmentType && field.name == listField.name
            }

    // Every assignment of the list field. Clearing it (null) is ignored by the extension.
    val sites = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (method.implementation?.instructions?.any { it.assignsList() } == true) sites += classDef to method
        }
    }
    if (sites.isEmpty()) throw PatchException("No assignment of the Playlist list field ${listField.name} found")

    sites.forEach { (classDef, method) ->
        val mutableMethod = mutableClassDefBy(classDef).methods.first { candidate ->
            candidate.name == method.name &&
                    candidate.returnType == method.returnType &&
                    candidate.parameterTypes.map { it.toString() } == method.parameterTypes.map { it.toString() }
        }
        val indices = mutableMethod.implementation!!.instructions
            .withIndex()
            .filter { (_, instruction) -> instruction.assignsList() }
            .map { it.index }
            .reversed()
        indices.forEach { index ->
            val assignment = mutableMethod.implementation!!.instructions[index] as TwoRegisterInstruction
            val listRegister = assignment.registerA
            val fragmentRegister = assignment.registerB
            if (listRegister > 15 || fragmentRegister > 15) {
                throw PatchException("Playlist list registers v$fragmentRegister, v$listRegister are out of range")
            }
            mutableMethod.addInstructions(
                index + 1,
                "invoke-static { v$fragmentRegister, v$listRegister }, " +
                        "$RECYCLER_SWIPE_CLASS->attachPlaylist(Ljava/lang/Object;Landroid/view/View;)V"
            )
        }
    }

    // The list's floating drag view, non-null only while a row is dragged to reorder it.
    val floatViewField = classDefBy(listField.type).fields
        .singleOrNull { field ->
            !AccessFlags.STATIC.isSet(field.accessFlags) && field.type == "Landroid/widget/FrameLayout;"
        }
        ?.let { field -> "${field.definingClass}->${field.name}:${field.type}" }

    hookRecyclerTouch(listField.type, floatViewField)
}
