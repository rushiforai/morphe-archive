/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.directMessage.saveAllMessages

import app.rex.patches.instagram.entity.messageInfoEntity.messageInfoEntity
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode

internal object DMLongPressButtonAdderFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("⏰", "userSession"),
    filters = listOf(
        // Save option content type check.
        opcode(Opcode.IF_EQZ),
        opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
        opcode(Opcode.SGET_OBJECT, MatchAfterImmediately()),
    ),
)

@Suppress("unused")
val saveAllMessagesPatch =
    patch(
        description = "Enables save option for all direct messages",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(messageInfoEntity)
        execute {
            runCatching {

            // Make Save option available for all DM content.
            DMLongPressButtonAdderFingerprint.let {
                it.method.removeInstruction(it.instructionMatches.first().index)
            }
        
            }
        }
    }
