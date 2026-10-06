package com.zeldrisho.patches.zalo

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.zeldrisho.patches.testing.syntheticMutableMethod
import com.zeldrisho.patches.zalo.backup.overrideBackupInterval
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class BackupIntervalTransformationTest {
    /** Builds a synthetic interval getter and wide result with a configurable preference key. */
    @Suppress("LongMethod")
    private fun scheduler(
        key: String = "SERVER_CONFIG_SYNC_MESSAGE_INTERVAL_",
        keyRegister: Int = 3,
        keyOpcode: Opcode = Opcode.CONST_STRING,
        appendRegister: Int = 4,
    ) = syntheticMutableMethod(
        registerCount = 6,
        instructions = listOf(
            if (keyOpcode == Opcode.CONST_STRING_JUMBO) {
                ImmutableInstruction31c(keyOpcode, 5, ImmutableStringReference(key))
            } else {
                ImmutableInstruction21c(keyOpcode, 5, ImmutableStringReference(key))
            },
            ImmutableInstruction21c(Opcode.CONST_STRING, 4, ImmutableStringReference("account-id")),
            ImmutableInstruction35c(
                Opcode.INVOKE_DIRECT,
                2,
                2,
                5,
                0,
                0,
                0,
                ImmutableMethodReference(
                    "Ljava/lang/StringBuilder;",
                    "<init>",
                    listOf("Ljava/lang/String;"),
                    "V",
                ),
            ),
            ImmutableInstruction35c(
                Opcode.INVOKE_VIRTUAL,
                2,
                2,
                appendRegister,
                0,
                0,
                0,
                ImmutableMethodReference(
                    "Ljava/lang/StringBuilder;",
                    "append",
                    listOf("Ljava/lang/String;"),
                    "Ljava/lang/StringBuilder;",
                ),
            ),
            ImmutableInstruction35c(
                Opcode.INVOKE_VIRTUAL,
                1,
                2,
                0,
                0,
                0,
                0,
                ImmutableMethodReference("Ljava/lang/StringBuilder;", "toString", emptyList(), "Ljava/lang/String;"),
            ),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, keyRegister),
            ImmutableInstruction3rc(
                Opcode.INVOKE_STATIC_RANGE,
                0,
                4,
                ImmutableMethodReference(
                    "Lu40/p0;",
                    "Y",
                    listOf("J", "Z", "Ljava/lang/String;"),
                    "J",
                ),
            ),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, 4),
        ),
    )

    /** Verifies that a three-hour override writes milliseconds to the original result register. */
    @Test
    fun overridesOnlyIntervalResultWithSelectedMilliseconds() {
        val method = scheduler()
        overrideBackupInterval(method, "3")
        val result = method.implementation!!.instructions.last()
        assertEquals(Opcode.CONST_WIDE_32, result.opcode)
        assertEquals(4, (result as OneRegisterInstruction).registerA)
        assertEquals(10_800_000, (result as NarrowLiteralInstruction).narrowLiteral)
    }

    /** Verifies that a jumbo string instruction can load the interval key. */
    @Test
    fun acceptsJumboStringLoadForIntervalKey() {
        val method = scheduler(keyOpcode = Opcode.CONST_STRING_JUMBO)
        overrideBackupInterval(method, "6")
        assertEquals(21_600_000, (method.implementation!!.instructions.last() as NarrowLiteralInstruction).narrowLiteral)
    }

    @Test
    fun supportsEachAllowedIntervalInMilliseconds() {
        mapOf("1" to 3_600_000, "3" to 10_800_000, "6" to 21_600_000, "12" to 43_200_000).forEach { (hours, millis) ->
            val method = scheduler()
            overrideBackupInterval(method, hours)
            assertEquals(millis, (method.implementation!!.instructions.last() as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    /** Verifies that unsupported hours and an unrelated preference key fail validation. */
    @Test
    fun rejectsUnsupportedIntervalAndMissingNativeKey() {
        assertFailsWith<IllegalArgumentException> { overrideBackupInterval(scheduler(), "2") }
        assertFailsWith<IllegalStateException> {
            overrideBackupInterval(scheduler("UNRELATED_CONFIG_KEY"), "6")
        }
        assertFailsWith<IllegalStateException> {
            overrideBackupInterval(scheduler(keyRegister = 5), "6")
        }
    }
}
