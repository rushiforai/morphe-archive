/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.ghost

import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel

private const val INSTANT_SEEN_MUTATION = "IGQuickSnapUpdateSeenStateMutation"

private object InstantSeenUpdateFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(string(INSTANT_SEEN_MUTATION)),
)

@Suppress("unused")
val ghostInstantsPatch =
    bytecodePatch(
        name = "Hide Instants view",
        description = "Stops Instagram from marking Instants you watch as seen.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(settingsPatch)

        execute {
            InstantSeenUpdateFingerprint.method.apply {
                val firstInstruction = getInstruction(0)
                addInstructionsWithLabels(
                    0,
                    """
                    invoke-static {}, $PATCHES_DESCRIPTOR/ghost/GhostInstants;->hideInstantViews()Z
                    move-result v0
                    if-eqz v0, :rex_send_seen
                    const/4 v0, 0x0
                    return-object v0
                    """.trimIndent(),
                    ExternalLabel("rex_send_seen", firstInstruction),
                )
            }

            enableSettings("ghostInstants")
        }
    }
