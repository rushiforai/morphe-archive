/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.internalStuffs

import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.DOWNLOAD_DESCRIPTOR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode

const val QE_FRAGMENT_DESCRIPTOR = "Lcom/instagram/debug/quickexperiment/QuickExperimentCategoriesFragment;"

internal object QuickExperimentCategoriesFragmentOnViewCreateFingerprint : Fingerprint(
    name = "onViewCreated",
    definingClass = QE_FRAGMENT_DESCRIPTOR,
    filters = listOf(
        opcode(Opcode.IF_GEZ),
        // Fragment of the configs loading dialog.
        methodCall(parameters = listOf("Landroidx/fragment/app/Fragment;"), location = MatchAfterImmediately()),
        opcode(Opcode.GOTO_16),
    ),
)

@Suppress("unused")
val checkMappingsPatch =
    patch(
        description = "This patch is used to check if the mappings file exists and if not alert the user",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        execute {
            runCatching {

            QuickExperimentCategoriesFragmentOnViewCreateFingerprint.method.apply {
                val targetIndex = QuickExperimentCategoriesFragmentOnViewCreateFingerprint.instructionMatches[1].index
                val fragmentRegister = QuickExperimentCategoriesFragmentOnViewCreateFingerprint.instructionMatches[1].instruction.registersUsed[0]

                val firstGoto16 = getInstruction(QuickExperimentCategoriesFragmentOnViewCreateFingerprint.instructionMatches.last().index)

                addInstructionsWithLabels(
                    targetIndex,
                    """ 
                    invoke-static {v$fragmentRegister}, $DOWNLOAD_DESCRIPTOR/DownloadMapping;->checkMappings(Landroidx/fragment/app/Fragment;)V
                    goto: rex
                    """.trimIndent(),
                    ExternalLabel("rex", firstGoto16),
                )
            }
        
            }
        }
    }
