package com.zeldrisho.threads.extension;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/**
 * Feed ad removal for Threads (issue #5).
 *
 * <p>The main-feed hook passes the current APK's resolved media predicate and wrapper accessors
 * into this helper. Names are resolved from DEX at patch time, so no R8-obfuscated host member
 * names are embedded in this extension. The previous "Hide ads" patch forced the predicate false,
 * which stripped sponsored labels while leaving the ad post in the feed.
 *
 * <p>{@link #filterAds(List)} is called from the "Hide ads" bytecode patch at the top of the
 * BarcelonaFeedCache merge method; it returns the input list without ad units, and the patch
 * replaces the feed-list reference with the result, so sponsored posts never reach the visible feed
 * (gap-free, cache stays clean).
 *
 * <p>Reflection is confined to host-object boundaries. A missing/changed member is retained rather
 * than crashing the host app; patch-time validation should reject unsupported ABIs before
 * injection.
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
   * Returns {@code items} without units whose resolved predicate identifies sponsored media. A null
   * input stays null, and the original list instance is returned when no ad is removed or scanning
   * throws, so immutable inputs are safe.
   */
  /** All host-obfuscated accessors are resolved from the matched APK at patch time. */
  public static List<?> filterAds(
      List<?> items,
      String mediaPredicateName,
      String mediaAccessorName,
      String threadAccessorName,
      String threadItemsAccessorName,
      String itemMediaAccessorName) {
    if (items == null || items.isEmpty()) {
      return items;
    }
    // Keep the common all-organic path allocation-free. Once the first ad is
    // found, copy the retained prefix and continue into a new mutable result.
    ArrayList<Object> out = null;
    try {
      Iterator<?> iterator = items.iterator();
      int index = 0;
      while (iterator.hasNext()) {
        Object item = iterator.next();
        if (isAdUnit(
            item,
            mediaPredicateName,
            mediaAccessorName,
            threadAccessorName,
            threadItemsAccessorName,
            itemMediaAccessorName)) {
          if (out == null) {
            out = new ArrayList<>(items.size() - 1);
            Iterator<?> prefixIterator = items.iterator();
            for (int prefix = 0; prefix < index; prefix++) {
              out.add(prefixIterator.next());
            }
          }
        } else if (out != null) {
          out.add(item);
        }
        index++;
      }
    } catch (Throwable ignored) {
      // Any failure -> return the original untouched.
      return items;
    }
    return out == null ? items : out;
  }

  /**
   * Checks a unit through the no-arg accessors resolved for its APK.
   *
   * @param item The feed unit object to inspect.
   * @return True if the item is determined to be an ad, false otherwise or on reflection failure.
   */
  private static boolean isAdUnit(
      Object item,
      String mediaPredicateName,
      String mediaAccessorName,
      String threadAccessorName,
      String threadItemsAccessorName,
      String itemMediaAccessorName) {
    try {
      // Some ad-unit wrappers expose the same ad predicate directly; use the
      // predicate name discovered from this APK rather than version name tables.
      if (Boolean.TRUE.equals(call(item, mediaPredicateName))) {
        return true;
      }
      // Media-bearing feed unit: resolved media accessor -> resolved ad predicate.
      Object media = call(item, mediaAccessorName);
      if (media != null && callMediaPredicate(media, mediaPredicateName)) {
        return true;
      }
      // Thread-carried ad: resolved thread -> items -> item media -> ad predicate.
      Object thread = call(item, threadAccessorName);
      if (thread != null) {
        Object threadItems;
        threadItems = call(thread, threadItemsAccessorName);
        if (threadItems instanceof List) {
          for (Object ti : (List<?>) threadItems) {
            if (ti != null
                && (Boolean.TRUE.equals(call(ti, mediaPredicateName))
                    || callMediaPredicate(call(ti, itemMediaAccessorName), mediaPredicateName))) {
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
   * Invokes the resolved no-arg predicate and returns true for Boolean.TRUE.
   *
   * @param o The object to inspect.
   * @return True if the ad predicate returns true, false otherwise or on reflection failure.
   */
  private static boolean callMediaPredicate(Object o, String resolvedName) {
    if (o == null) return false;
    return Boolean.TRUE.equals(callAny(o, resolvedName));
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
