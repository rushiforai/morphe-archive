package io.github.warleysr.instagram.extension.utils;

import android.content.SharedPreferences;
import android.util.Log;

public class Pref {
    private static final String TAG = "PikoPatch";
    private static final String KEY_KEEP_SCREEN_ON = "keep_screen_on_while_playing";
    private static final String KEY_CAROUSEL_AUTO_SCROLL = "carousel_auto_scroll";

    public static boolean keepScreenOnWhilePlaying() {
        // First check custom patches preferences
        SharedPreferences sp = AppContext.getPreferences();
        if (sp != null && sp.contains(KEY_KEEP_SCREEN_ON)) {
            boolean val = sp.getBoolean(KEY_KEEP_SCREEN_ON, true);
            Log.d(TAG, "keepScreenOnWhilePlaying from custom sp: " + val);
            return val;
        }

        // Check Piko settings if present
        SharedPreferences pikoSp = AppContext.getPikoPreferences();
        if (pikoSp != null && pikoSp.contains(KEY_KEEP_SCREEN_ON)) {
            boolean val = pikoSp.getBoolean(KEY_KEEP_SCREEN_ON, true);
            Log.d(TAG, "keepScreenOnWhilePlaying from piko_settings: " + val);
            return val;
        }

        Log.d(TAG, "keepScreenOnWhilePlaying default: true");
        return true;
    }

    public static void setKeepScreenOnWhilePlaying(boolean enabled) {
        Log.i(TAG, "setKeepScreenOnWhilePlaying: " + enabled);
        SharedPreferences sp = AppContext.getPreferences();
        if (sp != null) {
            sp.edit().putBoolean(KEY_KEEP_SCREEN_ON, enabled).apply();
        }
        SharedPreferences pikoSp = AppContext.getPikoPreferences();
        if (pikoSp != null) {
            pikoSp.edit().putBoolean(KEY_KEEP_SCREEN_ON, enabled).apply();
        }
    }

    public static boolean carouselAutoScroll() {
        // First check custom patches preferences
        SharedPreferences sp = AppContext.getPreferences();
        if (sp != null && sp.contains(KEY_CAROUSEL_AUTO_SCROLL)) {
            boolean val = sp.getBoolean(KEY_CAROUSEL_AUTO_SCROLL, false);
            Log.d(TAG, "carouselAutoScroll from custom sp: " + val);
            return val;
        }

        // Check Piko settings if present
        SharedPreferences pikoSp = AppContext.getPikoPreferences();
        if (pikoSp != null && pikoSp.contains(KEY_CAROUSEL_AUTO_SCROLL)) {
            boolean val = pikoSp.getBoolean(KEY_CAROUSEL_AUTO_SCROLL, false);
            Log.d(TAG, "carouselAutoScroll from piko_settings: " + val);
            return val;
        }

        Log.d(TAG, "carouselAutoScroll default: false");
        return false;
    }

    public static void setCarouselAutoScroll(boolean enabled) {
        Log.i(TAG, "setCarouselAutoScroll: " + enabled);
        SharedPreferences sp = AppContext.getPreferences();
        if (sp != null) {
            sp.edit().putBoolean(KEY_CAROUSEL_AUTO_SCROLL, enabled).apply();
        }
        SharedPreferences pikoSp = AppContext.getPikoPreferences();
        if (pikoSp != null) {
            pikoSp.edit().putBoolean(KEY_CAROUSEL_AUTO_SCROLL, enabled).apply();
        }
    }
}
