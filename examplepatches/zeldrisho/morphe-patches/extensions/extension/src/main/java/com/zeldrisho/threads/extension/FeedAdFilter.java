package com.zeldrisho.threads.extension;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Feed ad removal for Threads (issue #5).
 *
 * <p>The Threads main feed is assembled by merging fetched feed units
 * (LX/3oS wrappers around thread models or ad media) through
 * {@code BarcelonaFeedCache.A0F}. A sponsored post is distinguished from an
 * organic one ONLY by {@code com.instagram.feed.media.Media.DED()} (the app's
 * isAd predicate — confirmed by on-device probes: thousands of DED calls per
 * feed scroll, zero ad-specific construction hooks on the main feed path). The
 * previous "Hide ads" patch forced {@code DED() -> false}, which just stripped
 * the "Ad"/"Sponsored" chrome while leaving the ad post in the feed.
 *
 * <p>{@link #filterAds(List)} is called from the "Hide ads" bytecode patch at
 * the top of {@code BarcelonaFeedCache.A0F}; it returns the input list without
 * ad units, and the patch replaces the feed-list reference with the result, so
 * sponsored posts never reach the visible feed (gap-free, cache stays clean).
 *
 * <p>Everything is reflection wrapped in try/catch: any R8 rename mismatch
 * degrades to a no-op instead of crashing the host app (worst case an app
 * update briefly brings ads back rather than breaking the feed).
 */
public final class FeedAdFilter {

    /**
     * Private constructor to prevent instantiation of this utility class.
     */
    private FeedAdFilter() {
    }

    /**
     * Returns {@code items} minus ad units (same instance if nothing removed, so
     * immutable inputs are safe). Ad detection: direct {@code DED()} (X/1qQ ad
     * headers), else the unit's media {@code A05() -> Media.DED()}, else
     * thread-carried media ({@code A02() -> ThreadIntf.Ckh() -> ThreadItem.CDh()
     * -> Media.DED()}).
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
     * Checks whether a feed unit is an ad via reflection on DED(), A05(), A02(), Ckh(), and CDh().
     * @param item The feed unit object to inspect.
     * @return True if the item is determined to be an ad, false otherwise or on reflection failure.
     */
    private static boolean isAdUnit(Object item) {
        try {
            // 1) Direct DED() (X/1qQ ad headers carry their own DED flag).
            if (callDed(item)) {
                return true;
            }
            // 2) Media-bearing feed unit: LX/3oS.A05() -> Media; Media.DED() is the ad flag.
            Object media = call(item, "A05");
            if (media != null && callDed(media)) {
                return true;
            }
            // 3) Thread-carried ad: LX/3oS.A02() -> ThreadIntf; items (Ckh) -> ThreadItem
            //    (CDh) -> Media.DED().
            Object thread = call(item, "A02");
            if (thread != null) {
                Object threadItems = call(thread, "Ckh");
                if (threadItems instanceof List) {
                    for (Object ti : (List<?>) threadItems) {
                        if (ti != null && (callDed(ti) || callDed(call(ti, "CDh")))) {
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
     * Invokes DED() on an object via reflection and returns true if the result is Boolean.TRUE.
     * @param o The object to inspect.
     * @return True if o.DED() returns true, false otherwise or on reflection failure.
     */
    private static boolean callDed(Object o) {
        return o != null && Boolean.TRUE.equals(call(o, "DED"));
    }

    /**
     * Reflectively invokes a no-arg method on an object, returning null on any failure.
     * Only invokes methods that return boolean, Boolean, or non-primitive types.
     * @param o The object to call the method on.
     * @param name The method name.
     * @return The method's return value, or null if the method does not exist or reflection fails.
     */
    private static Object call(Object o, String name) {
        try {
            Method m = o.getClass().getMethod(name);
            if (m.getReturnType() == boolean.class || m.getReturnType() == Boolean.class
                    || !m.getReturnType().isPrimitive()) {
                return m.invoke(o);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }
}
