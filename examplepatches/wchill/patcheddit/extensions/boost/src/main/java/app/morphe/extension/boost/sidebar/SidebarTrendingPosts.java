/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.extension.boost.sidebar;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.TextView;

import app.morphe.extension.boost.navigation.BoostNativeListings;
import app.morphe.extension.boost.navigation.BoostNativeNavigation;

import com.rubenmayayo.reddit.models.reddit.SubmissionModel;

import net.dean.jraw.models.Submission;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Restores Boost's sidebar "Trending today" data path when Reddit's legacy
 * trending-search endpoint returns no renderable rows.
 *
 * The native loader still runs first. Only an empty/non-renderable native
 * result falls back to public HOT listings, converted into Boost's own
 * TrendingSearch and SubmissionModel objects through typed 1.14.1 bindings.
 */
public final class SidebarTrendingPosts {
    private static final String TAG = "MorpheSidebarTrending";
    private static final String MARKER = "MORPHE_SIDEBAR_TRENDING_POSTS_V3";

    private static final Object LOCK = new Object();
    private static final int LISTING_LIMIT = 75;
    private static final int FINAL_LIMIT = 12;
    private static final long CACHE_MAX_AGE_MS = 30L * 60L * 1000L;

    private static List<Object> cachedFallback = Collections.emptyList();
    private static long cachedFallbackAtMs;

    /*
     * Identity is deliberate: native and fallback rows use the same Boost
     * model class and may compare equal by content. Only rows constructed by
     * this extension should receive fallback-specific rendering policy.
     */
    private static final Set<Object> fallbackRows =
        Collections.newSetFromMap(new IdentityHashMap<Object, Boolean>());

    /*
     * Bind parameters are safe at method entry, but Boost may reuse p1 later.
     * Record the row classification at entry and apply it at every return.
     * Weak keys avoid retaining recycled holders after the adapter releases them.
     */
    private static final Map<Object, Boolean> holderFallbackState =
        new WeakHashMap<Object, Boolean>();

    private SidebarTrendingPosts() {
    }

    /** Called from Boost's TrendingTodayAsyncLoader background method. */
    public static List load() {
        List nativeRows = loadNativeRows();
        List<Object> renderableNative = filterRenderableRows(nativeRows);
        if (!renderableNative.isEmpty()) {
            log("source=native rows=" + renderableNative.size() + " marker=" + MARKER);
            return renderableNative;
        }

        synchronized (LOCK) {
            long now = System.currentTimeMillis();
            if (!cachedFallback.isEmpty()
                && now >= cachedFallbackAtMs
                && now - cachedFallbackAtMs < CACHE_MAX_AGE_MS) {
                log("source=fallback_cache rows=" + cachedFallback.size()
                    + " ageMs=" + (now - cachedFallbackAtMs)
                    + " marker=" + MARKER);
                return new ArrayList<Object>(cachedFallback);
            }

            try {
                List<Object> fallback = fetchFallbackRows();
                if (!fallback.isEmpty()) {
                    cachedFallback = new ArrayList<Object>(fallback);
                    cachedFallbackAtMs = now;
                    log("source=popular_hot rows=" + fallback.size() + " marker=" + MARKER);
                    return fallback;
                }
                log("source=popular_hot rows=0 marker=" + MARKER);
            } catch (Throwable t) {
                logFailure("fallback_failed", t);
            }
        }

        return renderableNative;
    }

    /**
     * Removes the meaningless global "Limit to Community" control. When a
     * concrete subreddit context can be resolved, it is retained as
     * "Limit to r/<name>" and preloaded without enabling the checkbox.
     */
    public static void configureSearchOptions(Object fragment, View root) {
        if (root == null) {
            return;
        }

        try {
            String community = resolveCurrentCommunity(
                BoostNativeListings.fragmentActivity(fragment));
            View limitGroup = findView(root, "limit_group");

            if (limitGroup == null) {
                log("limit_control=missing marker=" + MARKER);
                return;
            }

            if (community == null) {
                Object parent = limitGroup.getParent();
                if (parent instanceof ViewGroup) {
                    ((ViewGroup) parent).removeView(limitGroup);
                    log("limit_control=removed context=global marker=" + MARKER);
                } else {
                    limitGroup.setVisibility(View.GONE);
                    log("limit_control=hidden context=global marker=" + MARKER);
                }
                return;
            }

            View checkboxView = findView(root, "filter_limit");
            if (checkboxView instanceof TextView) {
                ((TextView) checkboxView).setText("Limit to r/" + community);
            }

            View valueView = findView(root, "limit_view");
            if (valueView instanceof TextView) {
                ((TextView) valueView).setText(community);
            }

            if (checkboxView instanceof CompoundButton) {
                ((CompoundButton) checkboxView).setChecked(false);
            }

            log("limit_control=retained context=r/" + community + " marker=" + MARKER);
        } catch (Throwable t) {
            logFailure("limit_control_failed", t);
        }
    }

    /**
     * Records whether the row currently bound to this holder was constructed
     * by the Morphe fallback. This is called at bind entry while p1 still has
     * the declared TrendingSearch type.
     */
    public static void recordBoundRow(Object holder, Object row) {
        if (holder == null) {
            return;
        }

        synchronized (LOCK) {
            holderFallbackState.put(holder, Boolean.valueOf(fallbackRows.contains(row)));
        }
    }

    /**
     * Hides the secondary SubmissionModel title for Morphe fallback rows only.
     * Native Reddit trending rows keep Boost's original two-line presentation.
     * The explicit VISIBLE reset is required because RecyclerView holders are
     * reused after a fallback row has hidden the description view.
     */
    public static void applyBoundTextPolicy(Object holder) {
        if (holder == null) {
            return;
        }

        try {
            View descriptionView = findView(BoostNativeListings.holderView(holder), "item_description");
            if (!(descriptionView instanceof TextView)) {
                return;
            }

            boolean fallback;
            synchronized (LOCK) {
                fallback = Boolean.TRUE.equals(holderFallbackState.get(holder));
            }

            descriptionView.setVisibility(fallback ? View.GONE : View.VISIBLE);
        } catch (Throwable t) {
            logFailure("bound_text_policy_failed", t);
        }
    }

    /** Starts the sidebar load immediately instead of waiting for Boost's 8-second delayed refresh. */
    public static void triggerLoad(Object fragment) {
        if (fragment == null) {
            return;
        }

        try {
            BoostNativeListings.reloadTrending(fragment);
            log("load_trigger=immediate marker=" + MARKER);
        } catch (Throwable t) {
            logFailure("load_trigger_failed", t);
        }
    }

    private static List loadNativeRows() {
        try {
            return BoostNativeListings.nativeTrendingRows();
        } catch (Throwable t) {
            logFailure("native_load_failed", t);
            return Collections.emptyList();
        }
    }

    private static List<Object> filterRenderableRows(List rows) {
        ArrayList<Object> result = new ArrayList<Object>();
        if (rows == null) {
            return result;
        }

        for (Object row : rows) {
            try {
                if (!BoostNativeListings.trendingSubmissions(row).isEmpty()) {
                    result.add(row);
                }
            } catch (Throwable error) {
                logFailure("native_row_invalid", error);
            }
        }
        return result;
    }

    private static List<Object> fetchFallbackRows() throws Exception {
        boolean includeNsfw = BoostNativeListings.includeNsfw();

        List<Submission> raw = BoostNativeListings.hotSubmissions("popular", LISTING_LIMIT);
        if (raw.isEmpty()) {
            raw = BoostNativeListings.hotSubmissions("all", LISTING_LIMIT);
        }

        ArrayList<Object> rows = new ArrayList<Object>();
        Set<String> seen = new HashSet<String>();

        for (int i = 0; i < raw.size() && rows.size() < FINAL_LIMIT; i++) {
            Submission submission = raw.get(i);
            if (submission == null || Boolean.TRUE.equals(submission.isStickied())) {
                continue;
            }
            if (BoostNativeListings.isPromoted(submission)) {
                continue;
            }
            if (!includeNsfw && Boolean.TRUE.equals(submission.isNsfw())) {
                continue;
            }

            String title = submission.getTitle();
            if (title == null) {
                continue;
            }
            title = normalizeTitle(title);
            if (title.length() == 0) {
                continue;
            }

            String dedupe = firstNonEmpty(
                submission.getFullName(),
                submission.getId(),
                title.toLowerCase(Locale.US)
            );
            if (dedupe == null || !seen.add(dedupe)) {
                continue;
            }

            SubmissionModel model = BoostNativeListings.submissionModel(submission);
            rows.add(BoostNativeListings.trendingRow(title, model));
        }

        if (!rows.isEmpty()) {
            // load() holds LOCK while this method runs.
            fallbackRows.clear();
            fallbackRows.addAll(rows);
        }

        return rows;
    }

    private static String resolveCurrentCommunity(android.app.Activity activity) {
        if (activity == null) {
            return null;
        }

        String value = BoostNativeNavigation.currentCommunity(activity);
        if (value == null) {
            return null;
        }
        String name = value.trim();
        while (name.startsWith("/")) {
            name = name.substring(1);
        }
        if (name.startsWith("r/")) {
            name = name.substring(2);
        }
        return name.length() == 0 || isGlobalSource(name) ? null : name;
    }

    private static boolean isGlobalSource(String value) {
        String name = value.toLowerCase(Locale.US).trim();

        // Boost uses this internal sentinel for Home/front-page context. It is
        // not a subreddit and must never be exposed as "Limit to r/...".
        if ("_load_front_page_this_is_not_a_subreddit".equals(name)
            || name.startsWith("_load_front_page")
            || name.contains("not_a_subreddit")) {
            return true;
        }

        return "all".equals(name)
            || "popular".equals(name)
            || "frontpage".equals(name)
            || "front_page".equals(name)
            || "home".equals(name)
            || "friends".equals(name)
            || "default".equals(name);
    }

    private static View findView(View root, String name) {
        try {
            int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
            return id == 0 ? null : root.findViewById(id);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String firstNonEmpty(String... values) {
        if (values == null) {
            return null;
        }
        for (String value : values) {
            if (value != null && value.trim().length() > 0) {
                return value.trim();
            }
        }
        return null;
    }

    private static String normalizeTitle(String value) {
        String title = value.replaceAll("\\s+", " ").trim();
        if (title.length() > 120) {
            title = title.substring(0, 117).trim() + "…";
        }
        return title;
    }

    private static void log(String message) {
        Log.i(TAG, message);
    }

    private static void logFailure(String message, Throwable throwable) {
        Log.w(TAG, message + " type=" + throwable.getClass().getName()
            + " message=" + String.valueOf(throwable.getMessage()));
    }
}
