/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.disableVideoAutoplay

import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PREF_CALL_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

object DisableVideoAutoplayMethodFingerprint : Fingerprint(
    strings = listOf("ig_olympus_disable_video_autoplay", "ig_disable_video_autoplay", "ig_video_setting"),
    returnType = "Z",
)

// Credits to MyInsta
@Suppress("unused")
val disableVideoAutoplayPatch =
    bytecodePatch(
        name = "Disable video autoplay",
    ) {
        dependsOn(settingsPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            DisableVideoAutoplayMethodFingerprint.method.apply {
                addInstructionsWithLabels(
                    0,
                    """
                    $PREF_CALL_DESCRIPTOR->disableVideoAutoplay()Z
                    move-result v0
                    if-eqz v0, :rex
                    return v0
                    """.trimIndent(),
                    ExternalLabel("rex", getInstruction(0)),
                )
                enableSettings("disableVideoAutoplay")
            }
        }
    }
