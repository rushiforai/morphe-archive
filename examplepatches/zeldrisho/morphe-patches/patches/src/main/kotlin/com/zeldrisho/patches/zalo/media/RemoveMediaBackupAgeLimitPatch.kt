package com.zeldrisho.patches.zalo.media

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/**
 * Removes Zalo's locally configured age filter from Drive media backup and restore.
 *
 * The stock code reads BACKUP_MEDIA_LIMIT_TIME_DAY (30 by default, and 365 in the
 * supplied UI) and converts it into a timestamp. Returning zero makes the existing
 * code treat all timestamps as eligible. This does not recreate files absent from
 * Drive, bypass server retention, or include media explicitly excluded by Zalo.
 */
internal fun clearAgeResult(method: MutableMethod) {
    val implementation = method.implementation
        ?: error("Zalo media age limit: method has no implementation")
    val instructions = implementation.instructions.toList()
    val keyIndex = instructions.indexOfFirst { instruction ->
        if (instruction.opcode != Opcode.CONST_STRING) return@indexOfFirst false
        val reference = (instruction as? ReferenceInstruction)?.reference
        (reference as? StringReference)?.string == "BACKUP_MEDIA_LIMIT_TIME_DAY"
    }
    check(keyIndex >= 0) { "Zalo media age limit: config key not found" }
    val resultIndex = instructions.withIndex().indexOfFirst { (index, instruction) ->
        index > keyIndex && instruction.opcode == Opcode.MOVE_RESULT
    }
    check(resultIndex >= 0) { "Zalo media age limit: config result not found" }
    val result = instructions[resultIndex] as OneRegisterInstruction
    method.replaceInstruction(resultIndex, "const/4 v${result.registerA}, 0x0")
}

@Suppress("unused")
val removeZaloMediaBackupAgeLimitPatch = bytecodePatch(
    name = "Remove media backup age limit",
    description = "Includes media of any age in Zalo's existing Google Drive " +
        "backup/restore pipeline. It does not bypass Drive retention or media exclusions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        clearAgeResult(MediaBackupAgeFilter.method)
        clearAgeResult(MediaRestoreAgeCutoff.method)
    }
}
