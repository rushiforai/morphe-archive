package com.zeldrisho.patches.zalo

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import kotlin.test.Test
import kotlin.test.assertEquals
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
}
