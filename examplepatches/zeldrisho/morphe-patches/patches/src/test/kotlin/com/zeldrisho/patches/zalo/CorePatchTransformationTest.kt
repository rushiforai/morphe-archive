package com.zeldrisho.patches.zalo

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.zeldrisho.patches.testing.syntheticMutableMethod
import com.zeldrisho.patches.zalo.chat.suppressBusinessBoxInsertion
import com.zeldrisho.patches.zalo.chat.suppressBusinessBoxPeriodicBranch
import com.zeldrisho.patches.zalo.chat.suppressMediaBoxInsertion
import com.zeldrisho.patches.zalo.chat.suppressMediaBoxInsertionAfterConstructor
import com.zeldrisho.patches.zalo.chat.suppressZinstantAdInsertion
import com.zeldrisho.patches.zalo.chat.suppressZinstantAdInsertionAfterConstructor
import com.zeldrisho.patches.zalo.privacy.suppressSeenStatus
import com.zeldrisho.patches.zalo.privacy.suppressTypingStatus
import com.zeldrisho.patches.zalo.telemetry.disableNativeCrashHandler
import com.zeldrisho.patches.zalo.telemetry.forceReturnInt
import com.zeldrisho.patches.zalo.telemetry.forceReturnVoid
import kotlin.test.Test
import kotlin.test.assertEquals

/** Exercises production bytecode transformations against synthetic mutable methods. */
class CorePatchTransformationTest {
    /** Builds a synthetic method with a NOP and return for body-replacement assertions. */
    private fun method(returnType: String = "V", registerCount: Int = 1) = syntheticMutableMethod(
        returnType = returnType,
        registerCount = registerCount,
        instructions = listOf(
            ImmutableInstruction10x(Opcode.NOP),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        ),
    )

    /** Verifies seen=true is dropped while the false-seen ACK path falls through. */
    @Test
    fun seenSuppressionBranchesOnSeenFlagAndPreservesAckPath() {
        val target = syntheticMutableMethod(
            definingClass = "Ls00/x;",
            name = "e",
            parameters = listOf("Ljava/util/List;", "Z", "I", "I", "Lf11/j0;"),
            registerCount = 6,
            instructions = listOf(
                ImmutableInstruction10x(Opcode.NOP),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            ),
            accessFlags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        )
        suppressSeenStatus(target)
        assertEquals(
            listOf(Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.NOP, Opcode.NOP, Opcode.RETURN_VOID),
            target.implementation!!.instructions.map { it.opcode },
        )
    }

    /** Verifies that typing-status suppression leaves only a void return. */
    @Test
    fun typingSuppressionReplacesWholeBodyWithReturnVoid() {
        val target = method()
        suppressTypingStatus(target)
        assertEquals(listOf(Opcode.RETURN_VOID), target.implementation!!.instructions.map { it.opcode })
    }

    /** Checks that both business-box helpers place a void return at the selected instruction. */
    @Test
    fun businessBoxInsertionAndPeriodicBranchReturnAtSelectedInstruction() {
        val insertion = method()
        suppressBusinessBoxInsertion(insertion, 0)
        assertEquals(Opcode.RETURN_VOID, insertion.implementation!!.instructions[0].opcode)

        val periodic = method()
        suppressBusinessBoxPeriodicBranch(periodic, 0)
        assertEquals(Opcode.RETURN_VOID, periodic.implementation!!.instructions[0].opcode)
    }

    /** Verifies constructor-following list insertions are found and unrelated calls are rejected. */
    @Test
    fun mediaBoxAndZinstantAdInsertionLookupRequiresExpectedArrayListOverload() {
        val mediaAdd = syntheticMutableMethod(
            registerCount = 1,
            instructions = listOf(
                ImmutableInstruction35c(
                    Opcode.INVOKE_VIRTUAL,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    ImmutableMethodReference("Ljava/util/ArrayList;", "add", listOf("Ljava/lang/Object;"), "Z"),
                ),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            ),
        )
        suppressMediaBoxInsertionAfterConstructor(mediaAdd, -1)
        assertEquals(Opcode.NOP, mediaAdd.implementation!!.instructions[0].opcode)

        val adAdd = syntheticMutableMethod(
            registerCount = 1,
            instructions = listOf(
                ImmutableInstruction35c(
                    Opcode.INVOKE_VIRTUAL,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    ImmutableMethodReference("Ljava/util/ArrayList;", "add", listOf("I", "Ljava/lang/Object;"), "V"),
                ),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            ),
        )
        suppressZinstantAdInsertionAfterConstructor(adAdd, -1)
        assertEquals(Opcode.NOP, adAdd.implementation!!.instructions[0].opcode)

        val wrongOverload = syntheticMutableMethod(
            registerCount = 1,
            instructions = listOf(
                ImmutableInstruction35c(
                    Opcode.INVOKE_VIRTUAL,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    ImmutableMethodReference("Ljava/util/ArrayList;", "add", emptyList(), "V"),
                ),
            ),
        )
        kotlin.test.assertFailsWith<IllegalStateException> {
            suppressMediaBoxInsertionAfterConstructor(wrongOverload, -1)
        }
    }

    /** Verifies that the Media Box and Zinstant ad list insertions are skipped in place. */
    @Test
    fun mediaBoxAndZinstantAdInsertionsBecomeNops() {
        val mediaBox = method()
        suppressMediaBoxInsertion(mediaBox, 0)
        assertEquals(listOf(Opcode.NOP, Opcode.RETURN_VOID), mediaBox.implementation!!.instructions.map { it.opcode })

        val ad = method()
        suppressZinstantAdInsertion(ad, 0)
        assertEquals(listOf(Opcode.NOP, Opcode.RETURN_VOID), ad.implementation!!.instructions.map { it.opcode })
    }

    /** Verifies that disabling crash registration preserves the following return instruction. */
    @Test
    fun nativeCrashRegistrationCallIsNoppedWithoutRemovingAdjacentInstructions() {
        val target = syntheticMutableMethod(
            registerCount = 1,
            instructions = listOf(
                ImmutableInstruction35c(
                    Opcode.INVOKE_STATIC,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    ImmutableMethodReference("Ltest/NativeCrash;", "init", emptyList(), "V"),
                ),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            ),
        )
        disableNativeCrashHandler(target, 0)
        assertEquals(
            listOf(Opcode.NOP, Opcode.RETURN_VOID),
            target.implementation!!.instructions.map { it.opcode },
        )
    }

    /** Checks the replacement instruction sequences for void and integer telemetry sinks. */
    @Test
    fun telemetryVoidSinksBecomeNoOpsAndIntegerSinksReturnZero() {
        val voidSink = method()
        forceReturnVoid(voidSink)
        assertEquals(listOf(Opcode.RETURN_VOID), voidSink.implementation!!.instructions.map { it.opcode })

        val intSink = method(returnType = "I")
        forceReturnInt(intSink)
        assertEquals(
            listOf(Opcode.CONST_4, Opcode.RETURN),
            intSink.implementation!!.instructions.map { it.opcode },
        )
    }
}
