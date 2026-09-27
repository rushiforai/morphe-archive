package com.zeldrisho.patches.zalo.backup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

private const val MAX_CONST16_REGISTER = 0xFF

/**
 * Forces only the value argument of the setter call immediately following the backup-media key.
 * This setter takes two booleans; the second (default) argument is deliberately preserved.
 */
internal fun enableMediaBackup(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    val implementation = method.implementation
        ?: error("Zalo Google Drive backup: configuration method has no implementation")
    val instructions = implementation.instructions
    val keys = instructions.indices.filter { index ->
        (instructions[index] as? ReferenceInstruction)?.reference.let { it as? StringReference }
            ?.string == "ENABLE_BACKUP_MEDIA"
    }
    check(keys.size == 1) {
        "Zalo Google Drive backup: expected exactly one ENABLE_BACKUP_MEDIA key"
    }
    val keyIndex = keys.single()
    val keyRegister = (instructions[keyIndex] as? OneRegisterInstruction)?.registerA
        ?: error("Zalo Google Drive backup: backup key register not found")
    check(
        keyIndex + 1 < instructions.size &&
            instructions[keyIndex + 1].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE),
    ) {
        "Zalo Google Drive backup: setter call does not follow ENABLE_BACKUP_MEDIA key"
    }
    val writeIndex = keyIndex + 1
    val writeInstruction = instructions[writeIndex]
    check(keyRegister == invokeRegisterAt(writeInstruction, 0)) {
        "Zalo Google Drive backup: setter key does not match ENABLE_BACKUP_MEDIA"
    }
    val writeReference = (writeInstruction as? ReferenceInstruction)?.reference as? MethodReference
        ?: error("Zalo Google Drive backup: ENABLE_BACKUP_MEDIA write reference not found")
    check(
        writeReference.definingClass == "Lu40/p0;" && writeReference.name == "i0" &&
            writeReference.parameterTypes == listOf("Ljava/lang/String;", "Z", "Z"),
    ) {
        "Zalo Google Drive backup: unexpected ENABLE_BACKUP_MEDIA setter signature"
    }
    val valueRegister = invokeRegisterAt(writeInstruction, 1)
        ?: error("Zalo Google Drive backup: backup value register not found")
    val preservedRegister = invokeRegisterAt(writeInstruction, 2)
        ?: error("Zalo Google Drive backup: preserved boolean register not found")
    check(valueRegister != preservedRegister) {
        "Zalo Google Drive backup: boolean arguments must use distinct registers"
    }
    check(valueRegister <= MAX_CONST16_REGISTER) {
        "Zalo Google Drive backup: backup value register v$valueRegister is out of const/16 range"
    }
    method.addInstructions(writeIndex, "const/16 v$valueRegister, 0x1")
}

/**
 * Resolves a non-negative argument slot to its register in a fixed or range invoke.
 * Returns null when the slot is at or beyond the argument count or the instruction format is unsupported.
 */
@Suppress("MagicNumber") // DEX invoke register slots are positional (C through G).
private fun invokeRegisterAt(instruction: Instruction, registerIndex: Int): Int? = when (instruction) {
    is FiveRegisterInstruction -> if (registerIndex >= instruction.registerCount) {
        null
    } else {
        when (registerIndex) {
            0 -> instruction.registerC
            1 -> instruction.registerD
            2 -> instruction.registerE
            3 -> instruction.registerF
            4 -> instruction.registerG
            else -> null
        }
    }

    is RegisterRangeInstruction ->
        if (registerIndex < instruction.registerCount) instruction.startRegister + registerIndex else null

    else -> null
}

/** Enables the existing Google Drive photo-backup entry point. */
@Suppress("unused")
val enableZaloGoogleDriveMediaBackupPatch = bytecodePatch(
    name = "Enable Google Drive photo backup",
    description = "Enables Zalo's existing Google Drive photo-backup option. " +
        "It does not bypass Google authorization, server retention, encryption, or media exclusions.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        enableMediaBackup(BackupConfiguration.method)
    }
}
