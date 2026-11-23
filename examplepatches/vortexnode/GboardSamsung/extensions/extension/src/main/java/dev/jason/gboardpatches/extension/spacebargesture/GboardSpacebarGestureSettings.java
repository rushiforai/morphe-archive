package dev.jason.gboardpatches.extension.spacebargesture;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

/**
 * Persistent settings for the Samsung Spacebar Gestures & Language section.
 * All runtime reads go through {@link GboardPatchesSettings#readRuntimeSetting} for Direct Boot
 * safety and cache values briefly to avoid SharedPreferences lookups on every touch or key bind.
 */
public final class GboardSpacebarGestureSettings {
    public static final String PREF_KEY_SPACEBAR_LANGUAGE_SWIPE_ENABLED =
            "pref_spacebar_language_swipe_enabled";
    public static final boolean DEFAULT_SPACEBAR_LANGUAGE_SWIPE_ENABLED = true;

    public static final String PREF_KEY_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED =
            "pref_spacebar_language_chevrons_enabled";
    public static final boolean DEFAULT_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED = false;

    public static final String PREF_KEY_HIDE_LANGUAGE_SWITCH_KEY =
            "pref_hide_language_switch_key";
    public static final boolean DEFAULT_HIDE_LANGUAGE_SWITCH_KEY = false;

    private static final long CACHE_TTL_MS = 1000L;

    private static volatile boolean cachedSwipeEnabled = DEFAULT_SPACEBAR_LANGUAGE_SWIPE_ENABLED;
    private static volatile long cachedSwipeTimestampMs = -1L;

    private static volatile boolean cachedChevronsEnabled =
            DEFAULT_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED;
    private static volatile long cachedChevronsTimestampMs = -1L;

    private static volatile boolean cachedHideGlobeKey = DEFAULT_HIDE_LANGUAGE_SWITCH_KEY;
    private static volatile long cachedHideGlobeTimestampMs = -1L;

    private GboardSpacebarGestureSettings() {
    }

    public static boolean isSpacebarLanguageSwipeEnabled(Context context) {
        long now = currentTimeMs();
        long cachedAt = cachedSwipeTimestampMs;
        if (cachedAt >= 0L && (now - cachedAt) < CACHE_TTL_MS) {
            return cachedSwipeEnabled;
        }
        boolean value = readSpacebarLanguageSwipeEnabled(context);
        cachedSwipeEnabled = value;
        cachedSwipeTimestampMs = now;
        return value;
    }

    public static boolean readSpacebarLanguageSwipeEnabled(Context context) {
        return GboardPatchesSettings.readRuntimeSetting(
                context,
                GboardSpacebarGestureSettings::readSpacebarLanguageSwipeEnabled,
                DEFAULT_SPACEBAR_LANGUAGE_SWIPE_ENABLED);
    }

    public static boolean readSpacebarLanguageSwipeEnabled(SharedPreferences preferences) {
        return readBoolean(
                preferences,
                PREF_KEY_SPACEBAR_LANGUAGE_SWIPE_ENABLED,
                DEFAULT_SPACEBAR_LANGUAGE_SWIPE_ENABLED);
    }

    public static boolean writeSpacebarLanguageSwipeEnabled(Context context, boolean enabled) {
        boolean saved = writeBoolean(context, PREF_KEY_SPACEBAR_LANGUAGE_SWIPE_ENABLED, enabled);
        if (saved) {
            cachedSwipeEnabled = enabled;
            cachedSwipeTimestampMs = currentTimeMs();
        }
        return saved;
    }

    public static boolean isSpacebarLanguageChevronsEnabled(Context context) {
        long now = currentTimeMs();
        long cachedAt = cachedChevronsTimestampMs;
        if (cachedAt >= 0L && (now - cachedAt) < CACHE_TTL_MS) return cachedChevronsEnabled;
        boolean value = readSpacebarLanguageChevronsEnabled(context);
        cachedChevronsEnabled = value;
        cachedChevronsTimestampMs = now;
        return value;
    }

    public static boolean readSpacebarLanguageChevronsEnabled(Context context) {
        return GboardPatchesSettings.readRuntimeSetting(
                context,
                GboardSpacebarGestureSettings::readSpacebarLanguageChevronsEnabled,
                DEFAULT_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED);
    }

    public static boolean readSpacebarLanguageChevronsEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED,
                DEFAULT_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED);
    }

    public static boolean writeSpacebarLanguageChevronsEnabled(Context context, boolean enabled) {
        boolean saved = writeBoolean(context, PREF_KEY_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED, enabled);
        if (saved) {
            cachedChevronsEnabled = enabled;
            cachedChevronsTimestampMs = currentTimeMs();
            GboardSpacebarChevronRuntime.onChevronsPreferenceChanged(enabled);
        }
        return saved;
    }

    public static boolean isHideLanguageSwitchKeyEnabled(Context context) {
        long now = currentTimeMs();
        long cachedAt = cachedHideGlobeTimestampMs;
        if (cachedAt >= 0L && (now - cachedAt) < CACHE_TTL_MS) {
            return cachedHideGlobeKey;
        }
        boolean value = readHideLanguageSwitchKeyEnabled(context);
        cachedHideGlobeKey = value;
        cachedHideGlobeTimestampMs = now;
        return value;
    }

    public static boolean readHideLanguageSwitchKeyEnabled(Context context) {
        return GboardPatchesSettings.readRuntimeSetting(
                context,
                GboardSpacebarGestureSettings::readHideLanguageSwitchKeyEnabled,
                DEFAULT_HIDE_LANGUAGE_SWITCH_KEY);
    }

    public static boolean readHideLanguageSwitchKeyEnabled(SharedPreferences preferences) {
        return readBoolean(
                preferences,
                PREF_KEY_HIDE_LANGUAGE_SWITCH_KEY,
                DEFAULT_HIDE_LANGUAGE_SWITCH_KEY);
    }

    public static boolean writeHideLanguageSwitchKeyEnabled(Context context, boolean hidden) {
        boolean saved = writeBoolean(context, PREF_KEY_HIDE_LANGUAGE_SWITCH_KEY, hidden);
        if (saved) {
            cachedHideGlobeKey = hidden;
            cachedHideGlobeTimestampMs = currentTimeMs();
            GboardSpacebarGlobeKeyRuntime.onHidePreferenceChanged(hidden);
        }
        return saved;
    }

    public static void invalidateCache() {
        cachedSwipeTimestampMs = -1L;
        cachedChevronsTimestampMs = -1L;
        cachedHideGlobeTimestampMs = -1L;
        cachedSwipeEnabled = DEFAULT_SPACEBAR_LANGUAGE_SWIPE_ENABLED;
        cachedChevronsEnabled = DEFAULT_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED;
        cachedHideGlobeKey = DEFAULT_HIDE_LANGUAGE_SWITCH_KEY;
    }

    private static boolean readBoolean(
            SharedPreferences preferences, String key, boolean defaultValue) {
        if (preferences == null) {
            return defaultValue;
        }
        Object raw = preferences.getAll().get(key);
        if (raw == null && !preferences.contains(key)) {
            return defaultValue;
        }
        if (raw instanceof Boolean value) {
            return value;
        }
        if (raw instanceof String value) {
            if ("true".equalsIgnoreCase(value)) {
                return true;
            }
            if ("false".equalsIgnoreCase(value)) {
                return false;
            }
        }
        return defaultValue;
    }

    private static boolean writeBoolean(Context context, String key, boolean value) {
        if (context == null) {
            return false;
        }
        SharedPreferences preferences = GboardPatchesSettings.preferencesOrNull(context);
        if (preferences == null) {
            return false;
        }
        try {
            return preferences.edit().putBoolean(key, value).commit();
        } catch (RuntimeException unavailable) {
            return false;
        }
    }

    private static long currentTimeMs() {
        try {
            return SystemClock.uptimeMillis();
        } catch (Throwable ignored) {
            return System.nanoTime() / 1_000_000L;
        }
    }
}
