/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.timeline.hideNudgeButtons

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.Constants.PREF_DESCRIPTOR
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
import com.android.tools.smali.dexlib2.Opcode

private object HideNudgeButtonPatchFingerprint : Fingerprint(
    definingClass = "FollowNudgeButtonViewDelegateBinder;",
    strings = listOf("viewModel"),
)

@Suppress("unused")
val hideNudgeButtonPatch =
    bytecodePatch(
        name = "Hide nudge button",
        description = "Hides follow/subscribe/follow back buttons on posts",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch)

        execute {

            HideNudgeButtonPatchFingerprint.method.apply {
                val toggleButtonIndex = instructions.filter { it.opcode == Opcode.IGET_OBJECT }[1].location.index
                val dummyReg = findFreeRegister(toggleButtonIndex)

                addInstructionsWithLabels(
                    toggleButtonIndex + 1,
                    """
                    invoke-static {}, $PREF_DESCRIPTOR;->hideNudgeButton()Z
                    move-result v$dummyReg
                    if-eqz v$dummyReg, :rex
                    const/16 v$dummyReg, 0x8
                    invoke-virtual {p1, v$dummyReg}, Landroidx/appcompat/widget/AppCompatButton;->setVisibility(I)V
                    """.trimIndent(),
                    ExternalLabel("rex", getInstruction(toggleButtonIndex + 1)),
                )

                enableSettings("hideNudgeButton")
            }
        }
    }
