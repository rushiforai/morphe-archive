package app.zeldrisho.patches.zalo.media

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO

/**
 * Removes Zalo's locally configured age filter from Drive media backup and restore.
 *
 * The stock code reads BACKUP_MEDIA_LIMIT_TIME_DAY (30 by default, and 365 in the
 * supplied UI) and converts it into a timestamp. Returning zero makes the existing
 * code treat all timestamps as eligible. This does not recreate files absent from
 * Drive, bypass server retention, or include media explicitly excluded by Zalo.
 */
internal fun clearAgeResult(method: MutableMethod) {
    val (index, register) = locateAgeResult(method)
    method.replaceInstruction(index, "const/4 v$register, 0x0")
}

private fun locateAgeResult(method: MutableMethod): Pair<Int, Int> {
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
    return resultIndex to result.registerA
}

@Suppress("unused")
val removeZaloMediaBackupAgeLimitPatch = bytecodePatch(
    name = "Remove media backup age limit",
    description = "Includes media of any age in Drive backup and restore. " +
        "Drive retention and excluded media still apply.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)
    execute {
        val oldBackup = MediaBackupAgeFilter.matchAll(0..1)
        val oldRestore = MediaRestoreAgeCutoff.matchAll(0..1)
        val currentBackup = MediaBackupAgeFilter261002.matchAll(0..1)
        val currentRestore = MediaRestoreAgeCutoff261002.matchAll(0..1)
        check(oldBackup.size + currentBackup.size == 1 && oldRestore.size + currentRestore.size == 1) {
            "Expected one backup and one restore age cutoff"
        }
        if (oldBackup.isNotEmpty() && oldRestore.isNotEmpty()) {
            clearAgeResult(oldBackup.single().method)
            clearAgeResult(oldRestore.single().method)
            return@execute
        }
        check(currentBackup.size == 1 && currentRestore.size == 1) { "Mixed media age cutoff versions" }
        val targets = listOf(currentBackup.single().method, currentRestore.single().method).map { method ->
            val (index, register) = locateAgeResult(method)
            val instructions = method.implementation!!.instructions.toList()
            val getter = (instructions.getOrNull(index - 1) as? ReferenceInstruction)?.reference?.toString()
            check(register == 0 && getter == "Lp60/p0;->l(ILjava/lang/String;Z)I" &&
                instructions.getOrNull(index + 1)?.opcode == Opcode.IF_LEZ
            ) { "Zalo media age limit: unexpected native getter or result consumer" }
            method to index
        }
        targets.forEach { (method, index) -> method.replaceInstruction(index, "const/4 v0, 0x0") }
    }
}
