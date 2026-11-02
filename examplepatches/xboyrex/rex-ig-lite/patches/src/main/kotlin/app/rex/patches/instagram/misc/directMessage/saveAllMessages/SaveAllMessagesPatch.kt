/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.directMessage.saveAllMessages

import app.rex.patches.instagram.entity.messageInfoEntity.messageInfoEntity
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

internal object DMLongPressButtonAdderFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("⏰", "userSession"),
)

@Suppress("unused")
val saveAllMessagesPatch =
    bytecodePatch(
        description = "Enables save option for all direct messages",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(messageInfoEntity)
        execute {

            // Make Save option available for all DM content.
            DMLongPressButtonAdderFingerprint.method.apply {
                val allIfNez = instructions.filter { it.opcode == Opcode.IF_NEZ }
                allIfNez.firstOrNull { instruction ->
                    val index = instruction.location.index
                    val opCodeOfPrevInstruction = getInstruction(index - 1).opcode
                    val opCodeOfNextInstruction = getInstruction(index + 1).opcode

                    if (opCodeOfPrevInstruction == Opcode.IF_EQZ && opCodeOfNextInstruction == Opcode.SGET_OBJECT) {
                        removeInstruction(index - 1)
                        true
                    } else {
                        false
                    }
                }
            }
        }
    }
