package app.template.patches.joplin.fontswap

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.joplin.JOPLIN_COMPATIBILITY
import app.template.patches.joplin.theme.joplinThemeResourcesPatch

@Suppress("unused")
val joplinCustomFontPatch = bytecodePatch(
    name = "Joplin zero-flash custom font",
    description = "Flash-free custom font for all Joplin text, plus the Blush Pink theme.",
    default = true,
) {
    compatibleWith(JOPLIN_COMPATIBILITY)
    dependsOn(joplinFontSettingsResourcesPatch, joplinThemeResourcesPatch, joplinNativeFontHooks)
}
