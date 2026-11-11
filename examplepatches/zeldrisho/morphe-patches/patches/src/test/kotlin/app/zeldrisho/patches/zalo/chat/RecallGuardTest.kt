package app.zeldrisho.patches.zalo.chat

import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import kotlin.test.Test
import kotlin.test.assertEquals

class RecallGuardTest {
    @Test fun incomingGuardPreservesNativeFlagAndChecksRetention() {
        val instructions = INCOMING_RECALL_GUARD.toInstructions()
        assertEquals(listOf(Opcode.IF_NEZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT,
            Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.NOP), instructions.map { it.opcode })
        assertEquals(2, (instructions[0] as OneRegisterInstruction).registerA)
        assertEquals(5, (instructions[1] as FiveRegisterInstruction).registerC)
        assertEquals(3, (instructions[2] as OneRegisterInstruction).registerA)
        assertEquals("Lapp/zeldrisho/zalo/extension/RecallMarker;->retain(Ljava/lang/Object;)Z",
            (instructions[1] as ReferenceInstruction).reference.toString())
        for (branch in listOf(0, 3)) {
            assertEquals(instructions.last().location,
                (instructions[branch] as BuilderOffsetInstruction).target.location)
        }
    }

    @Test fun dispatcherGuardUsesActualMessageIdNotMessageText() {
        val instructions = RECALL_DISPATCH_GUARD.toInstructions()
        assertEquals(listOf(Opcode.IF_NEZ, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.NOP), instructions.map { it.opcode })
        assertEquals(13, (instructions[0] as OneRegisterInstruction).registerA)
        assertEquals("Lj20/q;->b:Lcom/zing/zalo/data/entity/chat/message/MessageId;",
            (instructions[1] as ReferenceInstruction).reference.toString())
        assertEquals(2, (instructions[2] as FiveRegisterInstruction).registerC)
        for (branch in listOf(0, 4)) {
            assertEquals(instructions.last().location,
                (instructions[branch] as BuilderOffsetInstruction).target.location)
        }
    }

    @Test fun incomingGuardBehaviorMatrix() = behaviorMatrix(INCOMING_RECALL_GUARD, 2)

    @Test fun dispatcherGuardBehaviorMatrix() = behaviorMatrix(RECALL_DISPATCH_GUARD, 13)

    /** Execute the guard's small branch subset to check off/native, on/remote, and local bypass. */
    private fun behaviorMatrix(smali: String, flagRegister: Int) {
        for (local in listOf(false, true)) for (enabled in listOf(false, true)) {
            val instructions = smali.toInstructions()
            val registers = mutableMapOf(flagRegister to if (local) 1 else 0)
            var index = 0
            var calls = 0
            var blocked = false
            while (index < instructions.size) {
                val instruction = instructions[index]
                when (instruction.opcode) {
                    Opcode.IF_NEZ, Opcode.IF_EQZ -> {
                        val value = registers[(instruction as OneRegisterInstruction).registerA] ?: 0
                        val take = if (instruction.opcode == Opcode.IF_NEZ) value != 0 else value == 0
                        if (take) {
                            val target = (instruction as BuilderOffsetInstruction).target.location
                            index = instructions.indexOfFirst { it.location == target }
                            check(index >= 0)
                            continue
                        }
                    }
                    Opcode.INVOKE_STATIC -> calls++
                    Opcode.MOVE_RESULT -> registers[(instruction as OneRegisterInstruction).registerA] = if (enabled) 1 else 0
                    Opcode.IGET_OBJECT -> Unit // Real message identity is asserted in the structure test.
                    Opcode.RETURN_VOID -> { blocked = true; break }
                    Opcode.NOP -> Unit
                    else -> error("Unexpected guard opcode: ${instruction.opcode}")
                }
                index++
            }
            assertEquals(!local && enabled, blocked, "local=$local enabled=$enabled")
            assertEquals(if (local) 0 else 1, calls)
            assertEquals(if (local) 1 else 0, registers[flagRegister], "Native flag must survive")
        }
    }
}
