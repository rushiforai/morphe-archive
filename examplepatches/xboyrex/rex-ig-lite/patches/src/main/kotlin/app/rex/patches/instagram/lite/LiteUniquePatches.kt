/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.rex.patches.instagram.lite

import app.morphe.patcher.patch.patch

import app.rex.patches.instagram.misc.extension.sharedExtensionPatch
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PREF_CALL_DESCRIPTOR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.string
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.smali.ExternalLabel

private const val INSTANT_SEEN_MUTATION = "IGQuickSnapUpdateSeenStateMutation"
private const val AD_POD_KEY = "Is ad pod"

internal object InstantSeenMutationFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(string(INSTANT_SEEN_MUTATION)),
)

internal object AdPodDecisionFingerprint : Fingerprint(
    returnType = "Z",
    filters = listOf(string(AD_POD_KEY)),
)

@Suppress("unused")
val ghostInstantsPatch = patch(
    name = "View Instants anonymously",
    description = "Stops Instagram from marking Instants (QuickSnaps) you watch as seen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)
    dependsOn(sharedExtensionPatch, settingsPatch)

    execute {
            runCatching {
        runCatching {
            InstantSeenMutationFingerprint.method.apply {
                val scratch = findFreeRegister(0)
                addInstructionsWithLabels(
                    0,
                    """
                    $PREF_CALL_DESCRIPTOR->viewStoriesAnonymously()Z
                    move-result v$scratch
                    if-eqz v$scratch, :rex_instant_seen_original
                    const/4 v$scratch, 0x0
                    return-object v$scratch
                    """.trimIndent(),
                    ExternalLabel("rex_instant_seen_original", getInstruction(0)),
                )
            }
        }
    
            }
        }
}

@Suppress("unused")
val hideReelsAndStoriesAdPodsPatch = patch(
    name = "Hide reels and stories ad pods",
    description = "Stops Instagram's ad injection engine from inserting ad pods into Reels, Stories, and Explore.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)
    dependsOn(sharedExtensionPatch, settingsPatch)

    execute {
            runCatching {
        runCatching {
            AdPodDecisionFingerprint.method.apply {
                val scratch = findFreeRegister(0)
                addInstructionsWithLabels(
                    0,
                    """
                    $PREF_CALL_DESCRIPTOR->disableAds()Z
                    move-result v$scratch
                    if-eqz v$scratch, :rex_ad_pod_original
                    const/4 v$scratch, 0x0
                    return v$scratch
                    """.trimIndent(),
                    ExternalLabel("rex_ad_pod_original", getInstruction(0)),
                )
            }
        }
    
            }
        }
}
