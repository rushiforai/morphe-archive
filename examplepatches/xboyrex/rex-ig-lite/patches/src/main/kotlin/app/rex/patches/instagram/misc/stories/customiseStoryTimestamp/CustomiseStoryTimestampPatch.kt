/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.stories.customiseStoryTimestamp

import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findInstructionIndicesReversed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

internal object ReelItemTimestampFormatMethodFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    definingClass = "Lcom/instagram/model/reels/ReelItem;",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(opcode(Opcode.LONG_TO_DOUBLE)),
)

@Suppress("unused")
val customiseStoryTimestampPatch =
    patch(
        name = "Customise story timestamp",
        description = "Customise the timestamp that shows when the story was posted",
    ) {
        dependsOn(settingsPatch)

        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            runCatching {
                ReelItemTimestampFormatMethodFingerprint.method.apply {
                    findInstructionIndicesReversed(Opcode.RETURN_OBJECT).forEach { returnIndex ->
                        val retReg = getInstruction<OneRegisterInstruction>(returnIndex).registerA
                        addInstructions(
                            returnIndex,
                            """
                            invoke-static {v$retReg, p0}, ${PATCHES_DESCRIPTOR}/story/StoryTimestamp;->appendHiddenMentionLabel(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                            move-result-object v$retReg
                            """.trimIndent(),
                        )
                    }

                    val longToDoubleIndex = ReelItemTimestampFormatMethodFingerprint.instructionMatches.first().index
                    val longToDoubleInstruction = getInstruction<TwoRegisterInstruction>(longToDoubleIndex)
                    val dummyRegister = longToDoubleInstruction.registerA
                    val postedTimestampRegister = longToDoubleInstruction.registerB

                    addInstructionsWithLabels(
                        longToDoubleIndex,
                        """
                        invoke-static {v$postedTimestampRegister, v${postedTimestampRegister + 1}, p0}, ${PATCHES_DESCRIPTOR}/story/StoryTimestamp;->customiseStoryTimestamp(JLjava/lang/Object;)Ljava/lang/String;
                        move-result-object v$dummyRegister
                        if-eqz v$dummyRegister, :rex
                        return-object v$dummyRegister
                        """.trimIndent(),
                        ExternalLabel("rex", longToDoubleInstruction),
                    )

                    enableSettings("customiseStoryTimestamp")
                }
            }
        }
    }
