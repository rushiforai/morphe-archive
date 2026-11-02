/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.timeline.hideSocialProof

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.Constants.PREF_DESCRIPTOR
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode

private object HideSocialProofPatchFingerprint : Fingerprint(
    definingClass = "SocialProofView;",
    name = "setSocialProofData",
)

@Suppress("unused")
val hideSocialProofPatch =
    bytecodePatch(
        name = "Hide followed by context",
        description = "Hides followed by context under profile",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch)

        execute {
            val HOOK_DESCRIPTOR =
                "invoke-static {}, $PREF_DESCRIPTOR;->hideSocialProof()Z"
            val method = HideSocialProofPatchFingerprint.method
            val instructions = method.instructions

            method.addInstructionsWithLabels(
                0,
                """
                $HOOK_DESCRIPTOR
                move-result v0
                if-eqz v0, :rex
                return-void
                """.trimIndent(),
                ExternalLabel("rex", instructions.first { it.opcode == Opcode.CONST_4 }),
            )
            enableSettings("hideSocialProof")
        }
    }
