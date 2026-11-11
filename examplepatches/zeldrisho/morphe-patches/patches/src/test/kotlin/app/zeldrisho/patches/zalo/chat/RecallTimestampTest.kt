package app.zeldrisho.patches.zalo.chat

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import kotlin.test.Test
import kotlin.test.assertEquals

class RecallTimestampTest {
    private fun fixture(): MutableMethod = MutableMethod(ImmutableMethod(
        "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;", "getCurrentTimeText", emptyList(),
        "Ljava/lang/String;", AccessFlags.PRIVATE.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(3, """
            const-string v0, "12:34"
            const/4 v1, 0x0
            if-eqz v1, :second_return
            return-object v0
            :second_return
            return-object v0
        """.toInstructions(), emptyList(), emptyList()),
    ))

    @Test fun bothExitsRetainReturnAndConsumeDecoratorResult() {
        val method = fixture()
        decorateRecallTimestamp(method)
        val instructions = method.implementation!!.instructions.toList()
        assertEquals(Opcode.RETURN_OBJECT, instructions.last().opcode,
            "Timestamp must not fall through the end of its code area")
        val exits = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_OBJECT }
        assertEquals(2, exits.size)
        for (exit in exits) {
            assertEquals(Opcode.INVOKE_STATIC, instructions[exit - 2].opcode)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, instructions[exit - 1].opcode)
            assertEquals("Lapp/zeldrisho/zalo/extension/RecallMarker;->timeLabel(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;",
                (instructions[exit - 2] as ReferenceInstruction).reference.toString())
        }
        assertEquals(3, method.implementation!!.registerCount)
    }

    @Test fun branchToReturnExecutesDecoratorRatherThanSkippingIt() {
        val method = fixture()
        decorateRecallTimestamp(method)
        val instructions = method.implementation!!.instructions.toList()
        val branch = instructions.single { it.opcode == Opcode.IF_EQZ } as BuilderOffsetInstruction
        val target = instructions.single { it.location == branch.target.location }
        assertEquals(Opcode.INVOKE_STATIC, target.opcode)
    }
}
