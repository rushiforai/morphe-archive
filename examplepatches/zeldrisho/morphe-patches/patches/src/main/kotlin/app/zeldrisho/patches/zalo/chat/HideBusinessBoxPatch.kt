package app.zeldrisho.patches.zalo.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO

/**
 * Suppresses Zalo's typed Business Box conversation item (q00/a, item type 0x2e).
 *
 * This intentionally targets the dedicated item subtype rather than ContactProfile
 * account/OA fields, so ordinary user conversations and user-initiated OA chats are
 * unaffected. The target is pinned to Zalo 26.08.01; re-verify both methods on update.
 */
@Suppress("unused")
val hideZaloBusinessBoxPatch = bytecodePatch(
    name = "Hide Business Box",
    description = "Hides Business Box from the chat list without hiding ordinary or " +
        "user-initiated Official Account chats.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        // je0/u.G() constructs q00/a only for the dedicated Business Box path.
        // Returning at its constructor call prevents insertion while preserving all
        // standard Conversation categories and avoiding a broad method short-circuit.
        val insertions = BusinessBoxListInsertionFingerprint.matchAll(0..1) +
            BusinessBoxListInsertion261002.matchAll(0..1) + BusinessBoxListInsertion261101.matchAll(0..1)
        check(insertions.size == 1) { "Expected exactly one Business Box insertion" }
        val insertion = insertions.single()
        if (insertion.method.definingClass == "Lp8g;") {
            val anchor = insertion.instructionMatches.first().index
            val instructions = insertion.method.implementation!!.instructions.toList()
            val start = ((0 until anchor).lastOrNull { instructions[it].opcode == Opcode.RETURN_VOID }
                ?: error("Business Box branch boundary not found")) + 1
            val reference = (instructions.getOrNull(start) as? ReferenceInstruction)?.reference as? MethodReference
            check(instructions[start].opcode == Opcode.INVOKE_VIRTUAL &&
                reference?.definingClass == "Lk8g;" && reference.name == "j" &&
                reference.parameterTypes.isEmpty() && reference.returnType == "I" &&
                instructions.getOrNull(start + 1)?.opcode == Opcode.MOVE_RESULT
            ) { "Business Box branch entry changed" }
            insertion.method.replaceInstruction(start, "return-void")
            insertion.method.replaceInstruction(start + 1, "nop")
        } else {
            val constructor = insertion.instructionMatches.single { it.instruction.opcode == Opcode.INVOKE_DIRECT }
            suppressBusinessBoxInsertion(insertion.method, constructor.index)
        }

        val oldPeriodic = BusinessBoxPeriodicBranchFingerprint.matchAll(0..1)
        val newPeriodic = BusinessBoxPeriodicBranch261002.matchAll(0..1)
        val diagnostic = BusinessBoxPeriodicBranch261101.matchAll(0..1)
        check(oldPeriodic.size + newPeriodic.size + diagnostic.size == 1) { "Expected exactly one Business Box refresh handler" }
        if (diagnostic.isNotEmpty()) {
            val method = diagnostic.single().method
            val instructions = method.implementation!!.instructions.toList()
            val index = instructions.indices.singleOrNull { i ->
                instructions[i].opcode == Opcode.INSTANCE_OF &&
                    ((instructions[i] as? ReferenceInstruction)?.reference as? TypeReference)?.type == "Lw22;"
            } ?: error("Business Box refresh type check not uniquely found")
            val registers = instructions[index] as? TwoRegisterInstruction
            val branch = instructions.getOrNull(index + 1) as? OneRegisterInstruction
            check(registers?.registerA == 4 && registers.registerB == 4 &&
                instructions.getOrNull(index + 1)?.opcode == Opcode.IF_EQZ && branch?.registerA == 4
            ) { "Business Box refresh type branch changed" }
            method.replaceInstruction(index, "const/4 v4, 0x0")
        } else if (oldPeriodic.isNotEmpty()) {
            val match = oldPeriodic.single()
            val cast = match.instructionMatches.single { it.instruction.opcode == Opcode.CHECK_CAST }
            suppressBusinessBoxPeriodicBranch(match.method, cast.index)
        } else {
            val method = newPeriodic.single().method
            val instructions = method.implementation?.instructions?.toList()
                ?: error("Business Box refresh handler has no implementation")
            val cast = instructions.indices.singleOrNull { index ->
                val instruction = instructions[index]
                instruction.opcode == Opcode.CHECK_CAST &&
                    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == "Ll20/a;"
            } ?: error("Business Box refresh cast not uniquely found")
            suppressBusinessBoxPeriodicBranch(method, cast)
        }
    }
}

/** Replaces the selected business-box insertion instruction with an immediate void return. */
internal fun suppressBusinessBoxInsertion(
    method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    instructionIndex: Int,
) {
    method.replaceInstruction(instructionIndex, "return-void")
}

/** Replaces the selected periodic business-box branch instruction with a void return. */
internal fun suppressBusinessBoxPeriodicBranch(
    method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    instructionIndex: Int,
) {
    method.replaceInstruction(instructionIndex, "return-void")
}

// Experimental target: 26.11.01 is advertised but not fully device-qualified.
internal object BusinessBoxListInsertion261101 : Fingerprint(
    definingClass = "Lp8g;", name = "D",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL), returnType = "V",
    parameters = listOf("Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;",
        "Ljava/util/ArrayList;", "I", "Z", "I", "Lk8g;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Lkf2;", name = "BizBox", type = "Lkf2;"),
        methodCall(definingClass = "Lw22;", name = "<init>",
            parameters = listOf("Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;", "Ljava/lang/String;"), returnType = "V"),
    ),
)

internal object BusinessBoxPeriodicBranch261101 : Fingerprint(
    definingClass = "Lnag;", name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL), returnType = "V",
    parameters = emptyList(), filters = listOf(string("business_box_thread")),
)

internal object BusinessBoxListInsertion261002 : Fingerprint(
    definingClass = "Ltg0/s;",
    name = "F",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;",
        "Ljava/util/ArrayList;", "I", "Z", "I", "Ltg0/n;",
    ),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Loz/a;", name = "BizBox", type = "Loz/a;"),
        methodCall(
            definingClass = "Ll20/a;", name = "<init>",
            parameters = listOf("Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;", "Ljava/lang/String;"),
            returnType = "V",
        ),
    ),
)

internal object BusinessBoxPeriodicBranch261002 : Fingerprint(
    definingClass = "Lpx/z;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(string("business_box_thread")),
)

internal object BusinessBoxListInsertionFingerprint : Fingerprint(
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
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "Lsx/a;",
            name = "BizBox",
            type = "Lsx/a;",
        ),
        methodCall(
            definingClass = "Lq00/a;",
            name = "<init>",
            parameters = listOf(
                "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;",
                "Ljava/lang/String;",
            ),
            returnType = "V",
        ),
    ),
)

internal object BusinessBoxPeriodicBranchFingerprint : Fingerprint(
    definingClass = "Lof1/o;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.INSTANCE_OF),
        opcode(Opcode.IF_EQZ),
        opcode(Opcode.CHECK_CAST),
        string("business_box_thread"),
    ),
)

internal val businessBoxFingerprints = listOf(
    BusinessBoxListInsertionFingerprint,
    BusinessBoxPeriodicBranchFingerprint,
)
