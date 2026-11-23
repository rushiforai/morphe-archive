package dev.jason.gboardpatches.extension.spacebargesture;

import android.content.res.Resources;
import android.os.Handler;
import android.os.Looper;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewParent;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Runtime hook invoked after {@code SoftKeyView.s(SoftKeyDef, long)Z} binds key metadata.
 * Hides or restores Gboard's language switch (Globe) key independently of spacebar swipe gestures,
 * safely restoring recycled view slots when a slot is later bound to a non-language key.
 */
public final class GboardSpacebarGlobeKeyRuntime {
    static final String GLOBE_VIEW_NAME = "key_pos_qwerty_globe";
    static final String NEXT_LANGUAGE_VIEW_NAME = "key_pos_switch_to_next_language";
    static final int KEYCODE_SWITCH_TO_NEXT_LANGUAGE = -10011;
    static final int KEYCODE_SWITCH_TO_NEXT_LANGUAGE_ALL_IMES = -10197;

    private static final Map<View, Integer> TRACKED_GLOBE_VIEWS = new WeakHashMap<>();

    private GboardSpacebarGlobeKeyRuntime() {
    }

    /**
     * Runtime ABI entry point invoked by the SoftKey family composer ({@code after_stock}).
     */
    public static void afterSoftKeyBind(View softKeyView) {
        if (softKeyView == null) {
            return;
        }
        try {
            boolean hideEnabled = GboardSpacebarGestureSettings.isHideLanguageSwitchKeyEnabled(
                    softKeyView.getContext());
            applyToSoftKeyView(
                    softKeyView,
                    isLanguageSwitchSoftKey(softKeyView),
                    hideEnabled);
        } catch (Throwable ignored) {
            // SoftKey bind hooks must never crash keyboard inflation or layout transitions.
        }
    }

    /**
     * Immediately applies a Settings toggle change to all live tracked language switch key views.
     */
    public static void onHidePreferenceChanged(boolean hideEnabled) {
        Runnable applyAll = () -> {
            List<Map.Entry<View, Integer>> snapshot;
            synchronized (TRACKED_GLOBE_VIEWS) {
                snapshot = new ArrayList<>(TRACKED_GLOBE_VIEWS.entrySet());
            }
            for (Map.Entry<View, Integer> entry : snapshot) {
                View view = entry.getKey();
                if (view == null) {
                    continue;
                }
                applyVisibility(view, entry.getValue(), hideEnabled);
            }
        };

        try {
            Looper mainLooper = Looper.getMainLooper();
            if (mainLooper != null && Looper.myLooper() != mainLooper) {
                new Handler(mainLooper).post(applyAll);
                return;
            }
        } catch (Throwable ignored) {
            // Fall through to synchronous execution in JVM tests without Android Looper.
        }
        applyAll.run();
    }

    static void applyToSoftKeyView(
            View softKeyView, boolean isLanguageSwitchKey, boolean hideEnabled) {
        if (softKeyView == null) {
            return;
        }
        if (!isLanguageSwitchKey) {
            Integer previousVisibility;
            synchronized (TRACKED_GLOBE_VIEWS) {
                previousVisibility = TRACKED_GLOBE_VIEWS.remove(softKeyView);
            }
            if (previousVisibility != null) {
                restoreVisibility(softKeyView, previousVisibility);
            }
            return;
        }

        Integer originalVisibility;
        synchronized (TRACKED_GLOBE_VIEWS) {
            originalVisibility = TRACKED_GLOBE_VIEWS.get(softKeyView);
            if (originalVisibility == null) {
                int current = softKeyView.getVisibility();
                originalVisibility = current == View.GONE ? View.VISIBLE : current;
                TRACKED_GLOBE_VIEWS.put(softKeyView, originalVisibility);
            }
        }
        applyVisibility(softKeyView, originalVisibility, hideEnabled);
    }

    static boolean isLanguageSwitchKeyDescriptor(int pressKeycode, String resourceEntryName) {
        if (pressKeycode == KeyEvent.KEYCODE_SPACE) {
            return false;
        }
        if (pressKeycode == KEYCODE_SWITCH_TO_NEXT_LANGUAGE
                || pressKeycode == KEYCODE_SWITCH_TO_NEXT_LANGUAGE_ALL_IMES) {
            return true;
        }
        // If SoftKeyDef resolved a non-zero non-language keycode (e.g. Emoji or Comma sharing
        // the bottom-row slot), do not hide it even if the view ID mentions globe.
        if (pressKeycode != 0) {
            return false;
        }
        return GLOBE_VIEW_NAME.equals(resourceEntryName)
                || NEXT_LANGUAGE_VIEW_NAME.equals(resourceEntryName);
    }

    private static boolean isLanguageSwitchSoftKey(View softKeyView) {
        int pressKeycode = GboardSpacebarKeyHitTester.extractPressKeycode(softKeyView);
        String entryName = resolveResourceEntryName(softKeyView);
        return isLanguageSwitchKeyDescriptor(pressKeycode, entryName);
    }

    private static String resolveResourceEntryName(View view) {
        int id = view.getId();
        if (id == View.NO_ID) {
            return null;
        }
        try {
            Resources resources = view.getResources();
            return resources == null ? null : resources.getResourceEntryName(id);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void applyVisibility(View view, Integer originalVisibility, boolean hideEnabled) {
        if (hideEnabled) {
            if (view.getVisibility() != View.GONE) {
                view.setVisibility(View.GONE);
                requestParentLayout(view);
            }
        } else {
            restoreVisibility(view, originalVisibility);
        }
    }

    private static void restoreVisibility(View view, Integer originalVisibility) {
        int targetVisibility = originalVisibility != null && originalVisibility != View.GONE
                ? originalVisibility
                : View.VISIBLE;
        if (view.getVisibility() != targetVisibility) {
            view.setVisibility(targetVisibility);
            requestParentLayout(view);
        }
    }

    private static void requestParentLayout(View view) {
        try {
            ViewParent parent = view.getParent();
            if (parent != null) {
                parent.requestLayout();
            }
        } catch (Throwable ignored) {
            // Safe in unit tests or detached views.
        }
    }

    static void resetForTesting() {
        synchronized (TRACKED_GLOBE_VIEWS) {
            TRACKED_GLOBE_VIEWS.clear();
        }
    }
}
