package com.zeldrisho.threads.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;

/** Unit tests for {@link FeedAdFilter}. Pure JVM — no Android deps. */
public class FeedAdFilterTest {

  // --- fakes mirroring the obfuscated app surface (A05/A02/Ckh/CDh/DED) ---

  /** Fake Instagram Media object with a DED() ad flag. */
  public static class FakeMedia {
    private final boolean ad;

    FakeMedia(boolean ad) {
      this.ad = ad;
    }

    public boolean DED() {
      return ad;
    }
  }

  /** Fake feed unit (LX/3oS) with an A05() accessor for Media. */
  public static class FakeFeedUnit {
    private final FakeMedia media;

    FakeFeedUnit(boolean ad) {
      this.media = new FakeMedia(ad);
    }

    public FakeMedia A05() {
      return media;
    }
  }

  /** Fake thread item with a CDh() accessor for its Media. */
  public static class FakeThreadItem {
    private final FakeMedia media;

    FakeThreadItem(boolean ad) {
      this.media = new FakeMedia(ad);
    }

    public FakeMedia CDh() {
      return media;
    }
  }

  /** Fake thread object with a Ckh() accessor for its item list. */
  public static class FakeThread {
    private final List<FakeThreadItem> items;

    FakeThread(FakeThreadItem... items) {
      this.items = Arrays.asList(items);
    }

    public List<FakeThreadItem> Ckh() {
      return items;
    }
  }

  /** Fake feed unit wrapping a thread via A02() accessor. */
  public static class FakeThreadUnit {
    private final FakeThread thread;

    FakeThreadUnit(FakeThread thread) {
      this.thread = thread;
    }

    public FakeThread A02() {
      return thread;
    }
  }

  /** Fake ad header (X/1qQ) that directly exposes DED() as true. */
  public static class FakeAdHeader {
    public boolean DED() {
      return true;
    }
  }

  /** Null and empty lists must pass through unchanged. */
  @Test
  public void nullAndEmptyPassthrough() {
    assertEquals(null, FeedAdFilter.filterAds(null));
    List<?> empty = Collections.emptyList();
    assertSame(empty, FeedAdFilter.filterAds(empty));
  }

  /** When no ads are present, the filter must return the same list instance (no copy). */
  @Test
  public void allOrganicReturnsSameInstance() {
    List<Object> in =
        new ArrayList<>(Arrays.asList(new FakeFeedUnit(false), new FakeFeedUnit(false)));
    assertSame(in, FeedAdFilter.filterAds(in));
  }

  /** Ad headers with direct DED() must be filtered out. */
  @Test
  public void directDedHeaderRemoved() {
    Object ad = new FakeAdHeader();
    Object post = new FakeFeedUnit(false);
    List<?> out = FeedAdFilter.filterAds(Arrays.asList(ad, post));
    assertEquals(1, out.size());
    assertSame(post, out.get(0));
  }

  /** Feed units with ad media (A05() returns Media with DED=true) must be filtered out. */
  @Test
  public void mediaDedRemoved() {
    Object ad = new FakeFeedUnit(true);
    Object post = new FakeFeedUnit(false);
    List<?> out = FeedAdFilter.filterAds(Arrays.asList(ad, post));
    assertEquals(1, out.size());
    assertSame(post, out.get(0));
  }

  /** Thread units with any ad item in their Ckh()->CDh()->DED() chain must be filtered out. */
  @Test
  public void threadCarriedAdRemoved() {
    FakeThread thread = new FakeThread(new FakeThreadItem(false), new FakeThreadItem(true));
    Object adUnit = new FakeThreadUnit(thread);
    Object post = new FakeFeedUnit(false);
    List<?> out = FeedAdFilter.filterAds(Arrays.asList(adUnit, post));
    assertEquals(1, out.size());
    assertSame(post, out.get(0));
  }

  /** Immutable input lists must be copied (not modified in-place) when filtering. */
  @Test
  public void immutableInputReturnsFilteredCopy() {
    // Regression guard: in-place Iterator.remove() on an immutable list
    // throws UnsupportedOperationException — the filter must copy.
    List<?> in =
        Collections.unmodifiableList(
            new ArrayList<>(Arrays.asList(new FakeFeedUnit(true), new FakeFeedUnit(false))));
    List<?> out = FeedAdFilter.filterAds(in);
    assertEquals(1, out.size());
  }

  /** Unknown object shapes (no DED/A05/A02 methods) must be kept and must not crash. */
  @Test
  public void unknownShapeIsKeptNoCrash() {
    // R8 rename drift: objects without DED/A05/A02 must be kept, never crash.
    Object unknown = new Object();
    List<?> in = Collections.singletonList(unknown);
    assertSame(in, FeedAdFilter.filterAds(in));
  }

  /** Null items in the feed list must be preserved (not filtered). */
  @Test
  public void nullItemsKept() {
    Object post = new FakeFeedUnit(false);
    List<?> out = FeedAdFilter.filterAds(Arrays.asList(null, post));
    assertTrue(out.contains(null));
    assertTrue(out.contains(post));
  }

  /** First use must populate the reflection cache, including misses for unknown shapes. */
  @Test
  public void reflectionCachePopulatesOnFirstUse() {
    FeedAdFilter.clearCacheForTest();
    assertEquals(0, FeedAdFilter.cachedMethodCountForTest());
    List<?> in = new ArrayList<>(Arrays.asList(new FakeFeedUnit(true), new FakeFeedUnit(false)));
    List<?> out = FeedAdFilter.filterAds(in);
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
    List<?> first = FeedAdFilter.filterAds(in);
    int cached = FeedAdFilter.cachedMethodCountForTest();
    assertTrue(cached > 0);
    List<?> second = FeedAdFilter.filterAds(in);
    assertEquals(first.size(), second.size());
    assertSame(first.get(0), second.get(0));
    assertEquals(cached, FeedAdFilter.cachedMethodCountForTest());
  }
}
