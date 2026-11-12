package app.template.patches.notesnook.fontswap

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.notesnook.NOTESNOOK_COMPATIBILITY

@Suppress("unused")
val notesnookCustomFontPatch = bytecodePatch(
    name = "Notesnook custom font",
    description = "Use a device font or a TTF, OTF or TTC file across Notesnook. Icons, emoji and math keep theirs.",
    default = true,
) {
    compatibleWith(NOTESNOOK_COMPATIBILITY)
    dependsOn(notesnookFontResourcesPatch, notesnookAppearanceMenuPatch, notesnookNativeFontHooks, notesnookPaintDefaultHooks)
}
