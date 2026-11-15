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
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
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
                val longToDoubleIndex = ReelItemTimestampFormatMethodFingerprint.instructionMatches.first().index
                val longToDoubleInstruction = getInstruction<TwoRegisterInstruction>(longToDoubleIndex)
                val dummyRegister = longToDoubleInstruction.registerA
                val postedTimestampRegister = longToDoubleInstruction.registerB

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
    }
