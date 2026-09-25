package app.edgewindow.patches.font

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.floatSliderOption
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val ANDROID_ACTIVITY = "Landroid/app/Activity;"
private const val ANDROID_CONTEXT = "Landroid/content/Context;"
private const val FONT_SCALE_HELPER = "Lapp/edgewindow/extension/AppFontScaleCompat;"
private const val WRAPPED_METHOD_NAME = "attachBaseContext\$edgeWindowFontScaleOriginal"

/**
 * Applies a configurable font-scale multiplier to app Activity contexts while leaving
 * densityDpi alone, so density-based layouts keep their selected column count.
 */
@Suppress("unused")
val appFontScalePatch = bytecodePatch(
    name = "Adjust app font scale",
    description = "Scales text in this app without changing display density or layout sizing.",
    default = false,
) {
    extendWith("extensions/extension.mpe")

    val fontScaleMultiplier by floatSliderOption(
        key = "fontScaleMultiplier",
        min = 0.5f,
        max = 2.0f,
        default = 1.2f,
        step = 0.05f,
        title = "Font scale multiplier",
        description = "Multiplier applied to this app's current system font scale. 1.0 keeps it unchanged.",
    )

    execute {
        val multiplier = fontScaleMultiplier ?: 1.2f
        if (!multiplier.isFinite() || multiplier !in 0.5f..2.0f) {
            throw PatchException("Font scale multiplier must be between 0.5x and 2.0x")
        }

        val multiplierBits = java.lang.Float.floatToIntBits(multiplier)
        val multiplierLiteral = "0x%08x".format(multiplierBits)

        val allClasses = mutableListOf<ClassDef>()
        classDefForEach { allClasses += it }
        val classesByType = allClasses.associateBy { it.type }
        val activities = classesByType.values.filter { it.isActivityClass(classesByType) }

        if (activities.isEmpty()) {
            throw PatchException("No application Activity classes were found")
        }

        var hookedActivities = 0

        activities.forEach { classDef ->
            val activity = mutableClassDefBy(classDef)
            val original = classDef.methods.firstOrNull { method ->
                method.name == "attachBaseContext" &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0].toString() == ANDROID_CONTEXT &&
                    method.returnType == "V"
            }

            val parentType = classDef.superclass
                ?: throw PatchException("Activity ${classDef.type} has no superclass")

            val delegateCall = if (original != null && original.implementation != null) {
                val renamedMethod = ImmutableMethod(
                    classDef.type,
                    WRAPPED_METHOD_NAME,
                    original.parameters,
                    original.returnType,
                    (original.accessFlags and AccessFlags.PUBLIC.value.inv() and
                        AccessFlags.PROTECTED.value.inv() and AccessFlags.ABSTRACT.value.inv()) or
                        AccessFlags.PRIVATE.value or AccessFlags.SYNTHETIC.value,
                    original.annotations,
                    original.hiddenApiRestrictions,
                    MutableMethodImplementation(original.implementation!!),
                ).toMutable()

                activity.methods.removeAll { method ->
                    method.name == original.name &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0].toString() == ANDROID_CONTEXT &&
                        method.returnType == "V"
                }
                activity.methods.add(renamedMethod)
                "invoke-direct/range { p0 .. p1 }, ${classDef.type}->$WRAPPED_METHOD_NAME($ANDROID_CONTEXT)V"
            } else {
                // Abstract declarations and Activities without an override still need a
                // concrete entry point so the framework's base context is wrapped.
                activity.methods.removeAll { method ->
                    method.name == "attachBaseContext" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0].toString() == ANDROID_CONTEXT &&
                        method.returnType == "V"
                }
                "invoke-super/range { p0 .. p1 }, $parentType->attachBaseContext($ANDROID_CONTEXT)V"
            }

            val wrapper = ImmutableMethod(
                classDef.type,
                "attachBaseContext",
                listOf(ImmutableMethodParameter(ANDROID_CONTEXT, emptySet(), "base")),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.SYNTHETIC.value,
                original?.annotations ?: emptySet(),
                emptySet(),
                MutableMethodImplementation(3),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        const v0, $multiplierLiteral
                        invoke-static { p0, p1, v0 }, $FONT_SCALE_HELPER->wrap($ANDROID_ACTIVITY;$ANDROID_CONTEXT;F)$ANDROID_CONTEXT
                        move-result-object p1
                        $delegateCall
                        return-void
                    """.trimIndent(),
                )
            }

            activity.methods.add(wrapper)
            hookedActivities++
        }

        if (hookedActivities == 0) {
            throw PatchException("No application Activity attachBaseContext methods could be patched")
        }
    }
}

private fun ClassDef.isActivityClass(classesByType: Map<String, ClassDef>): Boolean {
    val visited = mutableSetOf<String>()
    var currentType: String? = type

    while (currentType != null && visited.add(currentType)) {
        if (currentType == ANDROID_ACTIVITY) return true
        currentType = classesByType[currentType]?.superclass
    }

    return false
}
