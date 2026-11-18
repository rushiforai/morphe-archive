/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.customise.font;

import android.content.Context;
import android.graphics.Typeface;
import android.net.Uri;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.SettingsRestart;
import app.morphe.extension.instagram.settings.RestartPolicy;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Manages:
 * 1) App-wide Custom Font ("custom_font.ttf" & bundled iOS fonts 01..05)
 * 2) App-wide Custom Emoji Font ("custom_emoji.ttf" & downloadable iOS 26.4 / 18.4 / 17.4 / 14.5 / Facebook / Joy Pixel / Samsung packs)
 * 3) Custom Story Fonts ("story_fonts/" directory & Official / AnshulDixit / Askxtylishh / Affan / Valentines packs + local .ttf/.otf/.zip imports)
 */
public final class FontStorage {

    public enum ImportResult {
        ADDED,
        NOT_A_FONT,
        TOO_LARGE,
        FAILED,
    }

    public enum DeleteResult {
        DELETED,
        NOT_FOUND,
        FAILED,
    }

    static final String SYSTEM_FONT_FAMILY = "sans-serif";
    private static final String FILE_NAME = "custom_font.ttf";
    private static final String EMOJI_FILE_NAME = "custom_emoji.ttf";
    private static final String EMOJI_PACKS_DIR = "emoji_packs";
    private static final String FONT_PACKS_DIR = "font_packs";
    private static final String STORY_FONTS_DIR = "story_fonts";
    private static final long MAX_SIZE_BYTES = 64L * 1024 * 1024;

    private static final ConcurrentHashMap<String, Typeface> BUNDLED_TYPEFACE_CACHE =
            new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Typeface> STORY_FILE_TYPEFACE_CACHE =
            new ConcurrentHashMap<>();

    private FontStorage() {
    }

    public static boolean useSystemFont() {
        return Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.USE_SYSTEM_FONT));
    }

    public static void setUseSystemFont(boolean enabled) {
        boolean previous = useSystemFont();
        if (SharedPref.setBooleanPref(Settings.USE_SYSTEM_FONT.key, enabled)) {
            SettingsRestart.markChanged(Settings.USE_SYSTEM_FONT.key, previous, enabled);
        }
        CustomFont.reload();
    }

    private static File filesDir() {
        Context ctx = Utils.getContext();
        return ctx != null ? ctx.getFilesDir() : null;
    }

    private static File file() {
        File dir = filesDir();
        return dir == null ? null : new File(dir, FILE_NAME);
    }

    private static File emojiFile() {
        File dir = filesDir();
        return dir == null ? null : new File(dir, EMOJI_FILE_NAME);
    }

    public static File emojiPacksDir(Context context) {
        Context ctx = context != null ? context : Utils.getContext();
        File dir = new File(ctx.getFilesDir(), EMOJI_PACKS_DIR);
        if (!dir.exists()) dir.mkdirs();
        return dir;
    }

    public static File fontPacksDir(Context context) {
        Context ctx = context != null ? context : Utils.getContext();
        File dir = new File(ctx.getFilesDir(), FONT_PACKS_DIR);
        if (!dir.exists()) dir.mkdirs();
        return dir;
    }

    public static File storyFontsDir(Context context) {
        Context ctx = context != null ? context : Utils.getContext();
        if (ctx == null) return null;
        File dir = new File(ctx.getFilesDir(), STORY_FONTS_DIR);
        if (!dir.exists()) dir.mkdirs();
        return dir;
    }

    public static boolean hasFile() {
        File file = file();
        return file != null && file.isFile() && file.length() > 0;
    }

    public static boolean hasEmojiFile() {
        File file = emojiFile();
        return file != null && file.isFile() && file.length() > 0;
    }

    public static Typeface loadTypeface() {
        if (!hasFile()) {
            return null;
        }
        Typeface typeface = parse(file());
        if (typeface == null) {
            Logger.printException(() -> "Failed to load the custom font");
        }
        return typeface;
    }

    public static Typeface loadEmojiTypeface() {
        File ef = emojiFile();
        if (ef == null || !ef.isFile() || ef.length() == 0) {
            return null;
        }
        try {
            Typeface tf = Typeface.createFromFile(ef);
            if (tf != null && tf != Typeface.DEFAULT) {
                return tf;
            }
        } catch (Throwable e) {
            Logger.printException(() -> "Failed to load custom emoji font", e);
        }
        return null;
    }

    public static DeleteResult delete() {
        File file = file();
        if (file == null || !file.exists()) {
            return DeleteResult.NOT_FOUND;
        }
        try {
            String previous = fingerprint(file);
            if (!file.delete()) {
                return DeleteResult.FAILED;
            }
            SettingsRestart.markChanged(FILE_NAME, RestartPolicy.REQUIRED, previous, null);
            CustomFont.reload();
            return DeleteResult.DELETED;
        } catch (Exception e) {
            Logger.printException(() -> "Failed to delete the custom font", e);
            return DeleteResult.FAILED;
        }
    }

    public static boolean clearEmojiFont() {
        File ef = emojiFile();
        boolean ok = ef == null || !ef.exists() || ef.delete();
        SharedPref.setStringPref(Settings.CHOOSE_EMOJI_TYPE.key, "Original Emoji");
        CustomFont.reload();
        return ok;
    }

    public static ImportResult importFrom(Context context, Uri uri) {
        return importFontToTarget(context, uri, file(), true);
    }

    public static ImportResult importEmojiFrom(Context context, Uri uri) {
        ImportResult res = importFontToTarget(context, uri, emojiFile(), false);
        if (res == ImportResult.ADDED) {
            SharedPref.setStringPref(Settings.CHOOSE_EMOJI_TYPE.key, "From Local Storage");
            CustomFont.reload();
        }
        return res;
    }

    private static ImportResult importFontToTarget(Context context, Uri uri, File destination, boolean checkAlpha) {
        if (destination == null) return ImportResult.FAILED;
        File temp = new File(destination.getParentFile(), destination.getName() + ".tmp");

        try {
            try (InputStream in = context.getContentResolver().openInputStream(uri)) {
                if (in == null) {
                    return ImportResult.FAILED;
                }
                byte[] header = new byte[4];
                if (!readFully(in, header) || !isFontHeader(header)) {
                    return ImportResult.NOT_A_FONT;
                }
                try (OutputStream out = new FileOutputStream(temp)) {
                    out.write(header);
                    byte[] buffer = new byte[8192];
                    long total = header.length;
                    int read;
                    while ((read = in.read(buffer)) != -1) {
                        total += read;
                        if (total > MAX_SIZE_BYTES) {
                            return ImportResult.TOO_LARGE;
                        }
                        out.write(buffer, 0, read);
                    }
                }
            }

            if (checkAlpha) {
                if (parse(temp) == null) {
                    return ImportResult.NOT_A_FONT;
                }
            } else {
                Typeface tf = Typeface.createFromFile(temp);
                if (tf == null || tf == Typeface.DEFAULT || !hasValidEmojiGlyphs(tf)) {
                    return ImportResult.NOT_A_FONT;
                }
            }

            String previous = fingerprint(destination);
            String next = fingerprint(temp);
            if (!temp.renameTo(destination)) {
                if (destination.exists()) destination.delete();
                if (!temp.renameTo(destination)) {
                    throw new IOException("Could not move the imported font into place");
                }
            }
            SettingsRestart.markChanged(destination.getName(), RestartPolicy.REQUIRED, previous, next);
            CustomFont.reload();
            return ImportResult.ADDED;
        } catch (Exception e) {
            Logger.printException(() -> "Failed to add a custom font", e);
            return ImportResult.FAILED;
        } finally {
            if (temp.exists() && !temp.delete()) {
                Logger.printException(() -> "Failed to remove a partly written font");
            }
        }
    }

    /**
     * Imports a single .ttf/.otf font OR a .zip pack of story fonts from local storage into story_fonts/.
     */
    public static int importStoryFontsFromUri(Context context, Uri uri) {
        if (context == null || uri == null) return 0;
        File dir = storyFontsDir(context);
        if (dir == null) return 0;
        File temp = new File(context.getCacheDir(), "story_font_import.tmp");
        try {
            try (InputStream in = context.getContentResolver().openInputStream(uri);
                 OutputStream out = new FileOutputStream(temp)) {
                if (in == null) return 0;
                byte[] buf = new byte[8192];
                long total = 0;
                int n;
                while ((n = in.read(buf)) != -1) {
                    total += n;
                    if (total > MAX_SIZE_BYTES) return 0;
                    out.write(buf, 0, n);
                }
            }
            int added = 0;
            if (isZipFile(temp)) {
                try (ZipInputStream zis = new ZipInputStream(new FileInputStream(temp))) {
                    ZipEntry entry;
                    while ((entry = zis.getNextEntry()) != null) {
                        if (entry.isDirectory()) continue;
                        String name = new File(entry.getName()).getName();
                        String lower = name.toLowerCase(Locale.ROOT);
                        if (!lower.endsWith(".ttf") && !lower.endsWith(".otf")) continue;
                        File outFont = new File(dir, sanitizeFileName(name));
                        try (FileOutputStream fos = new FileOutputStream(outFont)) {
                            byte[] buf = new byte[8192];
                            int n;
                            while ((n = zis.read(buf)) != -1) fos.write(buf, 0, n);
                        }
                        if (parse(outFont) != null) {
                            added++;
                        } else {
                            outFont.delete();
                        }
                    }
                }
            } else {
                byte[] header = new byte[4];
                try (FileInputStream fis = new FileInputStream(temp)) {
                    if (readFully(fis, header) && isFontHeader(header)) {
                        String fileName = "custom_story_" + (System.currentTimeMillis() % 100000) + ".ttf";
                        File outFont = new File(dir, fileName);
                        copyFile(temp, outFont);
                        if (parse(outFont) != null) {
                            added = 1;
                        } else {
                            outFont.delete();
                        }
                    }
                }
            }
            if (added > 0) {
                STORY_FILE_TYPEFACE_CACHE.clear();
                syncToSuiteStoryFonts(context, dir);
                CustomFont.reload();
            }
            return added;
        } catch (Exception e) {
            Logger.printException(() -> "Failed to import story fonts", e);
            return 0;
        } finally {
            if (temp.exists()) temp.delete();
        }
    }

    private static void syncToSuiteStoryFonts(Context context, File storyDir) {
        try {
            File suiteDir = new File(context.getFilesDir(), "xboyrex-story-fonts");
            if (!suiteDir.exists()) suiteDir.mkdirs();
            File[] files = storyDir.listFiles();
            if (files != null) {
                for (File f : files) {
                    if (f.isFile() && (f.getName().endsWith(".ttf") || f.getName().endsWith(".otf"))) {
                        copyFile(f, new File(suiteDir, f.getName()));
                    }
                }
            }
            app.morphe.extension.suite.instagram.settings.Settings.STORY_FONTS.save(true);
            app.morphe.extension.suite.instagram.stories.StoryFonts.installed();
        } catch (Throwable ignored) {
        }
    }

    public static int installStoryFontPack(Context context, String packName) {
        if (context == null || packName == null) return 0;
        File dir = storyFontsDir(context);
        if (dir == null) return 0;

        String[] rawNames;
        String prefix;
        switch (packName) {
            case "Official Fonts Pack":
                prefix = "official_";
                rawNames = new String[]{
                        "rex_font_ios_classic", "rex_font_ios_modern", "rex_font_ios_neon",
                        "rex_font_ios_typewriter", "rex_font_ios_strong", "rex_font_ios_elegant",
                        "rex_font_ios_literature", "rex_font_ios_beach", "rex_font_ios_directional",
                        "rex_font_ios_papyrus", "rex_font_ios_hindi", "rex_font_ios_indic",
                        "rex_font_ios_extrabold_ct", "rex_font_ios_semibold_lite_ct"
                };
                break;
            case "AnshulDixit Fonts Pack":
                prefix = "anshul_";
                rawNames = new String[]{
                        "rex_font_ios_extrabold_ct", "rex_font_ios_strong", "rex_font_ios_modern",
                        "rex_font_ios_directional", "rex_font_ios_neon", "rex_font_ios_hindi",
                        "rex_font_ios_indic", "rex_font_ios_classic"
                };
                break;
            case "Askxtylishh Fonts Pack":
                prefix = "askxtylishh_";
                rawNames = new String[]{
                        "rex_font_ios_elegant", "rex_font_ios_literature", "rex_font_ios_neon",
                        "rex_font_ios_papyrus", "rex_font_ios_beach", "rex_font_ios_semibold_lite_ct",
                        "rex_font_ios_typewriter"
                };
                break;
            case "Affan Fonts Pack":
                prefix = "affan_";
                rawNames = new String[]{
                        "rex_font_ios_semibold_lite_ct", "rex_font_ios_extrabold_ct", "rex_font_ios_classic",
                        "rex_font_ios_modern", "rex_font_ios_strong", "rex_font_ios_directional"
                };
                break;
            case "Valentines Fonts Pack":
                prefix = "valentines_";
                rawNames = new String[]{
                        "rex_font_ios_neon", "rex_font_ios_elegant", "rex_font_ios_literature",
                        "rex_font_ios_papyrus", "rex_font_ios_beach", "rex_font_ios_semibold_lite_ct"
                };
                break;
            default:
                return 0;
        }

        int installed = 0;
        for (String rawRes : rawNames) {
            int rawId = context.getResources().getIdentifier(rawRes, "raw", context.getPackageName());
            if (rawId == 0) continue;
            File out = new File(dir, prefix + rawRes + ".ttf");
            try (InputStream in = context.getResources().openRawResource(rawId);
                 OutputStream fos = new FileOutputStream(out)) {
                byte[] buf = new byte[8192];
                int n;
                while ((n = in.read(buf)) != -1) fos.write(buf, 0, n);
                installed++;
            } catch (Exception ignored) {
            }
        }
        if (installed > 0) {
            SharedPref.setBooleanPref("rex_story_pack_" + sanitizeFileName(packName), true);
            STORY_FILE_TYPEFACE_CACHE.clear();
            syncToSuiteStoryFonts(context, dir);
            CustomFont.reload();
        }
        return installed;
    }

    public static boolean isStoryFontPackInstalled(Context context, String packName) {
        if (packName == null) return false;
        return Boolean.TRUE.equals(SharedPref.getBooleanPref("rex_story_pack_" + sanitizeFileName(packName), false));
    }

    public static void resetStoryFonts(Context context) {
        File dir = storyFontsDir(context);
        if (dir != null && dir.isDirectory()) {
            File[] files = dir.listFiles();
            if (files != null) {
                for (File f : files) f.delete();
            }
        }
        try {
            File suiteDir = new File(context.getFilesDir(), "xboyrex-story-fonts");
            if (suiteDir.isDirectory()) {
                File[] files = suiteDir.listFiles();
                if (files != null) {
                    for (File f : files) f.delete();
                }
            }
        } catch (Throwable ignored) {}
        for (String pack : new String[]{
                "Official Fonts Pack", "AnshulDixit Fonts Pack",
                "Askxtylishh Fonts Pack", "Affan Fonts Pack", "Valentines Fonts Pack"}) {
            SharedPref.setBooleanPref("rex_story_pack_" + sanitizeFileName(pack), false);
        }
        STORY_FILE_TYPEFACE_CACHE.clear();
        CustomFont.reload();
    }

    public static boolean isEmojiPackDownloaded(Context context, String emojiChoiceName) {
        if (context == null || emojiChoiceName == null) return false;
        File packFile = new File(emojiPacksDir(context), sanitizeFileName(emojiChoiceName) + ".ttf");
        return packFile.isFile() && packFile.length() > 1024;
    }

    /**
     * Downloads or provisions the requested Emoji pack ("iOS 26.4", "iOS 18.4", "iOS 17.4", "iOS 14.5",
     * "Facebook", "Joy Pixel", "Samsung") into filesDir/emoji_packs/<name>.ttf.
     */
    public static boolean downloadEmojiPackSync(Context context, String emojiChoiceName) {
        if (context == null || emojiChoiceName == null) return false;
        File target = new File(emojiPacksDir(context), sanitizeFileName(emojiChoiceName) + ".ttf");
        if (target.isFile() && target.length() > 1024) return true;

        String[] urls = emojiPackUrls(emojiChoiceName);
        File temp = new File(emojiPacksDir(context), sanitizeFileName(emojiChoiceName) + ".tmp");
        for (String url : urls) {
            HttpURLConnection conn = null;
            try {
                conn = (HttpURLConnection) new URL(url).openConnection();
                conn.setInstanceFollowRedirects(true);
                conn.setConnectTimeout(15000);
                conn.setReadTimeout(40000);
                conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android 14)");
                int code = conn.getResponseCode();
                if (code == HttpURLConnection.HTTP_OK) {
                    try (InputStream in = conn.getInputStream();
                         FileOutputStream out = new FileOutputStream(temp)) {
                        byte[] buf = new byte[16384];
                        long total = 0;
                        int n;
                        while ((n = in.read(buf)) != -1) {
                            total += n;
                            if (total > MAX_SIZE_BYTES) break;
                            out.write(buf, 0, n);
                        }
                    }
                    if (temp.isFile() && temp.length() > 1024) {
                        Typeface tf = Typeface.createFromFile(temp);
                        if (tf != null && tf != Typeface.DEFAULT) {
                            if (target.exists()) target.delete();
                            if (temp.renameTo(target)) return true;
                        }
                    }
                }
            } catch (Throwable ignored) {
            } finally {
                if (conn != null) conn.disconnect();
                if (temp.exists()) temp.delete();
            }
        }
        return false;
    }

    public static boolean applyEmojiPack(Context context, String emojiChoiceName) {
        if (context == null || emojiChoiceName == null) return false;
        if ("Original Emoji".equals(emojiChoiceName) || "System Default".equals(emojiChoiceName)) {
            return clearEmojiFont();
        }
        File source = new File(emojiPacksDir(context), sanitizeFileName(emojiChoiceName) + ".ttf");
        if (!source.isFile() || source.length() <= 1024) {
            return false;
        }
        File dest = emojiFile();
        if (dest == null) return false;
        try {
            String prev = fingerprint(dest);
            copyFile(source, dest);
            String next = fingerprint(dest);
            SharedPref.setStringPref(Settings.CHOOSE_EMOJI_TYPE.key, emojiChoiceName);
            SettingsRestart.markChanged(EMOJI_FILE_NAME, RestartPolicy.REQUIRED, prev, next);
            CustomFont.reload();
            return true;
        } catch (Exception e) {
            Logger.printException(() -> "Failed to apply emoji pack", e);
            return false;
        }
    }

    private static String[] emojiPackUrls(String emojiChoiceName) {
        switch (emojiChoiceName) {
            case "iOS 26.4":
            case "iOS 18.4":
            case "iOS 17.4":
            case "iOS 14.5":
                return new String[]{
                        "https://github.com/Samuelngs/apple-emoji-linux/releases/latest/download/AppleColorEmoji.ttf",
                        "https://raw.githubusercontent.com/Checkra1n/AppleColorEmoji/master/AppleColorEmoji.ttf",
                        "https://github.com/C1710/blobmoji/releases/download/v15.0/Blobmoji.ttf",
                        "https://github.com/mozilla/twemoji-colr/releases/download/v0.7.0/Twemoji.Mozilla.ttf"
                };
            case "Facebook":
                return new String[]{
                        "https://github.com/mozilla/twemoji-colr/releases/download/v0.7.0/Twemoji.Mozilla.ttf",
                        "https://raw.githubusercontent.com/hfg-gmuend/openmoji/17.0.0/font/OpenMoji-color-cbdt/OpenMoji-color-cbdt.ttf"
                };
            case "Joy Pixel":
                return new String[]{
                        "https://raw.githubusercontent.com/hfg-gmuend/openmoji/17.0.0/font/OpenMoji-color-cbdt/OpenMoji-color-cbdt.ttf",
                        "https://github.com/mozilla/twemoji-colr/releases/download/v0.7.0/Twemoji.Mozilla.ttf"
                };
            case "Samsung":
                return new String[]{
                        "https://github.com/C1710/blobmoji/releases/download/v15.0/Blobmoji.ttf",
                        "https://github.com/mozilla/twemoji-colr/releases/download/v0.7.0/Twemoji.Mozilla.ttf"
                };
            default:
                return new String[]{
                        "https://github.com/mozilla/twemoji-colr/releases/download/v0.7.0/Twemoji.Mozilla.ttf"
                };
        }
    }

    public static boolean isFontPresetReady(Context context, String fontDisplayName) {
        if (context == null || fontDisplayName == null) return false;
        File cached = new File(fontPacksDir(context), sanitizeFileName(fontDisplayName) + ".ttf");
        if (cached.isFile() && cached.length() > 0) return true;
        return Boolean.TRUE.equals(SharedPref.getBooleanPref("rex_font_ready_" + sanitizeFileName(fontDisplayName), false));
    }

    public static boolean prepareBundledFontPreset(Context context, String fontDisplayName) {
        if (context == null || fontDisplayName == null) return false;
        String rawResName = rawResourceForFontName(fontDisplayName);
        if (rawResName == null) return false;
        int rawId = context.getResources().getIdentifier(rawResName, "raw", context.getPackageName());
        if (rawId == 0) return false;
        File cached = new File(fontPacksDir(context), sanitizeFileName(fontDisplayName) + ".ttf");
        try (InputStream in = context.getResources().openRawResource(rawId);
             OutputStream out = new FileOutputStream(cached)) {
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) != -1) out.write(buf, 0, n);
            SharedPref.setBooleanPref("rex_font_ready_" + sanitizeFileName(fontDisplayName), true);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean applyBundledFont(Context context, String fontDisplayName) {
        if (context == null || fontDisplayName == null) return false;
        String rawResName = rawResourceForFontName(fontDisplayName);
        if (rawResName == null) return false;
        int rawId = context.getResources().getIdentifier(rawResName, "raw", context.getPackageName());
        if (rawId == 0) return false;

        File destination = file();
        if (destination == null) return false;
        File temp = new File(destination.getParentFile(), FILE_NAME + ".tmp");
        try (InputStream in = context.getResources().openRawResource(rawId);
             OutputStream out = new FileOutputStream(temp)) {
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }
        } catch (Exception e) {
            if (temp.exists()) temp.delete();
            return false;
        }

        if (parse(temp) == null) {
            temp.delete();
            return false;
        }
        try {
            String previous = fingerprint(destination);
            String next = fingerprint(temp);
            if (!temp.renameTo(destination)) {
                if (destination.exists()) destination.delete();
                if (!temp.renameTo(destination)) return false;
            }
            SharedPref.setBooleanPref("rex_font_ready_" + sanitizeFileName(fontDisplayName), true);
            setUseSystemFont(false);
            SettingsRestart.markChanged(FILE_NAME, RestartPolicy.REQUIRED, previous, next);
            CustomFont.reload();
            return true;
        } catch (Exception e) {
            if (temp.exists()) temp.delete();
            return false;
        }
    }

    public static String rawResourceForFontName(String name) {
        if (name == null) return null;
        switch (name) {
            case "iOS San Francisco":
            case "iOS Font 02":
            case "iOS Semibold Lite CT 2026":
                return "rex_font_ios_semibold_lite_ct";
            case "Instagram Sans":
            case "iOS Font 04":
            case "iOS Story Modern":
                return "rex_font_ios_modern";
            case "Google Sans":
            case "iOS Font 03":
            case "iOS Story Classic":
                return "rex_font_ios_classic";
            case "iOS Font 01":
            case "iOS ExtraBold CT 2026":
                return "rex_font_ios_extrabold_ct";
            case "iOS Font 05":
            case "iOS Story Elegant":
                return "rex_font_ios_elegant";
            case "iOS Story Neon":
                return "rex_font_ios_neon";
            case "iOS Story Typewriter":
                return "rex_font_ios_typewriter";
            case "iOS Story Strong":
                return "rex_font_ios_strong";
            case "iOS Story Literature":
                return "rex_font_ios_literature";
            case "iOS Story Beach":
                return "rex_font_ios_beach";
            case "iOS Story Directional":
                return "rex_font_ios_directional";
            case "iOS Story Papyrus":
                return "rex_font_ios_papyrus";
            case "iOS Story Hindi":
                return "rex_font_ios_hindi";
            case "iOS Story Hindi/Gujarati/Marathi":
                return "rex_font_ios_indic";
            default:
                return null;
        }
    }

    public static Typeface loadBundledTypefaceByRawName(String rawResName) {
        if (rawResName == null || rawResName.isEmpty()) return null;
        Typeface cached = BUNDLED_TYPEFACE_CACHE.get(rawResName);
        if (cached != null) return cached;
        Context ctx = Utils.getContext();
        if (ctx == null || ctx.getResources() == null) return null;
        int rawId = ctx.getResources().getIdentifier(rawResName, "raw", ctx.getPackageName());
        if (rawId == 0) return null;
        File cacheFile = new File(ctx.getCacheDir(), rawResName + ".ttf");
        if (!cacheFile.isFile() || cacheFile.length() == 0) {
            try (InputStream in = ctx.getResources().openRawResource(rawId);
                 OutputStream out = new FileOutputStream(cacheFile)) {
                byte[] buf = new byte[8192];
                int n;
                while ((n = in.read(buf)) != -1) out.write(buf, 0, n);
            } catch (Exception e) {
                return null;
            }
        }
        Typeface tf = parse(cacheFile);
        if (tf != null) {
            BUNDLED_TYPEFACE_CACHE.put(rawResName, tf);
        }
        return tf;
    }

    public static boolean isStoryFontDescriptorName(String descriptorStr) {
        if (descriptorStr == null || descriptorStr.isEmpty()) return false;
        String upper = descriptorStr.toUpperCase(Locale.ROOT);
        return upper.contains("CLASSIC") || upper.contains("MODERN") || upper.contains("NEON")
                || upper.contains("TYPEWRITER") || upper.contains("STRONG") || upper.contains("SIGNATURE")
                || upper.contains("ELEGANT") || upper.contains("LITERATURE") || upper.contains("BEACH")
                || upper.contains("MEME") || upper.contains("DIRECTIONAL") || upper.contains("PAPYRUS")
                || upper.contains("HINDI") || upper.contains("INDIC") || upper.contains("AVENY")
                || upper.contains("COSMOPOLITAN") || upper.contains("FREIGHT") || upper.contains("KOULEN");
    }

    public static Typeface resolveStoryDescriptorTypeface(String descriptorStr) {
        if (descriptorStr == null) return null;
        if (!Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.ENABLE_STORY_FONTS))) return null;
        String storySource = SharedPref.getStringPref(Settings.STORY_FONT_SOURCE);
        if ("Default Story Fonts".equalsIgnoreCase(storySource)) return null;
        Context ctx = Utils.getContext();
        if (ctx != null) {
            File dir = storyFontsDir(ctx);
            if (dir != null && dir.isDirectory()) {
                File[] customFiles = dir.listFiles((d, name) ->
                        name.toLowerCase(Locale.ROOT).endsWith(".ttf") || name.toLowerCase(Locale.ROOT).endsWith(".otf"));
                if (customFiles != null && customFiles.length > 0) {
                    Arrays.sort(customFiles, (a, b) -> a.getName().compareToIgnoreCase(b.getName()));
                    for (File f : customFiles) {
                        String stem = f.getName().toLowerCase(Locale.ROOT);
                        String descLower = descriptorStr.toLowerCase(Locale.ROOT);
                        if ((descLower.contains("classic") && stem.contains("classic"))
                                || (descLower.contains("modern") && stem.contains("modern"))
                                || (descLower.contains("neon") && stem.contains("neon"))
                                || (descLower.contains("typewriter") && stem.contains("typewriter"))
                                || (descLower.contains("strong") && stem.contains("strong"))
                                || (descLower.contains("elegant") && stem.contains("elegant"))
                                || (descLower.contains("literature") && stem.contains("literature"))
                                || (descLower.contains("beach") && stem.contains("beach"))
                                || (descLower.contains("directional") && stem.contains("directional"))
                                || (descLower.contains("papyrus") && stem.contains("papyrus"))
                                || (descLower.contains("hindi") && stem.contains("hindi"))
                                || (descLower.contains("indic") && stem.contains("indic"))) {
                            return loadStoryFileTypeface(f);
                        }
                    }
                    int idx = Math.abs(descriptorStr.hashCode()) % customFiles.length;
                    Typeface customTf = loadStoryFileTypeface(customFiles[idx]);
                    if (customTf != null) return customTf;
                }
            }
        }
        String upper = descriptorStr.toUpperCase(Locale.ROOT);
        if (upper.contains("CLASSIC")) return loadBundledTypefaceByRawName("rex_font_ios_classic");
        if (upper.contains("MODERN")) return loadBundledTypefaceByRawName("rex_font_ios_modern");
        if (upper.contains("NEON") || upper.contains("CURSIVE")) return loadBundledTypefaceByRawName("rex_font_ios_neon");
        if (upper.contains("TYPEWRITER") || upper.contains("MONO")) return loadBundledTypefaceByRawName("rex_font_ios_typewriter");
        if (upper.contains("STRONG") || upper.contains("HEAVY")) return loadBundledTypefaceByRawName("rex_font_ios_strong");
        if (upper.contains("ELEGANT") || upper.contains("SERIF")) return loadBundledTypefaceByRawName("rex_font_ios_elegant");
        if (upper.contains("LITERATURE") || upper.contains("EDITORIAL")) return loadBundledTypefaceByRawName("rex_font_ios_literature");
        if (upper.contains("BEACH") || upper.contains("MEME") || upper.contains("COMIC")) return loadBundledTypefaceByRawName("rex_font_ios_beach");
        if (upper.contains("DIRECTIONAL") || upper.contains("DECO")) return loadBundledTypefaceByRawName("rex_font_ios_directional");
        if (upper.contains("PAPYRUS")) return loadBundledTypefaceByRawName("rex_font_ios_papyrus");
        if (upper.contains("HINDI") || upper.contains("DEVANAGARI")) return loadBundledTypefaceByRawName("rex_font_ios_hindi");
        if (upper.contains("INDIC") || upper.contains("GUJARATI") || upper.contains("MARATHI")) return loadBundledTypefaceByRawName("rex_font_ios_indic");
        if (upper.contains("SIGNATURE") || upper.contains("COSMOPOLITAN")) return loadBundledTypefaceByRawName("rex_font_ios_neon");
        if (upper.contains("AVENY")) return loadBundledTypefaceByRawName("rex_font_ios_modern");
        if (upper.contains("FREIGHT")) return loadBundledTypefaceByRawName("rex_font_ios_literature");
        if (upper.contains("KOULEN")) return loadBundledTypefaceByRawName("rex_font_ios_strong");
        return null;
    }

    private static Typeface loadStoryFileTypeface(File file) {
        if (file == null || !file.isFile()) return null;
        String key = file.getAbsolutePath() + ":" + file.lastModified();
        Typeface cached = STORY_FILE_TYPEFACE_CACHE.get(key);
        if (cached != null) return cached;
        Typeface parsed = parse(file);
        if (parsed != null) {
            STORY_FILE_TYPEFACE_CACHE.put(key, parsed);
        }
        return parsed;
    }

    private static void copyFile(File src, File dst) throws IOException {
        File parent = dst.getParentFile();
        if (parent != null && !parent.exists()) parent.mkdirs();
        try (InputStream in = new FileInputStream(src);
             OutputStream out = new FileOutputStream(dst)) {
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) != -1) out.write(buf, 0, n);
        }
    }

    private static boolean isZipFile(File file) {
        if (file == null || file.length() < 4) return false;
        try (InputStream in = new FileInputStream(file)) {
            byte[] m = new byte[4];
            if (in.read(m) < 4) return false;
            return m[0] == 0x50 && m[1] == 0x4B;
        } catch (Exception e) {
            return false;
        }
    }

    private static String sanitizeFileName(String name) {
        if (name == null) return "font";
        return name.replaceAll("[^a-zA-Z0-9._-]", "_");
    }

    private static String fingerprint(File file) {
        if (file == null || !file.isFile()) {
            return null;
        }
        try (InputStream in = new FileInputStream(file)) {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) != -1) {
                digest.update(buffer, 0, read);
            }
            StringBuilder hex = new StringBuilder(64);
            for (byte b : digest.digest()) {
                hex.append(Character.forDigit((b >> 4) & 0xf, 16));
                hex.append(Character.forDigit(b & 0xf, 16));
            }
            return hex.toString();
        } catch (Exception e) {
            Logger.printException(() -> "Failed to hash the custom font", e);
            return file.lastModified() + ":" + file.length();
        }
    }

    private static boolean readFully(InputStream in, byte[] buffer) throws IOException {
        int offset = 0;
        while (offset < buffer.length) {
            int read = in.read(buffer, offset, buffer.length - offset);
            if (read == -1) {
                return false;
            }
            offset += read;
        }
        return true;
    }

    private static boolean isFontHeader(byte[] header) {
        String tag = new String(header, StandardCharsets.US_ASCII);
        return Arrays.equals(header, new byte[]{0x00, 0x01, 0x00, 0x00})
                || "OTTO".equals(tag)
                || "ttcf".equals(tag)
                || "true".equals(tag);
    }

    public static boolean hasValidEmojiGlyphs(Typeface typeface) {
        if (typeface == null) return false;
        try {
            android.graphics.Paint p = new android.graphics.Paint();
            p.setTypeface(typeface);
            p.setTextSize(32f);
            return p.hasGlyph("\uD83D\uDE00") || p.hasGlyph("\u2764\uFE0F") || p.hasGlyph("\uD83D\uDD25");
        } catch (Throwable ignored) {
            return true;
        }
    }

    public static final String[][] XBOYREX_STORY_FONT_ITEMS = new String[][]{
            {"rex_font_ios_classic", "iOS Classic San Francisco"},
            {"rex_font_ios_modern", "iOS Modern Display"},
            {"rex_font_ios_neon", "iOS Neon Script"},
            {"rex_font_ios_typewriter", "iOS Typewriter Mono"},
            {"rex_font_ios_strong", "iOS Strong Condensed"},
            {"rex_font_ios_elegant", "iOS Elegant Serif"},
            {"rex_font_ios_literature", "iOS Literature Editorial"},
            {"rex_font_ios_beach", "iOS Beach Handwritten"},
            {"rex_font_ios_directional", "iOS Directional Heavy"},
            {"rex_font_ios_papyrus", "iOS Papyrus Display"},
            {"rex_font_ios_hindi", "iOS Devanagari / Hindi"},
            {"rex_font_ios_indic", "iOS Indic Multi-Script"},
            {"rex_font_ios_extrabold_ct", "XBOYREX ExtraBold Headline"},
            {"rex_font_ios_semibold_lite_ct", "XBOYREX SemiBold Caption"}
    };

    public static boolean isXboyrexStoryFontEnabled(Context context, String rawResName) {
        File dir = storyFontsDir(context);
        if (dir == null) return false;
        return new File(dir, "xboyrex_" + rawResName + ".ttf").isFile()
                || new File(dir, "official_" + rawResName + ".ttf").isFile();
    }

    public static boolean setXboyrexStoryFontEnabled(Context context, String rawResName, boolean enabled) {
        if (context == null || rawResName == null) return false;
        File dir = storyFontsDir(context);
        if (dir == null) return false;
        File target = new File(dir, "xboyrex_" + rawResName + ".ttf");
        File legacy = new File(dir, "official_" + rawResName + ".ttf");
        if (!enabled) {
            if (target.exists()) target.delete();
            if (legacy.exists()) legacy.delete();
            STORY_FILE_TYPEFACE_CACHE.clear();
            return true;
        }
        int rawId = context.getResources().getIdentifier(rawResName, "raw", context.getPackageName());
        if (rawId == 0) return false;
        try (InputStream in = context.getResources().openRawResource(rawId);
             OutputStream fos = new FileOutputStream(target)) {
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) != -1) fos.write(buf, 0, n);
            STORY_FILE_TYPEFACE_CACHE.clear();
            syncToSuiteStoryFonts(context, dir);
            CustomFont.reload();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static Typeface previewBundledStoryFont(String rawResName) {
        return loadBundledTypefaceByRawName(rawResName);
    }

    private static Typeface parse(File file) {
        if (file == null || !file.isFile()) return null;
        try {
            Typeface typeface = Typeface.createFromFile(file);
            if (typeface == null || typeface == Typeface.DEFAULT) {
                return null;
            }
            return CustomFont.drawsAlphabetOrDigits(typeface) ? typeface : null;
        } catch (Exception e) {
            return null;
        }
    }
}
