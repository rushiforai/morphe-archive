package dev.jason.gboardpatches.patches.gboard.features.longpressquickactions

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationPlan
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationState
import dev.jason.gboardpatches.patches.gboard.shared.applyVerified
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.isRegisterOperation
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val INPUT_EVENT_RUNTIME_CALL =
    RuntimeCallId.LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_HANDLE_INPUT_EVENT
private val INPUT_EVENT_RUNTIME_DESCRIPTOR = RuntimeAbiCatalog.abi(INPUT_EVENT_RUNTIME_CALL).reference

internal val LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_DELEGATE = """
    ${RuntimeCallEmitter.invoke(INPUT_EVENT_RUNTIME_CALL, "p0 .. p1")}

    move-result v0

    if-eqz v0, :jasondev_continue_long_press_quick_action_event

    return v0
""".trimIndent()

private val LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_CALL = """
    ${RuntimeCallEmitter.invoke(INPUT_EVENT_RUNTIME_CALL, "p0 .. p1")}

    move-result v0
""".trimIndent()

private val LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_BRANCH = """
    if-eqz v0, :jasondev_continue_long_press_quick_action_event

    return v0
""".trimIndent()

internal val gboardLongPressQuickActionsInputEventPatch = bytecodePatch(
    description = "在 18.0.3 Gboard input event dispatcher 前處理 exact editing shortcuts。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val method = findMutableMethodOrThrow(
            GboardVersionBindings.longPressQuickActionsInputEvent,
        )
        method.applyLongPressQuickActionsInputEventDelegate()
    }
}

internal fun MutableMethod.applyLongPressQuickActionsInputEventDelegate() {
    applyVerified(
        VerifiedTransformationPlan(
            targetName = GboardVersionBindings.longPressQuickActionsInputEvent.reference,
            classify = MutableMethod::classifyLongPressInputEvent,
            mutate = { method ->
                method.addInstructions(0, "nop")
                val continuation = method.implementation!!.instructions[0]
                method.addInstructionsWithLabels(
                    0,
                    LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_BRANCH,
                    ExternalLabel(
                        "jasondev_continue_long_press_quick_action_event",
                        continuation,
                    ),
                )
                method.addInstructions(0, LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_CALL)
                method
            },
        ),
    )
}

private fun MutableMethod.classifyLongPressInputEvent(): VerifiedTransformationState {
    val implementation = implementation
        ?: error("Long-press input event target has no implementation")
    val layout = inputEventRegisterLayout(implementation.registerCount)
    val instructions = implementation.instructions
    return when (instructions.count { it.isMethodReference(INPUT_EVENT_RUNTIME_DESCRIPTOR) }) {
        0 -> {
            check(instructions.hasLongPressInputStockEntry(0, layout.eventRegister)) {
                "Stock entry drift in " +
                    "${GboardVersionBindings.longPressQuickActionsInputEvent.reference}: " +
                    instructions.take(4).joinToString { instruction ->
                        instruction.opcode.name + ":" +
                            (instruction as? OneRegisterInstruction)?.registerA + ":" +
                            (instruction as? TwoRegisterInstruction)?.registerB
                    }
            }
            VerifiedTransformationState.STOCK
        }
        1 -> if (
            instructions.size >= 5 &&
            instructions[0].isInvoke(
                "INVOKE_STATIC_RANGE",
                INPUT_EVENT_RUNTIME_DESCRIPTOR,
                layout.receiverRegister,
                layout.eventRegister,
            ) &&
            instructions[1].isRegisterOperation("MOVE_RESULT", 0) &&
            instructions[2].isRegisterOperation("IF_EQZ", 0) &&
            instructions[3].isRegisterOperation("RETURN", 0) &&
            instructions[4].isOpcode("NOP") &&
            instructions.hasExactBranchTarget(2, 4) &&
            instructions.hasLongPressInputStockEntry(5, layout.eventRegister)
        ) {
            VerifiedTransformationState.PATCHED
        } else {
            VerifiedTransformationState.MALFORMED
        }
        else -> VerifiedTransformationState.MALFORMED
    }
}

private fun List<Instruction>.hasLongPressInputStockEntry(
    startIndex: Int,
    eventRegister: Int,
): Boolean {
    if (size < startIndex + 4) return false
    val firstMove = this[startIndex] as? TwoRegisterInstruction
    val zero = this[startIndex + 1] as? NarrowLiteralInstruction
    return this[startIndex].isOpcode("MOVE_OBJECT_FROM16") &&
        firstMove?.registerA == 1 && firstMove.registerB == eventRegister &&
        this[startIndex + 1].isOpcode("CONST_4") &&
        (this[startIndex + 1] as? OneRegisterInstruction)?.registerA == 2 &&
        zero?.narrowLiteral == 0 &&
        this[startIndex + 2].isRegisterOperation("IF_NEZ", 1) &&
        this[startIndex + 3].isRegisterOperation("RETURN", 2)
}

private data class InputEventRegisterLayout(
    val receiverRegister: Int,
    val eventRegister: Int,
)

private fun inputEventRegisterLayout(registerCount: Int): InputEventRegisterLayout {
    val binding = GboardVersionBindings.longPressQuickActionsInputEvent
    check(binding.parameterTypes.size == 1 && binding.returnType == "Z") {
        "Long-press input event prototype drift: ${binding.reference}"
    }
    val parameterWordCount = 1 + binding.parameterTypes.sumOf { type ->
        if (type == "J" || type == "D") 2 else 1
    }
    val receiverRegister = registerCount - parameterWordCount
    val eventRegister = receiverRegister + 1
    check(receiverRegister >= 0 && eventRegister < registerCount) {
        "Long-press input event register layout is smaller than its prototype"
    }
    return InputEventRegisterLayout(receiverRegister, eventRegister)
}

private fun List<Instruction>.hasExactBranchTarget(
    branchIndex: Int,
    targetIndex: Int,
): Boolean {
    val branch = getOrNull(branchIndex) as? OffsetInstruction ?: return false
    if (targetIndex !in indices) return false
    return codeAddressOf(branchIndex) + branch.codeOffset == codeAddressOf(targetIndex)
}

private fun List<Instruction>.codeAddressOf(index: Int): Int =
    take(index).sumOf { instruction -> instruction.codeUnits }
