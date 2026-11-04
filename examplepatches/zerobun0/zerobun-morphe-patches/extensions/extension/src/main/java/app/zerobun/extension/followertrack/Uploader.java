/*
 * Zerobun Morphe patches - GPLv3.
 *
 * v2 of the uploader. Drop-in replacement for the one shipped in v1.0.0 at
 * extensions/extension/src/main/java/app/zerobun/extension/followertrack/Uploader.java
 * in zerobun0/zerobun-morphe-patches.
 *
 * WHY THIS REPLACEMENT EXISTS
 * ---------------------------
 * On 2026-11-03 the phone captured follower rows and uploaded them, the server
 * received nothing, and the app said everything was fine. Reading v1.0.0's post()
 * shows three separate reasons, and each one on its own silently destroys data:
 *
 *   1. Redirects were followed. HttpURLConnection.setInstanceFollowRedirects
 *      defaults to true, and on a 302 it re-issues the request as a GET. Authelia
 *      answers an unauthenticated POST with a redirect to its login page, which
 *      returns 200 - so the check `code >= 200 && code < 300` passed on a login
 *      page and the batch was marked sent.
 *
 *   2. `return code == 401 || code == 403;` returned TRUE for an unauthorized
 *      response. In this method true means "delivered, drop the batch". The intent
 *      in the comment was "do not retry a bad token forever", but the effect was to
 *      throw the rows away. This is the single biggest cause of the lost uploads.
 *
 *   3. Only the status code was checked. The tracker replies with a JSON body
 *      saying whether it stored anything; a 200 from anything else in the path
 *      (a proxy, a captive portal, an error page) looked identical to success.
 *
 * So v2's rule is: a batch is delivered only when the TRACKER ITSELF says so -
 * HTTP 2xx and a body containing "ok":true. Everything else keeps the batch.
 *
 * It also records every outcome in Status, so the on-screen indicator can show
 * what actually happened instead of nothing at all.
 */

package app.zerobun.extension.followertrack;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.InputStream;
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

    /**
     * A batch is given up on only after this many authorization failures. It is not
     * dropped on the first 401: that is what lost the 2026-11-03 uploads, and an
     * unauthorized reply usually means a fixable server-side gate rather than
     * worthless data. Reaching the cap is reported, never silent.
     */
    private static final int MAX_AUTH_FAILURES = 25;

    private static final ExecutorService IO = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "zb-follower-track");
        t.setDaemon(true);
        return t;
    });

    private Uploader() {}

    /** Sends captured rows. `extra` may carry profile, session and completeness fields. */
    static void send(Context context, JSONArray users, String target, String category,
                     JSONObject extra) {
        if (context == null) return;
        boolean hasRows = users != null && users.length() > 0;
        boolean hasExtra = extra != null && extra.length() > 0;
        if (!hasRows && !hasExtra) return;
        final Context app = context.getApplicationContext();
        final String body;
        try {
            JSONObject o = new JSONObject();
            o.put("target", target == null ? "" : target);
            o.put("category", category == null ? "followers" : category);
            o.put("users", users == null ? new JSONArray() : users);
            o.put("captured_at", System.currentTimeMillis() / 1000L);
            o.put("source", "morphe-capture");
            if (extra != null) {
                for (java.util.Iterator<String> it = extra.keys(); it.hasNext(); ) {
                    String key = it.next();
                    o.put(key, extra.get(key));
                }
            }
            body = o.toString();
        } catch (Exception e) {
            Log.w(TAG, "could not build payload", e);
            Status.uploadFailed("could not build the payload");
            return;
        }
        final int rows = users == null ? 0 : users.length();
        Status.uploading(rows);
        IO.execute(() -> {
            flushQueue(app);
            Result result = post(body);
            if (result.delivered) {
                Status.uploaded(rows);
            } else {
                enqueue(app, body);
                Status.uploadFailed(result.reason);
            }
        });
    }

    static void send(Context context, JSONArray users, String target, String category) {
        send(context, users, target, category, null);
    }

    private static void flushQueue(Context app) {
        SharedPreferences prefs = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String raw = prefs.getString(QUEUE_KEY, null);
        if (raw == null) return;
        JSONArray left = new JSONArray();
        int sent = 0;
        try {
            JSONArray queued = new JSONArray(raw);
            for (int i = 0; i < queued.length(); i++) {
                String batch = queued.getString(i);
                Result result = post(batch);
                if (result.delivered) {
                    sent++;
                } else if (result.authFailures >= MAX_AUTH_FAILURES) {
                    // Given up on, and said so. Dropping it quietly is what v1 did.
                    Log.w(TAG, "giving up on a batch after repeated authorization failures");
                    Status.uploadFailed("gave up on a queued batch: " + result.reason);
                } else {
                    left.put(batch);
                }
            }
        } catch (Exception e) {
            Log.w(TAG, "queue flush failed", e);
            return;
        }
        prefs.edit().putString(QUEUE_KEY, left.length() == 0 ? null : left.toString()).apply();
        Status.queueDepth(left.length());
        if (sent > 0) Log.i(TAG, "flushed " + sent + " queued batch(es)");
    }

    private static void enqueue(Context app, String batch) {
        SharedPreferences prefs = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        try {
            JSONArray queued = new JSONArray(prefs.getString(QUEUE_KEY, "[]"));
            queued.put(batch);
            while (queued.length() > MAX_QUEUED) queued.remove(0);
            prefs.edit().putString(QUEUE_KEY, queued.toString()).apply();
            Status.queueDepth(queued.length());
        } catch (Exception e) {
            Log.w(TAG, "enqueue failed", e);
        }
    }

    /** What one POST attempt did, and why, so the indicator can be specific. */
    private static final class Result {
        final boolean delivered;
        final String reason;
        final int authFailures;

        Result(boolean delivered, String reason, int authFailures) {
            this.delivered = delivered;
            this.reason = reason;
            this.authFailures = authFailures;
        }
    }

    private static int authFailureCount = 0;

    /**
     * One POST. Delivered ONLY when the tracker itself confirms it.
     *
     * Not "the request did not throw", and not "some server somewhere answered 200".
     * Those are the two things v1.0.0 mistook for success.
     */
    private static Result post(String json) {
        String url = Config.get("cfg.url");
        String token = Config.get("cfg.token");
        if (url == null || !url.startsWith("https://")) {
            return new Result(false, "tracker URL not configured", authFailureCount);
        }
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setRequestMethod("POST");
            // THE FIX for the silent data loss. Left at its default of true, a 302 to
            // Authelia's login page is re-issued as a GET, that page answers 200, and
            // a login form gets scored as a successful upload.
            conn.setInstanceFollowRedirects(false);
            conn.setConnectTimeout(15_000);
            conn.setReadTimeout(20_000);
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept", "application/json");
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

            if (code >= 300 && code < 400) {
                // Almost always Authelia. Naming it makes the screenshot useful.
                authFailureCount++;
                return new Result(false,
                        "redirected (HTTP " + code + ") - the relay route is behind a "
                                + "login gate, so nothing was stored",
                        authFailureCount);
            }
            if (code == 401 || code == 403) {
                authFailureCount++;
                return new Result(false,
                        "unauthorized (HTTP " + code + ") - check the tracker token",
                        authFailureCount);
            }
            if (code < 200 || code >= 300) {
                return new Result(false, "tracker returned HTTP " + code, authFailureCount);
            }

            String body = readBody(conn);
            if (body == null || !confirmsStored(body)) {
                // 2xx from something that is not our tracker, or our tracker refusing
                // the payload. Either way nothing was stored, so keep the batch.
                return new Result(false,
                        "HTTP " + code + " but the tracker did not confirm it stored "
                                + "anything", authFailureCount);
            }
            authFailureCount = 0;
            return new Result(true, null, 0);
        } catch (Exception e) {
            return new Result(false, e.getClass().getSimpleName()
                    + (e.getMessage() == null ? "" : ": " + e.getMessage()), authFailureCount);
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    private static String readBody(HttpURLConnection conn) {
        try (InputStream in = conn.getInputStream()) {
            byte[] buffer = new byte[4096];
            int read = in.read(buffer);
            return read <= 0 ? "" : new String(buffer, 0, read, StandardCharsets.UTF_8);
        } catch (Exception e) {
            return null;
        }
    }

    /** The relay answers {"ok": true, ...} when, and only when, it wrote a drop. */
    private static boolean confirmsStored(String body) {
        try {
            return new JSONObject(body).optBoolean("ok", false);
        } catch (Exception e) {
            // Not JSON at all - a proxy or error page. Definitely not our tracker.
            return false;
        }
    }
}
