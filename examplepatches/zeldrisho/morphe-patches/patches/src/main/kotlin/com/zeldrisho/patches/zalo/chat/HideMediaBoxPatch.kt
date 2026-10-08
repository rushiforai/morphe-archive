package com.zeldrisho.patches.zalo.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/** Hides only the dedicated Media Box conversation-list row. */
@Suppress("unused")
val hideZaloMediaBoxPatch = bytecodePatch(
    name = "Hide Media Box",
    description = "Hides Zalo's Media Box row from the conversation list; Media Box content and data are not deleted.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val match = MediaBoxListInsertion.matchAll(1..1).single()
        val insertion = match.instructionMatches.single { it.instruction.opcode == Opcode.INVOKE_DIRECT }
        suppressMediaBoxInsertionAfterConstructor(match.method, insertion.index)
    }
}

/**
 * Replaces the first `ArrayList.add(Object): boolean` call after [constructorIndex] in [method]
 * with a NOP, leaving the Media Box row construction intact.
 *
 * @param constructorIndex instruction index of the matched Media Box row constructor call.
 * @throws IllegalStateException if the method has no implementation or no matching insertion follows.
 */
internal fun suppressMediaBoxInsertionAfterConstructor(
    method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    constructorIndex: Int,
) {
    val instructions = method.implementation?.instructions?.toList()
        ?: error("MediaBoxListInsertion: matched method has no implementation")
    val add = instructions.indices.firstOrNull { index ->
        index > constructorIndex && instructions[index].let {
            it.opcode == Opcode.INVOKE_VIRTUAL &&
                (it as? ReferenceInstruction)?.reference.let { ref ->
                    ref is MethodReference &&
                        ref.definingClass == "Ljava/util/ArrayList;" && ref.name == "add" &&
                        ref.parameterTypes == listOf("Ljava/lang/Object;") && ref.returnType == "Z"
                }
        }
    } ?: error("MediaBoxListInsertion: list insertion not found after Media Box constructor")
    method.replaceInstruction(add, "nop")
}

/**
 * Replaces the instruction at [index] in [method] with a NOP, preserving instruction positions.
 * The caller must ensure [index] identifies the Media Box list insertion.
 */
internal fun suppressMediaBoxInsertion(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, index: Int) {
    method.replaceInstruction(index, "nop")
}

/** Anchors the list-building branch to the MediaBox enum and its dedicated row constructor. */
internal object MediaBoxListInsertion : Fingerprint(
    definingClass = "Lje0/u;",
    name = "G",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;",
        "Ljava/util/ArrayList;",
        "I",
        "Z",
        "I",
        "Lje0/p;",
    ),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Lsx/a;", name = "MediaBox", type = "Lsx/a;"),
        methodCall(
            definingClass = "Lq00/v;",
            name = "<init>",
            parameters = listOf("Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;"),
            returnType = "V",
        ),
        opcode(Opcode.INVOKE_VIRTUAL),
    ),
)
