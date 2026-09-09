package com.zeldrisho.threads.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Feed-merge entry point (BarcelonaFeedCache.A0F).
 *
 * WHY THIS TARGET:
 * Every fetched main-feed list funnels through A0F before merging into the visible
 * feed, so filtering the list parameter here drops sponsored units before they can
 * render (gap-free, cache stays clean). There is no ad-specific construction hook
 * on the main-feed path — ads are ordinary feed units whose only ad signal is
 * Media.DED() (confirmed by on-device probes: thousands of DED calls per scroll).
 *
 * WHY THIS FINGERPRINT IS STABLE:
 * The defining class is non-obfuscated and the INVOKE_DIRECT_RANGE into the
 * addAndSaveItemsFromFeedFetchSuccess$2$1 save-callback is structural, not a bare
 * R8 name match. Do not match the R8 method name or its obfuscated object
 * parameter types; the List remains p5 and all parameters occupy one register.
 *
 * VERIFIED 434.0.0.41.74 (versionCode 510406926):
 *   BarcelonaFeedCache.smali — public final A0F(...)Ljava/lang/Object; with the
 *   $2$1.<init> range-invoke present. Re-verify per update; see
 *   docs/qa-checklist.md §4 (APKPure ships the same version name with a different
 *   versionCode — smali matched, but fingerprints must be re-confirmed).
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
