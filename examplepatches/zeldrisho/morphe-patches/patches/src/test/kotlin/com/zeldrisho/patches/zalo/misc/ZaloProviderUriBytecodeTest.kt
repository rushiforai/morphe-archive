package com.zeldrisho.patches.zalo.misc

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.zeldrisho.patches.testing.syntheticMutableMethod
import kotlin.test.Test
import kotlin.test.assertEquals

class ZaloProviderUriBytecodeTest {
    /** Checks owned URI substitutions, per-URI counts, and preservation of registers and unrelated code. */
    @Test
    fun rewritesOnlyOwnedProviderUriStringsAndPreservesDestinationRegisters() {
        val preferencesUri = "content://com.zing.zalo.db.preferencesprovider"
        val internalUri = "content://com.zing.zalo.provider.InternalProvider"
        val method = syntheticMutableMethod(
            registerCount = 4,
            instructions = listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 2, ImmutableStringReference(preferencesUri)),
                ImmutableInstruction21c(Opcode.CONST_STRING, 3, ImmutableStringReference("content://third.party.provider")),
                ImmutableInstruction10x(Opcode.NOP),
                ImmutableInstruction21c(Opcode.CONST_STRING, 1, ImmutableStringReference(internalUri)),
            ),
        )

        val counts = rewriteProviderUriStrings(method, "com.zing.zalo.clone")
        val instructions = method.implementation!!.instructions.toList()
        assertEquals(1, counts[preferencesUri])
        assertEquals(1, counts[internalUri])
        validateProviderUriReplacementCounts(counts)
        assertEquals(Opcode.CONST_STRING, instructions[0].opcode)
        assertEquals(2, (instructions[0] as OneRegisterInstruction).registerA)
        assertEquals(
            "content://com.zing.zalo.clone.db.preferencesprovider",
            (((instructions[0] as ReferenceInstruction).reference) as StringReference).string,
        )
        assertEquals(
            "content://third.party.provider",
            (((instructions[1] as ReferenceInstruction).reference) as StringReference).string,
        )
        assertEquals(Opcode.NOP, instructions[2].opcode)
        assertEquals(1, (instructions[3] as OneRegisterInstruction).registerA)
        assertEquals(
            "content://com.zing.zalo.clone.provider.InternalProvider",
            (((instructions[3] as ReferenceInstruction).reference) as StringReference).string,
        )
    }

    /** Checks the diagnostic when provider URI replacement counts include zero and duplicate edits. */
    @Test
    fun replacementCountGuardRejectsMissingOrRepeatedUris() {
        val error = kotlin.test.assertFailsWith<IllegalStateException> {
            validateProviderUriReplacementCounts(mapOf("uri" to 0, "other" to 2))
        }
        kotlin.test.assertTrue(error.message!!.contains("expected one reference per provider URI"))
    }

    /** Verifies that a method without bytecode reports zero provider URI replacements. */
    @Test
    fun bodylessMethodsAreNoOps() {
        val method = syntheticMutableMethod(registerCount = 0, instructions = null)
        assertEquals(0, rewriteProviderUriStrings(method, "com.zing.zalo.clone").values.sum())
    }
}
