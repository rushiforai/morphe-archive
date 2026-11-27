package dev.vortexnode.sbrowserx.patches.extensions

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow
import dev.vortexnode.sbrowserx.shared.returnConstantBoolean

private const val SIX_STATUS_CLASS =
    "Lcom/sec/android/app/sbrowser/common/extensions/SixStatus;"
private const val SIX_PKG_UPDATER_CLASS =
    "Lcom/sec/android/app/sbrowser/extensions/SixPkgUpdater;"
private const val SIX_DEFAULT_LOADER_CLASS =
    "Lcom/sec/android/app/sbrowser/extensions/SixDefaultExtLoader;"
private const val EXTENSIONS_MENU_COORDINATOR_CLASS =
    "Lcom/sec/android/app/sbrowser/extensions/ExtensionsMenuCoordinator;"

@Suppress("unused")
val unlockExtensionsPatch = bytecodePatch(
    name = "Unlock Chrome Web Store & Extensions",
    description = "Enables extension support, unlocks the Chrome Web Store, and allows installing and keeping third-party extensions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)

    execute {
        listOf(
            "isEnabled",
            "isDefaultExtEnabled",
            "isSupportedExtContainer",
            "isSupportedExtContainerPin",
            "isSupportedExtWebUI",
        ).forEach { methodName ->
            findMethodOrThrow(
                classType = SIX_STATUS_CLASS,
                methodName = methodName,
                parameterTypes = emptyList(),
                returnType = "Z",
            ).returnConstantBoolean(true)
        }

        findMethodOrThrow(
            classType = SIX_STATUS_CLASS,
            methodName = "isDefaultExtEnabled",
            parameterTypes = listOf("Z"),
            returnType = "Z",
        ).returnConstantBoolean(true)

        // Allow Chrome Web Store & Extensions on non-Samsung (GED) Android devices without globally overriding GEDUtils.isGED()
        findMethodOrThrow(
            classType = SIX_STATUS_CLASS,
            methodName = "isEnabled",
            parameterTypes = listOf("Lcom/sec/android/app/sbrowser/common/extensions/SixStatus\$SIX_ENABLE_TYPE;"),
            returnType = "Z",
        ).returnConstantBoolean(true)

        // Prevent SixPkgUpdater startup sync from auto-uninstalling CRX extensions that have no Samsung SIX APK
        findMethodOrThrow(
            classType = SIX_PKG_UPDATER_CLASS,
            methodName = "handleUninstallExt",
            parameterTypes = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
            returnType = "V",
        ).addInstruction(0, "return-void")

        // Prevent SixDefaultExtLoader from auto-uninstalling built-in extensions (like webtrans.crx)
        findMethodOrThrow(
            classType = SIX_DEFAULT_LOADER_CLASS,
            methodName = "uninstallDefaultExts",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).returnConstantBoolean(false)

        // Route Extensions popup gear icon (null/empty extensionId) to our native SBrowserXExtensionsActivity
        findMethodOrThrow(
            classType = EXTENSIONS_MENU_COORDINATOR_CLASS,
            methodName = "openManagementPageIfSupported",
            parameterTypes = listOf("Landroid/app/Activity;", "Ljava/lang/String;"),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryOpenNativeExtensionsManager(Landroid/app/Activity;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :sbrowserx_stock_ext_mgmt
                const/4 v0, 0x1
                return v0
                :sbrowserx_stock_ext_mgmt
                nop
            """.trimIndent(),
        )
    }
}
