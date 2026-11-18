package app.waylo.patches.podcastaddict

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val RECYCLER_SWIPE_CLASS = "Lapp/waylo/extension/podcastaddict/RecyclerSwipe;"

/**
 * Makes a RecyclerView based list class call [RECYCLER_SWIPE_CLASS] first in its
 * `onInterceptTouchEvent` and `onTouchEvent`, by adding overrides that fall through to the
 * superclass.
 *
 * @param listType The list class, an app class extending RecyclerView.
 * @param floatViewField Field (smali) holding the list's floating drag view, or null if it has none.
 */
internal fun hookRecyclerTouch(listType: String, floatViewField: String? = null) {
    val listClass = mutableClassDefBy(listType)
    val superclass = listClass.superclass ?: throw PatchException("$listType has no superclass")

    for ((touchMethod, hook) in listOf("onInterceptTouchEvent" to "onIntercept", "onTouchEvent" to "onTouch")) {
        if (listClass.methods.any { method ->
                method.name == touchMethod && method.parameterTypes.map { it.toString() } == listOf("Landroid/view/MotionEvent;")
            }
        ) {
            // Not the case in any version so far. Fail loudly rather than skipping the hook.
            throw PatchException("$listType already overrides $touchMethod")
        }

        val loadFloatView = if (floatViewField != null) "iget-object v0, p0, $floatViewField" else "const/4 v0, 0x0"
        listClass.methods.add(
            ImmutableMethod(
                listType,
                touchMethod,
                listOf(ImmutableMethodParameter("Landroid/view/MotionEvent;", null, null)),
                "Z",
                AccessFlags.PUBLIC.value,
                null,
                null,
                // v0 + p0 (this) + p1 (event).
                MutableMethodImplementation(3),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        $loadFloatView
                        invoke-static { p0, p1, v0 }, $RECYCLER_SWIPE_CLASS->$hook(Landroid/view/ViewGroup;Landroid/view/MotionEvent;Landroid/view/View;)Z
                        move-result v0
                        if-eqz v0, :fall_through
                        return v0
                        :fall_through
                        invoke-super { p0, p1 }, $superclass->$touchMethod(Landroid/view/MotionEvent;)Z
                        move-result v0
                        return v0
                    """
                )
            }
        )
    }
}
