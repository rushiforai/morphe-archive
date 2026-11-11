package app.zeldrisho.patches.zalo.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.newInstance
import app.morphe.patcher.literal
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.zeldrisho.patches.zalo.navigation.zeldrisSettingsPatch
import app.morphe.patcher.string
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val MARKER = "Lapp/zeldrisho/zalo/extension/RecallMarker;"

internal const val INCOMING_RECALL_GUARD = """
    if-nez v2, :keep_local_action
    invoke-static {v5}, $MARKER->retain(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :keep_local_action
    return-void
    :keep_local_action
    nop
"""

internal const val RECALL_DISPATCH_GUARD = """
    if-nez v13, :keep_local_undo
    iget-object v2, v10, Lj20/q;->b:Lcom/zing/zalo/data/entity/chat/message/MessageId;
    invoke-static {v2}, $MARKER->retain(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :keep_local_undo
    return-void
    :keep_local_undo
    nop
"""

/**
 * Inserts recall-label decoration before both timestamp returns, preserving their control-flow labels.
 *
 * @throws IllegalStateException if the method does not have two object returns from register 0.
 * @throws NullPointerException if the method has no implementation.
 */
internal fun decorateRecallTimestamp(method: MutableMethod) {
    val returns = method.implementation!!.instructions.toList().withIndex().filter {
        it.value.opcode == Opcode.RETURN_OBJECT
    }
    check(returns.size == 2 && returns.all { (it.value as OneRegisterInstruction).registerA == 0 }) {
        "Chat timestamp return flow changed"
    }
    for (exit in returns.asReversed()) {
        method.addInstructionsAtControlFlowLabel(exit.index, """
            invoke-static {p0, v0}, $MARKER->timeLabel(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v0
        """)
    }
}

/** Guard before queuing, model clearing, attachment cleanup, and database mutation—not after them. */
@Suppress("unused")
val antiRecallPatch = bytecodePatch(
    name = "Keep recalled messages",
    description = "Adds an initially off recall-retention switch in Zeldris Patches. " +
        "Preserves locally received content with a recalled label; cannot recover missing content. Restart to apply.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002)
    dependsOn(zeldrisSettingsPatch)
    execute {
        validateNativeConfirmationContract { classDefBy(it).methods }
        check(classDefBy("Lfs0/e;").superclass == "Lk92/e;" &&
            AccessFlags.INTERFACE.isSet(classDefBy("Lk92/g;").accessFlags)
        ) { "Native confirmation dialog hierarchy changed" }
        mutableClassDefBy("Lapp/zeldrisho/zalo/extension/ZeldrisSettingsContent;")
            .methods.single { it.name == "hasRecallSettings" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
            .returnEarly(true)
        val incoming = IncomingRecall261002.matchAll(1..1).single()
        val queue = incoming.instructionMatches.last()
        check((queue.instruction as? OneRegisterInstruction)?.registerA == 4) {
            "Remote recall pending-event register changed"
        }
        val incomingInstructions = incoming.method.implementation!!.instructions.toList()
        // v2 is the local-action flag. v5 is the target MessageId; neither is scratch.
        check(incomingInstructions.count {
            (it as? ReferenceInstruction)?.reference?.toString() == "Lcom/zing/zalo/webview/g;->a:Z" &&
                (it as? TwoRegisterInstruction)?.registerA == 2
        } == 1 && incomingInstructions.count {
            it.opcode == Opcode.CHECK_CAST && (it as? OneRegisterInstruction)?.registerA == 5 &&
                (it as? ReferenceInstruction)?.reference?.toString() ==
                "Lcom/zing/zalo/data/entity/chat/message/MessageId;"
        } == 1) { "Remote recall target/local-action flow changed" }
        // v3 (the previously checked target string) is dead at this allocation.
        // Preserve v2: it remains the native local-action flag when retention is off.
        // :cond_3c targets this allocation, so ordinary insertion would be skipped.
        incoming.method.addInstructionsAtControlFlowLabel(queue.index, INCOMING_RECALL_GUARD)

        val dispatcher = RecallDispatcher261002.matchAll(1..1).single()
        val flag = dispatcher.instructionMatches.last()
        val registers = flag.instruction as? TwoRegisterInstruction
        check(registers?.registerA == 13 && registers.registerB == 0) {
            "Recall dispatcher local-action flag changed"
        }
        // v2 has not been assigned yet. The message in v10 is still intact here.
        dispatcher.method.addInstructionsAtControlFlowLabel(flag.index + 1, RECALL_DISPATCH_GUARD)

        // Some native callers invoke the database/tab helpers directly. Guard
        // their entries too, before cache invalidation or changing the message type.
        val database = RecallDatabase261002.matchAll(1..1).single().method
        val tab = RecallTab261002.matchAll(1..1).single().method
        check(database.implementation!!.registerCount == 14 && tab.implementation!!.registerCount == 14) {
            "Recall database/tab helper register layout changed"
        }
        database.addInstructionsAtControlFlowLabel(0, """
            if-nez p2, :native_local_database_undo
            iget-object v0, p1, Lj20/q;->b:Lcom/zing/zalo/data/entity/chat/message/MessageId;
            invoke-static {v0}, $MARKER->retain(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :native_local_database_undo
            return-void
            :native_local_database_undo
            nop
        """)
        tab.addInstructionsAtControlFlowLabel(0, """
            if-nez p2, :native_local_tab_undo
            invoke-static {p1}, $MARKER->retain(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :native_local_tab_undo
            return-void
            :native_local_tab_undo
            nop
        """)

        decorateRecallTimestamp(RecallTimeLabel261002.matchAll(1..1).single().method)
    }
}

private object IncomingRecall261002 : Fingerprint(
    definingClass = "Lo20/g;", name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lj20/q;"), returnType = "V",
    filters = listOf(string("msgActionUndo"), newInstance("Lq20/f;")),
)

private object RecallDispatcher261002 : Fingerprint(
    definingClass = "Las1/y0;", name = "D",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;"), returnType = "V",
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Las1/x0;", name = "a", type = "Lj20/q;"),
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, definingClass = "Las1/x0;", name = "b", type = "Z"),
    ),
)

private object RecallDatabase261002 : Fingerprint(
    definingClass = "Lp60/e;", name = "g0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lj20/q;", "Z", "Lj20/t0;"), returnType = "V",
    filters = listOf(literal(0x21), literal(0x24)),
)

private object RecallTab261002 : Fingerprint(
    definingClass = "Las1/y0;", name = "E",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/zing/zalo/data/entity/chat/message/MessageId;", "Z", "Lj20/t0;", "Z"),
    returnType = "V", filters = listOf(literal(0x21), literal(0x24)),
)

private object RecallTimeLabel261002 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;", name = "getCurrentTimeText",
    accessFlags = listOf(AccessFlags.PRIVATE), parameters = emptyList(), returnType = "Ljava/lang/String;",
    filters = listOf(fieldAccess(opcode = Opcode.IGET_OBJECT,
        definingClass = "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;", name = "i", type = "Lj20/q;")),
)
