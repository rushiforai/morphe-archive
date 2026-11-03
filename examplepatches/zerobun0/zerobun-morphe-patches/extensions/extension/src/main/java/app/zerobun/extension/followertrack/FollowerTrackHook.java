/*
 * Zerobun Morphe patches - GPLv3.
 *
 * Approach learned from Piko (https://github.com/crimera/piko, GPLv3): the follow-list
 * row binder and the User-model getters it resolves. This is an independent
 * implementation in its own package so it can be applied alongside Piko without
 * clashing.
 */

package app.zerobun.extension.followertrack;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashSet;
import java.util.Set;

/**
 * Called at the end of the follow-list binder's bindView for every row you scroll past.
 * Collects {pk, username, full_name, profile_pic_url} and which list it came from, and
 * hands batches to {@link Uploader}. Makes no Instagram request of its own.
 */
@SuppressWarnings("unused")
public final class FollowerTrackHook {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long FLUSH_DEBOUNCE_MS = 2_500;

    private static final Object LOCK = new Object();
    private static String currentKey = "";
    private static String currentTarget = "";
    private static String currentCategory = "followers";
    private static JSONArray buffer = new JSONArray();
    private static final Set<String> seen = new HashSet<>();
    private static Context appContext;
    private static boolean loggedReady;

    private static final Runnable FLUSH = FollowerTrackHook::flush;

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

            String pk = Reflect.str(Reflect.call(user, Config.get("m.id")));
            if (pk.isEmpty()) return;

            JSONObject entry = new JSONObject();
            entry.put("pk", pk);
            entry.put("username", Reflect.str(safeCall(user, "m.username")));
            entry.put("full_name", Reflect.str(safeCall(user, "m.fullName")));
            Object picInfo = safeCall(user, "m.picInfo");
            entry.put("profile_pic_url", picInfo == null ? "" : Reflect.str(safeCallNamed(picInfo, "getUrl")));

            add(target, category, pk, entry);
        } catch (Throwable t) {
            // Never break Instagram's own list.
            Log.w(Uploader.TAG, "row capture failed", t);
        }
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

    private static void add(String target, String category, String pk, JSONObject entry) {
        int batchSize = Math.max(1, Math.min(200, Config.getInt("cfg.batch", 50)));
        JSONArray toSend = null;
        String sendTarget = null, sendCategory = null;
        synchronized (LOCK) {
            String key = target + "|" + category;
            if (!key.equals(currentKey)) {
                if (buffer.length() > 0) {
                    toSend = buffer;
                    sendTarget = currentTarget;
                    sendCategory = currentCategory;
                }
                currentKey = key;
                currentTarget = target;
                currentCategory = category;
                buffer = new JSONArray();
                seen.clear();
            }
            if (seen.add(pk)) buffer.put(entry);
            if (buffer.length() >= batchSize) {
                if (toSend != null && appContext != null) {
                    Uploader.send(appContext, toSend, sendTarget, sendCategory);
                }
                toSend = buffer;
                sendTarget = currentTarget;
                sendCategory = currentCategory;
                buffer = new JSONArray();
            }
        }
        if (toSend != null && appContext != null) {
            Uploader.send(appContext, toSend, sendTarget, sendCategory);
        }
        MAIN.removeCallbacks(FLUSH);
        MAIN.postDelayed(FLUSH, FLUSH_DEBOUNCE_MS);
    }

    private static void flush() {
        JSONArray toSend;
        String target, category;
        synchronized (LOCK) {
            if (buffer.length() == 0) return;
            toSend = buffer;
            target = currentTarget;
            category = currentCategory;
            buffer = new JSONArray();
        }
        if (appContext != null) Uploader.send(appContext, toSend, target, category);
    }
}
