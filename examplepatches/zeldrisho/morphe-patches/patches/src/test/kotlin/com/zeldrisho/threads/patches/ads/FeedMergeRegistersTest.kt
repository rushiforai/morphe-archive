package com.zeldrisho.threads.patches.ads

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/**
 * Unit tests for the Dalvik register calculation helpers in FeedMergeRegisters.kt.
 */
class FeedMergeRegistersTest {
    @Test fun rejectsFramesWithoutLocalScratchRegister() {
        assertFailsWith<IllegalArgumentException> { feedListRegister(9) }
        assertFailsWith<IllegalArgumentException> { feedListRegister(8) }
    }

    /**
     * Verify the register calculation for the feed list parameter in A0F.
     */
    @Test fun listRegisterMath() {
        // registerCount - 9 params (incl. this) + index 5
        assertEquals(6, feedListRegister(10))
        assertEquals(11, feedListRegister(15))
    }

    /**
     * Verify that registers v0-v15 use the plain move-object instruction.
     */
    @Test fun lowRegistersUsePlainMove() {
        assertEquals("move-object v0, v11", feedListLoadMove(11))
        assertEquals("move-object v11, v0", feedListStoreMove(11))
    }

    /**
     * Verify that registers above v15 use the move-object/from16 instruction.
     */
    @Test fun highRegistersUseFrom16() {
        // move-object has 4-bit operands; from16 extends the range.
        // e.g. registerCount 25 -> listReg 21
        val reg = feedListRegister(25)
        assertEquals(21, reg)
        assertTrue(feedListLoadMove(reg).startsWith("move-object/from16"))
        assertTrue(feedListStoreMove(reg).startsWith("move-object/from16"))
    }

    /**
     * Verify that store destinations above v255 use move-object/16.
     * from16 has an 8-bit destination, so it cannot address v256+.
     */
    @Test fun storeAboveV255UsesMove16() {
        // registerCount 260 -> listReg 256
        val reg = feedListRegister(260)
        assertEquals(256, reg)
        assertEquals("move-object/from16 v0, v256", feedListLoadMove(reg))
        assertEquals("move-object/16 v256, v0", feedListStoreMove(reg))
        assertEquals("move-object/from16 v255, v0", feedListStoreMove(255))
    }

    /**
     * Verify the boundary condition: v15 uses plain move, v16 uses from16.
     */
    @Test fun boundaryAtV15() {
        assertEquals("move-object v0, v15", feedListLoadMove(15))
        assertTrue(feedListLoadMove(16).startsWith("move-object/from16"))
    }
}
