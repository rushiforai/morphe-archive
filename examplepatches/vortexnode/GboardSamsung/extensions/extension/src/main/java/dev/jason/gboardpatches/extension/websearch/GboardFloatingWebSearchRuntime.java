package dev.jason.gboardpatches.extension.websearch;

import android.content.Context;
import android.widget.Toast;

import java.util.Locale;

import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardFloatingWebSearchRuntime {
    private GboardFloatingWebSearchRuntime() {
    }

    public static boolean isEnabled(Context context) {
        try {
            GboardFloatingWebSearchSettingsSnapshot snapshot = readSnapshotOrNull(context);
            return snapshot != null && snapshot.isEnabled();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void open(Context context) {
        try {
            open(context, readSnapshotOrNull(context));
        } catch (Throwable ignored) {
            showUnavailable(context);
        }
    }

    public static void open(Context context, GboardFloatingWebSearchSettingsSnapshot settings) {
        try {
            if (context == null || settings == null || !settings.isEnabled()) {
                showUnavailable(context);
                return;
            }
            if (!GboardCustomTabsProviderResolver.hasBrowsableActivity(
                    context, settings.getStartPageUrl())) {
                showToast(context, "Нет доступного браузера", "No available browser");
                return;
            }
            if (!GboardFloatingWebSearchLauncher.open(context, settings)) {
                showUnavailable(context);
            }
        } catch (Throwable ignored) {
            showUnavailable(context);
        }
    }

    static GboardFloatingWebSearchSettingsSnapshot readSnapshotOrNull(Context context) {
        try {
            return GboardFloatingWebSearchSettings.readSnapshotOrNull(
                    GboardFloatingWebSearchSettingsStore.preferences(context));
        } catch (Throwable ignored) {
            return null;
        }
    }

    static void showUnavailable(Context context) {
        showToast(context, "Не удалось открыть плавающий веб-поиск",
                "Unable to open Floating Web Search");
    }

    static String resolveToastMessage(Context context, String russian, String english) {
        try {
            if ("ru".equalsIgnoreCase(GboardSettingsText.languageTag(context))) {
                return russian;
            }
            return english;
        } catch (Throwable ignored) {
            String language = Locale.getDefault().getLanguage();
            return "ru".equalsIgnoreCase(language) ? russian : english;
        }
    }

    private static void showToast(Context context, String russian, String english) {
        try {
            if (context == null) {
                return;
            }
            Toast.makeText(
                    context,
                    resolveToastMessage(context, russian, english),
                    Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // User feedback cannot affect the Gboard click path.
        }
    }
}
