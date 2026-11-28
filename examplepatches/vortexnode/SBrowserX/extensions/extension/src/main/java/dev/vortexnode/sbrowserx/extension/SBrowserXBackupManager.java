package dev.vortexnode.sbrowserx.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.util.Base64;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Full Backup & Restore manager for SBrowserX (v2, backward-compatible with v1).
 *
 * Exports and imports:
 * 1. All SBrowserX preferences (sbrowserx_prefs, including Start Page shortcuts & layout).
 * 2. All stock Samsung Internet SharedPreferences XML files (toolbar customization,
 *    More menu items, address bar position, layout, dark mode, homepage, search engine, etc.),
 *    normalizing the default "<pkg>_preferences" file for cross-package portability.
 * 3. Bookmarks (embedded Netscape HTML via SBrowserXBookmarkBackup).
 * 4. Stock Samsung Quick Access shortcuts (pintab.db).
 * 5. Custom local Start Page wallpaper (sbrowserx_wallpaper_local.jpg, up to 6 MB).
 */
public final class SBrowserXBackupManager {

    private static final String TAG = "SBrowserXBackup";
    private static final String PREFS_NAME = "sbrowserx_prefs";
    private static final String DEFAULT_PREFS_ALIAS = "__DEFAULT_PREFS__";
    private static final int BACKUP_VERSION = 2;
    private static final long MAX_WALLPAPER_BYTES = 6L * 1024L * 1024L;

    public static final String INTERVAL_DAILY = "daily";
    public static final String INTERVAL_WEEKLY = "weekly";
    public static final String INTERVAL_MONTHLY = "monthly";

    private static final Set<String> EXCLUDED_SBROWSERX_KEYS = new HashSet<>();
    static {
        EXCLUDED_SBROWSERX_KEYS.add(SBrowserXPrefs.KEY_BACKUP_LOCAL_TS);
        EXCLUDED_SBROWSERX_KEYS.add(SBrowserXPrefs.KEY_BACKUP_DRIVE_TS);
        EXCLUDED_SBROWSERX_KEYS.add(SBrowserXPrefs.KEY_BACKUP_LOCAL_TREE);
        EXCLUDED_SBROWSERX_KEYS.add(SBrowserXPrefs.KEY_BACKUP_DRIVE_TREE);
    }

    private SBrowserXBackupManager() {}

    public static String suggestedFileName() {
        String date = new SimpleDateFormat("yyyyMMdd_HHmm", Locale.US).format(new Date());
        return "sbrowserx_backup_" + date + ".json";
    }

    private static boolean shouldSkipStockPrefsFile(String name) {
        if (name == null || name.isEmpty()) return true;
        if (PREFS_NAME.equals(name)) return true;
        String lower = name.toLowerCase(Locale.US);
        return lower.startsWith("com.google.android.gms")
                || lower.startsWith("com.google.firebase")
                || lower.startsWith("firebase")
                || lower.startsWith("androidx.")
                || lower.startsWith("workmanager")
                || lower.startsWith("smp_")
                || lower.startsWith("sa_logging")
                || lower.startsWith("samsunganalytics")
                || lower.startsWith("samsung_analytics")
                || lower.startsWith("scloud")
                || lower.startsWith("gcm_")
                || lower.startsWith("fcm_")
                || lower.startsWith("aw_")
                || lower.startsWith("leakcanary")
                || lower.equals("webviewchromiumprefs")
                || lower.contains("push_token")
                || lower.contains("account_sso");
    }

    private static void serializeSharedPrefs(
            SharedPreferences sp,
            Set<String> excludedKeys,
            JSONObject outPrefs,
            JSONObject outTypes
    ) throws Exception {
        Map<String, ?> all = sp.getAll();
        if (all == null) return;
        for (Map.Entry<String, ?> entry : all.entrySet()) {
            String key = entry.getKey();
            if (key == null) continue;
            if (excludedKeys != null && excludedKeys.contains(key)) continue;
            Object val = entry.getValue();
            if (val instanceof Boolean) {
                outPrefs.put(key, val);
                outTypes.put(key, "B");
            } else if (val instanceof Integer) {
                outPrefs.put(key, val);
                outTypes.put(key, "I");
            } else if (val instanceof Long) {
                outPrefs.put(key, val);
                outTypes.put(key, "L");
            } else if (val instanceof Float) {
                outPrefs.put(key, ((Float) val).doubleValue());
                outTypes.put(key, "F");
            } else if (val instanceof String) {
                outPrefs.put(key, val);
                outTypes.put(key, "S");
            } else if (val instanceof Set<?>) {
                JSONArray arr = new JSONArray();
                for (Object item : (Set<?>) val) {
                    if (item != null) arr.put(String.valueOf(item));
                }
                outPrefs.put(key, arr);
                outTypes.put(key, "SS");
            }
        }
    }

    private static int applySharedPrefs(
            SharedPreferences sp,
            Set<String> excludedKeys,
            JSONObject prefsObj,
            JSONObject typesObj
    ) {
        if (prefsObj == null) return 0;
        SharedPreferences.Editor ed = sp.edit();
        int count = 0;
        Iterator<String> it = prefsObj.keys();
        while (it.hasNext()) {
            String key = it.next();
            if (key == null) continue;
            if (excludedKeys != null && excludedKeys.contains(key)) continue;
            String type = typesObj != null ? typesObj.optString(key, "") : "";
            Object raw = prefsObj.opt(key);
            if (raw == null || raw == JSONObject.NULL) continue;

            try {
                if ("B".equals(type) || (type.isEmpty() && raw instanceof Boolean)) {
                    ed.putBoolean(key, prefsObj.getBoolean(key));
                    count++;
                } else if ("I".equals(type) || (type.isEmpty() && raw instanceof Integer)) {
                    ed.putInt(key, prefsObj.getInt(key));
                    count++;
                } else if ("L".equals(type) || (type.isEmpty() && raw instanceof Long)) {
                    ed.putLong(key, prefsObj.getLong(key));
                    count++;
                } else if ("F".equals(type) || (type.isEmpty() && (raw instanceof Double || raw instanceof Float))) {
                    ed.putFloat(key, (float) prefsObj.getDouble(key));
                    count++;
                } else if ("SS".equals(type) || (type.isEmpty() && raw instanceof JSONArray)) {
                    JSONArray arr = prefsObj.optJSONArray(key);
                    if (arr != null) {
                        Set<String> set = new HashSet<>();
                        for (int i = 0; i < arr.length(); i++) {
                            set.add(arr.optString(i, ""));
                        }
                        ed.putStringSet(key, set);
                        count++;
                    }
                } else {
                    ed.putString(key, prefsObj.optString(key, ""));
                    count++;
                }
            } catch (Throwable ignored) {}
        }
        ed.commit();
        return count;
    }

    private static JSONArray exportQuickAccess(Context ctx) {
        JSONArray arr = new JSONArray();
        SQLiteDatabase db = null;
        Cursor cursor = null;
        try {
            File dbFile = ctx.getApplicationContext().getDatabasePath("pintab.db");
            if (dbFile == null || !dbFile.exists()) return arr;
            db = SQLiteDatabase.openDatabase(dbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY);
            cursor = db.rawQuery(
                    "SELECT title, url, position, TYPE, dominant, touchiconUrl FROM pintab WHERE deleted = 0 ORDER BY position ASC",
                    null);
            while (cursor != null && cursor.moveToNext()) {
                String url = cursor.getString(1);
                if (url == null || url.trim().isEmpty()) continue;
                JSONObject item = new JSONObject();
                item.put("title", cursor.isNull(0) ? "" : cursor.getString(0));
                item.put("url", url);
                item.put("position", cursor.isNull(2) ? arr.length() : cursor.getInt(2));
                item.put("type", cursor.isNull(3) ? 2 : cursor.getInt(3));
                item.put("dominant", cursor.isNull(4) ? -1 : cursor.getInt(4));
                item.put("touchiconUrl", cursor.isNull(5) ? "" : cursor.getString(5));
                arr.put(item);
            }
        } catch (Throwable t) {
            Log.w(TAG, "exportQuickAccess skipped: " + t.getMessage());
        } finally {
            if (cursor != null) {
                try { cursor.close(); } catch (Throwable ignored) {}
            }
            if (db != null) {
                try { db.close(); } catch (Throwable ignored) {}
            }
        }
        return arr;
    }

    private static int importQuickAccess(Context ctx, JSONArray arr) {
        if (arr == null || arr.length() == 0) return 0;
        SQLiteDatabase db = null;
        int added = 0;
        try {
            File dbFile = ctx.getApplicationContext().getDatabasePath("pintab.db");
            if (dbFile == null || !dbFile.exists()) return 0;
            db = SQLiteDatabase.openDatabase(dbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE);
            Set<String> existingUrls = new HashSet<>();
            Cursor c = null;
            int maxPos = -1;
            try {
                c = db.rawQuery("SELECT url, position FROM pintab WHERE deleted = 0", null);
                while (c != null && c.moveToNext()) {
                    String u = c.getString(0);
                    if (u != null) existingUrls.add(u);
                    if (!c.isNull(1)) {
                        int p = c.getInt(1);
                        if (p > maxPos) maxPos = p;
                    }
                }
            } finally {
                if (c != null) try { c.close(); } catch (Throwable ignored) {}
            }

            for (int i = 0; i < arr.length(); i++) {
                JSONObject item = arr.optJSONObject(i);
                if (item == null) continue;
                String url = item.optString("url", "").trim();
                if (url.isEmpty() || existingUrls.contains(url)) continue;
                String title = item.optString("title", url);
                int pos = ++maxPos;
                int type = item.optInt("type", 2);
                int dominant = item.optInt("dominant", -1);
                String touchiconUrl = item.optString("touchiconUrl", "");
                try {
                    db.execSQL(
                            "INSERT OR IGNORE INTO pintab(title, url, position, TYPE, dominant, touchiconUrl, titleState, dirty, deleted) VALUES(?, ?, ?, ?, ?, ?, 0, 0, 0)",
                            new Object[]{title, url, pos, type, dominant, touchiconUrl});
                    existingUrls.add(url);
                    added++;
                } catch (Throwable ignored) {}
            }
        } catch (Throwable t) {
            Log.w(TAG, "importQuickAccess skipped: " + t.getMessage());
        } finally {
            if (db != null) {
                try { db.close(); } catch (Throwable ignored) {}
            }
        }
        return added;
    }

    public static String exportToJson(Context ctx) throws Exception {
        Context appCtx = ctx.getApplicationContext();
        JSONObject root = new JSONObject();
        root.put("format", "sbrowserx_backup");
        root.put("version", BACKUP_VERSION);
        root.put("timestamp", System.currentTimeMillis());
        root.put("package", appCtx.getPackageName());

        // 1. SBrowserX preferences (kept at top-level for v1 compatibility)
        SharedPreferences sbPrefs = appCtx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        JSONObject prefsObj = new JSONObject();
        JSONObject typesObj = new JSONObject();
        serializeSharedPrefs(sbPrefs, EXCLUDED_SBROWSERX_KEYS, prefsObj, typesObj);
        root.put("prefs", prefsObj);
        root.put("types", typesObj);

        // 2. All stock Samsung Internet SharedPreferences XML files
        JSONObject stockPrefsRoot = new JSONObject();
        String defaultPrefsName = appCtx.getPackageName() + "_preferences";
        try {
            File prefsDir = new File(appCtx.getApplicationInfo().dataDir, "shared_prefs");
            File[] xmlFiles = prefsDir.exists() && prefsDir.isDirectory() ? prefsDir.listFiles() : null;
            if (xmlFiles != null) {
                for (File f : xmlFiles) {
                    if (f == null || !f.isFile()) continue;
                    String fn = f.getName();
                    if (!fn.endsWith(".xml")) continue;
                    String prefName = fn.substring(0, fn.length() - 4);
                    if (shouldSkipStockPrefsFile(prefName)) continue;

                    SharedPreferences stockSp = appCtx.getSharedPreferences(prefName, Context.MODE_PRIVATE);
                    JSONObject pObj = new JSONObject();
                    JSONObject tObj = new JSONObject();
                    serializeSharedPrefs(stockSp, null, pObj, tObj);
                    if (pObj.length() > 0) {
                        JSONObject fileEntry = new JSONObject();
                        fileEntry.put("prefs", pObj);
                        fileEntry.put("types", tObj);
                        String exportKey = defaultPrefsName.equals(prefName) ? DEFAULT_PREFS_ALIAS : prefName;
                        stockPrefsRoot.put(exportKey, fileEntry);
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "stock SharedPreferences export partial: " + t.getMessage());
        }
        root.put("stock_prefs", stockPrefsRoot);

        // 3. Embedded bookmarks (Netscape HTML)
        try {
            SBrowserXBookmarkBackup.ExportResult bm = SBrowserXBookmarkBackup.exportBookmarksToHtml(appCtx);
            if (bm != null && bm.html != null && !bm.html.isEmpty() && bm.bookmarkCount > 0) {
                root.put("bookmarks_html", bm.html);
                root.put("bookmarks_count", bm.bookmarkCount);
            }
        } catch (Throwable t) {
            Log.w(TAG, "bookmarks export skipped: " + t.getMessage());
        }

        // 4. Stock Samsung Quick Access shortcuts (pintab.db)
        try {
            JSONArray qa = exportQuickAccess(appCtx);
            if (qa.length() > 0) {
                root.put("quick_access", qa);
            }
        } catch (Throwable t) {
            Log.w(TAG, "quick access export skipped: " + t.getMessage());
        }

        // 5. Local Start Page wallpaper (if present and <= 6 MB)
        try {
            File wpFile = new File(appCtx.getFilesDir(), "sbrowserx_wallpaper_local.jpg");
            if (wpFile.exists() && wpFile.isFile() && wpFile.length() > 0 && wpFile.length() <= MAX_WALLPAPER_BYTES) {
                byte[] bytes = readAllBytes(wpFile);
                root.put("startpage_wallpaper_b64", Base64.encodeToString(bytes, Base64.NO_WRAP));
            }
        } catch (Throwable t) {
            Log.w(TAG, "wallpaper export skipped: " + t.getMessage());
        }

        return root.toString(2);
    }

    public static int importFromJson(Context ctx, String jsonStr) throws Exception {
        Context appCtx = ctx.getApplicationContext();
        JSONObject root = new JSONObject(jsonStr);
        if (!"sbrowserx_backup".equals(root.optString("format", ""))) {
            throw new IllegalArgumentException("Invalid backup format");
        }

        int totalCount = 0;

        // 1. Restore SBrowserX preferences
        JSONObject prefsObj = root.optJSONObject("prefs");
        JSONObject typesObj = root.optJSONObject("types");
        if (prefsObj != null) {
            SharedPreferences sbPrefs = appCtx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            totalCount += applySharedPrefs(sbPrefs, EXCLUDED_SBROWSERX_KEYS, prefsObj, typesObj);
        }

        // 2. Restore all stock Samsung Internet SharedPreferences XML files (v2+)
        JSONObject stockPrefsRoot = root.optJSONObject("stock_prefs");
        if (stockPrefsRoot != null) {
            String defaultPrefsName = appCtx.getPackageName() + "_preferences";
            String backupPkg = root.optString("package", "");
            String backupDefaultName = !backupPkg.isEmpty() ? (backupPkg + "_preferences") : "";

            Iterator<String> fileIt = stockPrefsRoot.keys();
            while (fileIt.hasNext()) {
                String exportKey = fileIt.next();
                if (exportKey == null || exportKey.isEmpty()) continue;
                JSONObject fileEntry = stockPrefsRoot.optJSONObject(exportKey);
                if (fileEntry == null) continue;

                String targetPrefName;
                if (DEFAULT_PREFS_ALIAS.equals(exportKey) || (!backupDefaultName.isEmpty() && backupDefaultName.equals(exportKey))) {
                    targetPrefName = defaultPrefsName;
                } else {
                    targetPrefName = exportKey;
                }
                if (shouldSkipStockPrefsFile(targetPrefName)) continue;

                SharedPreferences stockSp = appCtx.getSharedPreferences(targetPrefName, Context.MODE_PRIVATE);
                totalCount += applySharedPrefs(
                        stockSp,
                        null,
                        fileEntry.optJSONObject("prefs"),
                        fileEntry.optJSONObject("types"));
            }
        }

        // 3. Restore embedded bookmarks (if present)
        String bookmarksHtml = root.optString("bookmarks_html", "");
        if (!bookmarksHtml.isEmpty()) {
            try {
                SBrowserXBookmarkBackup.ImportResult bmRes =
                        SBrowserXBookmarkBackup.importBookmarksFromText(appCtx, bookmarksHtml);
                if (bmRes != null) {
                    totalCount += bmRes.addedBookmarks;
                }
            } catch (Throwable t) {
                Log.w(TAG, "bookmarks import partial/skipped: " + t.getMessage());
            }
        }

        // 4. Restore stock Samsung Quick Access shortcuts (if present)
        JSONArray qa = root.optJSONArray("quick_access");
        if (qa != null && qa.length() > 0) {
            totalCount += importQuickAccess(appCtx, qa);
        }

        // 5. Restore local Start Page wallpaper (if present)
        String wpB64 = root.optString("startpage_wallpaper_b64", "");
        if (!wpB64.isEmpty()) {
            try {
                byte[] bytes = Base64.decode(wpB64, Base64.DEFAULT);
                if (bytes != null && bytes.length > 0 && bytes.length <= MAX_WALLPAPER_BYTES) {
                    File wpFile = new File(appCtx.getFilesDir(), "sbrowserx_wallpaper_local.jpg");
                    try (FileOutputStream fos = new FileOutputStream(wpFile)) {
                        fos.write(bytes);
                        fos.flush();
                    }
                    SBrowserXPrefs.bumpStartPageWallpaperVersion(appCtx);
                    totalCount++;
                }
            } catch (Throwable t) {
                Log.w(TAG, "wallpaper import skipped: " + t.getMessage());
            }
        }

        return totalCount;
    }

    private static byte[] readAllBytes(File file) throws Exception {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        try (FileInputStream fis = new FileInputStream(file)) {
            byte[] buf = new byte[8192];
            int n;
            while ((n = fis.read(buf)) > 0) bos.write(buf, 0, n);
        }
        return bos.toByteArray();
    }

    public static void writeBackupToUri(Context ctx, Uri uri) throws Exception {
        String json = exportToJson(ctx);
        try (OutputStream os = ctx.getContentResolver().openOutputStream(uri, "wt")) {
            if (os == null) throw new IllegalStateException("Cannot open output stream");
            os.write(json.getBytes(StandardCharsets.UTF_8));
            os.flush();
        }
    }

    public static int readBackupFromUri(Context ctx, Uri uri) throws Exception {
        StringBuilder sb = new StringBuilder();
        try (InputStream is = ctx.getContentResolver().openInputStream(uri)) {
            if (is == null) throw new IllegalStateException("Cannot open input stream");
            byte[] buf = new byte[8192];
            int n;
            while ((n = is.read(buf)) > 0) {
                sb.append(new String(buf, 0, n, StandardCharsets.UTF_8));
            }
        }
        return importFromJson(ctx, sb.toString());
    }

    public static boolean writeBackupToTreeUri(Context ctx, Uri treeUri, String fileName) {
        try {
            String docId = DocumentsContract.getTreeDocumentId(treeUri);
            Uri parentDocUri = DocumentsContract.buildDocumentUriUsingTree(treeUri, docId);
            Uri created = DocumentsContract.createDocument(
                    ctx.getContentResolver(), parentDocUri, "application/json", fileName);
            if (created == null) return false;
            writeBackupToUri(ctx, created);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "writeBackupToTreeUri failed: " + t.getMessage());
            return false;
        }
    }

    public static long intervalMillis(String code) {
        if (INTERVAL_DAILY.equals(code)) return 24L * 60L * 60L * 1000L;
        if (INTERVAL_MONTHLY.equals(code)) return 30L * 24L * 60L * 60L * 1000L;
        return 7L * 24L * 60L * 60L * 1000L; // weekly default
    }

    public static void runAutoBackupIfDue(Context ctx) {
        if (ctx == null) return;
        final Context appCtx = ctx.getApplicationContext();
        final long now = System.currentTimeMillis();

        final boolean localOn = SBrowserXPrefs.isLocalAutoBackupEnabled(appCtx);
        final String localUriStr = SBrowserXPrefs.getLocalBackupTreeUri(appCtx);
        final long localInterval = intervalMillis(SBrowserXPrefs.getLocalAutoBackupInterval(appCtx));
        final boolean localDue = localOn && !localUriStr.isEmpty()
                && (now - SBrowserXPrefs.getLocalBackupLastTs(appCtx) >= localInterval);

        final boolean driveOn = SBrowserXPrefs.isDriveAutoBackupEnabled(appCtx);
        final String driveUriStr = SBrowserXPrefs.getDriveBackupTreeUri(appCtx);
        final long driveInterval = intervalMillis(SBrowserXPrefs.getDriveAutoBackupInterval(appCtx));
        final boolean driveDue = driveOn && !driveUriStr.isEmpty()
                && (now - SBrowserXPrefs.getDriveBackupLastTs(appCtx) >= driveInterval);

        if (!localDue && !driveDue) return;

        new Thread(() -> {
            String fileName = suggestedFileName();
            if (localDue) {
                try {
                    if (writeBackupToTreeUri(appCtx, Uri.parse(localUriStr), fileName)) {
                        SBrowserXPrefs.setLocalBackupLastTs(appCtx, System.currentTimeMillis());
                        Log.i(TAG, "Local auto-backup succeeded: " + fileName);
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "Local auto-backup error: " + t.getMessage());
                }
            }
            if (driveDue) {
                try {
                    if (writeBackupToTreeUri(appCtx, Uri.parse(driveUriStr), fileName)) {
                        SBrowserXPrefs.setDriveBackupLastTs(appCtx, System.currentTimeMillis());
                        Log.i(TAG, "Drive auto-backup succeeded: " + fileName);
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "Drive auto-backup error: " + t.getMessage());
                }
            }
        }, "SBrowserX-AutoBackup").start();
    }

    public static String formatTimestamp(long ts) {
        return formatTimestamp(ts, SBrowserXStrings.get(SBrowserXStrings.BACKUP_NEVER));
    }

    public static String formatTimestamp(long ts, String neverLabel) {
        if (ts <= 0L) return neverLabel != null ? neverLabel : SBrowserXStrings.get(SBrowserXStrings.BACKUP_NEVER);
        return new SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.getDefault()).format(new Date(ts));
    }
}
