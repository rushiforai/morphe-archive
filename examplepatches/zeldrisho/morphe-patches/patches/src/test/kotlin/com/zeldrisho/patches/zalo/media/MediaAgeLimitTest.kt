package com.zeldrisho.patches.zalo.media

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.zeldrisho.patches.testing.syntheticMutableMethod
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class MediaAgeLimitTest {
    /** Builds an age-limit fixture with three registers and optional bytecode. */
    private fun method(instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>?) = syntheticMutableMethod(registerCount = 3, instructions = instructions)

    /** Checks that only the result after the age-limit key is replaced, retaining its register. */
    @Test
    fun replacesMoveResultAfterTheMatchingConfigurationKey() {
        val target = method(
            listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("unrelated")),
                ImmutableInstruction11x(Opcode.MOVE_RESULT, 1),
                ImmutableInstruction21c(
                    Opcode.CONST_STRING,
                    0,
                    ImmutableStringReference("BACKUP_MEDIA_LIMIT_TIME_DAY"),
                ),
                ImmutableInstruction11x(Opcode.MOVE_RESULT, 2),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            ),
        )
        clearAgeResult(target)
        assertEquals(
            listOf(Opcode.CONST_STRING, Opcode.MOVE_RESULT, Opcode.CONST_STRING, Opcode.CONST_4, Opcode.RETURN_VOID),
            target.implementation!!.instructions.map { it.opcode },
        )
        assertEquals(2, (target.implementation!!.instructions.toList()[3] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA)
    }

    /** Verifies rejection of absent bytecode, a missing age-limit key, or a missing result. */
    @Test
    fun rejectsMissingImplementationKeyAndResult() {
        assertFailsWith<IllegalStateException> { clearAgeResult(method(null)) }
        assertFailsWith<IllegalStateException> {
            clearAgeResult(method(listOf(ImmutableInstruction10x(Opcode.RETURN_VOID))))
        }
        val keyOnly = method(
            listOf(
                ImmutableInstruction21c(
                    Opcode.CONST_STRING,
                    0,
                    ImmutableStringReference("BACKUP_MEDIA_LIMIT_TIME_DAY"),
                ),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            ),
        )
        assertFailsWith<IllegalStateException> { clearAgeResult(keyOnly) }
    }
}
