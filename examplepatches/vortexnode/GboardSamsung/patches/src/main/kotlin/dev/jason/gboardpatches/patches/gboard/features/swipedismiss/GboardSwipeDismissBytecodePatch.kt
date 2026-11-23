package dev.jason.gboardpatches.patches.gboard.features.swipedismiss

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import dev.jason.gboardpatches.patches.gboard.shared.GboardKeyboardViewHolderTouchFeature
import dev.jason.gboardpatches.patches.gboard.shared.applyKeyboardViewHolderTouchInterceptors
import dev.jason.gboardpatches.patches.gboard.shared.gboardKeyboardViewHolderTouchFeaturePatch

internal val gboardSwipeDismissBytecodePatch = gboardKeyboardViewHolderTouchFeaturePatch(
    description = "在 KeyboardViewHolder.dispatchTouchEvent 注入 header 下滑關閉手勢攔截器。",
    feature = GboardKeyboardViewHolderTouchFeature.SWIPE_DISMISS,
)

internal fun MutableMethod.applySwipeDismissTouchInterceptor() {
    applyKeyboardViewHolderTouchInterceptors(
        setOf(GboardKeyboardViewHolderTouchFeature.SWIPE_DISMISS),
    )
}
