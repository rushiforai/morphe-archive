package app.template.patches.zalo.chat

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
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO

/** Hides only the dedicated Media Box conversation-list row. */
@Suppress("unused")
val hideZaloMediaBoxPatch = bytecodePatch(
    name = "Hide Media Box",
    description = "Hides Media Box from the chat list without deleting its content.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val oldMatches = MediaBoxListInsertion.matchAll(0..1)
        val newMatches = MediaBoxListInsertion261002.matchAll(0..1)
        check(oldMatches.size + newMatches.size == 1) { "Expected exactly one Media Box insertion" }
        if (oldMatches.isNotEmpty()) {
            val match = oldMatches.single()
            val insertion = match.instructionMatches.single { it.instruction.opcode == Opcode.INVOKE_DIRECT }
            suppressMediaBoxInsertionAfterConstructor(match.method, insertion.index)
        } else {
            val match = newMatches.single()
            val mediaBoxIndex = match.instructionMatches.first().index
            suppressMediaBoxBranch261002(match.method, mediaBoxIndex)
        }
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

/** Skips the Media Box branch before its counters and list state change on 26.10.02. */
private fun suppressMediaBoxBranch261002(
    method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    mediaBoxIndex: Int,
) {
    val instructions = method.implementation?.instructions?.toList()
        ?: error("MediaBoxListInsertion261002: matched method has no implementation")
    val previousReturn = (0 until mediaBoxIndex).lastOrNull { instructions[it].opcode == Opcode.RETURN_VOID }
        ?: error("MediaBoxListInsertion261002: branch boundary not found")
    val start = previousReturn + 1
    val call = instructions.getOrNull(start) as? ReferenceInstruction
    val reference = call?.reference as? MethodReference
    check(instructions[start].opcode == Opcode.INVOKE_VIRTUAL &&
        reference?.definingClass == "Ltg0/n;" && reference.name == "k" &&
        reference.parameterTypes.isEmpty() && reference.returnType == "I" &&
        instructions.getOrNull(start + 1)?.opcode == Opcode.MOVE_RESULT
    ) { "MediaBoxListInsertion261002: unexpected branch entry" }
    method.replaceInstruction(start, "return-void")
    method.replaceInstruction(start + 1, "nop")
}

/** Exact 26.10.02 branch, kept separate from the previous target's fingerprint. */
internal object MediaBoxListInsertion261002 : Fingerprint(
    definingClass = "Ltg0/s;",
    name = "F",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;",
        "Ljava/util/ArrayList;", "I", "Z", "I", "Ltg0/n;",
    ),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Loz/a;", name = "MediaBox", type = "Loz/a;"),
        methodCall(definingClass = "Ltg0/n;", name = "v", parameters = listOf("Ll20/x;"), returnType = "V"),
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "add", parameters = listOf("Ljava/lang/Object;"), returnType = "Z"),
    ),
)

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
