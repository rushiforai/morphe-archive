/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.ghostMode

import app.rex.patches.instagram.misc.actionBar.chatActionBarButton.chatActionBarButtonPatch
import app.rex.patches.instagram.misc.actionBar.inboxActionBarButton.inboxActionBarButtonPatch
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PREF_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val viewDmAnonymouslyPatch =
    patch(
        name = "View DMs anonymously",
        default = true,
    ) {
        dependsOn(settingsPatch, chatActionBarButtonPatch, inboxActionBarButtonPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            runCatching { enableSettings("viewDmAnonymously") }
            runCatching {
                DMSeenFingerprint.method.apply {
                    val shouldDisableRegister =
                        getFreeRegisterProvider(
                            index = 1,
                            numberOfFreeRegistersNeeded = 1,
                        ).getFreeRegister()

                    addInstructionsWithLabels(
                        1,
                        """
                        invoke-static {}, $PREF_DESCRIPTOR->viewDmAnonymously()Z
                        move-result v$shouldDisableRegister
                        if-eqz v$shouldDisableRegister, :rex_continue
                        return-void
                        """.trimIndent(),
                        ExternalLabel("rex_continue", getInstruction(1)),
                    )
                }
            }
            // Instagram 453.0.0.57.79+ direct mutation handlers for visual_items and IGDirectItemSeenMutation
            for (anchor in listOf(
                "direct_v2/visual_threads/%s/item_seen/",
                "direct_v2/visual_threads/%s/visual_items/%s/seen/",
                "IGDirectItemSeenMutation",
            )) {
                runCatching {
                    Fingerprint(filters = listOf(string(anchor))).matchAllOrNull()?.forEach { match ->
                        val m = match.method
                        if (!AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.parameterTypes.size == 3) {
                            runCatching {
                                val reg = m.getFreeRegisterProvider(0, 1).getFreeRegister()
                                m.addInstructionsWithLabels(
                                    0,
                                    """
                                    invoke-static {}, $PREF_DESCRIPTOR->viewDmAnonymously()Z
                                    move-result v$reg
                                    if-eqz v$reg, :rex_dm_seen_continue
                                    return-void
                                    """.trimIndent(),
                                    ExternalLabel("rex_dm_seen_continue", m.getInstruction(0)),
                                )
                            }
                        }
                    }
                }
            }
        }
    }
