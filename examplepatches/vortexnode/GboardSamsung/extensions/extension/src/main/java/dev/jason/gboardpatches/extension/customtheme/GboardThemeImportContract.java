package dev.jason.gboardpatches.extension.customtheme;

import java.util.Locale;

/** Stable archive rules shared by the catalog, downloader, and installer. */
public final class GboardThemeImportContract {
    public static final long MAX_SOURCE_BYTES = 16L * 1024L * 1024L;
    public static final long MAX_INNER_THEME_BYTES = 16L * 1024L * 1024L;
    public static final long MAX_METADATA_BYTES = 1024L * 1024L;
    public static final long MAX_THEME_ENTRY_BYTES = 32L * 1024L * 1024L;
    public static final long MAX_THEME_UNCOMPRESSED_BYTES = 64L * 1024L * 1024L;
    public static final int MAX_THEME_ENTRY_COUNT = 128;

    private GboardThemeImportContract() { }

    public static boolean isRootMetadata(String name) {
        return "metadata.json".equals(name) || "metadata.binarypb".equals(name);
    }

    public static boolean isSafeEntryName(String name) {
        if (name == null || name.isEmpty() || name.indexOf('\0') >= 0
                || name.indexOf('\\') >= 0 || name.startsWith("/")) return false;
        for (String segment : name.split("/", -1)) if ("..".equals(segment)) return false;
        return true;
    }

    public static String stockCompatibleFileName(long nowMillis, int suffix) {
        return String.format(Locale.US, "user_theme_package_%015d_%02d.zip",
                Math.max(0L, nowMillis), suffix);
    }
}
