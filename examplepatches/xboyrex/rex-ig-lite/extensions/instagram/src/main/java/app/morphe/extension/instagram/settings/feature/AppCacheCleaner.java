/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */
package app.morphe.extension.instagram.settings.feature;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.InputType;
import android.text.format.DateFormat;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.SettingsActivity;
import app.morphe.extension.instagram.settings.preference.widgets.InstagramPreferenceStyle;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexHaptics;
import app.morphe.extension.instagram.settings.preference.widgets.RexRuntimeFeatures;
import app.morphe.extension.instagram.settings.preference.widgets.RexVectorIcons;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Dedicated App Cache Cleaner engine & threshold manager for InstaRex:
 * - Calculates real cache size across internal cacheDir, externalCacheDir, codeCacheDir, and media temp cache
 * - Strict safety exclusions: never deletes user downloads (/Download/xboyrex), saved media, fonts, backups, databases, or session data
 * - Preset thresholds: 250 MB, 500 MB, 1 GB, 2 GB, 5 GB, plus Custom Limit (50 MB - 20 GB)
 * - Automatic startup threshold check on background thread without blocking app launch
 */
public final class AppCacheCleaner {

    public static final String KEY_AUTO_CLEAN_ENABLED = "rex_cache_auto_clean_enabled";
    public static final String KEY_CACHE_LIMIT_MB = "rex_cache_limit_mb";
    public static final String KEY_LAST_CLEANED_MS = "rex_cache_last_cleaned_ms";
    public static final String KEY_LAST_FREED_BYTES = "rex_cache_last_freed_bytes";
    public static final String KEY_TOTAL_FREED_BYTES = "rex_cache_total_freed_bytes";

    public static final String[] LIMIT_PRESETS = {
            "250 MB",
            "500 MB",
            "1 GB (1024 MB)",
            "2 GB (2048 MB)",
            "5 GB (5120 MB)",
            "Custom Limit (50 MB – 20 GB)..."
    };

    private static final String[] PROTECTED_DIR_NAMES = {
            "shared_prefs",
            "databases",
            "mobileconfig",
            "rex_fonts",
            "rex_story_fonts",
            "rex_emoji",
            "files"
    };

    private AppCacheCleaner() {}

    public static boolean isAutoCleanEnabled() {
        return Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.AUTO_CACHE_CLEAN_ENABLED));
    }

    public static long getLimitMb() {
        return getCacheLimitMb();
    }

    public static String getStatusSummary(Context context) {
        return buildStatusSummary(context);
    }

    public static String formatLimitLabel(long mb) {
        return formatLimitLabel();
    }

    public static void showCleanNowConfirmDialog(final Context context, final Runnable onDone) {
        cleanNowInteractive(context, onDone);
    }

    public static void showCustomLimitDialog(final Context context, final Runnable onUpdated) {
        showCustomCacheLimitDialog(context, onUpdated);
    }

    public static long getCacheLimitMb() {
        try {
            String raw = SharedPref.getStringPref(Settings.CACHE_CLEAN_LIMIT_MB);
            if (raw != null && !raw.trim().isEmpty()) {
                long val = Long.parseLong(raw.trim());
                return Math.max(50L, Math.min(20480L, val));
            }
        } catch (Throwable ignored) {}
        return 500L;
    }

    public static void setCacheLimitMb(long mb) {
        long clamped = Math.max(50L, Math.min(20480L, mb));
        SharedPref.setStringPref(Settings.CACHE_CLEAN_LIMIT_MB.key, String.valueOf(clamped));
    }

    public static String formatLimitLabel() {
        long mb = getCacheLimitMb();
        if (mb >= 1024L && mb % 1024L == 0) {
            return (mb / 1024L) + " GB (" + mb + " MB)";
        }
        return mb + " MB";
    }

    public static String formatBytes(long bytes) {
        if (bytes <= 0L) return "0.00 MB";
        double mb = bytes / (1024.0 * 1024.0);
        if (mb >= 1024.0) {
            return String.format(Locale.US, "%.2f GB (%.0f MB)", mb / 1024.0, mb);
        }
        return String.format(Locale.US, "%.2f MB", mb);
    }

    public static long calculateCurrentCacheBytes(Context context) {
        Context ctx = context != null ? context : RexUtils.getContext();
        if (ctx == null) return 0L;
        long total = 0L;
        try {
            total += dirSize(ctx.getCacheDir());
            total += dirSize(ctx.getExternalCacheDir());
            total += dirSize(ctx.getCodeCacheDir());
        } catch (Throwable ignored) {}
        return total;
    }

    private static long dirSize(File dir) {
        if (dir == null || !dir.exists()) return 0L;
        if (dir.isFile()) return dir.length();
        long sum = 0L;
        File[] children = dir.listFiles();
        if (children != null) {
            for (File c : children) {
                sum += dirSize(c);
            }
        }
        return sum;
    }

    private static boolean isProtectedPath(File file) {
        if (file == null) return true;
        String name = file.getName().toLowerCase(Locale.ROOT);
        for (String p : PROTECTED_DIR_NAMES) {
            if (p.equals(name)) return true;
        }
        String path = file.getAbsolutePath().toLowerCase(Locale.ROOT);
        return path.contains("/shared_prefs")
                || path.contains("/databases")
                || path.contains("/mobileconfig")
                || path.contains("/rex_fonts")
                || path.contains("/rex_story_fonts")
                || path.contains("/rex_emoji")
                || path.contains("/download/xboyrex");
    }

    private static long cleanSafeCacheDir(File dir, boolean deleteSelf) {
        if (dir == null || !dir.exists() || isProtectedPath(dir)) return 0L;
        long freed = 0L;
        if (dir.isDirectory()) {
            File[] children = dir.listFiles();
            if (children != null) {
                for (File child : children) {
                    if (isProtectedPath(child)) continue;
                    freed += cleanSafeCacheDir(child, true);
                }
            }
        }
        if (deleteSelf && dir.isFile()) {
            long len = dir.length();
            if (dir.delete()) {
                freed += len;
            }
        } else if (deleteSelf && dir.isDirectory()) {
            dir.delete();
        }
        return freed;
    }

    public static synchronized long cleanNowSync(Context context) {
        Context ctx = context != null ? context : RexUtils.getContext();
        if (ctx == null) return 0L;
        long before = calculateCurrentCacheBytes(ctx);
        long deletedBytes = 0L;
        try {
            deletedBytes += cleanSafeCacheDir(ctx.getCacheDir(), false);
            deletedBytes += cleanSafeCacheDir(ctx.getExternalCacheDir(), false);
            deletedBytes += cleanSafeCacheDir(ctx.getCodeCacheDir(), false);
        } catch (Throwable t) {
            Logger.printException(() -> "AppCacheCleaner.cleanNowSync failure", t);
        }
        long after = calculateCurrentCacheBytes(ctx);
        long freed = Math.max(deletedBytes, Math.max(0L, before - after));

        long now = System.currentTimeMillis();
        long prevTotal = 0L;
        try {
            prevTotal = Long.parseLong(SharedPref.getStringPref(KEY_TOTAL_FREED_BYTES, "0"));
        } catch (Throwable ignored) {}
        SharedPref.setStringPref(KEY_LAST_CLEANED_MS, String.valueOf(now));
        SharedPref.setStringPref(KEY_LAST_FREED_BYTES, String.valueOf(freed));
        SharedPref.setStringPref(KEY_TOTAL_FREED_BYTES, String.valueOf(prevTotal + freed));
        return freed;
    }

    public static void cleanNowInteractive(final Context context, final Runnable onDone) {
        Utils.runOnBackgroundThread(() -> {
            final long freed = cleanNowSync(context);
            Utils.runOnMainThread(() -> {
                Utils.showToastShort("Cleaned App Cache — Freed " + formatBytes(freed));
                SettingsActivity.refreshCurrentScreen(context);
                if (onDone != null) onDone.run();
            });
        });
    }

    /**
     * Runs on a background thread at app startup: checks if Automatic Cache Cleaning is enabled
     * and if current cache size exceeds the configured limit in MB.
     */
    public static void checkAndAutoCleanOnStartup(final Context context) {
        Utils.runOnBackgroundThread(() -> {
            try {
                if (!isAutoCleanEnabled()) return;
                Context ctx = context != null ? context : RexUtils.getContext();
                if (ctx == null) return;
                long currentBytes = calculateCurrentCacheBytes(ctx);
                long limitBytes = getCacheLimitMb() * 1024L * 1024L;
                if (currentBytes >= limitBytes) {
                    long freed = cleanNowSync(ctx);
                    Logger.printDebug(() -> "AppCacheCleaner auto-cleaned " + formatBytes(freed)
                            + " (exceeded limit " + formatLimitLabel() + ")");
                }
            } catch (Throwable ignored) {}
        });
    }

    public static String buildStatusSummary(Context context) {
        long current = calculateCurrentCacheBytes(context);
        long lastCleanedMs = 0L;
        long lastFreed = 0L;
        long totalFreed = 0L;
        try {
            lastCleanedMs = Long.parseLong(SharedPref.getStringPref(KEY_LAST_CLEANED_MS, "0"));
            lastFreed = Long.parseLong(SharedPref.getStringPref(KEY_LAST_FREED_BYTES, "0"));
            totalFreed = Long.parseLong(SharedPref.getStringPref(KEY_TOTAL_FREED_BYTES, "0"));
        } catch (Throwable ignored) {}

        String lastTimeStr = "Never";
        if (lastCleanedMs > 0L && context != null) {
            try {
                Locale locale = Locale.getDefault();
                String pattern = DateFormat.getBestDateTimePattern(locale, "yMMMdhm");
                lastTimeStr = new SimpleDateFormat(pattern, locale).format(new Date(lastCleanedMs));
            } catch (Throwable ignored) {
                lastTimeStr = "Recently";
            }
        }

        return "Current Cache: " + formatBytes(current)
                + "  •  Limit: " + (isAutoCleanEnabled() ? formatLimitLabel() : "Manual Only")
                + "\nLast Cleaned: " + lastTimeStr
                + " (Freed " + formatBytes(lastFreed) + " last run • " + formatBytes(totalFreed) + " lifetime)";
    }

    public static void showCacheLimitPickerDialog(final Context context, final Runnable onUpdated) {
        RexRuntimeFeatures.showSingleChoiceDialog(
                context,
                "Select Cache Size Limit",
                LIMIT_PRESETS,
                formatLimitLabel(),
                chosen -> {
                    if (chosen.startsWith("250")) {
                        setCacheLimitMb(250L);
                    } else if (chosen.startsWith("500")) {
                        setCacheLimitMb(500L);
                    } else if (chosen.startsWith("1 GB")) {
                        setCacheLimitMb(1024L);
                    } else if (chosen.startsWith("2 GB")) {
                        setCacheLimitMb(2048L);
                    } else if (chosen.startsWith("5 GB")) {
                        setCacheLimitMb(5120L);
                    } else {
                        showCustomCacheLimitDialog(context, onUpdated);
                        return;
                    }
                    Utils.showToastShort("Cache Limit set to " + formatLimitLabel());
                    SettingsActivity.refreshCurrentScreen(context);
                    if (onUpdated != null) onUpdated.run();
                }
        );
    }

    public static void showCustomCacheLimitDialog(final Context context, final Runnable onUpdated) {
        try {
            final Context hostCtx = RexDialogs.resolveActivity(context) != null ? RexDialogs.resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            LinearLayout sheet = RexDialogs.createDialogSheet(hostCtx, "database", "Custom Cache Limit (50 MB – 20 GB)");

            TextView desc = new TextView(hostCtx);
            desc.setText("Enter custom cache limit in Megabytes (50 to 20480 MB).\nExample: 750 = 750 MB, 3072 = 3 GB.");
            desc.setTextColor(RexDialogs.TEXT_SECONDARY);
            desc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            desc.setPadding(RexVectorIcons.dp(hostCtx, 4), 0, RexVectorIcons.dp(hostCtx, 4), RexVectorIcons.dp(hostCtx, 10));
            sheet.addView(desc);

            final EditText input = new EditText(hostCtx);
            input.setInputType(InputType.TYPE_CLASS_NUMBER);
            input.setText(String.valueOf(getCacheLimitMb()));
            input.setHint("50 - 20480 MB");
            input.setHintTextColor(RexDialogs.TEXT_SECONDARY);
            input.setTextColor(Color.WHITE);
            input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            int p = RexVectorIcons.dp(hostCtx, 12);
            input.setPadding(p, p, p, p);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(RexDialogs.ELEVATED_SURFACE);
            bg.setCornerRadius(RexVectorIcons.dp(hostCtx, 14));
            bg.setStroke(Math.max(1, RexVectorIcons.dp(hostCtx, 1)), RexDialogs.BORDER_STROKE);
            input.setBackground(bg);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.bottomMargin = RexVectorIcons.dp(hostCtx, 12);
            sheet.addView(input, lp);

            TextView saveBtn = RexRuntimeFeatures.createActionButton(
                    hostCtx,
                    "Save Custom Cache Limit",
                    InstagramPreferenceStyle.accentColor(),
                    0xFF0A1417
            );
            saveBtn.setOnClickListener(v -> {
                RexHaptics.tap(v);
                try {
                    long val = Long.parseLong(input.getText() == null ? "" : input.getText().toString().trim());
                    if (val < 50L || val > 20480L) {
                        Utils.showToastShort("Enter a value between 50 MB and 20480 MB (20 GB)");
                        return;
                    }
                    setCacheLimitMb(val);
                    dialog.dismiss();
                    Utils.showToastShort("Custom Cache Limit: " + formatLimitLabel());
                    SettingsActivity.refreshCurrentScreen(hostCtx);
                    if (onUpdated != null) onUpdated.run();
                } catch (NumberFormatException ex) {
                    Utils.showToastShort("Invalid number — enter 50 to 20480 MB");
                }
            });
            sheet.addView(saveBtn);

            RexDialogs.addDialogCloseFooter(hostCtx, sheet, dialog);
            dialog.setView(sheet);
            RexDialogs.showBlurredDialog(hostCtx, dialog);
        } catch (Throwable ignored) {}
    }
}
