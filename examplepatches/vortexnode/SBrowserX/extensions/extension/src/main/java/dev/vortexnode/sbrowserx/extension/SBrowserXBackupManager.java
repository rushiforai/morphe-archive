package dev.vortexnode.sbrowserx.extension;

import android.content.ContentResolver;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

public final class SBrowserXBackupManager {
    private static final String TAG = "SBrowserXBackup";
    private static final String PREFS_NAME = "sbrowserx_prefs";

    public static final String INTERVAL_DAILY = "daily";
    public static final String INTERVAL_WEEKLY = "weekly";
    public static final String INTERVAL_MONTHLY = "monthly";

    private SBrowserXBackupManager() {}

    public static String suggestedFileName() {
        String date = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date());
        return "sbrowserx-backup-" + date + ".json";
    }

    public static String exportToJson(Context ctx) throws Exception {
        SharedPreferences sp = ctx.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        Map<String, ?> all = sp.getAll();

        JSONObject root = new JSONObject();
        root.put("format", "sbrowserx_backup");
        root.put("version", 1);
        root.put("timestamp", System.currentTimeMillis());

        JSONObject prefsObj = new JSONObject();
        JSONObject typesObj = new JSONObject();

        for (Map.Entry<String, ?> entry : all.entrySet()) {
            String key = entry.getKey();
            Object val = entry.getValue();
            if (key == null || val == null) continue;
            // Skip transient backup timestamps so restoring doesn't confuse scheduler
            if (key.startsWith("backup_last_ts_")) continue;
            if (val instanceof Boolean) {
                prefsObj.put(key, val);
                typesObj.put(key, "bool");
            } else if (val instanceof Integer) {
                prefsObj.put(key, val);
                typesObj.put(key, "int");
            } else if (val instanceof Long) {
                prefsObj.put(key, val);
                typesObj.put(key, "long");
            } else if (val instanceof Float) {
                prefsObj.put(key, ((Float) val).doubleValue());
                typesObj.put(key, "float");
            } else if (val instanceof String) {
                prefsObj.put(key, val);
                typesObj.put(key, "string");
            }
        }
        root.put("prefs", prefsObj);
        root.put("types", typesObj);
        return root.toString(2);
    }

    public static int importFromJson(Context ctx, String jsonStr) throws Exception {
        JSONObject root = new JSONObject(jsonStr);
        JSONObject prefsObj = root.optJSONObject("prefs");
        JSONObject typesObj = root.optJSONObject("types");
        if (prefsObj == null) {
            throw new IllegalArgumentException("Invalid backup file (missing prefs)");
        }

        SharedPreferences sp = ctx.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        SharedPreferences.Editor ed = sp.edit();
        int count = 0;

        Iterator<String> keys = prefsObj.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            if (key == null || key.startsWith("backup_last_ts_")) continue;
            String type = typesObj != null ? typesObj.optString(key, "") : "";
            Object raw = prefsObj.opt(key);
            if (raw == null || raw == JSONObject.NULL) continue;

            if ("bool".equals(type) || (type.isEmpty() && raw instanceof Boolean)) {
                ed.putBoolean(key, prefsObj.optBoolean(key));
                count++;
            } else if ("int".equals(type)) {
                ed.putInt(key, prefsObj.optInt(key));
                count++;
            } else if ("long".equals(type)) {
                ed.putLong(key, prefsObj.optLong(key));
                count++;
            } else if ("float".equals(type)) {
                ed.putFloat(key, (float) prefsObj.optDouble(key));
                count++;
            } else if ("string".equals(type) || raw instanceof String) {
                ed.putString(key, prefsObj.optString(key));
                count++;
            } else if (raw instanceof Number) {
                ed.putInt(key, prefsObj.optInt(key));
                count++;
            }
        }
        ed.apply();
        return count;
    }

    public static void writeBackupToUri(Context ctx, Uri uri) throws Exception {
        String json = exportToJson(ctx);
        ContentResolver cr = ctx.getContentResolver();
        try (OutputStream os = cr.openOutputStream(uri, "wt")) {
            if (os == null) throw new IllegalStateException("Cannot open output stream");
            os.write(json.getBytes(StandardCharsets.UTF_8));
            os.flush();
        }
    }

    public static int readBackupFromUri(Context ctx, Uri uri) throws Exception {
        ContentResolver cr = ctx.getContentResolver();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try (InputStream is = cr.openInputStream(uri)) {
            if (is == null) throw new IllegalStateException("Cannot open input stream");
            byte[] buf = new byte[4096];
            int n;
            while ((n = is.read(buf)) > 0) {
                baos.write(buf, 0, n);
            }
        }
        String json = baos.toString("UTF-8");
        return importFromJson(ctx, json);
    }

    public static boolean writeBackupToTreeUri(Context ctx, Uri treeUri, String fileName) {
        try {
            ContentResolver cr = ctx.getContentResolver();
            String docId = DocumentsContract.getTreeDocumentId(treeUri);
            Uri parentDocUri = DocumentsContract.buildDocumentUriUsingTree(treeUri, docId);
            Uri created = DocumentsContract.createDocument(cr, parentDocUri, "application/json", fileName);
            if (created == null) return false;
            writeBackupToUri(ctx, created);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "writeBackupToTreeUri failed", t);
            return false;
        }
    }

    public static long intervalToMillis(String interval) {
        if (INTERVAL_DAILY.equals(interval)) return 24L * 60L * 60L * 1000L;
        if (INTERVAL_MONTHLY.equals(interval)) return 30L * 24L * 60L * 60L * 1000L;
        return 7L * 24L * 60L * 60L * 1000L; // weekly default
    }

    public static void runAutoBackupIfDue(Context ctx) {
        if (ctx == null) return;
        final Context appCtx = ctx.getApplicationContext();
        new Thread(() -> {
            try {
                long now = System.currentTimeMillis();
                // 1. Local scheduled auto-backup
                if (SBrowserXPrefs.isLocalAutoBackupEnabled(appCtx)) {
                    String uriStr = SBrowserXPrefs.getLocalBackupTreeUri(appCtx);
                    if (uriStr != null && !uriStr.isEmpty()) {
                        long last = SBrowserXPrefs.getLocalBackupLastTs(appCtx);
                        long intervalMs = intervalToMillis(SBrowserXPrefs.getLocalAutoBackupInterval(appCtx));
                        if (now - last >= intervalMs) {
                            Uri tree = Uri.parse(uriStr);
                            boolean ok = writeBackupToTreeUri(appCtx, tree, suggestedFileName());
                            if (SBrowserXPrefs.isLocalAutoBackupBookmarksEnabled(appCtx)) {
                                SBrowserXBookmarkBackup.writeBookmarksToTreeUri(
                                        appCtx, tree, SBrowserXBookmarkBackup.suggestedHtmlFileName());
                            }
                            if (ok) {
                                SBrowserXPrefs.setLocalBackupLastTs(appCtx, now);
                            }
                        }
                    }
                }
                // 2. Google Drive scheduled auto-backup
                if (SBrowserXPrefs.isDriveAutoBackupEnabled(appCtx)) {
                    String uriStr = SBrowserXPrefs.getDriveBackupTreeUri(appCtx);
                    if (uriStr != null && !uriStr.isEmpty()) {
                        long last = SBrowserXPrefs.getDriveBackupLastTs(appCtx);
                        long intervalMs = intervalToMillis(SBrowserXPrefs.getDriveAutoBackupInterval(appCtx));
                        if (now - last >= intervalMs) {
                            Uri tree = Uri.parse(uriStr);
                            boolean ok = writeBackupToTreeUri(appCtx, tree, suggestedFileName());
                            if (SBrowserXPrefs.isDriveAutoBackupBookmarksEnabled(appCtx)) {
                                SBrowserXBookmarkBackup.writeBookmarksToTreeUri(
                                        appCtx, tree, SBrowserXBookmarkBackup.suggestedHtmlFileName());
                            }
                            if (ok) {
                                SBrowserXPrefs.setDriveBackupLastTs(appCtx, now);
                            }
                        }
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "runAutoBackupIfDue failed", t);
            }
        }, "SBrowserX-AutoBackup").start();
    }

    public static String formatTimestamp(long ts, String neverLabel) {
        if (ts <= 0L) return neverLabel;
        return new SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.getDefault()).format(new Date(ts));
    }
}
