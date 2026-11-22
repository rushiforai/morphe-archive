package app.template.patches.orca

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val orcaCustomFontPatch = bytecodePatch(
    name = "Orca custom font",
    description = "Choose a system, installed or imported font in Settings > Appearance > Font. Code and icon fonts keep their faces.",
    default = true,
) {
    compatibleWith(ORCA_COMPATIBILITY)
    dependsOn(orcaFontResources, orcaNativeFontHooks)
}
