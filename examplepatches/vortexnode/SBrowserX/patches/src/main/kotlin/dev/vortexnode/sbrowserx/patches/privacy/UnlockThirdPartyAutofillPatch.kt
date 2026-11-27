package dev.vortexnode.sbrowserx.patches.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.vortexnode.sbrowserx.patches.core.sbrowserXCorePatch
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow

private const val AUTOFILL_MANAGER_WRAPPER_CLASS =
    "Lorg/chromium/components/autofill/AutofillManagerWrapper;"
private const val TIN_CONTENT_VIEW_WITH_AUTOFILL_CLASS =
    "Lcom/sec/terrace/content/browser/TinContentViewWithAutofill;"
private const val TERRACE_CLASS =
    "Lcom/sec/terrace/Terrace;"
private const val TERRACE_PREF_SERVICE_BRIDGE_CLASS =
    "Lcom/sec/terrace/browser/prefs/TerracePrefServiceBridge;"
private const val DEBUG_SETTINGS_CLASS =
    "Lcom/sec/android/app/sbrowser/common/device/DebugSettings;"
private const val SAVE_PASSWORD_INFOBAR_CLASS =
    "Lcom/sec/android/app/sbrowser/infobars/SavePasswordInfoBar;"
private const val UPDATE_PASSWORD_INFOBAR_CLASS =
    "Lcom/sec/android/app/sbrowser/infobars/UpdatePasswordInfoBar;"
private const val SAMSUNG_PASS_MIGRATION_DIALOG_CLASS =
    "Lcom/sec/android/app/sbrowser/autofill/password/SamsungPassMigrationDialog;"
private const val AUTOFILL_POPUP_EXTENSION_CLASS =
    "Lcom/sec/android/app/sbrowser/autofill/personal_data/AutofillPopupExtension;"

@Suppress("unused")
val unlockThirdPartyAutofillPatch = bytecodePatch(
    name = "Third-Party Autofill Support",
    description = "Enables native Android Autofill (Bitwarden, Gboard inline suggestions), removes Samsung Pass prompts, and unlocks local credit cards without Knox.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)
    dependsOn(sbrowserXCorePatch)

    execute {
        val spassCheck = findMethodOrThrow(
            classType = AUTOFILL_MANAGER_WRAPPER_CLASS,
            methodName = "checkAutofillServiceIsSPass",
            parameterTypes = emptyList(),
            returnType = "Z",
        )
        spassCheck.addInstructions(
            0,
            """
                invoke-virtual {p0}, Lorg/chromium/components/autofill/AutofillManagerWrapper;->isDisabled()Z
                move-result v0
                xor-int/lit8 v0, v0, 0x1
                return v0
            """.trimIndent(),
        )

        val importantMethod = findMethodOrThrow(
            classType = TIN_CONTENT_VIEW_WITH_AUTOFILL_CLASS,
            methodName = "setImportantForAutofillForVirtualView",
            parameterTypes = listOf("Z"),
            returnType = "V",
        )
        importantMethod.addInstructions(
            0,
            """
                invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->adjustImportantForAutofill(Landroid/view/View;Z)Z
                move-result p1
            """.trimIndent(),
        )

        for (methodName in listOf("autofill", "onProvideAutofillVirtualStructure")) {
            val method = findMethodOrThrow(
                classType = TIN_CONTENT_VIEW_WITH_AUTOFILL_CLASS,
                methodName = methodName,
                returnType = "V",
            )
            val insns = method.implementation?.instructions
                ?: error("Missing instructions in TinContentViewWithAutofill.$methodName")
            var patched = false
            for (i in 0 until insns.size - 1) {
                val mRef = (insns[i] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                if (mRef.name != "getPersonalDataSyncSetFlag") continue
                val move = insns[i + 1]
                if (move.opcode != Opcode.MOVE_RESULT) continue
                val reg = (move as OneRegisterInstruction).registerA
                method.addInstructions(
                    i + 2,
                    """
                        invoke-static {p0, v$reg}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->shouldUseTerraceAutofill(Landroid/view/View;Z)Z
                        move-result v$reg
                    """.trimIndent(),
                )
                patched = true
                break
            }
            check(patched) { "Failed to patch getPersonalDataSyncSetFlag in $methodName" }
        }

        // Native libterrace.so gates AutofillProvider::OnAskForValuesToFill / startAutofillSession on the C++
        // PrefService boolean "personal_data_sync_set" (default false). Sync it to true when a system Android
        // Autofill service is active and prevent anything from resetting it to false.
        findMethodOrThrow(
            classType = TERRACE_CLASS,
            methodName = "initializeAutofillProviderIfNecessary",
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-virtual {p0}, Lcom/sec/terrace/Terrace;->getContext()Landroid/content/Context;
                move-result-object v0
                invoke-static {v0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->ensureTerraceAutofillEnabled(Landroid/content/Context;)V
            """.trimIndent(),
        )

        findMethodOrThrow(
            classType = TERRACE_PREF_SERVICE_BRIDGE_CLASS,
            methodName = "setPersonalDataSyncSetFlag",
            parameterTypes = listOf("Z"),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->adjustPersonalDataSyncSetFlag(Z)Z
                move-result p0
            """.trimIndent(),
        )

        // Disable Samsung Pass UI/storage integration cleanly via Samsung's built-in switch,
        // and bypass the broken Knox biometric gate on Credit/Debit Cards so local cards work.
        findMethodOrThrow(
            classType = DEBUG_SETTINGS_CLASS,
            methodName = "isSamsungPassDisabled",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                const/4 p0, 0x1
                return p0
            """.trimIndent(),
        )

        findMethodOrThrow(
            classType = DEBUG_SETTINGS_CLASS,
            methodName = "isCreditCardAuthenticationDisabled",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )

        // Suppress Samsung's proprietary Save/Update password infobars when a third-party Android Autofill service is active.
        findMethodOrThrow(
            classType = SAVE_PASSWORD_INFOBAR_CLASS,
            methodName = "create",
            returnType = SAVE_PASSWORD_INFOBAR_CLASS,
        ).addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->shouldSuppressSamsungPasswordUi(Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :sbrowserx_allow_save_infobar
                const/4 v0, 0x0
                return-object v0
                :sbrowserx_allow_save_infobar
                nop
            """.trimIndent(),
        )

        findMethodOrThrow(
            classType = UPDATE_PASSWORD_INFOBAR_CLASS,
            methodName = "create",
            returnType = UPDATE_PASSWORD_INFOBAR_CLASS,
        ).addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->shouldSuppressSamsungPasswordUi(Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :sbrowserx_allow_update_infobar
                const/4 v0, 0x0
                return-object v0
                :sbrowserx_allow_update_infobar
                nop
            """.trimIndent(),
        )

        findMethodOrThrow(
            classType = SAMSUNG_PASS_MIGRATION_DIALOG_CLASS,
            methodName = "showIfNeeded",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstructionsWithLabels(
            0,
            """
                const/4 v0, 0x0
                invoke-static {v0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->shouldSuppressSamsungPasswordUi(Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :sbrowserx_allow_migration_dialog
                return-void
                :sbrowserx_allow_migration_dialog
                nop
            """.trimIndent(),
        )

        findMethodOrThrow(
            classType = AUTOFILL_POPUP_EXTENSION_CLASS,
            methodName = "overridePasswordSuggestions",
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p3}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->adjustSuggestPasswordStore(Z)Z
                move-result p3
            """.trimIndent(),
        )
    }
}
