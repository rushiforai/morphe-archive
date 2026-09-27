package com.zeldrisho.patches.shared.bytecode

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/** Contracts for the two deliberately different method-body operations. */
class MethodExtensionsTest {
    private fun method(
        registers: Int = 1,
        parameters: List<String> = emptyList(),
        instructions: List<com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction> =
            listOf(ImmutableInstruction10x(Opcode.NOP)),
    ) = ImmutableMethod(
        "Ltest/Target;",
        "run",
        parameters.map { ImmutableMethodParameter(it, emptySet(), null) },
        "V",
        AccessFlags.PUBLIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            registers,
            instructions,
            emptyList(),
            emptyList(),
        ),
    ).toMutable()

    @Test
    fun clearBodyRemovesAllInstructionsAndExceptionRanges() {
        val target = method()
        val implementation = target.implementation!!
        val start = implementation.newLabelForIndex(0)
        val end = implementation.newLabelForIndex(1)
        val handler = implementation.newLabelForIndex(0)
        implementation.addCatch("Ljava/lang/Exception;", start, end, handler)
        assertTrue(implementation.tryBlocks.isNotEmpty())

        target.clearBody()

        assertTrue(implementation.instructions.none())
        assertTrue(implementation.tryBlocks.none())
    }

    @Test
    fun registerGrowthIsAvailableForWholeBodyReplacement() {
        val target = method(1)
        target.ensureRegisters(4)
        target.ensureRegisters(2)
        assertEquals(4, target.implementation!!.registerCount)
        target.clearBody()
        assertEquals(0, target.implementation!!.instructions.size)
    }

    @Test
    fun zeroRegisterMethodsAreLeftUntouched() {
        val target = method(0, instructions = emptyList())
        target.ensureRegisters(0)
        target.ensureRegisters(-1)
        assertEquals(0, target.implementation!!.registerCount)
    }

    @Test
    fun wideParametersDoNotChangeRegisterGrowthContract() {
        val target = method(
            registers = 3,
            parameters = listOf("J", "Ljava/lang/Object;"),
        )
        target.ensureRegisters(4)
        assertEquals(4, target.implementation!!.registerCount)
        assertEquals(listOf("J", "Ljava/lang/Object;"), target.parameterTypes.map { it.toString() })
    }

    @Test
    fun growingFrameDoesNotRewriteExistingParameterRegisterOperands() {
        val target = method(
            registers = 2,
            parameters = listOf("Ljava/lang/Object;"),
            instructions = listOf(ImmutableInstruction11x(Opcode.MOVE_RESULT, 1)),
        )
        target.ensureRegisters(16)
        assertEquals(16, target.implementation!!.registerCount)
        assertEquals(1, (target.implementation!!.instructions.first() as OneRegisterInstruction).registerA)
    }
}
