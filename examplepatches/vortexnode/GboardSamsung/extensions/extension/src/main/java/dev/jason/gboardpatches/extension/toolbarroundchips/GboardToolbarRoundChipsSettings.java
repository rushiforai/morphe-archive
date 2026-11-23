package dev.jason.gboardpatches.extension.toolbarroundchips;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

/**
 * Persistent settings for adaptive round icon chips in the top toolbar and the optional fixed
 * Rambler-style circular background behind the menu grid ({@code ⊞}) button.
 * Uses Direct Boot-safe reads via {@link GboardPatchesSettings#readRuntimeSetting} and brief
 * caching to avoid SharedPreferences lookups on every SoftKeyView bind.
 */
public final class GboardToolbarRoundChipsSettings {
    public static final String PREF_KEY_TOOLBAR_ROUND_CHIPS_ENABLED =
            "pref_toolbar_round_chips_enabled";
    public static final boolean DEFAULT_TOOLBAR_ROUND_CHIPS_ENABLED = false;

    public static final String PREF_KEY_MENU_GRID_CHIP_ENABLED =
            "pref_toolbar_round_chips_menu_grid_enabled";
    public static final boolean DEFAULT_MENU_GRID_CHIP_ENABLED = false;

    private static final long CACHE_TTL_MS = 1000L;

    private static volatile boolean cachedEnabled = DEFAULT_TOOLBAR_ROUND_CHIPS_ENABLED;
    private static volatile long cachedTimestampMs = -1L;

    private static volatile boolean cachedMenuGridEnabled = DEFAULT_MENU_GRID_CHIP_ENABLED;
    private static volatile long cachedMenuGridTimestampMs = -1L;

    private GboardToolbarRoundChipsSettings() {}

    public static boolean isEnabled(Context context) {
        long now = currentTimeMs();
        long cachedAt = cachedTimestampMs;
        if (cachedAt >= 0L && (now - cachedAt) < CACHE_TTL_MS) {
            return cachedEnabled;
        }
        boolean value = readEnabled(context);
        cachedEnabled = value;
        cachedTimestampMs = now;
        return value;
    }

    public static boolean readEnabled(Context context) {
        return GboardPatchesSettings.readRuntimeSetting(
                context,
                GboardToolbarRoundChipsSettings::readEnabled,
                DEFAULT_TOOLBAR_ROUND_CHIPS_ENABLED);
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        return readBoolean(
                preferences,
                PREF_KEY_TOOLBAR_ROUND_CHIPS_ENABLED,
                DEFAULT_TOOLBAR_ROUND_CHIPS_ENABLED);
    }

    public static boolean writeEnabled(Context context, boolean enabled) {
        if (context == null) return false;
        SharedPreferences preferences = GboardPatchesSettings.preferencesOrNull(context);
        if (preferences == null) return false;
        try {
            boolean saved = preferences.edit()
                    .putBoolean(PREF_KEY_TOOLBAR_ROUND_CHIPS_ENABLED, enabled)
                    .commit();
            if (saved) {
                cachedEnabled = enabled;
                cachedTimestampMs = currentTimeMs();
                GboardToolbarRoundChipsRuntime.onPreferenceChanged(enabled);
            }
            return saved;
        } catch (RuntimeException unavailable) {
            return false;
        }
    }

    public static boolean isMenuGridEnabled(Context context) {
        long now = currentTimeMs();
        long cachedAt = cachedMenuGridTimestampMs;
        if (cachedAt >= 0L && (now - cachedAt) < CACHE_TTL_MS) {
            return cachedMenuGridEnabled;
        }
        boolean value = readMenuGridEnabled(context);
        cachedMenuGridEnabled = value;
        cachedMenuGridTimestampMs = now;
        return value;
    }

    public static boolean readMenuGridEnabled(Context context) {
        return GboardPatchesSettings.readRuntimeSetting(
                context,
                GboardToolbarRoundChipsSettings::readMenuGridEnabled,
                DEFAULT_MENU_GRID_CHIP_ENABLED);
    }

    public static boolean readMenuGridEnabled(SharedPreferences preferences) {
        return readBoolean(
                preferences,
                PREF_KEY_MENU_GRID_CHIP_ENABLED,
                DEFAULT_MENU_GRID_CHIP_ENABLED);
    }

    public static boolean writeMenuGridEnabled(Context context, boolean enabled) {
        if (context == null) return false;
        SharedPreferences preferences = GboardPatchesSettings.preferencesOrNull(context);
        if (preferences == null) return false;
        try {
            boolean saved = preferences.edit()
                    .putBoolean(PREF_KEY_MENU_GRID_CHIP_ENABLED, enabled)
                    .commit();
            if (saved) {
                cachedMenuGridEnabled = enabled;
                cachedMenuGridTimestampMs = currentTimeMs();
                GboardToolbarRoundChipsRuntime.onMenuGridPreferenceChanged(enabled);
            }
            return saved;
        } catch (RuntimeException unavailable) {
            return false;
        }
    }

    public static void invalidateCache() {
        cachedTimestampMs = -1L;
        cachedEnabled = DEFAULT_TOOLBAR_ROUND_CHIPS_ENABLED;
        cachedMenuGridTimestampMs = -1L;
        cachedMenuGridEnabled = DEFAULT_MENU_GRID_CHIP_ENABLED;
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
            if ("true".equalsIgnoreCase(value)) return true;
            if ("false".equalsIgnoreCase(value)) return false;
        }
        return defaultValue;
    }

    private static long currentTimeMs() {
        try {
            return SystemClock.uptimeMillis();
        } catch (Throwable ignored) {
            return System.nanoTime() / 1_000_000L;
        }
    }
}
