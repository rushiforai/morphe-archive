package com.zeldrisho.patches.zalo

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.zeldrisho.patches.testing.syntheticMutableMethod
import com.zeldrisho.patches.zalo.telemetry.neutralizeSinks
import com.zeldrisho.patches.zalo.telemetry.removeTelemetryCalls
import kotlin.test.Test
import kotlin.test.assertEquals

class TelemetryTransformationTest {
    /** Checks that only selected telemetry instruction positions become NOPs. */
    @Test
    fun removesSelectedTelemetryCallsAndLeavesSurroundingCode() {
        val caller = syntheticMutableMethod(
            registerCount = 1,
            instructions = List(4) { ImmutableInstruction11n(Opcode.CONST_4, it, 0) },
        )

        removeTelemetryCalls(caller, listOf(1, 3))

        assertEquals(
            listOf(Opcode.CONST_4, Opcode.NOP, Opcode.CONST_4, Opcode.NOP),
            caller.implementation!!.instructions.map { it.opcode },
        )
    }

    /** Verifies that every supplied telemetry sink is reduced to a void return. */
    @Test
    fun neutralizesEachSinkBody() {
        val first = syntheticMutableMethod(
            registerCount = 1,
            instructions = listOf(ImmutableInstruction10x(Opcode.NOP)),
        )
        val second = syntheticMutableMethod(
            registerCount = 2,
            instructions = listOf(ImmutableInstruction10x(Opcode.NOP), ImmutableInstruction10x(Opcode.RETURN_VOID)),
        )

        neutralizeSinks(listOf(first, second))

        assertEquals(listOf(Opcode.RETURN_VOID), first.implementation!!.instructions.map { it.opcode })
        assertEquals(listOf(Opcode.RETURN_VOID), second.implementation!!.instructions.map { it.opcode })
    }
}
