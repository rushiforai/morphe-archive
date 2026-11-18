/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.fragments;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.app.Fragment;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Xml;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.xmlpull.v1.XmlPullParser;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.patches.customise.font.FontStorage;
import app.morphe.extension.instagram.patches.devFlags.HookFlags;
import app.morphe.extension.instagram.patches.devFlags.RecommendedFlags;
import app.morphe.extension.instagram.patches.dm.InboxLock;
import app.morphe.extension.instagram.patches.focusLock.FocusLock;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public class RestorePrefFragment extends Fragment {

    private static final int READ_REQUEST_CODE = 42;
    private static final long MAX_RESTORE_BYTES = 16L * 1024 * 1024;

    private static final String[] FONT_MIME_TYPES = {
            "font/ttf",
            "font/otf",
            "application/x-font-ttf",
            "application/octet-stream"
    };

    private final Handler mainHandler = new Handler(Looper.getMainLooper());

    private File destinationFile;
    private Context context;
    private boolean isFontImport;
    private boolean isEmojiFontImport;
    private boolean isStoryFontImport;
    private boolean isInitialFeaturesImport;
    private boolean inlineHosted;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        context = getActivity() != null ? getActivity() : Utils.getContext();
        Bundle args = getArguments();

        if (args != null) {
            inlineHosted = args.getBoolean(app.morphe.extension.instagram.settings.ActivityHook.EXTRA_INLINE_HOST, false);
            if (args.containsKey("rex_import_dev_overrides")) {
                destinationFile = new File(context.getFilesDir() + "/mobileconfig", "mc_overrides.json");
            } else if (args.containsKey("rex_import_id_mapping")) {
                destinationFile = new File(context.getFilesDir() + "/mobileconfig", "id_name_mapping.json");
            } else if (args.containsKey("rex_import_pref")) {
                if (FocusLock.isActive()) {
                    toast(str("rex_focus_lock_blocked_action"));
                    finishHost();
                    return;
                }
                destinationFile = new File(context.getApplicationInfo().dataDir + "/shared_prefs", Constants.REX_SETTINGS + ".xml");
            } else if (args.containsKey("rex_pref_add_font")) {
                isFontImport = true;
            } else if (args.containsKey("rex_pref_add_emoji_font")) {
                isFontImport = true;
                isEmojiFontImport = true;
            } else if (args.containsKey("rex_pref_add_story_font")) {
                isFontImport = true;
                isStoryFontImport = true;
            } else if (args.containsKey("rex_import_initial_features")) {
                isInitialFeaturesImport = true;
            }
        }
        if (savedInstanceState == null) {
            if (destinationFile != null || isFontImport || isInitialFeaturesImport) {
                if (args != null && args.containsKey("rex_import_pref") && getActivity() != null) {
                    InboxLock.confirmIfLocked(getActivity(), this::requestFileForRestore, this::finishHost);
                } else {
                    requestFileForRestore();
                }
            } else {
                toast(str("rex_import_fail"));
                finishHost();
            }
        }
    }

    public void requestFileForRestore() {
        try {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("*/*");
            if (isFontImport && !isStoryFontImport) {
                intent.putExtra(Intent.EXTRA_MIME_TYPES, FONT_MIME_TYPES);
            }
            startActivityForResult(intent, READ_REQUEST_CODE);
        } catch (Exception e) {
            Logger.printException(() -> "requestFileForRestore failure", e);
            toast(str(e instanceof ActivityNotFoundException
                    ? "rex_file_picker_unavailable"
                    : "rex_import_fail"));
            finishHost();
        }
    }

    private void receiveFont(Context ctx, Uri uri) {
        new Thread(() -> {
            if (isStoryFontImport) {
                int count = FontStorage.importStoryFontsFromUri(ctx, uri);
                mainHandler.post(() -> {
                    if (count > 0) {
                        toast("Added " + count + " custom story font" + (count > 1 ? "s" : "") + "!");
                    } else {
                        toast(str("rex_pref_add_font_invalid"));
                    }
                    finishHost();
                });
                return;
            }
            FontStorage.ImportResult result = isEmojiFontImport
                    ? FontStorage.importEmojiFrom(ctx, uri)
                    : FontStorage.importFrom(ctx, uri);

            mainHandler.post(() -> {
                switch (result) {
                    case ADDED:
                        toast(isEmojiFontImport ? "Custom Emoji font applied!" : str("rex_pref_add_font_success"));
                        break;
                    case NOT_A_FONT:
                        toast(str("rex_pref_add_font_invalid"));
                        break;
                    case TOO_LARGE:
                        toast(str("rex_pref_add_font_too_large"));
                        break;
                    default:
                        toast(str("rex_pref_add_font_fail"));
                        break;
                }
                finishHost();
            });
        }).start();
    }

    private void receiveFileForRestore(Context ctx, Uri uri) {
        File tempFile = new File(destinationFile.getPath() + ".tmp");
        try {
            File parent = destinationFile.getParentFile();
            if (parent != null && !parent.exists()) {
                parent.mkdirs();
            }
            long total = 0;
            try (InputStream in = ctx.getContentResolver().openInputStream(uri);
                 FileOutputStream out = new FileOutputStream(tempFile)) {
                if (in == null) throw new IOException("Could not open " + uri);
                byte[] buffer = new byte[8192];
                int read;
                while ((read = in.read(buffer)) != -1) {
                    total += read;
                    if (total > MAX_RESTORE_BYTES) throw new IOException("File is too large to restore");
                    out.write(buffer, 0, read);
                }
            }

            if (isZipArchive(tempFile)) {
                boolean zipImported = handleZipPackageImport(ctx, tempFile);
                tempFile.delete();
                if (zipImported) {
                    HookFlags.load();
                    toast("Imported package successfully — restarting...");
                    Utils.restartApp(ctx);
                }
                return;
            }

            // Check if the picked JSON file is a Recommended Flags catalog (JSONArray of {name, desc, type, code})
            if (isRecommendedFlagsCatalogFile(tempFile)) {
                String content = new String(readStreamBytes(new FileInputStream(tempFile), MAX_RESTORE_BYTES), StandardCharsets.UTF_8);
                tempFile.delete();
                if (RecommendedFlags.importRecommendedFlagsJson(content)) {
                    toast("Imported Recommended Flags catalog successfully!");
                    Utils.restartApp(ctx);
                } else {
                    toast(str("rex_import_fail"));
                }
                return;
            }

            // Auto-route JSON override/mapping files even when selected from the general Import Settings button
            if (destinationFile.getName().endsWith(".xml") && isJsonFile(tempFile)) {
                File mcDir = new File(ctx.getFilesDir(), "mobileconfig");
                if (!mcDir.exists()) mcDir.mkdirs();
                destinationFile = new File(mcDir, isIdMappingJsonFile(tempFile) ? "id_name_mapping.json" : "mc_overrides.json");
            }

            if (!isValidRestoreFile(tempFile)) {
                tempFile.delete();
                toast(str("rex_import_fail"));
                return;
            }

            replaceWithBackupRollback(tempFile, destinationFile);

            if (destinationFile.getName().equals("mc_overrides.json")) {
                HookFlags.load();
            }
            toast(str("rex_import_success"));
            Utils.restartApp(ctx);

        } catch (Exception e) {
            tempFile.delete();
            toast(str("rex_import_fail"));
            Logger.printException(() -> "import failure", e);
        }
    }

    /**
     * Atomically replaces dest with stagedTemp, creating a .bak backup of dest first
     * and restoring .bak if anything fails.
     */
    public static void replaceWithBackupRollback(File stagedTemp, File dest) throws IOException {
        File parent = dest.getParentFile();
        if (parent != null && !parent.exists()) {
            parent.mkdirs();
        }
        File backup = new File(dest.getPath() + ".bak");
        boolean hadExisting = dest.exists() && dest.length() > 0;
        if (hadExisting) {
            copyFileBytes(dest, backup);
        }
        try {
            if (!stagedTemp.renameTo(dest)) {
                if (dest.exists() && !dest.delete()) {
                    throw new IOException("Could not remove existing file for atomic replace: " + dest);
                }
                if (!stagedTemp.renameTo(dest)) {
                    copyFileBytes(stagedTemp, dest);
                    stagedTemp.delete();
                }
            }
            if (!dest.exists() || dest.length() == 0) {
                throw new IOException("Destination file invalid after atomic replace: " + dest);
            }
            if (backup.exists()) {
                backup.delete();
            }
        } catch (IOException e) {
            if (hadExisting && backup.exists()) {
                try {
                    copyFileBytes(backup, dest);
                    backup.delete();
                } catch (Throwable ignored) {
                }
            }
            throw e;
        }
    }

    private static void copyFileBytes(File src, File dst) throws IOException {
        try (FileInputStream in = new FileInputStream(src);
             FileOutputStream out = new FileOutputStream(dst)) {
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) != -1) {
                out.write(buf, 0, n);
            }
            out.flush();
        }
    }

    private static boolean isJsonFile(File file) {
        if (file == null || !file.isFile() || file.length() == 0 || file.length() > MAX_RESTORE_BYTES) {
            return false;
        }
        try (InputStream in = new FileInputStream(file)) {
            byte[] head = new byte[(int) Math.min(file.length(), 512)];
            int n = in.read(head);
            if (n <= 0) return false;
            String s = new String(head, 0, n, StandardCharsets.UTF_8).trim();
            return s.startsWith("{") || s.startsWith("[");
        } catch (Exception ignored) {
            return false;
        }
    }

    private static boolean isRecommendedFlagsCatalogFile(File file) {
        if (!isJsonFile(file)) return false;
        try {
            String content = new String(readStreamBytes(new FileInputStream(file), MAX_RESTORE_BYTES), StandardCharsets.UTF_8).trim();
            if (!content.startsWith("[")) return false;
            JSONArray arr = new JSONArray(content);
            if (arr.length() == 0) return false;
            JSONObject first = arr.optJSONObject(0);
            return first != null && first.has("name") && first.has("code");
        } catch (Exception e) {
            return false;
        }
    }

    private static boolean isIdMappingJsonFile(File file) {
        if (!isJsonFile(file)) return false;
        try {
            String content = new String(readStreamBytes(new FileInputStream(file), MAX_RESTORE_BYTES), StandardCharsets.UTF_8).trim();
            if (!content.startsWith("[")) return false;
            JSONArray arr = new JSONArray(content);
            return arr.length() > 0 && arr.opt(0) instanceof String;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isZipArchive(File file) {
        if (file == null || file.length() < 4) return false;
        try (InputStream in = new FileInputStream(file)) {
            byte[] magic = new byte[4];
            if (in.read(magic) < 4) return false;
            return magic[0] == 0x50 && magic[1] == 0x4B && (magic[2] == 0x03 || magic[2] == 0x05 || magic[2] == 0x07);
        } catch (Exception ignored) {
            return false;
        }
    }

    /**
     * Validates and atomically imports a ZIP configuration archive:
     * - Enforces Zip Slip / path traversal checks (canonical path verification + '..' / leading slash rejection)
     * - Rejects duplicate entry names inside the archive
     * - Validates every JSON/XML payload in memory before touching existing files
     * - Backs up existing target files and rolls back all changes if any write fails
     */
    private boolean handleZipPackageImport(Context ctx, File zipFile) {
        File mcDir = new File(ctx.getFilesDir(), "mobileconfig");
        if (!mcDir.exists()) mcDir.mkdirs();

        Map<File, byte[]> stagedWrites = new LinkedHashMap<>();
        String stagedRecommendedFlagsJson = null;
        boolean sawEncryptedContainer = false;
        Set<String> seenEntryNames = new HashSet<>();

        try (ZipInputStream zis = new ZipInputStream(new FileInputStream(zipFile))) {
            String canonicalTargetRoot = ctx.getFilesDir().getCanonicalPath();
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                if (entry.isDirectory()) continue;
                String name = entry.getName();
                if (name == null || name.trim().isEmpty()) continue;

                // Zip Slip / path traversal defense
                if (name.contains("..") || name.startsWith("/") || name.startsWith("\\")) {
                    throw new SecurityException("Rejected unsafe ZIP entry path: " + name);
                }
                File candidatePath = new File(ctx.getFilesDir(), name);
                if (!candidatePath.getCanonicalPath().startsWith(canonicalTargetRoot)) {
                    throw new SecurityException("Zip Slip traversal detected: " + name);
                }

                String base = candidatePath.getName().toLowerCase(Locale.ROOT);
                if (base.isEmpty()) continue;
                if (!seenEntryNames.add(base)) {
                    throw new IOException("Duplicate configuration entry in ZIP archive: " + base);
                }

                byte[] data = readZipEntryBytes(zis, MAX_RESTORE_BYTES);
                if (data == null || data.length == 0) continue;

                if (base.endsWith(".json")) {
                    String jsonStr = new String(data, StandardCharsets.UTF_8);
                    JSONTokener tok = new JSONTokener(jsonStr);
                    Object parsed = tok.nextValue();
                    if (tok.nextClean() != 0) {
                        throw new IOException("Trailing garbage in JSON entry: " + base);
                    }
                    if (parsed instanceof JSONArray) {
                        JSONArray arr = (JSONArray) parsed;
                        if (arr.length() == 0) {
                            throw new IOException("Empty JSONArray in ZIP entry: " + base);
                        }
                        Object first = arr.get(0);
                        if (first instanceof JSONObject && ((JSONObject) first).has("code")) {
                            stagedRecommendedFlagsJson = jsonStr;
                        } else if (first instanceof String) {
                            for (int i = 0; i < arr.length(); i++) {
                                if (!(arr.get(i) instanceof String) || ((String) arr.get(i)).isEmpty()) {
                                    throw new IOException("Invalid id_name_mapping entry at index " + i);
                                }
                            }
                            stagedWrites.put(new File(mcDir, "id_name_mapping.json"), data);
                        }
                    } else if (parsed instanceof JSONObject) {
                        JSONObject obj = (JSONObject) parsed;
                        if (obj.length() == 0) {
                            throw new IOException("Empty JSONObject in ZIP entry: " + base);
                        }
                        if (base.contains("mapping")) {
                            stagedWrites.put(new File(mcDir, "id_name_mapping.json"), data);
                        } else {
                            stagedWrites.put(new File(mcDir, "mc_overrides.json"), data);
                        }
                    }
                } else if (base.endsWith(".xml") && !FocusLock.isActive()) {
                    try (InputStream xmlIn = new ByteArrayInputStream(data)) {
                        if (!isValidPreferences(xmlIn)) {
                            throw new IOException("Invalid SharedPreferences XML in ZIP: " + base);
                        }
                        File prefsDest = new File(ctx.getApplicationInfo().dataDir + "/shared_prefs", Constants.REX_SETTINGS + ".xml");
                        stagedWrites.put(prefsDest, data);
                    }
                } else if (base.contains("mc_overrides") || base.contains("id_name_mapping")) {
                    sawEncryptedContainer = true;
                }
            }
        } catch (Exception e) {
            Logger.printException(() -> "ZIP package validation failure", e);
            toast(str("rex_import_fail"));
            return false;
        }

        if (sawEncryptedContainer && stagedWrites.isEmpty() && stagedRecommendedFlagsJson == null) {
            try {
                int rawId = ctx.getResources().getIdentifier("instarex_pro_config_v6", "raw", ctx.getPackageName());
                if (rawId != 0) {
                    byte[] fallbackBytes = readStreamBytes(ctx.getResources().openRawResource(rawId), MAX_RESTORE_BYTES);
                    if (fallbackBytes != null && fallbackBytes.length > 0) {
                        stagedWrites.put(new File(mcDir, "mc_overrides.json"), fallbackBytes);
                    }
                }
            } catch (Throwable ignored) {
            }
        }

        if (stagedWrites.isEmpty() && stagedRecommendedFlagsJson == null) {
            toast(str("rex_import_fail"));
            return false;
        }

        // Apply all staged writes transactionally with backup & rollback
        Map<File, File> backups = new LinkedHashMap<>();
        try {
            for (Map.Entry<File, byte[]> entry : stagedWrites.entrySet()) {
                File dest = entry.getKey();
                if (dest.exists() && dest.length() > 0) {
                    File bak = new File(dest.getPath() + ".zipbak");
                    copyFileBytes(dest, bak);
                    backups.put(dest, bak);
                }
                writeAtomic(dest, entry.getValue());
            }
            if (stagedRecommendedFlagsJson != null) {
                if (!RecommendedFlags.importRecommendedFlagsJson(stagedRecommendedFlagsJson)) {
                    throw new IOException("Failed to import Recommended Flags JSON from ZIP");
                }
            }
            for (File bak : backups.values()) {
                if (bak.exists()) bak.delete();
            }
            return true;
        } catch (Exception e) {
            for (Map.Entry<File, File> b : backups.entrySet()) {
                try {
                    if (b.getValue().exists()) {
                        copyFileBytes(b.getValue(), b.getKey());
                        b.getValue().delete();
                    }
                } catch (Throwable ignored) {
                }
            }
            Logger.printException(() -> "ZIP package atomic commit rollback", e);
            toast(str("rex_import_fail"));
            return false;
        }
    }

    private static byte[] readStreamBytes(InputStream in, long maxBytes) throws IOException {
        try (InputStream autoClose = in) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            long total = 0;
            int n;
            while ((n = autoClose.read(buf)) != -1) {
                total += n;
                if (total > maxBytes) throw new IOException("Stream exceeds size limit");
                baos.write(buf, 0, n);
            }
            return baos.toByteArray();
        }
    }

    private static byte[] readZipEntryBytes(ZipInputStream zis, long maxBytes) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        long total = 0;
        int n;
        while ((n = zis.read(buf)) != -1) {
            total += n;
            if (total > maxBytes) throw new IOException("ZIP entry exceeds size limit");
            baos.write(buf, 0, n);
        }
        return baos.toByteArray();
    }

    private static void writeAtomic(File dest, byte[] data) throws IOException {
        File parent = dest.getParentFile();
        if (parent != null && !parent.exists()) parent.mkdirs();
        File tmp = new File(dest.getPath() + ".tmp");
        try (FileOutputStream fos = new FileOutputStream(tmp)) {
            fos.write(data);
            fos.flush();
        }
        replaceWithBackupRollback(tmp, dest);
    }

    private boolean isValidRestoreFile(File file) {
        try {
            if (destinationFile.getName().endsWith(".xml")) {
                try (InputStream in = new FileInputStream(file)) {
                    return isValidPreferences(in);
                }
            }
            byte[] bytes = new byte[(int) file.length()];
            try (InputStream in = new FileInputStream(file)) {
                int offset = 0;
                while (offset < bytes.length) {
                    int read = in.read(bytes, offset, bytes.length - offset);
                    if (read < 0) return false;
                    offset += read;
                }
            }
            JSONTokener tokener = new JSONTokener(new String(bytes, StandardCharsets.UTF_8));
            Object json = tokener.nextValue();
            if (tokener.nextClean() != 0) return false;
            if (destinationFile.getName().equals("id_name_mapping.json")) {
                if (!(json instanceof JSONArray) || ((JSONArray) json).length() == 0) return false;
                JSONArray array = (JSONArray) json;
                for (int i = 0; i < array.length(); i++) {
                    if (!(array.get(i) instanceof String) || ((String) array.get(i)).isEmpty()) return false;
                }
                return true;
            }
            if (json instanceof JSONObject) {
                return ((JSONObject) json).length() > 0;
            }
            if (json instanceof JSONArray) {
                return ((JSONArray) json).length() > 0;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    /** Checks the whole SharedPreferences document: every entry, its type and its value. */
    private static boolean isValidPreferences(InputStream in) throws Exception {
        XmlPullParser parser = Xml.newPullParser();
        parser.setInput(in, null);
        Set<String> names = new HashSet<>();
        String setName = null;
        boolean sawRoot = false;
        int depth = 0;
        boolean inPrimitive = false;
        for (int event = parser.getEventType(); event != XmlPullParser.END_DOCUMENT; event = parser.next()) {
            if (event == XmlPullParser.END_TAG) {
                if (depth == 2) inPrimitive = false;
                depth--;
                continue;
            }
            if (event == XmlPullParser.TEXT && inPrimitive) return false;
            if (event != XmlPullParser.START_TAG) continue;
            depth++;
            String tag = parser.getName();
            if (depth == 1) {
                if (sawRoot || !"map".equals(tag)) return false;
                sawRoot = true;
            } else if (depth == 2) {
                String name = parser.getAttributeValue(null, "name");
                if (name == null || name.isEmpty() || !names.add(name)) return false;
                String value = parser.getAttributeValue(null, "value");
                setName = null;
                switch (tag) {
                    case "boolean":
                        if (!"true".equals(value) && !"false".equals(value)) return false;
                        break;
                    case "int":
                        Integer.parseInt(value);
                        break;
                    case "long":
                        Long.parseLong(value);
                        break;
                    case "float":
                        if (!Float.isFinite(Float.parseFloat(value))) return false;
                        break;
                    case "string":
                        break;
                    case "set":
                        setName = name;
                        break;
                    default:
                        return false;
                }
                inPrimitive = !"string".equals(tag) && !"set".equals(tag);
            } else if (depth != 3 || setName == null || !"string".equals(tag)) {
                return false;
            }
        }
        return sawRoot && depth == 0;
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
        super.onActivityResult(requestCode, resultCode, intent);

        if (resultCode == Activity.RESULT_CANCELED) {
            finishHost();
            return;
        }

        if (requestCode == READ_REQUEST_CODE && resultCode == Activity.RESULT_OK && intent != null) {
            Uri uri = intent.getData();
            Context ctx = getActivity() != null ? getActivity() : context;
            if (uri == null) {
                toast(str("rex_fail_no_path"));
            } else if (isFontImport) {
                receiveFont(ctx, uri);
                return;
            } else if (isInitialFeaturesImport) {
                try (InputStream in = ctx.getContentResolver().openInputStream(uri)) {
                    if (in != null) {
                        ByteArrayOutputStream bos = new ByteArrayOutputStream();
                        byte[] buf = new byte[4096];
                        int r;
                        while ((r = in.read(buf)) != -1) bos.write(buf, 0, r);
                        int count = app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.importJsonConfig(
                                new String(bos.toByteArray(), StandardCharsets.UTF_8));
                        toast(count > 0 ? ("Imported " + count + " Initial Features overrides") : str("rex_import_fail"));
                        app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(ctx);
                    }
                } catch (Exception e) {
                    Logger.printException(() -> "InitialFeatures import failed", e);
                    toast(str("rex_import_fail"));
                }
            } else {
                receiveFileForRestore(ctx, uri);
            }
        }
        finishHost();
    }

    private void finishHost() {
        Activity activity = getActivity();
        if (activity == null) return;
        if (inlineHosted) {
            try {
                activity.getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
            } catch (Throwable ignored) {}
        } else {
            activity.finish();
        }
    }

    private static void toast(String msg) {
        Utils.showToastShort(msg);
    }
}
