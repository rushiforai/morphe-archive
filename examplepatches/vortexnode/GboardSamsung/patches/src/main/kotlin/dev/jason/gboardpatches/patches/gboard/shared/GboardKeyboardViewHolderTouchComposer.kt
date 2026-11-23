package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import java.util.WeakHashMap

internal enum class GboardKeyboardViewHolderTouchFeature {
    SWIPE_DISMISS,
    SAMSUNG_SPACEBAR_GESTURES,
}

internal class GboardKeyboardViewHolderTouchSelectionStore<K : Any> {
    private val selectedByContext =
        WeakHashMap<K, MutableSet<GboardKeyboardViewHolderTouchFeature>>()

    @Synchronized
    fun add(context: K, feature: GboardKeyboardViewHolderTouchFeature) {
        selectedByContext.getOrPut(context) { linkedSetOf() }.add(feature)
    }

    @Synchronized
    fun take(context: K): Set<GboardKeyboardViewHolderTouchFeature> =
        selectedByContext.remove(context)?.toSet().orEmpty()
}

private object GboardKeyboardViewHolderTouchFeatureSelections {
    private val store = GboardKeyboardViewHolderTouchSelectionStore<BytecodePatchContext>()

    fun add(context: BytecodePatchContext, feature: GboardKeyboardViewHolderTouchFeature) =
        store.add(context, feature)

    fun take(context: BytecodePatchContext): Set<GboardKeyboardViewHolderTouchFeature> =
        store.take(context)
}

internal val gboardKeyboardViewHolderTouchComposerPatch = bytecodePatch(
    description = "Compose selected KeyboardViewHolder.dispatchTouchEvent interceptors in one verified prolog.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute { }

    finalize {
        val selected = GboardKeyboardViewHolderTouchFeatureSelections.take(this)
        if (selected.isEmpty()) return@finalize
        findMutableMethodOrThrow(
            classType = KEYBOARD_VIEW_HOLDER_CLASS,
            name = DISPATCH_TOUCH_EVENT_NAME,
            returnType = DISPATCH_TOUCH_EVENT_RETURN,
            parameterTypes = listOf(MOTION_EVENT_TYPE),
        ).applyKeyboardViewHolderTouchInterceptors(selected)
    }
}

internal fun gboardKeyboardViewHolderTouchFeaturePatch(
    description: String,
    feature: GboardKeyboardViewHolderTouchFeature,
) = bytecodePatch(description = description) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardKeyboardViewHolderTouchComposerPatch)

    execute {
        GboardKeyboardViewHolderTouchFeatureSelections.add(this, feature)
    }
}

internal fun MutableMethod.applyKeyboardViewHolderTouchInterceptors(
    selected: Set<GboardKeyboardViewHolderTouchFeature>,
) {
    if (selected.isEmpty()) return

    val includeSwipeDismiss = GboardKeyboardViewHolderTouchFeature.SWIPE_DISMISS in selected
    val includeSpacebarGestures =
        GboardKeyboardViewHolderTouchFeature.SAMSUNG_SPACEBAR_GESTURES in selected

    val swipeDismissAbi = RuntimeAbiCatalog.abi(
        RuntimeCallId.SWIPE_DISMISS_RUNTIME_ON_HEADER_TOUCH,
    )
    val spacebarGestureAbi = RuntimeAbiCatalog.abi(
        RuntimeCallId.SPACEBAR_GESTURE_RUNTIME_ON_HOLDER_TOUCH,
    )

    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existingSwipeDismiss = instructions.count { it.isMethodReference(swipeDismissAbi.reference) }
    val existingSpacebarGesture =
        instructions.count { it.isMethodReference(spacebarGestureAbi.reference) }

    if (existingSwipeDismiss > 0 || existingSpacebarGesture > 0) {
        val expectedSwipeDismiss = if (includeSwipeDismiss) 1 else 0
        val expectedSpacebarGesture = if (includeSpacebarGestures) 1 else 0
        val expectedFirstAbi = if (includeSwipeDismiss) swipeDismissAbi else spacebarGestureAbi
        check(
            existingSwipeDismiss == expectedSwipeDismiss &&
                existingSpacebarGesture == expectedSpacebarGesture &&
                instructions.first().isMethodReference(expectedFirstAbi.reference),
        ) {
            "Malformed KeyboardViewHolder touch interceptor in $definingClass->$name: " +
                "selected=$selected, swipeDismiss=$existingSwipeDismiss, " +
                "spacebarGestures=$existingSpacebarGesture"
        }
        return
    }

    addInstructions(0, "nop")
    val continuation = implementation!!.instructions[0]
    val prolog = when {
        includeSwipeDismiss && includeSpacebarGestures ->
            """
                ${RuntimeCallEmitter.invoke(
                    RuntimeCallId.SWIPE_DISMISS_RUNTIME_ON_HEADER_TOUCH,
                    "p0, p1",
                )}

                move-result v0

                if-eqz v0, :jasondev_check_spacebar_gesture

                const/4 v0, 0x1

                return v0

                :jasondev_check_spacebar_gesture
                ${RuntimeCallEmitter.invoke(
                    RuntimeCallId.SPACEBAR_GESTURE_RUNTIME_ON_HOLDER_TOUCH,
                    "p0, p1",
                )}

                move-result v0

                if-eqz v0, :jasondev_continue_holder_touch

                const/4 v0, 0x1

                return v0
            """.trimIndent()
        includeSwipeDismiss ->
            """
                ${RuntimeCallEmitter.invoke(
                    RuntimeCallId.SWIPE_DISMISS_RUNTIME_ON_HEADER_TOUCH,
                    "p0, p1",
                )}

                move-result v0

                if-eqz v0, :jasondev_continue_holder_touch

                const/4 v0, 0x1

                return v0
            """.trimIndent()
        else ->
            """
                ${RuntimeCallEmitter.invoke(
                    RuntimeCallId.SPACEBAR_GESTURE_RUNTIME_ON_HOLDER_TOUCH,
                    "p0, p1",
                )}

                move-result v0

                if-eqz v0, :jasondev_continue_holder_touch

                const/4 v0, 0x1

                return v0
            """.trimIndent()
    }

    addInstructionsWithLabels(
        0,
        prolog,
        ExternalLabel("jasondev_continue_holder_touch", continuation),
    )
}

private const val KEYBOARD_VIEW_HOLDER_CLASS =
    "Lcom/google/android/libraries/inputmethod/keyboard/impl/KeyboardViewHolder;"
private const val DISPATCH_TOUCH_EVENT_NAME = "dispatchTouchEvent"
private const val MOTION_EVENT_TYPE = "Landroid/view/MotionEvent;"
private const val DISPATCH_TOUCH_EVENT_RETURN = "Z"
