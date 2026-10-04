package com.zeldrisho.patches.zalo.backup

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

private const val INTERVAL_KEY = "SERVER_CONFIG_SYNC_MESSAGE_INTERVAL_"
private const val INTERVAL_GETTER = "Lu40/p0;->Y(JZLjava/lang/String;)J"
private const val KEY_LOOKBACK_INSTRUCTIONS = 24
private val intervalHours = setOf("1", "3", "6", "12")

/**
 * Replaces the native interval getter result with [hours] converted to milliseconds.
 *
 * Accepts only 1, 3, 6, or 12 hours. Requires a single known getter, the key-building
 * pattern recognized by [hasAccountSpecificKey], and a wide result immediately after it;
 * validation fails before mutation.
 * The remaining scheduler instructions, including native backup guards, are preserved.
 *
 * @throws IllegalArgumentException if [hours] is not one of the supported values.
 * @throws IllegalStateException if [method] has no implementation or the required
 * getter, key-building pattern, or argument/result registers cannot be found.
 */
internal fun overrideBackupInterval(method: MutableMethod, hours: String) {
    require(hours in intervalHours) { "Backup interval must be one of 1, 3, 6, or 12 hours" }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("Zalo backup interval: scheduler has no implementation")
    val getterIndex = findIntervalGetter(instructions)
    val keyRegister = invokeRegisterAt(instructions[getterIndex], 3)
        ?: error("Zalo backup interval: getter string argument register not found")
    check(hasAccountSpecificKey(instructions, getterIndex, keyRegister)) {
        "Zalo backup interval: account-specific interval key is not passed to getter"
    }
    val resultIndex = getterIndex + 1
    check(resultIndex < instructions.size && instructions[resultIndex].opcode == Opcode.MOVE_RESULT_WIDE) {
        "Zalo backup interval: interval getter is not followed by move-result-wide"
    }
    val register = (instructions[resultIndex] as? OneRegisterInstruction)?.registerA
        ?: error("Zalo backup interval: result register not found")
    val millis = hours.toLong() * 3_600_000L
    method.replaceInstruction(resultIndex, "const-wide/32 v$register, $millis")
}

/**
 * Returns the zero-based index of the sole static call to the known interval getter.
 *
 * @throws IllegalStateException if there are no matching calls or more than one.
 */
private fun findIntervalGetter(instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>): Int {
    val matches = instructions.indices.filter { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        instructions[index].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) &&
            reference?.let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" } == INTERVAL_GETTER
    }
    check(matches.size == 1) { "Zalo backup interval: expected exactly one interval getter (found ${matches.size})" }
    return matches.single()
}

/**
 * Checks for the runtime key-building pattern before the getter at [getterIndex].
 *
 * Returns true when the interval prefix is loaded within the preceding 24 instructions,
 * appended to a StringBuilder, and that builder's toString result is moved into
 * [keyRegister], the getter's string argument register. Later StringBuilder appends
 * on the same builder are followed through. Returns false if no pattern matches.
 */
private fun hasAccountSpecificKey(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    getterIndex: Int,
    keyRegister: Int,
): Boolean = (maxOf(0, getterIndex - KEY_LOOKBACK_INSTRUCTIONS) until getterIndex).any { prefixIndex ->
    val prefixLoad = instructions[prefixIndex]
    val prefixReference = (prefixLoad as? ReferenceInstruction)?.reference as? StringReference
    val prefixRegister = (prefixLoad as? OneRegisterInstruction)?.registerA
    prefixLoad.opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
        prefixReference?.string == INTERVAL_KEY && prefixRegister != null &&
        prefixFlowsToKey(instructions, prefixIndex, getterIndex, prefixRegister, keyRegister)
}

private fun prefixFlowsToKey(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    prefixIndex: Int,
    getterIndex: Int,
    prefixRegister: Int,
    keyRegister: Int,
): Boolean {
    var builderRegister: Int? = null
    var prefixAppended = false
    for (index in prefixIndex + 1 until getterIndex) {
        val instruction = instructions[index]
        val reference = stringBuilderReference(instruction) ?: continue
        if (isStringAppend(reference)) {
            val receiver = invokeRegisterAt(instruction, 0)
            val argument = invokeRegisterAt(instruction, 1)
            val resultRegister = moveResultObjectRegister(instructions, index)
            if (resultRegister != null) {
                if (argument == prefixRegister) {
                    prefixAppended = true
                    builderRegister = resultRegister
                } else if (prefixAppended && receiver == builderRegister) {
                    builderRegister = resultRegister
                }
            }
        } else if (prefixAppended && isGetterKeyConstruction(
                instructions,
                index,
                instruction,
                reference,
                builderRegister,
                keyRegister,
            )
        ) {
            return true
        }
    }
    return false
}

private fun stringBuilderReference(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction): MethodReference? {
    if (instruction.opcode !in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)) return null
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
    return reference?.takeIf { it.definingClass == "Ljava/lang/StringBuilder;" }
}

private fun isStringAppend(reference: MethodReference): Boolean = reference.name == "append" &&
    reference.parameterTypes == listOf("Ljava/lang/String;") &&
    reference.returnType == "Ljava/lang/StringBuilder;"

private fun isStringBuilderToString(reference: MethodReference): Boolean = reference.name == "toString" && reference.returnType == "Ljava/lang/String;"

private fun isGetterKeyConstruction(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    index: Int,
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    reference: MethodReference,
    builderRegister: Int?,
    keyRegister: Int,
): Boolean = isStringBuilderToString(reference) &&
    invokeRegisterAt(instruction, 0) == builderRegister &&
    moveResultObjectRegister(instructions, index) == keyRegister

private fun moveResultObjectRegister(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    invokeIndex: Int,
): Int? {
    val result = instructions.getOrNull(invokeIndex + 1)
    if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    return (result as? OneRegisterInstruction)?.registerA
}

@Suppress("MagicNumber") // DEX invoke registers are positional (C through G).
private fun invokeRegisterAt(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction, index: Int): Int? =
    when (instruction) {
        is FiveRegisterInstruction -> when {
            index >= instruction.registerCount -> null
            index == 0 -> instruction.registerC
            index == 1 -> instruction.registerD
            index == 2 -> instruction.registerE
            index == 3 -> instruction.registerF
            index == 4 -> instruction.registerG
            else -> null
        }

        is RegisterRangeInstruction ->
            if (index < instruction.registerCount) instruction.startRegister + index else null

        else -> null
    }

@Suppress("unused")
val configurableZaloBackupIntervalPatch = bytecodePatch(
    name = "Configurable native backup interval",
    description = "Overrides only Zalo's native auto-backup interval (1, 3, 6, or 12 hours). " +
        "Native opt-in, account, network, and backup guards remain in place.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    val hours by stringOption(
        key = "hours",
        default = "6",
        title = "Backup interval (hours)",
        description = "Choose 1, 3, 6, or 12 hours.",
        required = true,
    )

    execute {
        overrideBackupInterval(BackupScheduler.method, hours!!)
    }
}
