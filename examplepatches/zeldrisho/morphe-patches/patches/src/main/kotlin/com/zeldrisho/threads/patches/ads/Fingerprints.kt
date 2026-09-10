package com.zeldrisho.threads.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Feed-merge entry point (BarcelonaFeedCache.A0F on 434, A0G on 445).
 *
 * WHY THIS TARGET:
 * Every fetched main-feed list funnels through the merge method before merging into the visible
 * feed, so filtering the list parameter here drops sponsored units before they can
 * render (gap-free, cache stays clean). There is no ad-specific construction hook
 * on the main-feed path — ads are ordinary feed units whose only ad signal is
 * Media.DED()/DGK() (confirmed by on-device probes: thousands of calls per scroll).
 *
 * WHY THIS FINGERPRINT IS STABLE:
 * The defining class is non-obfuscated and the INVOKE_DIRECT_RANGE into the
 * addAndSaveItemsFromFeedFetchSuccess$2$1 save-callback is structural, not a bare
 * R8 name match. Do not match the R8 method name or its obfuscated object
 * parameter types; the List remains p5 and all parameters occupy one register.
 * The same fingerprint matches A0F on 434 and A0G on 445: both share the param
 * shape (LX/obf, Integer, String, String, List, LX/obf, Function3, Z, .locals 37)
 * and both contain the single $2$1.<init> range-invoke (only the obfuscated
 * continuation/inner types differ, which this fingerprint does not constrain).
 *
 * VERIFIED 434.0.0.41.74 (versionCode 510406926):
 *   BarcelonaFeedCache.smali — public final A0F(...)Ljava/lang/Object; with the
 *   $2$1.<init> range-invoke present.
 * VERIFIED 445.0.0.46.83 (versionCode 511507647):
 *   BarcelonaFeedCache.smali — public final A0G(...)Ljava/lang/Object; with the
 *   $2$1.<init> range-invoke present (A0F now has a different signature and no callback).
 * Re-verify per update; see
 * docs/qa-checklist.md §4 (APKPure ships the same version name with a different
 * versionCode — smali matched, but fingerprints must be re-confirmed).
 */
internal object FeedMergeMethod : Fingerprint(
    definingClass = "Lcom/instagram/barcelona/feed/data/cache/BarcelonaFeedCache;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "L",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/util/List;",
        "L",
        "Lkotlin/jvm/functions/Function3;",
        "Z",
    ),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_DIRECT_RANGE,
            definingClass = "Lcom/instagram/barcelona/feed/data/cache/" +
                "BarcelonaFeedCache\$addAndSaveItemsFromFeedFetchSuccess\$2\$1;",
            name = "<init>",
            returnType = "V",
        ),
    ),
)
