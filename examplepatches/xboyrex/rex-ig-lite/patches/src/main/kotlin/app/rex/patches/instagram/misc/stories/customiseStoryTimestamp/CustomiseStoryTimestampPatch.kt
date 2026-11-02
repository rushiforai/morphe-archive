/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.stories.customiseStoryTimestamp

import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode

internal object ReelItemTimestampFormatMethodFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    definingClass = "Lcom/instagram/model/reels/ReelItem;",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val customiseStoryTimestampPatch =
    bytecodePatch(
        name = "Customise story timestamp",
        description = "Customise the timestamp that shows when the story was posted",
    ) {
        dependsOn(settingsPatch)

        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            ReelItemTimestampFormatMethodFingerprint.method.apply {
                val longToDoubleIndex = indexOfFirstInstruction(Opcode.LONG_TO_DOUBLE)
                val longToDoubleInstruction = getInstruction(longToDoubleIndex)
                val longToDoubleRegisters = longToDoubleInstruction.registersUsed
                val dummyRegister = longToDoubleRegisters[0]
                val postedTimestampRegister = longToDoubleRegisters[1]

                addInstructionsWithLabels(
                    longToDoubleIndex,
                    """
                    invoke-static/range {v$postedTimestampRegister .. v${postedTimestampRegister + 1}}, ${PATCHES_DESCRIPTOR}/story/StoryTimestamp;->customiseStoryTimestamp(J)Ljava/lang/String;
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
