package com.zeldrisho.patches.zalo.media

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.zeldrisho.patches.testing.syntheticMutableMethod
import kotlin.test.Test
import kotlin.test.assertEquals

class SendOriginalMediaHelpersTest {
    /** Checks the instruction sequences inserted for selected quality and the picker argument. */
    @Test
    fun overridesQualityResultAndPickerArgument() {
        val selected = syntheticMutableMethod(
            returnType = "I",
            registerCount = 1,
            instructions = emptyList(),
        )
        forceQualityResult(selected, 2)
        assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN), selected.implementation!!.instructions.map { it.opcode })

        val argument = syntheticMutableMethod(
            parameters = listOf("I"),
            registerCount = 1,
            instructions = emptyList(),
        )
        forcePickerQualityArgument(argument)
        assertEquals(listOf(Opcode.CONST_4), argument.implementation!!.instructions.map { it.opcode })
    }

    /** Checks that both boolean override values emit a constant followed by a return. */
    @Test
    fun falseAndTrueResultOverridesUseRequestedLiteral() {
        for ((expectedValue, opcode) in listOf(0 to Opcode.CONST_4, 1 to Opcode.CONST_4)) {
            val method = syntheticMutableMethod(
                returnType = "Z",
                registerCount = 1,
                instructions = emptyList(),
            )
            forceQualityResult(method, expectedValue)
            assertEquals(opcode, method.implementation!!.instructions.first().opcode)
            assertEquals(Opcode.RETURN, method.implementation!!.instructions.last().opcode)
        }
    }
}
