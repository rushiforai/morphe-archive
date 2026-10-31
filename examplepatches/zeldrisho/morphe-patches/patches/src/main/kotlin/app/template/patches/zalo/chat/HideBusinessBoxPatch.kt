package app.template.patches.zalo.chat

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
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO

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
            BusinessBoxListInsertion261002.matchAll(0..1)
        check(insertions.size == 1) { "Expected exactly one Business Box insertion" }
        val insertion = insertions.single()
        val constructor = insertion.instructionMatches.single { it.instruction.opcode == Opcode.INVOKE_DIRECT }
        suppressBusinessBoxInsertion(insertion.method, constructor.index)

        val oldPeriodic = BusinessBoxPeriodicBranchFingerprint.matchAll(0..1)
        val newPeriodic = BusinessBoxPeriodicBranch261002.matchAll(0..1)
        check(oldPeriodic.size + newPeriodic.size == 1) { "Expected exactly one Business Box refresh handler" }
        if (oldPeriodic.isNotEmpty()) {
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
