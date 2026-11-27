package dev.vortexnode.sbrowserx.patches.debug

import app.morphe.patcher.patch.bytecodePatch
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow
import dev.vortexnode.sbrowserx.shared.returnConstantBoolean

private const val SETTINGS_FRAGMENT_UTIL_CLASS =
    "Lcom/sec/android/app/sbrowser/settings/SettingsFragmentUtil;"

@Suppress("unused")
val unlockDebugMenuPatch = bytecodePatch(
    name = "Unlock Debug settings menu",
    description = "Reveals the hidden Debug settings menu inside browser Settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)

    execute {
        findMethodOrThrow(
            classType = SETTINGS_FRAGMENT_UTIL_CLASS,
            methodName = "shouldDisableDebugSettings",
            parameterTypes = listOf("Ljava/lang/String;"),
            returnType = "Z",
        ).returnConstantBoolean(false)
    }
}
