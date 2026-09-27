package com.zeldrisho.patches.zalo

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.zeldrisho.patches.testing.syntheticMutableMethod
import com.zeldrisho.patches.zalo.backup.enableMediaBackup
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class BackupMediaTransformationTest {
    /** Builds an unrelated setter call followed by a configurable keyed backup setter call. */
    private fun writer(
        signature: List<String> = listOf("Ljava/lang/String;", "Z", "Z"),
        arguments: List<Int> = listOf(1, 3, 4),
        key: String = "ENABLE_BACKUP_MEDIA",
    ) = syntheticMutableMethod(
        registerCount = 5,
        instructions = listOf(
            // Another setter call in the method must not be selected.
            ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("OTHER_SETTING")),
            ImmutableInstruction35c(
                Opcode.INVOKE_STATIC,
                3,
                0,
                1,
                2,
                0,
                0,
                ImmutableMethodReference("Lu40/p0;", "i0", signature, "V"),
            ),
            ImmutableInstruction21c(Opcode.CONST_STRING, 1, ImmutableStringReference(key)),
            ImmutableInstruction35c(
                Opcode.INVOKE_STATIC,
                arguments.size,
                arguments.getOrElse(0) { 0 },
                arguments.getOrElse(1) { 0 },
                arguments.getOrElse(2) { 0 },
                arguments.getOrElse(3) { 0 },
                arguments.getOrElse(4) { 0 },
                ImmutableMethodReference("Lu40/p0;", "i0", signature, "V"),
            ),
        ),
    )

    /** Checks that the keyed setter receives a true value in its first boolean register and both calls remain. */
    @Test
    fun forcesOnlyFirstBooleanArgumentAtKeyedWrite() {
        val method = writer()
        enableMediaBackup(method)
        val instructions = method.implementation!!.instructions
        assertEquals(Opcode.CONST_16, instructions[3].opcode)
        assertEquals(3, (instructions[3] as OneRegisterInstruction).registerA)
        assertEquals(1, (instructions[3] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.INVOKE_STATIC, instructions[4].opcode)
        assertEquals(Opcode.INVOKE_STATIC, instructions[1].opcode)
    }

    /** Checks that a range invoke receives the override in its first boolean register and remains intact. */
    @Test
    fun forcesBackupValueForRangeInvoke() {
        val method = syntheticMutableMethod(
            registerCount = 5,
            instructions = listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 2, ImmutableStringReference("ENABLE_BACKUP_MEDIA")),
                ImmutableInstruction3rc(
                    Opcode.INVOKE_STATIC_RANGE,
                    2,
                    3,
                    ImmutableMethodReference("Lu40/p0;", "i0", listOf("Ljava/lang/String;", "Z", "Z"), "V"),
                ),
            ),
        )

        enableMediaBackup(method)

        val instructions = method.implementation!!.instructions
        assertEquals(Opcode.CONST_16, instructions[1].opcode)
        assertEquals(3, (instructions[1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, instructions[2].opcode)
    }

    /** Checks that the keyed setter must receive the register containing the backup key. */
    @Test
    fun rejectsSetterWithDifferentKeyRegister() {
        val error = assertFailsWith<IllegalStateException> {
            enableMediaBackup(writer(arguments = listOf(2, 3, 4)))
        }
        assertEquals("Zalo Google Drive backup: setter key does not match ENABLE_BACKUP_MEDIA", error.message)
    }

    /** Checks that the setter's boolean arguments cannot alias. */
    @Test
    fun rejectsAliasedBooleanArguments() {
        val error = assertFailsWith<IllegalStateException> {
            enableMediaBackup(writer(arguments = listOf(1, 3, 3)))
        }
        assertEquals("Zalo Google Drive backup: boolean arguments must use distinct registers", error.message)
    }

    /** Checks the diagnostic when the keyed setter does not take the expected string and two booleans. */
    @Test
    fun rejectsUnexpectedSetterSignature() {
        val error = assertFailsWith<IllegalStateException> {
            enableMediaBackup(writer(signature = listOf("Ljava/lang/String;", "Z")))
        }
        assertEquals("Zalo Google Drive backup: unexpected ENABLE_BACKUP_MEDIA setter signature", error.message)
    }

    /** Checks the diagnostic when no ENABLE_BACKUP_MEDIA key is present. */
    @Test
    fun rejectsMissingKey() {
        val error = assertFailsWith<IllegalStateException> {
            enableMediaBackup(writer(key = "OTHER_SETTING"))
        }
        assertEquals("Zalo Google Drive backup: expected exactly one ENABLE_BACKUP_MEDIA key", error.message)
    }

    /** Checks the diagnostic when the configuration method has no bytecode implementation. */
    @Test
    fun rejectsMissingImplementation() {
        val method = syntheticMutableMethod(registerCount = 1, instructions = null)
        val error = assertFailsWith<IllegalStateException> { enableMediaBackup(method) }
        assertEquals("Zalo Google Drive backup: configuration method has no implementation", error.message)
    }
}
