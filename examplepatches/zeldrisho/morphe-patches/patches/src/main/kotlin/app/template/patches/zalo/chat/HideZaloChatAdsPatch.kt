package app.template.patches.zalo.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO

/** Removes dedicated Zinstant ad cards from the message-tab item list. */
@Suppress("unused")
val hideZaloChatListAdsPatch = bytecodePatch(
    name = "Hide chat list ads",
    description = "Removes ad cards from the chat list. Server-delivered promotions and other ads may remain.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val matches = ZinstantAdListInsertion.matchAll(0..1) + ZinstantAdListInsertion261002.matchAll(0..1)
        check(matches.size == 1) { "Expected exactly one Zinstant ad insertion" }
        val match = matches.single()
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

/** Matches the dedicated Zinstant ad-card model in Zalo 26.10.02. */
internal object ZinstantAdListInsertion261002 : Fingerprint(
    definingClass = "Ltg0/s;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/util/ArrayList;"),
    filters = listOf(
        methodCall(definingClass = "Ll20/l0;", name = "<init>", parameters = listOf("La10/j;"), returnType = "V"),
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "add", parameters = listOf("I", "Ljava/lang/Object;"), returnType = "V"),
    ),
)

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
