package com.zeldrisho.threads.extension;

import static com.zeldrisho.threads.extension.FeedAdFilterFixtures.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.junit.Test;

/** Unit tests for {@link FeedAdFilter}. Pure JVM — no Android deps. */
public class FeedAdFilterTest {

  /** Filters a feed using the resolved member names for Threads 434. */
  private static List<?> filter434(List<?> items) {
    return FeedAdFilter.filterAds(items, "DED", "A05", "A02", "Ckh", "CDh");
  }

  /** Filters a feed using the resolved member names for Threads 445. */
  private static List<?> filter445(List<?> items) {
    return FeedAdFilter.filterAds(items, "DGK", "A05", "A02", "Cnd", "CIV");
  }

  /** Filters a feed using the resolved member names for Threads 449. */
  private static List<?> filter449(List<?> items) {
    return FeedAdFilter.filterAds(items, "DKT", "A05", "A02", "CrL", "CLK");
  }

  /** Exercises fallback behavior when no reflection member names are available. */
  private static List<?> withoutResolvedMembers(List<?> items) {
    return FeedAdFilter.filterAds(items, null, null, null, null, null);
  }

  /** Null and empty lists must pass through unchanged. */
  @Test
  public void nullAndEmptyPassthrough() {
    assertEquals(null, withoutResolvedMembers(null));
    List<?> empty = Collections.emptyList();
    assertSame(empty, withoutResolvedMembers(empty));
  }

  /** When no ads are present, the filter must return the same list instance (no copy). */
  @Test
  public void allOrganicReturnsSameInstance() {
    List<Object> in =
        new ArrayList<>(Arrays.asList(new FakeFeedUnit(false), new FakeFeedUnit(false)));
    assertSame(in, filter434(in));
  }

  /** Verifies that filtering a linked list retains organic items in their original order. */
  @Test
  public void linkedListTraversalRemainsLinearAndPreservesOrder() {
    Object first = new FakeFeedUnit(false);
    Object ad = new FakeFeedUnit(true);
    Object last = new FakeFeedUnit(false);
    List<Object> in = new LinkedList<>(Arrays.asList(first, ad, last));

    List<?> out = filter434(in);

    assertEquals(2, out.size());
    assertSame(first, out.get(0));
    assertSame(last, out.get(1));
  }

  /** Ad headers with direct DED() must be filtered out. */
  @Test
  public void directDedHeaderRemoved() {
    Object ad = new FakeAdHeader();
    Object post = new FakeFeedUnit(false);
    List<?> out = filter434(Arrays.asList(ad, post));
    assertEquals(1, out.size());
    assertSame(post, out.get(0));
  }

  /** Feed units with ad media (A05() returns Media with DED=true) must be filtered out. */
  @Test
  public void mediaDedRemoved() {
    Object ad = new FakeFeedUnit(true);
    Object post = new FakeFeedUnit(false);
    List<?> out = filter434(Arrays.asList(ad, post));
    assertEquals(1, out.size());
    assertSame(post, out.get(0));
  }

  /** Verifies that the resolved member set preserves an organic feed unit. */
  @Test
  public void resolvedFourArgumentOverloadDelegatesToLegacyThreadItemsLookup() {
    Object post = new FakeFeedUnit(false);
    List<?> result = FeedAdFilter.filterAds(Arrays.asList(post), "DED", "A05", "A02", "Ckh", "CDh");
    assertEquals(1, result.size());
    assertSame(post, result.get(0));
  }

  /** Verifies that the supplied thread accessor chain distinguishes ads from organic items. */
  @Test
  public void patchTimeResolvedThreadItemsAccessorIsUsed() {
    FakeThreadUnit adUnit = new FakeThreadUnit(new FakeThread(new FakeThreadItem(true)));
    FakeThreadUnit post = new FakeThreadUnit(new FakeThread(new FakeThreadItem(false)));
    List<?> out = filter434(Arrays.asList(adUnit, post));
    assertEquals(1, out.size());
    assertSame(post, out.get(0));
  }

  /** Thread units with any ad item in their Ckh()->CDh()->DED() chain must be filtered out. */
  @Test
  public void threadCarriedAdRemoved() {
    FakeThread thread = new FakeThread(new FakeThreadItem(false), new FakeThreadItem(true));
    Object adUnit = new FakeThreadUnit(thread);
    Object post = new FakeFeedUnit(false);
    List<?> out = filter434(Arrays.asList(adUnit, post));
    assertEquals(1, out.size());
    assertSame(post, out.get(0));
  }

  /** 445 ad headers with direct DGK() must be filtered out. */
  @Test
  public void directDgkHeaderRemoved() {
    FeedAdFilter.clearCacheForTest();
    Object ad = new FakeAdHeader445();
    Object post = new FakeFeedUnit445(false);
    List<?> out = filter445(Arrays.asList(ad, post));
    assertEquals(1, out.size());
    assertSame(post, out.get(0));
  }

  /** 445 feed units with ad media (A05() returns Media with DGK=true) must be filtered out. */
  @Test
  public void mediaDgkRemoved() {
    FeedAdFilter.clearCacheForTest();
    Object ad = new FakeFeedUnit445(true);
    Object post = new FakeFeedUnit445(false);
    List<?> out = filter445(Arrays.asList(ad, post));
    assertEquals(1, out.size());
    assertSame(post, out.get(0));
  }

  /** 445 thread units with any ad item in their Cnd()->CIV()->DGK() chain must be filtered out. */
  @Test
  public void threadCarriedAd445Removed() {
    FeedAdFilter.clearCacheForTest();
    FakeThread445 thread =
        new FakeThread445(new FakeThreadItem445(false), new FakeThreadItem445(true));
    Object adUnit = new FakeThreadUnit445(thread);
    Object post = new FakeFeedUnit445(false);
    List<?> out = filter445(Arrays.asList(adUnit, post));
    assertEquals(1, out.size());
    assertSame(post, out.get(0));
  }

  /** Mixed 434/445 feeds must filter on both shapes in one pass. */
  @Test
  public void mixedVersionFeedRemoved() {
    FeedAdFilter.clearCacheForTest();
    Object ad434 = new FakeFeedUnit(true);
    Object ad445 = new FakeFeedUnit445(true);
    Object post434 = new FakeFeedUnit(false);
    Object post445 = new FakeFeedUnit445(false);
    assertEquals(1, filter434(Arrays.asList(ad434, post434)).size());
    assertEquals(1, filter445(Arrays.asList(ad445, post445)).size());
  }

  /** Verifies that supplied 449 member names filter both media and thread ads. */
  @Test
  public void version449AccessorsAreProvidedDynamically() {
    Object ad = new FakeFeedUnit449(true);
    Object organic = new FakeThreadUnit449(new FakeThread449(new FakeThreadItem449(false)));
    Object threadAd = new FakeThreadUnit449(new FakeThread449(new FakeThreadItem449(true)));
    List<?> output = filter449(Arrays.asList(ad, organic, threadAd));
    assertEquals(1, output.size());
    assertSame(organic, output.get(0));
  }

  /** Immutable input lists must be copied (not modified in-place) when filtering. */
  @Test
  public void immutableInputReturnsFilteredCopy() {
    // Regression guard: in-place Iterator.remove() on an immutable list
    // throws UnsupportedOperationException — the filter must copy.
    List<?> in =
        Collections.unmodifiableList(
            new ArrayList<>(Arrays.asList(new FakeFeedUnit(true), new FakeFeedUnit(false))));
    List<?> out = filter434(in);
    assertEquals(1, out.size());
  }

  /** Verifies that a traversal failure returns the original feed without propagating the error. */
  @Test
  public void iteratorFailureReturnsOriginalList() {
    List<Object> broken =
        new java.util.AbstractList<Object>() {
          /** Throws on element access to simulate a failure during iteration. */
          @Override
          public Object get(int index) {
            throw new IllegalStateException("synthetic iterator failure");
          }

          /** Reports one element so traversal attempts the failing getter. */
          @Override
          public int size() {
            return 1;
          }
        };
    assertSame(broken, filter434(broken));
  }

  /** Unknown object shapes must be kept and must not crash. */
  @Test
  public void unknownShapeIsKeptNoCrash() {
    // R8 rename drift: objects without DED/A05/A02 must be kept, never crash.
    Object unknown = new Object();
    List<?> in = Collections.singletonList(unknown);
    assertSame(in, withoutResolvedMembers(in));
  }

  /** Null items in the feed list must be preserved (not filtered). */
  @Test
  public void nullItemsKept() {
    Object post = new FakeFeedUnit(false);
    List<?> out = filter434(Arrays.asList(null, post));
    assertTrue(out.contains(null));
    assertTrue(out.contains(post));
  }

  /** First use must populate the reflection cache, including misses for unknown shapes. */
  @Test
  public void reflectionCachePopulatesOnFirstUse() {
    FeedAdFilter.clearCacheForTest();
    assertEquals(0, FeedAdFilter.cachedMethodCountForTest());
    List<?> in = new ArrayList<>(Arrays.asList(new FakeFeedUnit(true), new FakeFeedUnit(false)));
    List<?> out = filter434(in);
    assertEquals(1, out.size());
    assertTrue(FeedAdFilter.cachedMethodCountForTest() > 0);
  }

  /** Repeat filtering must reuse cached lookups (no growth) with identical results. */
  @Test
  public void repeatFilteringReusesCache() {
    FeedAdFilter.clearCacheForTest();
    Object ad = new FakeFeedUnit(true);
    Object post = new FakeFeedUnit(false);
    Object unknown = new Object();
    List<Object> in = new ArrayList<>(Arrays.asList(ad, post, unknown));
    List<?> first = filter434(in);
    int cached = FeedAdFilter.cachedMethodCountForTest();
    assertTrue(cached > 0);
    List<?> second = filter434(in);
    assertEquals(first.size(), second.size());
    assertSame(first.get(0), second.get(0));
    assertEquals(cached, FeedAdFilter.cachedMethodCountForTest());
  }
}
