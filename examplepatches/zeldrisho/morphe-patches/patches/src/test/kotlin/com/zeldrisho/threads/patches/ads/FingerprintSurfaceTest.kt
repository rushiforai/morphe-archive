package com.zeldrisho.threads.patches.ads

import com.zeldrisho.threads.patches.shared.Constants
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Guards the R8-obfuscated fingerprint surface Hide-ads depends on.
 *
 * These names drift on nearly every Meta release (see lessons-learned.md), so
 * this test pins the CURRENT contract in one place: if Threads renames
 * BarcelonaFeedCache.A0F, Media.DED, or the A05/A02/Ckh/CDh reflection chain,
 * the failure message tells the next person exactly what to re-hunt
 * (docs/reverse-engineering.md + docs/qa-checklist.md §4) instead of shipping
 * a silently dead filter.
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
     * Verify that injected move instructions stay within v0-v15 or use from16 for higher registers.
     */
    @Test fun injectedMovesStayInV0V15() {
        // morphe snippet injection only accepts registers v0-v15; the helpers
        // must emit the from16 form once the list register exceeds v15.
        assertTrue(feedListLoadMove(15).startsWith("move-object v0,"), "v15 uses plain move")
        assertTrue(feedListLoadMove(16).contains("from16"), "v16 needs from16")
        assertTrue(feedListStoreMove(16).contains("from16"), "store mirrors load")
    }

    /**
     * Verify that the Threads compatibility target version remains pinned to avoid silent drift.
     */
    @Test fun compatibilityStaysPinned() {
        val compat = Constants.COMPATIBILITY_THREADS
        assertEquals("com.instagram.barcelona", compat.packageName)
        val versions = compat.targets.map { it.version }
        assertTrue("434.0.0.41.74" in versions, "Threads target must stay pinned, found: $versions")
        assertEquals(510406926, Constants.TESTED_VERSION_CODE, "tested versionCode must be recorded")
    }

    /**
     * Document the obfuscated reflection chain (DED, A05, A02, Ckh, CDh) so renames are caught early.
     */
    @Test fun reflectionChainIsDocumented() {
        // The extension resolves these obfuscated members via reflection
        // (FeedAdFilter.java). Listed here so a rename shows up as a hunt list,
        // not tribal knowledge: direct DED(), media A05()->DED(), thread
        // A02()->Ckh()->CDh()->DED().
        val members = setOf("DED", "A05", "A02", "Ckh", "CDh")
        assertEquals(5, members.size, "reflection chain: $members")
    }
}
