package app.zeldrisho.patches.zalo.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002
import app.zeldrisho.patches.zalo.navigation.zeldrisSettingsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

/**
 * Preset colors must match `AccentColor.java` in the extension: the setting stores the color value
 * and the overlay style is selected by the preset name derived from it.
 */
private val accentPresets = listOf(
    "Blue" to 0xff0068ff.toInt(),
    "Purple" to 0xff6941c6.toInt(),
    "Green" to 0xff067647.toInt(),
    "Red" to 0xffb42318.toInt(),
    "Orange" to 0xffb54708.toInt(),
)

/**
 * Native values of the brand-hue theme attributes in the light and dark design-system themes.
 * Each override keeps the native alpha, saturation ratio and brightness, so only the hue changes
 * and the native contrast ladder survives.
 */
private val lightBrandColors = linkedMapOf(
    "AppAccentColor" to 0xff00b3da.toInt(),
    "AppBrandingColor" to 0xff0068ff.toInt(),
    "AppPrimaryColor" to 0xff1194ff.toInt(),
    "AppPrimaryColor_alpha25" to 0x3f1194ff,
    "AppPrimaryColor_alpha70" to 0xb31194ff.toInt(),
    "accent_blue_background" to 0xff0068ff.toInt(),
    "accent_blue_background_bold" to 0xff00378a.toInt(),
    "accent_blue_background_subtle" to 0xffdbebff.toInt(),
    "accent_blue_border" to 0xff0068ff.toInt(),
    "accent_blue_border_bold" to 0xff00378a.toInt(),
    "accent_blue_border_subtle" to 0xffc7e0ff.toInt(),
    "accent_blue_icon" to 0xff0068ff.toInt(),
    "accent_blue_icon_bold" to 0xff002b6b.toInt(),
    "accent_blue_icon_subtle" to 0xfff0f7ff.toInt(),
    "accent_blue_text" to 0xff0068ff.toInt(),
    "accent_blue_text_bold" to 0xff002b6b.toInt(),
    "accent_blue_text_subtle" to 0xfff0f7ff.toInt(),
    "brand_background" to 0xff0068ff.toInt(),
    "brand_background_subtle" to 0xfff0f7ff.toInt(),
    "brand_border" to 0xff0068ff.toInt(),
    "brand_border_subtle" to 0xffadd1ff.toInt(),
    "brand_logo" to 0xff0068ff.toInt(),
    "brand_text" to 0xff0068ff.toInt(),
)

private val darkBrandColors = linkedMapOf(
    "AppAccentColor" to 0xff00b3da.toInt(),
    "AppBrandingColor" to 0xff0068ff.toInt(),
    "AppPrimaryColor" to 0xff0085ff.toInt(),
    "AppPrimaryColor_alpha25" to 0x3f0085ff,
    "AppPrimaryColor_alpha70" to 0xb30085ff.toInt(),
    "accent_blue_background" to 0xff5ca0ff.toInt(),
    "accent_blue_background_bold" to 0xffadd1ff.toInt(),
    "accent_blue_background_subtle" to 0xff002b6b.toInt(),
    "accent_blue_border" to 0xff5ca0ff.toInt(),
    "accent_blue_border_bold" to 0xffadd1ff.toInt(),
    "accent_blue_border_subtle" to 0xff00378a.toInt(),
    "accent_blue_icon" to 0xff5ca0ff.toInt(),
    "accent_blue_icon_bold" to 0xffc7e0ff.toInt(),
    "accent_blue_icon_subtle" to 0xff002152.toInt(),
    "accent_blue_text" to 0xff5ca0ff.toInt(),
    "accent_blue_text_bold" to 0xffc7e0ff.toInt(),
    "accent_blue_text_subtle" to 0xff002152.toInt(),
    "brand_background" to 0xff0068ff.toInt(),
    "brand_background_subtle" to 0xff002152.toInt(),
    "brand_border" to 0xff297eff.toInt(),
    "brand_border_subtle" to 0xff0045ad.toInt(),
    "brand_text" to 0xff5ca0ff.toInt(),
)

/** Appends one overlay style per preset and mode; the extension applies it after the native theme. */
private val accentOverlayResources = resourcePatch {
    compatibleWith(COMPATIBILITY_ZALO_261002)
    execute {
        document("res/values/styles.xml").use { document ->
            val existing = document.getElementsByTagName("style")
            val names = (0 until existing.length).map { (existing.item(it) as Element).getAttribute("name") }
            for ((preset, color) in accentPresets) {
                for ((mode, palette) in listOf("Light" to lightBrandColors, "Dark" to darkBrandColors)) {
                    val name = "ZeldrisAccent$preset$mode"
                    check(name !in names) { "Zalo accent style already present: $name" }
                    val style = document.createElement("style")
                    style.setAttribute("name", name)
                    for ((attribute, native) in palette) {
                        val item = document.createElement("item")
                        item.setAttribute("name", attribute)
                        item.textContent = toHex(shiftHue(native, color))
                        style.appendChild(item)
                    }
                    document.documentElement.appendChild(style)
                }
            }
        }
    }
}

/** Applies the preset overlay to the context theme that the native code just installed. */
@Suppress("unused")
val zaloAccentColorPatch = bytecodePatch(
    name = "Customize Zalo accent color",
    description = "Recolors Zalo's brand theme attributes from preset colors. Hardcoded colors, " +
        "images and third-party branding keep their native values.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002)
    dependsOn(zeldrisSettingsPatch, accentOverlayResources)
    execute {
        val capability = mutableClassDefBy("Lapp/zeldrisho/zalo/extension/ZeldrisSettingsContent;")
            .methods.single { it.name == "hasAccentColorSettings" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        capability.returnEarly(true)

        val setup = AccentThemeSetup.matchAll(1..1).single().method
        val instructions = setup.implementation?.instructions?.toList()
            ?: error("Zalo accent: theme setup has no implementation")
        check(setup.implementation?.registerCount == 13) { "Zalo accent: theme setup registers changed" }
        val themeCalls = instructions.indices.filter { index ->
            val instruction = instructions[index]
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                    "Landroid/content/Context;->setTheme(I)V" &&
                (instruction as? FiveRegisterInstruction)?.let { it.registerCount == 2 && it.registerC == 6 } == true
        }
        check(themeCalls.size == 2) { "Zalo accent: expected two native setTheme calls" }
        // p0 holds the dark theme and p1 the light theme, so v9 is dark and v10 is light.
        val dark = themeCalls.single { (instructions[it] as FiveRegisterInstruction).registerD == 9 }
        val light = themeCalls.single { (instructions[it] as FiveRegisterInstruction).registerD == 10 }
        // Apply after the native setTheme and before dependent views are inflated. v6 is the context.
        // Insert the later branch first: the dark index would otherwise shift past the light call.
        setup.addInstructions(light + 1,
            "invoke-static {v6}, Lapp/zeldrisho/zalo/extension/AccentColor;->applyLight(Landroid/content/Context;)V")
        setup.addInstructions(dark + 1,
            "invoke-static {v6}, Lapp/zeldrisho/zalo/extension/AccentColor;->applyDark(Landroid/content/Context;)V")
    }
}

private object AccentThemeSetup : Fingerprint(
    definingClass = "Lef1/c;", name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("I", "I", "Ljava/util/ArrayList;", "Z"), returnType = "V",
    filters = listOf(string("SAVE_SETTING_THEME_SELECTED_POSITION"),
        methodCall(definingClass = "Landroid/content/Context;", name = "setTheme", parameters = listOf("I"), returnType = "V")),
)

/** Rotates the hue while keeping alpha, the native saturation ratio and brightness. */
internal fun shiftHue(native: Int, target: Int): Int {
    val alpha = native ushr 24
    val nativeHsv = toHsv(native)
    val targetHsv = toHsv(target)
    val saturation = (nativeHsv[1] * targetHsv[1]).coerceIn(0f, 1f)
    val rgb = fromHsv(targetHsv[0], saturation, nativeHsv[2])
    return (alpha shl 24) or rgb
}

private fun toHsv(color: Int): FloatArray {
    val r = ((color shr 16) and 0xff) / 255f
    val g = ((color shr 8) and 0xff) / 255f
    val b = (color and 0xff) / 255f
    val max = maxOf(r, g, b)
    val min = minOf(r, g, b)
    val delta = max - min
    val hue = when {
        delta == 0f -> 0f
        max == r -> 60f * (((g - b) / delta) % 6f)
        max == g -> 60f * (((b - r) / delta) + 2f)
        else -> 60f * (((r - g) / delta) + 4f)
    }
    val saturation = if (max == 0f) 0f else delta / max
    return floatArrayOf(if (hue < 0f) hue + 360f else hue, saturation, max)
}

private fun fromHsv(hue: Float, saturation: Float, value: Float): Int {
    val chroma = value * saturation
    val section = (hue % 360f) / 60f
    val second = chroma * (1f - kotlin.math.abs(section % 2f - 1f))
    val (r, g, b) = when (section.toInt()) {
        0 -> Triple(chroma, second, 0f)
        1 -> Triple(second, chroma, 0f)
        2 -> Triple(0f, chroma, second)
        3 -> Triple(0f, second, chroma)
        4 -> Triple(second, 0f, chroma)
        else -> Triple(chroma, 0f, second)
    }
    val match = value - chroma
    fun channel(value: Float) = ((value + match) * 255f).toInt().coerceIn(0, 255)
    return (channel(r) shl 16) or (channel(g) shl 8) or channel(b)
}

private fun toHex(color: Int): String = "#%08x".format(color)
