package com.zeldrisho.threads.patches.ads

import com.zeldrisho.threads.patches.shared.Constants.COMPATIBILITY_THREADS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Hides sponsored posts from the Threads feed.
 *
 * Approach (issue #5): the previous implementation forced `Media.DED() -> false`,
 * which only stripped the "Ad"/"Sponsored" chrome while leaving the ad post in the
 * feed (the reporter's exact symptom: "labels disappeared but ads still show").
 * On-device probing (434.0.0.41.74 / versionCode 510406926) showed the main feed
 * has no ad-specific construction hook — ads are ordinary feed units whose ONLY ad
 * signal is `Media.DED()` (consulted thousands of times per feed scroll), and every
 * fetched list funnels through `BarcelonaFeedCache.A0F`.
 *
 * So instead of relabeling, we drop DED-true units from the list BEFORE it merges
 * into the visible feed: `FeedAdFilter.filterAds()` (companion extension) inspects
 * each unit via reflection (media `A05()/DED()`, or thread-carried items
 * `A02() -> Ckh() -> CDh() -> DED()`), and this patch replaces the feed-list
 * parameter with the filtered result at the top of A0F.
 *
 * Notes:
 *  - Feed-scoped: sponsored units in other surfaces (clips/reels/stories) are
 *    unaffected.
 *  - `DED()` is left natural so the filter can see real ads.
 *  - Any reflection mismatch degrades to a no-op (no crash), so an app update
 *    worst-case brings ads back instead of breaking the feed.
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes sponsored posts from the Threads feed by filtering ad feed units " +
        "(detected via Media.DED) out of the list merged into the feed cache, before they can " +
        "render. Feed-scoped; other surfaces (clips/reels) are not affected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_THREADS)
    extendWith("extensions/extension.mpe")

    execute {
        val method = FeedMergeMethod.method
        val impl = method.implementation
            ?: error("BarcelonaFeedCache.A0F has no implementation")
        // A0F(this, LX/9aR, Integer, String, String, List, LX/2uI, Function3, Z):
        // 9 params including `this`; the feed list is param index 5 (p5).
        val listReg = feedListRegister(impl.registerCount)
        val loadMove = feedListLoadMove(listReg)
        val storeMove = feedListStoreMove(listReg)
        method.addInstructions(
            0,
            """
                $loadMove
                invoke-static {v0}, Lcom/zeldrisho/threads/extension/FeedAdFilter;->filterAds(Ljava/util/List;)Ljava/util/List;
                move-result-object v0
                $storeMove
            """,
        )
    }
}

private object FeedMergeMethod : Fingerprint(
    name = "A0F",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("LX/9aR;", "Ljava/lang/Integer;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/List;", "LX/2uI;", "Lkotlin/jvm/functions/Function3;", "Z"),
    definingClass = "Lcom/instagram/barcelona/feed/data/cache/BarcelonaFeedCache;",
)
