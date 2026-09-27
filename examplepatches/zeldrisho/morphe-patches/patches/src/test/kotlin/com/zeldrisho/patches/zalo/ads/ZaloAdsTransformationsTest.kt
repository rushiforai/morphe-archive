package com.zeldrisho.patches.zalo.ads

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.zeldrisho.patches.testing.syntheticMutableMethod
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class ZaloAdsTransformationsTest {
    /** Checks that replacing a boolean gate leaves only a constant and return instruction. */
    @Test
    fun forceReturnFalseReplacesOriginalBody() {
        val method = syntheticMutableMethod(
            returnType = "Z",
            registerCount = 2,
            instructions = listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
        )

        forceReturnFalse(method)

        assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN), method.implementation!!.instructions.map { it.opcode })
    }

    /** Checks that neutralizing the network branch preserves surrounding instructions. */
    @Test
    fun networkSkipBranchIsNoppedWithoutChangingAdjacentInstructions() {
        val method = syntheticMutableMethod(
            registerCount = 2,
            instructions = listOf(
                ImmutableInstruction10x(Opcode.NOP),
                ImmutableInstruction21t(Opcode.IF_NEZ, 0, 1),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            ),
        )

        neutralizeNetworkSkipBranch(method, 1)

        assertEquals(
            listOf(Opcode.NOP, Opcode.NOP, Opcode.RETURN_VOID),
            method.implementation!!.instructions.map { it.opcode },
        )
    }

    /** Checks the opt-out store and null-return instruction sequence, with no remaining try blocks. */
    @Test
    fun forceLimitAdTrackingSetsOptOutFlagAndReturnsNull() {
        val method = syntheticMutableMethod(
            returnType = "Ljava/lang/String;",
            registerCount = 3,
            instructions = listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
        )

        forceLimitAdTracking(method)

        val instructions = method.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.CONST_4, Opcode.SPUT, Opcode.CONST_4, Opcode.RETURN_OBJECT), instructions.map { it.opcode })
        assertEquals(0, method.implementation!!.tryBlocks.size)
    }

    /** Checks that a zero assignment is inserted after MOVE_RESULT using its destination register. */
    @Test
    fun zeroConfigResultWritesZeroIntoMoveResultRegister() {
        val method = syntheticMutableMethod(
            registerCount = 4,
            instructions = listOf(
                ImmutableInstruction10x(Opcode.NOP),
                ImmutableInstruction11x(Opcode.MOVE_RESULT, 2),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            ),
        )

        zeroConfigResult(method, listOf(0, 1))

        assertEquals(
            listOf(Opcode.NOP, Opcode.MOVE_RESULT, Opcode.CONST_4, Opcode.RETURN_VOID),
            method.implementation!!.instructions.map { it.opcode },
        )
        assertEquals(2, (method.implementation!!.instructions.toList()[2] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA)
    }

    /** Verifies rejection of a missing method body or missing MOVE_RESULT match. */
    @Test
    fun zeroConfigResultReportsMissingImplementationAndMoveResult() {
        val abstractMethod = syntheticMutableMethod(registerCount = 0, instructions = null)
        assertFailsWith<IllegalStateException> { zeroConfigResult(abstractMethod, emptyList()) }

        val method = syntheticMutableMethod(
            registerCount = 1,
            instructions = listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
        )
        val error = assertFailsWith<IllegalStateException> { zeroConfigResult(method, listOf(0)) }
        assertTrue(error.message!!.contains("MOVE_RESULT not found"))
    }
}
