package com.zeldrisho.threads.patches.ads

import com.zeldrisho.threads.patches.shared.Constants
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Guards the R8-obfuscated fingerprint surface Hide-ads depends on.
 *
 * These tests guard compatibility metadata and register math, not an APK's
 * contents. FeedTargetTest exercises real fingerprint matching and reflection
 * ABI validation; its optional local APK test detects drift in the pinned input.
 */
class FingerprintSurfaceTest {

    /**
     * Verify the register math contract for the A0F method signature.
     */
    @Test fun feedMergeSignatureContract() {
        // A0F(this, LX/9aR, Integer, String, String, List, LX/2uI, Function3, Z):
        // 9 params including `this`; the feed list is param index 5.
        // Register math: listReg = registerCount - 9 + 5.
        assertEquals(6, feedListRegister(registerCount = 10), "list reg with one local scratch register")
        assertEquals(11, feedListRegister(registerCount = 15), "list reg shifts with frame size")
    }

    /**
     * Verify that injected move instructions follow instruction encodings.
     */
    @Test fun injectedMovesFollowEncodings() {
        // move-object has 4-bit operands; from16 extends the range, and stores
        // above v255 need move-object/16 (from16 has an 8-bit destination).
        assertTrue(feedListLoadMove(15).startsWith("move-object v0,"), "v15 uses plain move")
        assertTrue(feedListLoadMove(16).contains("from16"), "v16 needs from16")
        assertTrue(feedListStoreMove(16).contains("from16"), "store mirrors load")
        assertEquals("move-object/16 v256, v0", feedListStoreMove(256))
    }

    /**
     * Verify that the Threads compatibility target versions remain pinned to avoid silent drift.
     */
    @Test fun compatibilityStaysPinned() {
        val compat = Constants.COMPATIBILITY_THREADS
        assertEquals("com.instagram.barcelona", compat.packageName)
        val versions = compat.targets.map { it.version }
        assertTrue("434.0.0.41.74" in versions, "Threads target must stay pinned, found: $versions")
        assertTrue("445.0.0.46.83" in versions, "Threads 445 target must stay pinned, found: $versions")
        assertEquals(510406926, Constants.TESTED_VERSION_CODE, "tested versionCode must be recorded")
        assertEquals(511507647, Constants.TESTED_VERSION_CODE_445, "tested 445 versionCode must be recorded")
    }
}
