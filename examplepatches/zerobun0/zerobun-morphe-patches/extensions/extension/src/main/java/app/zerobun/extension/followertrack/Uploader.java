/*
 * Zerobun Morphe patches - GPLv3.
 */

package app.zerobun.extension.followertrack;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Posts captured rows to the tracker on one background thread, with an on-disk retry
 * queue so a batch captured offline is sent later instead of lost. Talks only to the
 * configured tracker URL - never to Instagram.
 */
final class Uploader {
    static final String TAG = "ZbFollowerTrack";

    private static final String PREFS = "zb_follower_track";
    private static final String QUEUE_KEY = "pending";
    private static final int MAX_QUEUED = 200;

    private static final ExecutorService IO = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "zb-follower-track");
        t.setDaemon(true);
        return t;
    });

    private Uploader() {}

    static void send(Context context, JSONArray users, String target, String category) {
        if (context == null || users == null || users.length() == 0) return;
        final Context app = context.getApplicationContext();
        final String body;
        try {
            JSONObject o = new JSONObject();
            o.put("target", target == null ? "" : target);
            o.put("category", category == null ? "followers" : category);
            o.put("users", users);
            o.put("captured_at", System.currentTimeMillis() / 1000L);
            o.put("source", "morphe-capture");
            body = o.toString();
        } catch (Exception e) {
            Log.w(TAG, "could not build payload", e);
            return;
        }
        IO.execute(() -> {
            flushQueue(app);
            if (!post(body)) enqueue(app, body);
        });
    }

    private static void flushQueue(Context app) {
        SharedPreferences prefs = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String raw = prefs.getString(QUEUE_KEY, null);
        if (raw == null) return;
        JSONArray left = new JSONArray();
        try {
            JSONArray queued = new JSONArray(raw);
            for (int i = 0; i < queued.length(); i++) {
                String batch = queued.getString(i);
                if (!post(batch)) left.put(batch);
            }
        } catch (Exception e) {
            Log.w(TAG, "queue flush failed", e);
            return;
        }
        prefs.edit().putString(QUEUE_KEY, left.length() == 0 ? null : left.toString()).apply();
    }

    private static void enqueue(Context app, String batch) {
        SharedPreferences prefs = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        try {
            JSONArray queued = new JSONArray(prefs.getString(QUEUE_KEY, "[]"));
            queued.put(batch);
            while (queued.length() > MAX_QUEUED) queued.remove(0);
            prefs.edit().putString(QUEUE_KEY, queued.toString()).apply();
        } catch (Exception e) {
            Log.w(TAG, "enqueue failed", e);
        }
    }

    /** One POST; true only on 2xx (or on 401/403, so a bad token is not retried forever). */
    private static boolean post(String json) {
        String url = Config.get("cfg.url");
        String token = Config.get("cfg.token");
        if (url == null || !url.startsWith("https://")) {
            Log.w(TAG, "tracker URL not configured");
            return false;
        }
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setRequestMethod("POST");
            conn.setConnectTimeout(15_000);
            conn.setReadTimeout(20_000);
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/json");
            // The tracker sits behind Cloudflare, which rejects bot-shaped agents such as
            // Android's default "Dalvik/..." before the request reaches the server.
            conn.setRequestProperty("User-Agent",
                    "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) "
                            + "Chrome/124.0.0.0 Mobile Safari/537.36");
            if (token != null && !token.isEmpty()) {
                conn.setRequestProperty("Authorization", "Bearer " + token);
            }
            try (OutputStream os = conn.getOutputStream()) {
                os.write(json.getBytes(StandardCharsets.UTF_8));
            }
            int code = conn.getResponseCode();
            if (code >= 200 && code < 300) return true;
            Log.w(TAG, "tracker returned HTTP " + code);
            return code == 401 || code == 403;
        } catch (Exception e) {
            Log.w(TAG, "POST failed, will retry", e);
            return false;
        } finally {
            if (conn != null) conn.disconnect();
        }
    }
}
