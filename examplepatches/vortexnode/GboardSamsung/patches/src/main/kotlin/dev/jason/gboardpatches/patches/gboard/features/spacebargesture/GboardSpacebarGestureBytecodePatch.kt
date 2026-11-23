package dev.jason.gboardpatches.patches.gboard.features.spacebargesture

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import dev.jason.gboardpatches.patches.gboard.shared.GboardKeyboardViewHolderTouchFeature
import dev.jason.gboardpatches.patches.gboard.shared.applyKeyboardViewHolderTouchInterceptors
import dev.jason.gboardpatches.patches.gboard.shared.gboardKeyboardViewHolderTouchFeaturePatch

internal val gboardSpacebarGestureBytecodePatch = gboardKeyboardViewHolderTouchFeaturePatch(
    description = "Injects the Samsung spacebar gesture interceptor into KeyboardViewHolder.dispatchTouchEvent.",
    feature = GboardKeyboardViewHolderTouchFeature.SAMSUNG_SPACEBAR_GESTURES,
)

internal fun MutableMethod.applySpacebarGestureTouchInterceptor() {
    applyKeyboardViewHolderTouchInterceptors(
        setOf(GboardKeyboardViewHolderTouchFeature.SAMSUNG_SPACEBAR_GESTURES),
    )
}
