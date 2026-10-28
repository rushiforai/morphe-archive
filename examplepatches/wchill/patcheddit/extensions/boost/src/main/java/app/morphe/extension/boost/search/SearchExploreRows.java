/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.extension.boost.search;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Looper;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import app.morphe.extension.boost.navigation.BoostNativeListings;

import com.rubenmayayo.reddit.models.reddit.SubredditModel;

import net.dean.jraw.models.Submission;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

public final class SearchExploreRows {
    private static final String TAG = "MorpheSearchExplore";
    private static final String MARKER = "MORPHE_SEARCH_EXPLORE_ISSUE61_DEDUP_V2_IDENTITY_GATE";
    private static final String SECTION_STABILITY_MARKER =
            "MORPHE_SEARCH_EXPLORE_ISSUE95_STABLE_ANCHOR_V1";

    private static final String PREFERENCE_MARKER =
            "MORPHE_SEARCH_ACTIVE_SUBREDDITS_PREFERENCE_ISSUE201_V1";
    // Settings V5 > Search & filters > Suggestions (default on).
    private static final String PREFERENCE_KEY =
            "morphe_boost_search_show_active_subreddits";

    private static final String CACHE_PREFS = "morphe_search_active_subreddits_v5l";
    private static final String CACHE_VALUE = "active_rows";
    private static final String CACHE_TS = "active_rows_ts";
    private static final long CACHE_MAX_AGE_MS = 6L * 60L * 60L * 1000L;

    private static final int LISTING_LIMIT = 75;
    private static final int FINAL_LIMIT = 10;
    private static final Object LOCK = new Object();

    private static final SearchInsertedRowsTracker<Activity> INSERTED_ROWS = new SearchInsertedRowsTracker<>();
    private static List<Object> cachedRows;
    private static List<CacheEntry> cachedEntries;
    private static boolean inFlight;

    private SearchExploreRows() {
    }

    private static final class CacheEntry {
        String name;
        long count;
        String iconUrl;
        String color;
        String description;
        long activeScore;
        int posts;
        long postScore;
        long comments;
        long newestMs;
    }

    private static final class CacheLoad {
        List<CacheEntry> entries;
        long ageMs;
    }

    private static final class FetchResult {
        List<Object> rows = Collections.emptyList();
        List<CacheEntry> entries = Collections.emptyList();
    }

    private static final class CommunityStat {
        String name;
        int posts;
        long postScore;
        long comments;
        long newestMs;
        long activeScore;

        long sortScore() {
            return activeScore + (posts * 100000L) + Math.min(postScore, 250000L) + Math.min(comments * 4L, 100000L);
        }
    }

    private static boolean isActiveSubredditsEnabled(Activity activity) {
        try {
            return android.preference.PreferenceManager
                    .getDefaultSharedPreferences(activity)
                    .getBoolean(PREFERENCE_KEY, true);
        } catch (Throwable error) {
            Log.w(TAG, "active subreddits preference failed marker=" + PREFERENCE_MARKER, error);
            return true;
        }
    }

    public static void appendOrRefresh(Activity activity, ArrayList rows) {
        if (activity == null || rows == null) {
            return;
        }

        if (!isSearchTextEmpty(activity)) {
            return;
        }

        normalizeRedditSearchFilterLabels(activity);

        if (!isActiveSubredditsEnabled(activity)) {
            synchronized (LOCK) {
                removeInsertedLocked(activity, rows);
            }
            log("mode=disabled marker=" + PREFERENCE_MARKER);
            return;
        }

        boolean shouldFetch = false;

        synchronized (LOCK) {
            removeInsertedLocked(activity, rows);

            List<Object> instantRows = null;
            String instantMode = null;

            if (cachedRows != null && !cachedRows.isEmpty()) {
                instantRows = cachedRows;
                instantMode = "memory_cache";
            } else {
                CacheLoad cacheLoad = loadCache(activity);
                if (cacheLoad != null && cacheLoad.entries != null && !cacheLoad.entries.isEmpty()) {
                    List<Object> diskRows = buildRowsFromCache(cacheLoad.entries);
                    if (diskRows != null && !diskRows.isEmpty()) {
                        cachedEntries = cacheLoad.entries;
                        cachedRows = diskRows;
                        instantRows = diskRows;
                        instantMode = "disk_cache ageMs=" + cacheLoad.ageMs;
                    }
                }
            }

            if (instantRows != null && !instantRows.isEmpty()) {
                List<Object> inserted = new ArrayList<Object>();
                inserted.add(makeHeader("Active subreddits"));
                inserted.addAll(instantRows);
                insertOwnedLocked(activity, rows, inserted);
                log("mode=" + instantMode + " rows=" + instantRows.size() + " CACHE_HIT=true");

                if (!inFlight) {
                    inFlight = true;
                    shouldFetch = true;
                }
            } else {
                List<Object> inserted = new ArrayList<Object>();
                inserted.add(makeHeader("Loading active subreddits"));
                insertOwnedLocked(activity, rows, inserted);
                log("mode=loading_active CACHE_HIT=false");

                if (!inFlight) {
                    inFlight = true;
                    shouldFetch = true;
                }
            }
        }

        if (shouldFetch) {
            startFetch(activity, rows);
        }
    }

    private static void startFetch(final Activity activity, final ArrayList rows) {
        Thread worker = new Thread(new Runnable() {
            @Override
            public void run() {
                FetchResult result = new FetchResult();
                Throwable failure = null;

                try {
                    result = fetchActiveRows();
                    log("fetch_done source=popular_hot_active rows=" + result.rows.size());
                } catch (Throwable t) {
                    failure = t;
                    logFailure("fetch_failed source=popular_hot_active", t);
                }

                final FetchResult finalResult = result;
                final Throwable finalFailure = failure;

                if (finalResult.entries != null && !finalResult.entries.isEmpty()) {
                    persistCache(activity, finalResult.entries);
                }

                synchronized (LOCK) {
                    cachedRows = finalResult.rows;
                    cachedEntries = finalResult.entries;
                    inFlight = false;
                }

                activity.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        if (!isSearchTextEmpty(activity)) {
                            log("refresh_skip_nonempty_query");
                            return;
                        }

                        if (!isActiveSubredditsEnabled(activity)) {
                            log("refresh_skip_disabled marker=" + PREFERENCE_MARKER);
                            return;
                        }

                        synchronized (LOCK) {
                            removeInsertedLocked(activity, rows);

                            List<Object> inserted = new ArrayList<Object>();
                            if (finalResult.rows != null && !finalResult.rows.isEmpty()) {
                                inserted.add(makeHeader("Active subreddits"));
                                inserted.addAll(finalResult.rows);
                                log("refresh=ui source=popular_hot_active rows=" + finalResult.rows.size());
                            } else if (finalFailure != null) {
                                log("refresh=ui empty_after_failure source=popular_hot_active");
                            } else {
                                log("refresh=ui empty_result source=popular_hot_active");
                            }

                            if (!inserted.isEmpty()) {
                                insertOwnedLocked(activity, rows, inserted);
                            }
                        }

                        notifyAdapter(activity);
                    }
                });
            }
        }, "morphe-search-active-v5k");

        worker.setDaemon(true);
        worker.start();
    }

    private static FetchResult fetchActiveRows() throws Exception {
        long startMs = System.currentTimeMillis();

        List<Submission> submissions = fetchPopularHotSubmissions();
        ArrayList<CommunityStat> ranked = rankCommunitiesFromSubmissions(submissions);

        FetchResult result = new FetchResult();
        if (ranked.isEmpty()) {
            log("active_rank empty durationMs=" + (System.currentTimeMillis() - startMs));
            return result;
        }

        int max = Math.min(FINAL_LIMIT, ranked.size());
        ArrayList<CommunityStat> selected = new ArrayList<CommunityStat>();
        for (int i = 0; i < max; i++) {
            selected.add(ranked.get(i));
        }

        List<Object> hydrated = hydrateAboutModels(selected);
        ArrayList<Object> rows = new ArrayList<Object>();
        ArrayList<CacheEntry> entries = new ArrayList<CacheEntry>();

        for (int i = 0; i < selected.size(); i++) {
            CommunityStat stat = selected.get(i);
            Object model = i < hydrated.size() ? hydrated.get(i) : null;

            if (model == null) {
                log("skip=no_about_model name=" + stat.name);
                continue;
            }

            long count = extractSubscriberCount(model);
            if (count <= 0L) {
                log("skip=no_subscriber_count name=" + stat.name);
                continue;
            }

            String iconUrl = extractIconUrl(model);
            String color = extractColor(model);
            String description = extractDescription(model);

            applySubscriberCount(model, count);
            applySubscriptionVisuals(model, iconUrl, color);
            applyDescription(model, description);

            Object row = makeSubredditRow(stat.name, model);
            if (row == null) {
                continue;
            }

            rows.add(row);

            CacheEntry entry = new CacheEntry();
            entry.name = stat.name;
            entry.count = count;
            entry.iconUrl = iconUrl;
            entry.color = color;
            entry.description = description;
            entry.activeScore = stat.sortScore();
            entry.posts = stat.posts;
            entry.postScore = stat.postScore;
            entry.comments = stat.comments;
            entry.newestMs = stat.newestMs;
            entries.add(entry);

            log("row=name=" + stat.name
                + " count=" + count
                + " posts=" + stat.posts
                + " postScore=" + stat.postScore
                + " comments=" + stat.comments
                + " activeScore=" + stat.sortScore()
                + " iconField=" + hasHttp(iconUrl)
                + " icon=" + hasLikelyIcon(model)
                + " color=" + hasColor(color)
                + " source=popular_hot");
        }

        result.rows = rows;
        result.entries = entries;

        log("fetch_durationMs=" + (System.currentTimeMillis() - startMs));
        return result;
    }

    private static List<Submission> fetchPopularHotSubmissions() {
        long startMs = System.currentTimeMillis();
        List<Submission> items = BoostNativeListings.hotSubmissions("popular", LISTING_LIMIT);
        log("source=popular_hot submissions=" + items.size() + " durationMs=" + (System.currentTimeMillis() - startMs));
        return items;
    }

    private static ArrayList<CommunityStat> rankCommunitiesFromSubmissions(List<Submission> submissions) {
        HashMap<String, CommunityStat> stats = new HashMap<String, CommunityStat>();

        if (submissions == null) {
            return new ArrayList<CommunityStat>();
        }

        for (int i = 0; i < submissions.size(); i++) {
            Submission item = submissions.get(i);
            String subreddit = normalizeName(item.getSubredditName());
            Integer score = item.getScore();
            Integer commentCount = item.getCommentCount();
            long postScore = score == null ? 0L : score.longValue();
            long comments = commentCount == null ? 0L : commentCount.longValue();
            java.util.Date created = item.getCreated();
            long createdMs = created == null ? 0L : created.getTime();
            boolean stickied = Boolean.TRUE.equals(item.isStickied());
            boolean over18 = Boolean.TRUE.equals(item.isNsfw());

            if (subreddit == null || subreddit.length() == 0 || stickied || over18) {
                continue;
            }

            CommunityStat stat = stats.get(subreddit);
            if (stat == null) {
                stat = new CommunityStat();
                stat.name = subreddit;
                stats.put(subreddit, stat);
            }

            long positionBoost = Math.max(0L, 100000L - (i * 1200L));
            long activityBoost = Math.min(Math.max(0L, postScore), 100000L) + Math.min(Math.max(0L, comments) * 4L, 100000L);

            stat.posts++;
            stat.postScore += Math.max(0L, postScore);
            stat.comments += Math.max(0L, comments);
            stat.newestMs = Math.max(stat.newestMs, createdMs);
            stat.activeScore += positionBoost + activityBoost;
        }

        ArrayList<CommunityStat> ranked = new ArrayList<CommunityStat>(stats.values());
        Collections.sort(ranked, new Comparator<CommunityStat>() {
            @Override
            public int compare(CommunityStat a, CommunityStat b) {
                long diff = b.sortScore() - a.sortScore();
                if (diff > 0L) return 1;
                if (diff < 0L) return -1;
                return a.name.compareToIgnoreCase(b.name);
            }
        });

        StringBuilder top = new StringBuilder();
        int max = Math.min(FINAL_LIMIT, ranked.size());
        for (int i = 0; i < max; i++) {
            CommunityStat stat = ranked.get(i);
            if (top.length() > 0) {
                top.append(",");
            }
            top.append(stat.name)
                .append(":posts=").append(stat.posts)
                .append(":score=").append(stat.postScore)
                .append(":comments=").append(stat.comments);
        }

        log("active_rank source=popular_hot submissions=" + submissions.size() + " communities=" + ranked.size() + " top=" + top.toString());
        return ranked;
    }

    private static List<Object> hydrateAboutModels(final List<CommunityStat> selected) {
        if (selected == null || selected.isEmpty()) {
            return Collections.emptyList();
        }

        ExecutorService executor = Executors.newFixedThreadPool(Math.min(4, selected.size()));
        ArrayList<Callable<Object>> tasks = new ArrayList<Callable<Object>>();

        for (int i = 0; i < selected.size(); i++) {
            final String name = selected.get(i).name;
            tasks.add(new Callable<Object>() {
                @Override
                public Object call() throws Exception {
                    return hydrateAboutSubredditModel(name);
                }
            });
        }

        long aboutStartMs = System.currentTimeMillis();
        List<Future<Object>> futures = Collections.emptyList();

        try {
            futures = executor.invokeAll(tasks, 1800L, TimeUnit.MILLISECONDS);
        } catch (Throwable t) {
            logFailure("about_parallel_failed", t);
        } finally {
            executor.shutdownNow();
        }

        ArrayList<Object> result = new ArrayList<Object>();
        for (int i = 0; i < selected.size(); i++) {
            Object model = null;
            String name = selected.get(i).name;

            try {
                if (i < futures.size()) {
                    Future<Object> future = futures.get(i);
                    if (!future.isCancelled()) {
                        model = future.get(1L, TimeUnit.MILLISECONDS);
                    } else {
                        log("hydrate=about_timeout name=" + name);
                    }
                }
            } catch (Throwable t) {
                logFailure("hydrate=about_failed name=" + name, t);
            }

            if (model != null) {
                log("hydrate=about name=" + name + " count=" + extractSubscriberCount(model) + " icon=" + hasLikelyIcon(model));
            }

            result.add(model);
        }

        log("about_parallel_done tasks=" + tasks.size() + " durationMs=" + (System.currentTimeMillis() - aboutStartMs));
        return result;
    }

    private static SubredditModel hydrateAboutSubredditModel(String name) {
        return BoostNativeListings.fetchSubreddit(name);
    }

    private static List<Object> buildRowsFromCache(List<CacheEntry> entries) {
        ArrayList<Object> rows = new ArrayList<Object>();
        if (entries == null) {
            return rows;
        }

        for (int i = 0; i < entries.size(); i++) {
            CacheEntry entry = entries.get(i);
            if (entry == null || entry.name == null || entry.name.length() == 0 || entry.count <= 0L) {
                continue;
            }

            try {
                Object model = makeCachedSubredditModel(entry);
                Object row = makeSubredditRow(entry.name, model);
                if (row != null) {
                    rows.add(row);
                    log("cache_row name=" + entry.name + " count=" + entry.count + " activeScore=" + entry.activeScore + " iconField=" + hasHttp(entry.iconUrl) + " icon=" + hasLikelyIcon(model));
                }
            } catch (Throwable t) {
                logFailure("cache_row_failed name=" + entry.name, t);
            }
        }

        return rows;
    }

    private static SubredditModel makeCachedSubredditModel(CacheEntry entry) {
        SubredditModel model = new SubredditModel(entry.name);

        applySubscriberCount(model, entry.count);
        applySubscriptionVisuals(model, entry.iconUrl, entry.color);
        applyDescription(model, entry.description);
        return model;
    }

    private static CacheLoad loadCache(Activity activity) {
        try {
            SharedPreferences prefs = activity.getSharedPreferences(CACHE_PREFS, 0);
            String raw = prefs.getString(CACHE_VALUE, null);
            long ts = prefs.getLong(CACHE_TS, 0L);

            if (raw == null || raw.length() == 0 || ts <= 0L) {
                log("cache=miss reason=empty");
                return null;
            }

            long ageMs = System.currentTimeMillis() - ts;
            if (ageMs < 0L || ageMs > CACHE_MAX_AGE_MS) {
                log("cache=miss reason=expired ageMs=" + ageMs);
                return null;
            }

            List<CacheEntry> entries = decodeEntries(raw);
            if (entries.isEmpty()) {
                log("cache=miss reason=decode_empty");
                return null;
            }

            CacheLoad load = new CacheLoad();
            load.entries = entries;
            load.ageMs = ageMs;
            log("cache=load rows=" + entries.size() + " ageMs=" + ageMs);
            return load;
        } catch (Throwable t) {
            logFailure("cache=load_failed", t);
            return null;
        }
    }

    private static void persistCache(Activity activity, List<CacheEntry> entries) {
        if (activity == null || entries == null || entries.isEmpty()) {
            return;
        }

        try {
            String encoded = encodeEntries(entries);
            activity.getSharedPreferences(CACHE_PREFS, 0)
                .edit()
                .putString(CACHE_VALUE, encoded)
                .putLong(CACHE_TS, System.currentTimeMillis())
                .apply();

            log("cache=store rows=" + entries.size());
        } catch (Throwable t) {
            logFailure("cache=store_failed", t);
        }
    }

    private static String encodeEntries(List<CacheEntry> entries) {
        StringBuilder builder = new StringBuilder();

        int max = Math.min(entries.size(), FINAL_LIMIT);
        for (int i = 0; i < max; i++) {
            CacheEntry entry = entries.get(i);
            if (entry == null || entry.name == null || entry.name.length() == 0 || entry.count <= 0L) {
                continue;
            }

            if (builder.length() > 0) {
                builder.append('\n');
            }

            builder.append(enc(entry.name)).append('\t')
                .append(entry.count).append('\t')
                .append(enc(entry.iconUrl)).append('\t')
                .append(enc(entry.color)).append('\t')
                .append(enc(entry.description)).append('\t')
                .append(entry.activeScore).append('\t')
                .append(entry.posts).append('\t')
                .append(entry.postScore).append('\t')
                .append(entry.comments).append('\t')
                .append(entry.newestMs);
        }

        return builder.toString();
    }

    private static List<CacheEntry> decodeEntries(String raw) {
        ArrayList<CacheEntry> entries = new ArrayList<CacheEntry>();
        if (raw == null || raw.length() == 0) {
            return entries;
        }

        String[] lines = raw.split("\\n");
        for (int i = 0; i < lines.length && entries.size() < FINAL_LIMIT; i++) {
            String line = lines[i];
            if (line == null || line.length() == 0) {
                continue;
            }

            String[] parts = line.split("\\t", -1);
            if (parts.length < 2) {
                continue;
            }

            CacheEntry entry = new CacheEntry();
            entry.name = dec(parts[0]);
            entry.count = parseLong(parts[1]);
            entry.iconUrl = parts.length > 2 ? dec(parts[2]) : null;
            entry.color = parts.length > 3 ? dec(parts[3]) : null;
            entry.description = parts.length > 4 ? dec(parts[4]) : null;
            entry.activeScore = parts.length > 5 ? parseLong(parts[5]) : 0L;
            entry.posts = parts.length > 6 ? (int) parseLong(parts[6]) : 0;
            entry.postScore = parts.length > 7 ? parseLong(parts[7]) : 0L;
            entry.comments = parts.length > 8 ? parseLong(parts[8]) : 0L;
            entry.newestMs = parts.length > 9 ? parseLong(parts[9]) : 0L;

            if (entry.name != null && entry.name.length() > 0 && entry.count > 0L) {
                entries.add(entry);
            }
        }

        return entries;
    }

    private static String enc(String value) {
        if (value == null || value.length() == 0) {
            return "";
        }

        return Base64.encodeToString(value.getBytes(), Base64.NO_WRAP);
    }

    private static String dec(String value) {
        if (value == null || value.length() == 0) {
            return null;
        }

        try {
            return new String(Base64.decode(value, Base64.NO_WRAP));
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object makeSubredditRow(String name, Object subredditModel) {
        return BoostNativeListings.searchRow(name, (SubredditModel) subredditModel);
    }

    private static Object makeHeader(String title) {
        return BoostNativeListings.searchHeader(title);
    }

    private static String normalizeName(String raw) {
        if (raw == null) {
            return null;
        }

        String name = raw.trim();
        if (name.startsWith("/r/")) {
            name = name.substring(3);
        } else if (name.startsWith("r/")) {
            name = name.substring(2);
        }
        return name.length() == 0 ? null : name;
    }

    private static String extractIconUrl(Object item) {
        return item == null ? null : ((SubredditModel) item).iconUrl;
    }

    private static String extractColor(Object item) {
        return item == null ? null : ((SubredditModel) item).themeColor;
    }

    private static String extractDescription(Object item) {
        if (item == null) {
            return null;
        }

        SubredditModel model = (SubredditModel) item;
        return firstNonEmpty(model.publicDescription, model.description);
    }

    private static void applySubscriptionVisuals(Object model, String iconUrl, String color) {
        if (model == null) {
            return;
        }

        if (hasHttp(iconUrl)) {
            ((SubredditModel) model).iconUrl = iconUrl;
        }

        if (hasColor(color)) {
            ((SubredditModel) model).themeColor = color;
        }
    }

    private static void applyDescription(Object model, String description) {
        if (model == null || description == null || description.length() == 0) {
            return;
        }

        ((SubredditModel) model).description = description;
        ((SubredditModel) model).publicDescription = description;
    }

    private static long extractSubscriberCount(Object item) {
        return item == null ? 0L : ((SubredditModel) item).subscribers;
    }

    private static void applySubscriberCount(Object subredditModel, long count) {
        if (subredditModel == null || count <= 0L) {
            return;
        }

        ((SubredditModel) subredditModel).subscribers = count;
    }

    private static long parseLong(String value) {
        if (value == null || value.length() == 0) {
            return 0L;
        }

        try {
            return Long.parseLong(value);
        } catch (Throwable ignored) {
            return 0L;
        }
    }

    private static String firstNonEmpty(String... values) {
        if (values == null) {
            return null;
        }

        for (String value : values) {
            if (value != null && value.length() > 0) {
                return value;
            }
        }

        return null;
    }

    private static boolean hasLikelyIcon(Object item) {
        return hasHttp(extractIconUrl(item));
    }

    private static boolean hasHttp(String value) {
        return value != null && (value.startsWith("http://") || value.startsWith("https://"));
    }

    private static boolean hasColor(String value) {
        return value != null && value.length() >= 4 && value.startsWith("#");
    }

    private static String typeName(Object item) {
        return item == null ? "null" : item.getClass().getName();
    }

    private static void insertOwnedLocked(
            Activity activity,
            ArrayList rows,
            List<Object> inserted
    ) {
        int insertionIndex =
                INSERTED_ROWS.insertionIndex(activity, rows);

        rows.addAll(insertionIndex, inserted);
        INSERTED_ROWS.record(activity, inserted);

        log(SECTION_STABILITY_MARKER
                + " insertionIndex=" + insertionIndex
                + " inserted=" + inserted.size()
                + " total=" + rows.size());
    }

    private static void removeInsertedLocked(Activity activity, ArrayList rows) {
        SearchInsertedRowsTracker.RemovalStats removal = INSERTED_ROWS.remove(activity, rows);
        log("dedup_remove previous=" + removal.previous
            + " matchedBefore=" + removal.matchedBefore
            + " removedOwned=" + removal.removedOwned
            + " remainingOwned=" + removal.remainingOwned);
    }

    private static boolean isSearchTextEmpty(Activity activity) {
        try {
            Field field = findField(activity.getClass(), "searchEditText");
            if (field == null) {
                throw new NoSuchFieldException("SearchAbstractActivity.searchEditText");
            }
            field.setAccessible(true);
            Object view = field.get(activity);
            if (!(view instanceof TextView)) {
                throw new IllegalStateException("Boost searchEditText is not initialized");
            }
            CharSequence text = ((TextView) view).getText();
            return text == null || text.length() == 0;
        } catch (Throwable error) {
            logFailure("query_inspection_failed", error);
            return false;
        }
    }

    private static void normalizeRedditSearchFilterLabels(Activity activity) {
        if (activity == null) {
            return;
        }

        try {
            int id = activity.getResources().getIdentifier("limit_view", "id", activity.getPackageName());
            if (id == 0) {
                log("filter_label=limit_view_missing_id");
                return;
            }

            View view = activity.findViewById(id);
            if (!(view instanceof TextView)) {
                log("filter_label=limit_view_not_text type=" + typeName(view));
                return;
            }

            TextView textView = (TextView) view;
            CharSequence text = textView.getText();
            CharSequence hint = textView.getHint();

            boolean changed = false;
            if (text != null && "Community".contentEquals(text)) {
                textView.setText("Subreddit");
                changed = true;
            }

            if (hint != null && "Community".contentEquals(hint)) {
                textView.setHint("Subreddit");
                changed = true;
            }

            log("filter_label=limit_view changed=" + changed + " text=" + textView.getText() + " hint=" + textView.getHint());
        } catch (Throwable t) {
            logFailure("filter_label=limit_view_failed", t);
        }
    }

    private static void notifyAdapter(Activity activity) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            return;
        }

        try {
            BoostNativeListings.notifySearchRows(activity);
        } catch (Throwable t) {
            logFailure("notify_failed", t);
        }
    }

    private static Field findField(Class<?> cls, String name) {
        Class<?> current = cls;
        while (current != null) {
            try {
                return current.getDeclaredField(name);
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        return null;
    }

    private static void log(String message) {
        Log.i(TAG, MARKER + " " + message);
    }

    private static void logFailure(String message, Throwable throwable) {
        Log.w(TAG, MARKER + " " + message + ": " + throwable.getClass().getSimpleName() + ": " + throwable.getMessage());
    }
}
