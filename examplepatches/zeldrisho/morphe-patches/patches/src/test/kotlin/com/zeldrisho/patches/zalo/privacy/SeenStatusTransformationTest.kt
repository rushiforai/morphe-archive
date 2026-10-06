package com.zeldrisho.patches.zalo.privacy

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.zeldrisho.patches.testing.syntheticMutableMethod
import kotlin.test.Test
import kotlin.test.assertEquals

class SeenStatusTransformationTest {
    @Test
    fun skipsOnlySeenAcknowledgementsAndPreservesOtherAcknowledgements() {
        val method = syntheticMutableMethod(
            parameters = listOf("Ljava/util/List;", "Z", "I", "I", "Lf11/j0;"),
            registerCount = 7,
            instructions = listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
        )

        suppressSeenStatus(method)

        assertEquals(
            listOf(Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.NOP, Opcode.RETURN_VOID),
            method.implementation!!.instructions.map { it.opcode },
        )
    }
}
