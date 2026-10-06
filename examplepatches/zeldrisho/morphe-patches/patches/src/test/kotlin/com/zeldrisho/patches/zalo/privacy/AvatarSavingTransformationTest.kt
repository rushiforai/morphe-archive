package com.zeldrisho.patches.zalo.privacy

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.zeldrisho.patches.testing.syntheticMutableMethod
import kotlin.test.Test
import kotlin.test.assertEquals

class AvatarSavingTransformationTest {
    @Test
    fun disablesScreenshotProtectionAtMatchedInstruction() {
        val method = syntheticMutableMethod(
            registerCount = 1,
            instructions = listOf(ImmutableInstruction10x(Opcode.NOP)),
        )

        allowAvatarScreenshots(method, index = 0, register = 0)

        val instructions = method.implementation!!.instructions.toList()
        assertEquals(Opcode.CONST_4, instructions.single().opcode)
        assertEquals(0, (instructions.single() as NarrowLiteralInstruction).narrowLiteral)
    }
}
