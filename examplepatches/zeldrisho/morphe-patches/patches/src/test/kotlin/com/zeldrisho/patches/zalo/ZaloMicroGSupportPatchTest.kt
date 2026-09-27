package com.zeldrisho.patches.zalo

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.zeldrisho.patches.zalo.microg.accountRefreshInvocation
import com.zeldrisho.patches.zalo.microg.replaceWithAccountPicker
import com.zeldrisho.patches.zalo.microg.requireProviderCheckScratch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class ZaloMicroGSupportPatchTest {
    @Test
    fun accountPickerReplacementBuildsPickerAndProviderGuard() {
        val method = ImmutableMethod(
            "Ltest/Picker;",
            "pick",
            emptyList(),
            "V",
            AccessFlags.PUBLIC.value,
            emptySet(),
            emptySet(),
            ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList()),
        ).toMutable()

        replaceWithAccountPicker(method)

        val instructions = method.implementation!!.instructions.toList()
        assertTrue(instructions.any { it.opcode == Opcode.INVOKE_STATIC })
        assertTrue(instructions.any { it.opcode == Opcode.INVOKE_VIRTUAL })
        assertTrue(instructions.any { it.opcode == Opcode.IF_EQZ })
        assertEquals(Opcode.RETURN_VOID, instructions.last().opcode)
    }

    @Test
    fun providerCheckRequiresARealLocalRegister() {
        assertFailsWith<IllegalStateException> { requireProviderCheckScratch(2) }
        requireProviderCheckScratch(3)
    }

    @Test
    fun accountRefreshReplacementPreservesFiveRegisterEncoding() {
        val instruction = ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL,
            2,
            3,
            4,
            0,
            0,
            0,
            ImmutableMethodReference("Ltest/View;", "A6", listOf("Ljava/lang/String;"), "V"),
        )
        val replacement = accountRefreshInvocation(instruction)
        assertTrue(replacement.startsWith("invoke-static { v3, v4 }"))
        assertTrue(replacement.contains("scheduleAccountRefresh(Ljava/lang/Object;Ljava/lang/String;)V"))
    }

    @Test
    fun accountRefreshReplacementUsesRangeForHighRegisters() {
        val instruction = ImmutableInstruction3rc(
            Opcode.INVOKE_VIRTUAL_RANGE,
            28,
            2,
            ImmutableMethodReference("Ltest/View;", "A6", listOf("Ljava/lang/String;"), "V"),
        )
        val replacement = accountRefreshInvocation(instruction)
        assertTrue(replacement.startsWith("invoke-static/range { v28 .. v29 }"))
    }
}
