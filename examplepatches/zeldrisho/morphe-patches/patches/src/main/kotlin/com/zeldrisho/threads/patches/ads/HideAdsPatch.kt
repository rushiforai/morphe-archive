package com.zeldrisho.threads.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.zeldrisho.threads.patches.shared.Constants.COMPATIBILITY_THREADS

/**
 * Hides sponsored posts from the Threads feed.
 *
 * Approach (issue #5): the previous implementation forced `Media.DED() -> false`,
 * which only stripped the "Ad"/"Sponsored" chrome while leaving the ad post in the
 * feed (the reporter's exact symptom: "labels disappeared but ads still show").
 * On-device probing (434.0.0.41.74 / versionCode 510406926) showed the main feed
 * has no ad-specific construction hook — ads are ordinary feed units whose ONLY ad
 * signal is `Media.DED()` (434) / `Media.DGK()` (445, same inner constants:
 * wrapper 0x775627d1, E7l(-0x79965650), CC6(0x10e895f0) non-null — renames of
 * E3k/C7J), consulted thousands of times per feed scroll, and every
 * fetched list funnels through the BarcelonaFeedCache merge method (A0F on 434,
 * A0G on 445 — same param shape, .locals 37).
 *
 * So instead of relabeling, we drop ad-flagged units from the list BEFORE it merges
 * into the visible feed: `FeedAdFilter.filterAds()` (companion extension) inspects
 * each unit via reflection (media `A05()/DED()/DGK()`, or thread-carried items
 * `A02() -> Ckh()/Cnd() -> CDh()/CIV() -> DED()/DGK()`), and this patch replaces the feed-list
 * parameter with the filtered result at the top of the merge method.
 *
 * Notes:
 *  - Feed-scoped: sponsored units in other surfaces (clips/reels/stories) are
 *    unaffected.
 *  - `DED()/DGK()` is left natural so the filter can see real ads.
 *  - Any reflection mismatch degrades to a no-op (no crash), so an app update
 *    worst-case brings ads back instead of breaking the feed.
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes sponsored posts from the Threads feed by filtering ad feed units " +
        "(detected via Media.DED/DGK) out of the list merged into the feed cache, before they can " +
        "render. Feed-scoped; other surfaces (clips/reels) are not affected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_THREADS)
    extendWith("extensions/extension.mpe")

    execute {
        validateFeedReflectionContract { classDefByOrNull(it) }
        val method = FeedMergeMethod.matchAll(1..1).single().method
        injectFeedAdFilter(method)
    }
}

/** Injects the production hook; the caller must first validate the target and reflection ABI. */
internal fun injectFeedAdFilter(method: MutableMethod) {
    val impl = method.implementation
        ?: error("BarcelonaFeedCache merge method has no implementation")
    // A0F (434) / A0G (445): (this, LX/obf, Integer, String, String, List, LX/obf, Function3, Z):
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
