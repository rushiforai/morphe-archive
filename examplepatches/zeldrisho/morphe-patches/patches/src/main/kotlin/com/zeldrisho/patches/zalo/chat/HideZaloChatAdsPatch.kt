package com.zeldrisho.patches.zalo.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/** Removes dedicated Zinstant ad cards from the message-tab item list. */
@Suppress("unused")
val hideZaloChatListAdsPatch = bytecodePatch(
    name = "Hide chat list ads",
    description = "Removes dedicated Zinstant ad cards from the message list. Server-inserted promotions or other ad surfaces may remain.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val match = ZinstantAdListInsertion.matchAll(1..1).single()
        val insertion = match.instructionMatches.single { it.instruction.opcode == Opcode.INVOKE_DIRECT }
        suppressZinstantAdInsertionAfterConstructor(match.method, insertion.index)
    }
}

/**
 * Replaces the first `ArrayList.add(int, Object): void` call after [constructorIndex] in [method]
 * with a NOP, leaving the Zinstant ad-card construction intact.
 *
 * @param constructorIndex instruction index of the matched Zinstant ad-card constructor call.
 * @throws IllegalStateException if the method has no implementation or no matching insertion follows.
 */
internal fun suppressZinstantAdInsertionAfterConstructor(
    method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    constructorIndex: Int,
) {
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ZinstantAdListInsertion: matched method has no implementation")
    val add = instructions.indices.firstOrNull { index ->
        index > constructorIndex && instructions[index].let {
            it.opcode == Opcode.INVOKE_VIRTUAL &&
                (it as? ReferenceInstruction)?.reference.let { ref ->
                    ref is MethodReference &&
                        ref.definingClass == "Ljava/util/ArrayList;" && ref.name == "add" &&
                        ref.parameterTypes == listOf("I", "Ljava/lang/Object;") && ref.returnType == "V"
                }
        }
    } ?: error("ZinstantAdListInsertion: list insertion not found after ad card constructor")
    method.replaceInstruction(add, "nop")
}

/**
 * Replaces the instruction at [index] in [method] with a NOP, preserving instruction positions.
 * The caller must ensure [index] identifies the Zinstant ad list insertion.
 */
internal fun suppressZinstantAdInsertion(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, index: Int) {
    method.replaceInstruction(index, "nop")
}

/** Matches only the dedicated ad-card model, not ordinary conversations. */
internal object ZinstantAdListInsertion : Fingerprint(
    definingClass = "Lje0/u;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/util/ArrayList;"),
    filters = listOf(
        methodCall(definingClass = "Lq00/j0;", name = "<init>", parameters = listOf("Lgz/g;"), returnType = "V"),
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "add", parameters = listOf("I", "Ljava/lang/Object;"), returnType = "V"),
    ),
)
