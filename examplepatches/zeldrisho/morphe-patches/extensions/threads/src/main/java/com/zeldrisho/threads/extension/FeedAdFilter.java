package com.zeldrisho.threads.extension;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

/**
 * Feed ad removal for Threads (issue #5).
 *
 * <p>The Threads main feed is assembled by merging fetched feed units (LX/3oS wrappers on 434,
 * LX/0hJ on 445, around thread models or ad media) through {@code BarcelonaFeedCache} (A0F on 434,
 * A0G on 445). A sponsored post is distinguished from an organic one ONLY by the media ad predicate
 * ({@code com.instagram.feed.media.Media.DED()} on 434, {@code DGK()} on 445 — same inner
 * constants, confirmed by smali comparison; consulted thousands of times per feed scroll), and
 * there are zero ad-specific construction hooks on the main feed path. The previous "Hide ads"
 * patch forced {@code DED() -> false}, which just stripped the "Ad"/"Sponsored" chrome while
 * leaving the ad post in the feed.
 *
 * <p>{@link #filterAds(List)} is called from the "Hide ads" bytecode patch at the top of the
 * BarcelonaFeedCache merge method; it returns the input list without ad units, and the patch
 * replaces the feed-list reference with the result, so sponsored posts never reach the visible feed
 * (gap-free, cache stays clean).
 *
 * <p>Everything is reflection wrapped in try/catch: any R8 rename mismatch degrades to a no-op
 * instead of crashing the host app (worst case an app update briefly brings ads back rather than
 * breaking the feed).
 */
public final class FeedAdFilter {

  /**
   * Resolved no-arg methods by "class#name", mirroring Piko's decoder philosophy (resolve once,
   * reuse): the feed merge consults the ad predicate thousands of times per scroll, so reflective
   * lookup happens at most once per pair. Plain maps under one lock keep this safe on the
   * extension's minSdk (API 23), where ConcurrentHashMap.computeIfAbsent and Optional are
   * unavailable. Misses are recorded in {@link #KNOWN_MISSING} so R8 drift on one shape does not
   * pay lookup costs on every subsequent item.
   */
  private static final Object CACHE_LOCK = new Object();

  /** Resolved methods by "class#name"; guarded by {@link #CACHE_LOCK}. */
  private static final HashMap<String, Method> METHOD_CACHE = new HashMap<>();

  /** Keys with no resolvable method (misses); guarded by {@link #CACHE_LOCK}. */
  private static final HashSet<String> KNOWN_MISSING = new HashSet<>();

  /** Private constructor to prevent instantiation of this utility class. */
  private FeedAdFilter() {}

  /**
   * Returns {@code items} minus ad units (same instance if nothing removed, so immutable inputs are
   * safe). Ad detection: direct {@code DED()/DGK()} (X/1qQ ad headers on 434, X/2xO on 445), else
   * the unit's media {@code A05() -> Media.DED()/DGK()}, else thread-carried media ({@code A02() ->
   * ThreadIntf.Ckh()/Cnd() -> ThreadItem.CDh()/CIV() -> Media.DED()/DGK()}).
   */
  public static List<?> filterAds(List<?> items) {
    if (items == null || items.isEmpty()) {
      return items;
    }
    ArrayList<Object> out = new ArrayList<>(items.size());
    try {
      for (Object o : items) {
        if (o == null || !isAdUnit(o)) {
          out.add(o);
        }
      }
    } catch (Throwable ignored) {
      // Any failure -> return the original untouched.
      return items;
    }
    return out.size() == items.size() ? items : out;
  }

  /**
   * Checks whether a feed unit is an ad via reflection on DED()/DGK(), A05(), A02(), Ckh()/Cnd(),
   * and CDh()/CIV(). New (445) names are tried first, then the 434 names.
   *
   * @param item The feed unit object to inspect.
   * @return True if the item is determined to be an ad, false otherwise or on reflection failure.
   */
  private static boolean isAdUnit(Object item) {
    try {
      // 1) Direct DED()/DGK() (X/1qQ ad headers on 434, X/2xO on 445 carry their own flag).
      if (callDed(item)) {
        return true;
      }
      // 2) Media-bearing feed unit: LX/3oS (434) / LX/0hJ (445) .A05() -> Media;
      //    Media.DED() (434) / DGK() (445) is the ad flag.
      Object media = call(item, "A05");
      if (media != null && callDed(media)) {
        return true;
      }
      // 3) Thread-carried ad: .A02() -> ThreadIntf; items (Ckh/Cnd) -> ThreadItem
      //    (CDh/CIV) -> Media.DED()/DGK().
      Object thread = call(item, "A02");
      if (thread != null) {
        Object threadItems = callAny(thread, "Cnd", "Ckh");
        if (threadItems instanceof List) {
          for (Object ti : (List<?>) threadItems) {
            if (ti != null && (callDed(ti) || callDed(callAny(ti, "CIV", "CDh")))) {
              return true;
            }
          }
        }
      }
    } catch (Throwable ignored) {
      // Reflection failure -> not an ad (keep).
    }
    return false;
  }

  /**
   * Invokes DED()/DGK() on an object via reflection and returns true if the result is Boolean.TRUE.
   * Tries the 445 name (DGK) first, then the 434 name (DED).
   *
   * @param o The object to inspect.
   * @return True if the ad predicate returns true, false otherwise or on reflection failure.
   */
  private static boolean callDed(Object o) {
    return o != null && Boolean.TRUE.equals(callAny(o, "DGK", "DED"));
  }

  /**
   * Reflectively invokes the first resolvable no-arg method from {@code names} on an object,
   * returning null when none resolves or reflection fails. Only invokes methods that return
   * boolean, Boolean, or non-primitive types.
   *
   * @param o The object to call the method on.
   * @param names Candidate method names in preference order.
   * @return The method's return value, or null if no candidate exists or reflection fails.
   */
  private static Object callAny(Object o, String... names) {
    if (o == null) {
      return null;
    }
    for (String name : names) {
      try {
        Method m = lookup(o.getClass(), name);
        if (m != null) {
          return m.invoke(o);
        }
      } catch (Throwable ignored) {
      }
    }
    return null;
  }

  /**
   * Reflectively invokes a no-arg method on an object, returning null on any failure. Only invokes
   * methods that return boolean, Boolean, or non-primitive types.
   *
   * @param o The object to call the method on.
   * @param name The method name.
   * @return The method's return value, or null if the method does not exist or reflection fails.
   */
  private static Object call(Object o, String name) {
    if (o == null) {
      return null;
    }
    try {
      Method m = lookup(o.getClass(), name);
      if (m != null) {
        return m.invoke(o);
      }
    } catch (Throwable ignored) {
    }
    return null;
  }

  /**
   * Returns the cached no-arg method for a (class, name) pair, resolving and caching it on first
   * use. Null means absent (unknown shape or disallowed return type) and is cached too.
   */
  private static Method lookup(Class<?> cls, String name) {
    String key = cls.getName() + '#' + name;
    synchronized (CACHE_LOCK) {
      if (KNOWN_MISSING.contains(key)) {
        return null;
      }
      Method cached = METHOD_CACHE.get(key);
      if (cached != null) {
        return cached;
      }
      Method resolved = resolve(cls, name);
      if (resolved != null) {
        METHOD_CACHE.put(key, resolved);
      } else {
        KNOWN_MISSING.add(key);
      }
      return resolved;
    }
  }

  /** Resolves a public no-arg method whose return type the filter is allowed to read. */
  private static Method resolve(Class<?> cls, String name) {
    try {
      // getMethod(name) with no parameter types only resolves zero-arg methods.
      Method m = cls.getMethod(name);
      if (m.getReturnType() == boolean.class
          || m.getReturnType() == Boolean.class
          || !m.getReturnType().isPrimitive()) {
        return m;
      }
    } catch (Throwable ignored) {
    }
    return null;
  }

  /** Test-only: number of cached (class, method) entries, including misses. */
  static int cachedMethodCountForTest() {
    synchronized (CACHE_LOCK) {
      return METHOD_CACHE.size() + KNOWN_MISSING.size();
    }
  }

  /** Test-only: clears the reflection cache so tests observe cold lookups deterministically. */
  static void clearCacheForTest() {
    synchronized (CACHE_LOCK) {
      METHOD_CACHE.clear();
      KNOWN_MISSING.clear();
    }
  }
}
