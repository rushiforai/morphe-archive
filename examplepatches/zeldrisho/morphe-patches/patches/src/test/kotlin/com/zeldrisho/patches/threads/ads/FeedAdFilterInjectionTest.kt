package com.zeldrisho.patches.threads.ads

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.zeldrisho.patches.testing.syntheticMutableMethod
import kotlin.test.Test
import kotlin.test.assertEquals

/**
 * Compiles the production [injectFeedAdFilter] hook into synthetic methods and
 * asserts the emitted instructions, not just the generated smali strings.
 */
class FeedAdFilterInjectionTest {
    /** Builds a synthetic feed-merge method with the requested register frame and a NOP body. */
    private fun targetMethod(registerCount: Int) = syntheticMutableMethod(
        definingClass = "Lcom/test/FeedCache;",
        name = "merge",
        parameters = listOf(
            "LX/Param;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List;",
            "LX/Continuation;",
            "Lkotlin/jvm/functions/Function3;",
            "Z",
        ),
        returnType = "Ljava/lang/Object;",
        accessFlags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        registerCount = registerCount,
        instructions = listOf(ImmutableInstruction10x(Opcode.NOP)),
    )

    /** Builds a feed-merge signature without bytecode to exercise the injection guard. */
    private fun targetMethodWithoutImplementation() = syntheticMutableMethod(
        definingClass = "Lcom/test/FeedCache;",
        name = "merge",
        parameters = listOf(
            "LX/Param;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List;",
            "LX/Continuation;",
            "Lkotlin/jvm/functions/Function3;",
            "Z",
        ),
        returnType = "Ljava/lang/Object;",
        accessFlags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        registerCount = 46,
        instructions = null,
    )

    private fun injectedOpcodes(registerCount: Int): List<Opcode> {
        val method = targetMethod(registerCount)
        injectFeedAdFilter(method)
        val instructions = method.implementation!!.instructions
        assertEquals(5, instructions.size, "hook adds 4 instructions before the original NOP")
        assertEquals(Opcode.NOP, instructions[4].opcode, "original body is preserved after the hook")
        return instructions.map { it.opcode }
    }

    @Test fun lowRegisterHookUsesPlainMoves() {
        // registerCount 10 -> listReg 6: everything fits 4-bit move-object.
        val opcodes = injectedOpcodes(10)
        assertEquals(
            listOf(
                Opcode.MOVE_OBJECT,
                Opcode.INVOKE_STATIC,
                Opcode.MOVE_RESULT_OBJECT,
                Opcode.MOVE_OBJECT,
                Opcode.NOP,
            ),
            opcodes,
        )
        val method = targetMethod(10)
        injectFeedAdFilter(method)
        val instructions = method.implementation!!.instructions
        val load = instructions[0] as TwoRegisterInstruction
        assertEquals(0, load.registerA)
        assertEquals(6, load.registerB)
        val store = instructions[3] as TwoRegisterInstruction
        assertEquals(6, store.registerA)
        assertEquals(0, store.registerB)
    }

    @Test fun pinnedFrameHookUsesFrom16Moves() {
        // Pinned A0F frame: registerCount 46 -> listReg 42.
        val opcodes = injectedOpcodes(46)
        assertEquals(
            listOf(
                Opcode.MOVE_OBJECT_FROM16,
                Opcode.INVOKE_STATIC,
                Opcode.MOVE_RESULT_OBJECT,
                Opcode.MOVE_OBJECT_FROM16,
                Opcode.NOP,
            ),
            opcodes,
        )
    }

    @Test fun hugeFrameStoreUsesMove16() {
        // registerCount 260 -> listReg 256: from16 cannot address the store destination.
        val opcodes = injectedOpcodes(260)
        assertEquals(Opcode.MOVE_OBJECT_FROM16, opcodes[0])
        assertEquals(Opcode.MOVE_OBJECT_16, opcodes[3])
    }

    /** Verifies that feed-filter injection rejects methods without a bytecode implementation. */
    @Test fun missingImplementationFailsBeforeInjection() {
        val error = kotlin.test.assertFailsWith<IllegalStateException> {
            injectFeedAdFilter(targetMethodWithoutImplementation())
        }
        kotlin.test.assertEquals("BarcelonaFeedCache merge method has no implementation", error.message)
    }

    @Test fun hookCallsFilterAdsAndPreservesList() {
        val method = targetMethod(46)
        injectFeedAdFilter(method)
        val instructions = method.implementation!!.instructions
        val invoke = instructions[1] as FiveRegisterInstruction
        val target = (invoke as ReferenceInstruction).reference as MethodReference
        assertEquals("Lcom/zeldrisho/threads/extension/FeedAdFilter;", target.definingClass)
        assertEquals("filterAds", target.name)
        assertEquals(listOf("Ljava/util/List;"), target.parameterTypes.map { it.toString() })
        assertEquals("Ljava/util/List;", target.returnType)
        assertEquals(0, invoke.registerC, "invoke must consume the scratch register")
        assertEquals(1, invoke.registerCount)
        val moveResult = instructions[2]
        assertEquals(Opcode.MOVE_RESULT_OBJECT, moveResult.opcode)
    }
}
