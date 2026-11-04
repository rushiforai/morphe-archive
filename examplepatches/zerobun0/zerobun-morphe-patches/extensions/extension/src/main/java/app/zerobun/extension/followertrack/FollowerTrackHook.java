/*
 * Zerobun Morphe patches - GPLv3.
 *
 * Approach learned from Piko (https://github.com/crimera/piko, GPLv3): the follow-list
 * row binder and the User-model getters it resolves. This is an independent
 * implementation in its own package so it can be applied alongside Piko without
 * clashing.
 */

package app.zerobun.extension.followertrack;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Called at the end of the follow-list binder's bindView for every row you scroll past.
 * Collects {pk, username, full_name, profile_pic_url} and which list it came from, and
 * hands batches to {@link Uploader}. Makes no Instagram request of its own.
 *
 * <p>EVERY LIST HAS ITS OWN STATE. Instagram's follow screen loads the Followers and
 * Following tabs side by side, so rows for both are bound at the same moment. The first
 * version kept one "current list", and each bind for the other tab flipped it - which
 * started a new capture session every few rows (170 sessions from 182 uploads, about
 * three rows each, on 2026-11-03), so nothing ever accumulated enough to be verified.
 * Now each target+category keeps its own buffer, dedupe set and session, and the
 * progress indicator follows whichever list is actually on screen.
 */
@SuppressWarnings("unused")
public final class FollowerTrackHook {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long FLUSH_DEBOUNCE_MS = 2_500;
    /**
     * No row of THIS list bound for this long, then one does: it was left and re-opened.
     * Silence rather than position - bindView's `position` is not the row's index in the
     * whole list, and treating a small one as "the top" restarted captures constantly.
     */
    private static final long REENTRY_GAP_MS = 20_000;

    private static final Object LOCK = new Object();
    private static final Map<String, ListState> LISTS = new HashMap<>();
    /** The list whose rows are on screen now; what the indicator and auto-scroll follow. */
    private static String activeKey = "";
    private static Context appContext;
    private static boolean loggedReady;
    private static boolean hudAttached;
    private static int sessionCounter = 0;

    private static final Runnable FLUSH = FollowerTrackHook::flush;

    /** Everything one list needs, so two lists never share a buffer or a session. */
    private static final class ListState {
        final String target;
        final String category;
        String session;
        /** The handle the screen showed for this session; read once per session. */
        String ownerHint = "";
        JSONArray buffer = new JSONArray();
        final Set<String> seen = new HashSet<>();
        long lastBindAt = 0;
        /** Diagnostics for this session; see add(). */
        int binds = 0;
        int noPk = 0;
        int unreadable = 0;
        int adapter = 0;

        ListState(String target, String category) {
            this.target = target;
            this.category = category;
            newSession();
        }

        void newSession() {
            session = "s" + Long.toString(System.currentTimeMillis(), 36)
                    + Integer.toString(++sessionCounter, 36);
            ownerHint = "";
            seen.clear();
            buffer = new JSONArray();
            binds = 0;
            noPk = 0;
            unreadable = 0;
            adapter = 0;
        }
    }

    /** Rows plus the identity of the session they belong to, ready to upload. */
    private static final class Batch {
        final JSONArray users;
        final String target;
        final String category;
        final JSONObject meta;

        Batch(JSONArray users, String target, String category, JSONObject meta) {
            this.users = users;
            this.target = target;
            this.category = category;
            this.meta = meta;
        }
    }

    private FollowerTrackHook() {}

    /** Same parameters as bindView(int, View, Object, Object), with the binder first. */
    public static void onRowBound(Object binder, int position, View row, Object user) {
        try {
            if (row != null && appContext == null) {
                appContext = row.getContext().getApplicationContext();
            }
            if (!loggedReady) {
                loggedReady = true;
                Log.i(Uploader.TAG, "follower tracking active");
            }

            String target = "";
            String category = "followers";
            // Best effort: if this build's list-context fields were not resolved, rows are
            // still collected and the server attributes them by username.
            try {
                Object listType = Reflect.field(binder, Config.get("f.listType"));
                String raw = Reflect.str(Reflect.field(listType, Config.get("f.listTypeValue")));
                // The tracker accepts exactly "followers" or "followings".
                category = raw.toLowerCase().contains("following") ? "followings" : "followers";
                Object listConfig = Reflect.field(binder, Config.get("f.listConfig"));
                Object listData = Reflect.field(listConfig, Config.get("f.followListData"));
                target = Reflect.str(Reflect.field(listData, Config.get("f.targetId")));
                if (target.isEmpty()) {
                    Object session = Reflect.field(binder, Config.get("f.session"));
                    target = Reflect.str(Reflect.call(session, "getUserId"));
                }
            } catch (Throwable ignored) {
            }

            // A row whose id cannot be read is NOT discarded. It used to be
            // (`if (pk.isEmpty()) return;`), silently - so if some rows carry a
            // different kind of user object, they vanished without a trace and the
            // capture topped out at a fixed fraction of the list (both of one
            // account's lists stopped at ~75% on 2026-11-03). The username alone is
            // enough for the store; only a row with neither is truly unreadable, and
            // that is counted and reported rather than hidden.
            String pk = "";
            try {
                pk = Reflect.str(Reflect.call(user, Config.get("m.id")));
            } catch (Throwable ignored) {
            }
            String username = Reflect.str(safeCall(user, "m.username"));

            JSONObject entry = null;
            String dedupe = null;
            if (!pk.isEmpty() || !username.isEmpty()) {
                entry = new JSONObject();
                if (!pk.isEmpty()) entry.put("pk", pk);
                entry.put("username", username);
                entry.put("full_name", Reflect.str(safeCall(user, "m.fullName")));
                Object picInfo = safeCall(user, "m.picInfo");
                entry.put("profile_pic_url", picInfo == null ? ""
                        : Reflect.str(safeCallNamed(picInfo, "getUrl")));
                dedupe = pk.isEmpty() ? "n:" + username : pk;
            }

            add(target, category, dedupe, entry, pk.isEmpty(), row);
        } catch (Throwable t) {
            // Never break Instagram's own list.
            Log.w(Uploader.TAG, "row capture failed", t);
        }
    }

    /** Whether any part of this row is actually on screen, as opposed to pre-bound. */
    private static boolean onScreen(View row) {
        try {
            return row != null && row.getGlobalVisibleRect(new Rect());
        } catch (Throwable t) {
            return true;
        }
    }

    /**
     * Brings up the HUD, and auto-scroll if it was switched on.
     *
     * Wrapped whole: an indicator that cannot be drawn must never stop a capture, which
     * is the only thing here that matters.
     */
    private static void showIndicator(View row) {
        if (hudAttached || row == null) return;
        try {
            Activity activity = activityOf(row.getContext());
            if (activity == null) return;
            hudAttached = true;
            CaptureHud.attach(activity);
            if ("true".equalsIgnoreCase(String.valueOf(Config.get("cfg.autoscroll")))) {
                AutoScroll.start(activity);
            }
        } catch (Throwable t) {
            Log.w(Uploader.TAG, "indicator unavailable", t);
        }
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static Object safeCall(Object obj, String key) {
        return safeCallNamed(obj, Config.get(key));
    }

    private static Object safeCallNamed(Object obj, String name) {
        try {
            return Reflect.call(obj, name);
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * The metadata every batch of one session carries. The owner hint rides with the
     * state that read it, so a batch can never be sent with another list's hint - which
     * would bind one list's owner id to a different list's name.
     */
    private static JSONObject meta(ListState st) {
        JSONObject extra = new JSONObject();
        try {
            if (st.session != null && !st.session.isEmpty()) {
                extra.put("session", st.session);
                if (!st.ownerHint.isEmpty()) extra.put("owner_hint", st.ownerHint);
                JSONObject diag = new JSONObject();
                diag.put("binds", st.binds);
                diag.put("unique", st.seen.size());
                diag.put("no_pk", st.noPk);
                diag.put("unreadable", st.unreadable);
                diag.put("adapter", st.adapter);
                extra.put("diag", diag);
            }
        } catch (Throwable ignored) {
        }
        return extra;
    }

    /** Empties a list's buffer into a batch. Caller holds LOCK. Null when empty. */
    private static Batch take(ListState st) {
        if (st.buffer.length() == 0) return null;
        Batch batch = new Batch(st.buffer, st.target, st.category, meta(st));
        st.buffer = new JSONArray();
        return batch;
    }

    private static void send(Batch batch) {
        if (batch != null && appContext != null) {
            Uploader.send(appContext, batch.users, batch.target, batch.category, batch.meta);
        }
    }

    private static void add(String target, String category, String pk,
                            JSONObject entry, boolean noPk, View row) {
        int batchSize = Math.max(1, Math.min(200, Config.getInt("cfg.batch", 50)));
        String key = target + "|" + category;
        boolean visible = onScreen(row);
        Batch carried = null;
        Batch full = null;
        boolean fresh = false;
        boolean becameActive = false;
        int total;
        int have;
        synchronized (LOCK) {
            long now = System.currentTimeMillis();
            ListState st = LISTS.get(key);
            if (st == null) {
                st = new ListState(target, category);
                LISTS.put(key, st);
                fresh = true;
            } else if (st.seen.size() > 2 && now - st.lastBindAt > REENTRY_GAP_MS) {
                // Left and came back. Send what is left of the old pass, then start a
                // new one: the dedupe set still holds everyone from last time, so
                // without this a re-opened list would capture and send nothing.
                carried = take(st);
                st.newSession();
                fresh = true;
            }
            st.lastBindAt = now;
            if (fresh) {
                try {
                    String read = row == null ? null : ListInspector.listOwner(row.getRootView());
                    if (read != null) st.ownerHint = read.trim().toLowerCase();
                } catch (Throwable ignored) {
                    // A hint is a convenience; without it the server resolves the owner
                    // some other way.
                }
            }
            // What this list actually did, so a shortfall can be explained from the
            // server's side instead of guessed at: how many binds happened, how many
            // had no readable id, how many had nothing readable at all.
            st.binds++;
            if (entry == null) {
                st.unreadable++;
            } else {
                if (noPk) st.noPk++;
                if (st.seen.add(pk)) st.buffer.put(entry);
            }
            if (st.binds % 20 == 0 && row != null) {
                try {
                    st.adapter = ListInspector.adapterCount(row.getRootView(), 0);
                } catch (Throwable ignored) {
                }
            }
            total = st.seen.size();
            if (visible && !key.equals(activeKey)) {
                activeKey = key;
                becameActive = true;
            }
            if (st.buffer.length() >= batchSize) full = take(st);
            have = total;
        }

        // The indicator and auto-scroll follow the list that is on screen. A list that
        // is merely pre-bound in the next tab collects quietly and changes neither.
        if (becameActive || (fresh && key.equals(activeKey))) {
            AutoScroll.stop("the list changed");
            Status.reset();
            Status.beginCapture(target, category, ListInspector.expectedCount(row, category));
            hudAttached = false;
        }
        if (key.equals(activeKey) && visible) {
            Status.rowsCaptured(have);
            showIndicator(row);
        }

        send(carried);
        send(full);
        MAIN.removeCallbacks(FLUSH);
        MAIN.postDelayed(FLUSH, FLUSH_DEBOUNCE_MS);
    }

    private static void flush() {
        List<Batch> out = new ArrayList<>();
        synchronized (LOCK) {
            for (ListState st : LISTS.values()) {
                Batch batch = take(st);
                if (batch != null) out.add(batch);
            }
        }
        for (Batch batch : out) send(batch);
    }

    /**
     * Closes the capture: the list on screen reached its end.
     *
     * Sends any remaining rows, then a final batch marked complete, which is what
     * permits the server to diff the list as a whole rather than only adding to it.
     *
     * The claim is deliberately conditional. `Status.serverWouldAccept()` applies the
     * same 90% ratio the server uses, so if the scroll ended short of the profile's own
     * count this reports the rows WITHOUT claiming completeness - the server then treats
     * it as partial, which is exactly right, and the indicator says the list still needs
     * doing. Claiming it anyway is how a broken scroll turns into hundreds of false
     * departures.
     */
    public static void onListEnded() {
        flush();
        ListState st;
        JSONObject extra;
        String target, category;
        synchronized (LOCK) {
            st = LISTS.get(activeKey);
            if (st == null) return;
            target = st.target;
            category = st.category;
            extra = meta(st);
        }
        if (appContext == null || !extra.has("session")) return;
        if (!Status.serverWouldAccept()) {
            Log.i(Uploader.TAG, "list ended but only " + Status.getCaptured() + " of "
                    + Status.getExpected() + " captured - not claiming complete");
            return;
        }
        try {
            extra.put("complete", true);
            if (Status.getExpected() > 0) extra.put("expected_count", Status.getExpected());
        } catch (Throwable ignored) {
        }
        Uploader.send(appContext, new JSONArray(), target, category, extra);
    }

    /** Lets the profile hook tell the capture how long the list should be. */
    public static void onProfileCount(String target, String category, int count) {
        if (count > 0) Status.beginCapture(target, category, count);
    }
}
