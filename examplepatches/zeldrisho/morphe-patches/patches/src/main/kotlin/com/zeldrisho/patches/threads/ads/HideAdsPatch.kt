package com.zeldrisho.patches.threads.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.zeldrisho.patches.threads.shared.Constants.COMPATIBILITY_THREADS

private const val FEED_MERGE_PARAMETER_COUNT = 9
private const val FEED_FILTER_SCRATCH_REGISTER_COUNT = 6

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
    // Coupling note: this resource path must match extensionMpeResourcePath in
    // patches/build.gradle.kts (Kotlin patch code and the Gradle build script
    // cannot share a constant across that boundary — change both together).
    extendWith("extensions/extension.mpe")

    execute {
        validateFeedReflectionContract { classDefByOrNull(it) }
        val method = FeedMergeMethod.matchAll(1..1).single().method
        val helper = requireSingleFeedMatch("Media ad-predicate helper", MediaAdPredicateHelper.matchAll())
            .originalMethod
        val predicate = requireSingleFeedMatch("Media ad-predicate", mediaAdPredicate(helper).matchAll()).originalMethod
        val anchor = requireSingleFeedMatch("feed-wrapper anchor", FeedContentAccessor.matchAll()).originalMethod
        val mediaAccessor = requireSingleFeedMatch(
            "feed media accessor",
            feedWrapperAccessor(anchor, "Lcom/instagram/feed/media/Media;").matchAll(),
        ).originalMethod
        val threadAccessor = requireSingleFeedMatch("feed ThreadIntf-role accessor", feedThreadAccessor(anchor).matchAll())
            .originalMethod
        val threadItems = requireSingleFeedMatch("thread-items accessor", threadItemsAccessor(threadAccessor).matchAll())
            .originalMethod
        val itemMedia = requireSingleFeedMatch(
            "thread-item media accessor",
            threadItemMediaAccessor().matchAll(),
        ).originalMethod
        injectFeedAdFilter(
            method,
            predicate.name,
            mediaAccessor.name,
            threadAccessor.name,
            threadItems.name,
            itemMedia.name,
        )
    }
}

/** Requires one unique result for every feed ABI fingerprint used by the injection. */
internal fun <T> requireSingleFeedMatch(label: String, matches: List<T>): T {
    check(matches.size == 1) { "Threads $label fingerprint matched ${matches.size} methods; expected exactly one" }
    return matches.single()
}

/** Injects the production hook; the caller must first validate the target and reflection ABI. */
internal fun injectFeedAdFilter(
    method: MutableMethod,
    mediaPredicateName: String = "",
    mediaAccessorName: String = "",
    threadAccessorName: String = "",
    threadItemsAccessorName: String = "",
    itemMediaAccessorName: String = "",
) {
    val impl = method.implementation
        ?: error("BarcelonaFeedCache merge method has no implementation")
    // A0F (434) / A0G (445): (this, LX/obf, Integer, String, String, List, LX/obf, Function3, Z):
    // 9 params including `this`; the feed list is param index 5 (p5).
    check(impl.registerCount - FEED_MERGE_PARAMETER_COUNT >= FEED_FILTER_SCRATCH_REGISTER_COUNT) {
        "BarcelonaFeedCache merge method needs six local scratch registers for the feed filter"
    }
    val listReg = feedListRegister(impl.registerCount)
    val loadMove = feedListLoadMove(listReg)
    val storeMove = feedListStoreMove(listReg)
    method.addInstructions(
        0,
        """
            $loadMove
            const-string v1, "$mediaPredicateName"
            const-string v2, "$mediaAccessorName"
            const-string v3, "$threadAccessorName"
            const-string v4, "$threadItemsAccessorName"
            const-string v5, "$itemMediaAccessorName"
            invoke-static/range {v0 .. v5}, Lcom/zeldrisho/threads/extension/FeedAdFilter;->filterAds(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
            move-result-object v0
            $storeMove
        """,
    )
}
