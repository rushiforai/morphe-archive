package app.edgewindow.patches.cutout

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val ANDROID_ACTIVITY = "Landroid/app/Activity;"
private val platformActivityBases = setOf(
    ANDROID_ACTIVITY,
    "Landroid/app/ActivityGroup;",
    "Landroid/app/ExpandableListActivity;",
    "Landroid/app/LauncherActivity;",
    "Landroid/app/ListActivity;",
    "Landroid/app/NativeActivity;",
    "Landroid/app/TabActivity;",
    "Landroid/preference/PreferenceActivity;",
)
private const val CUTOUT_HELPER = "Lapp/edgewindow/extension/DisplayCutoutCompat;"
private const val APPLY_CUTOUT_METHOD =
    "invoke-static/range { p0 .. p0 }, $CUTOUT_HELPER->apply(Landroid/app/Activity;)V"

/**
 * Applies the runtime cutout policy to every app-defined Activity. If an Activity
 * inherits onResume without declaring it, a small override is added to the top
 * of that Activity hierarchy so it still receives the policy.
 */
@Suppress("unused")
val forceContentIntoDisplayCutoutPatch = bytecodePatch(
    name = "Hide status bar and ignore display cutouts",
    description = "Hides the status bar and removes top status-bar and cutout insets from app content.",
    default = false,
) {
    extendWith("extensions/extension.mpe")

    execute {
        val allClasses = mutableListOf<ClassDef>()
        classDefForEach { allClasses += it }
        val classesByType = allClasses.associateBy { it.type }
        val activities = classesByType.values.filter { it.isActivityClass(classesByType) }

        if (activities.isEmpty()) {
            throw PatchException("No application Activity classes were found")
        }

        fun hookActivityCallback(
            classDef: ClassDef,
            methodName: String,
            parameterType: String,
        ) {
            val callback = classDef.methods.firstOrNull { method ->
                method.name == methodName &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0].toString() == parameterType &&
                    method.returnType == "V"
            }

            if (callback != null) {
                if (callback.implementation != null) {
                    mutableClassDefBy(classDef).methods
                        .first { method ->
                            method.name == methodName &&
                                method.parameterTypes.size == 1 &&
                                method.parameterTypes[0].toString() == parameterType &&
                                method.returnType == "V"
                        }
                        .addInstructions(0, APPLY_CUTOUT_METHOD)
                }
                return
            }

            val parentType = classDef.superclass ?: return
            val parentIsPackagedActivity = classesByType[parentType]
                ?.isActivityClass(classesByType) == true
            if (parentIsPackagedActivity) return

            val activity = mutableClassDefBy(classDef)
            val inheritedCallback = ImmutableMethod(
                activity.type,
                methodName,
                listOf(ImmutableMethodParameter(parameterType, emptySet(), null)),
                "V",
                AccessFlags.PUBLIC.value,
                null,
                null,
                MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-super/range { p0 .. p1 }, $parentType->$methodName($parameterType)V
                        $APPLY_CUTOUT_METHOD
                        return-void
                    """.trimIndent(),
                )
            }

            activity.methods.add(inheritedCallback)
        }

        var hookedActivities = 0

        activities.forEach { classDef ->
            val onResume = classDef.methods.firstOrNull { method ->
                method.name == "onResume" &&
                    method.parameterTypes.isEmpty() &&
                    method.returnType == "V"
            }

            if (onResume != null) {
                // Abstract or native declarations cannot be modified. Concrete
                // descendants with an implementation are handled independently.
                if (onResume.implementation != null) {
                    mutableClassDefBy(classDef).methods
                        .first { method ->
                            method.name == "onResume" &&
                                method.parameterTypes.isEmpty() &&
                                method.returnType == "V"
                        }
                        .addInstructions(0, APPLY_CUTOUT_METHOD)
                    hookedActivities++
                }
                return@forEach
            }

            val parentType = classDef.superclass ?: return@forEach
            val parentIsPackagedActivity = classesByType[parentType]
                ?.isActivityClass(classesByType) == true

            // A patched parent already covers subclasses that inherit onResume.
            if (parentIsPackagedActivity) return@forEach

            val activity = mutableClassDefBy(classDef)
            val inheritedOnResume = ImmutableMethod(
                activity.type,
                "onResume",
                emptyList(),
                "V",
                AccessFlags.PROTECTED.value,
                null,
                null,
                MutableMethodImplementation(1),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-super/range { p0 .. p0 }, $parentType->onResume()V
                        $APPLY_CUTOUT_METHOD
                        return-void
                    """.trimIndent(),
                )
            }

            activity.methods.add(inheritedOnResume)
            hookedActivities++
        }

        activities.forEach { classDef ->
            hookActivityCallback(
                classDef,
                "onWindowFocusChanged",
                "Z",
            )
            hookActivityCallback(
                classDef,
                "onConfigurationChanged",
                "Landroid/content/res/Configuration;",
            )
        }

        if (hookedActivities == 0) {
            throw PatchException("No Activity onResume entry points could be patched")
        }
    }
}

private fun ClassDef.isActivityClass(classesByType: Map<String, ClassDef>): Boolean {
    val visited = mutableSetOf<String>()
    var currentType: String? = type

    while (currentType != null && visited.add(currentType)) {
        if (currentType in platformActivityBases) return true
        currentType = classesByType[currentType]?.superclass
    }

    return false
}
