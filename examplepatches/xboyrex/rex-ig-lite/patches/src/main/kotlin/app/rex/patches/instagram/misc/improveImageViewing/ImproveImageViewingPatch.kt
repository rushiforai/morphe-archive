/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.improveImageViewing

import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PREF_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.registersUsed

@Suppress("unused")
val improveImageViewingPatch =
    patch(
        name = "Improve image viewing",
        description = "Fetches max resolution images from server.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(settingsPatch)
        execute {
            runCatching { enableSettings("improveImageViewing") }
            runCatching {
            // p2 is the target width Instagram picks the closest image variant to.
            ReturnExtendedImageUrlFingerprint.method.addInstructions(
                0,
                """
                invoke-static {p2}, $PREF_DESCRIPTOR->imageVariantTargetWidth(I)I
                move-result p2
                """,
            )

            // The array holds the DPI, then the screen width and height.
            val screenSizeArray = SetDPIMetricsFingerprint.instructionMatches.last()
            SetDPIMetricsFingerprint.method.addInstructions(
                screenSizeArray.index,
                screenSizeArray.instruction.registersUsed.drop(1).joinToString("\n") {
                    """
                    invoke-static {v$it}, $PREF_DESCRIPTOR->userAgentScreenSize(Ljava/lang/Integer;)Ljava/lang/Integer;
                    move-result-object v$it
                    """
                },
            )

                        }
        }
    }
