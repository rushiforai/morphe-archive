/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/rex-ig-lite
 *
 * Modified for xboyrex (Instagram), 2026.
 */
package app.morphe.extension.suite.instagram.settings;

import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.CLEAR_MEDIA_CACHE_NOW;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.category;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.clearMediaCache;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.mark;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.toggle;

import android.content.Context;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

import java.util.Set;

import app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.Row;
import app.morphe.extension.suite.shared.L10n;

/** Builds the Storage category of xboyrex settings. */
final class StorageCategory {
    private StorageCategory() { }

    static void add(xboyrexPreferenceFragment page, PreferenceScreen screen, Context context, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.MEDIA_CACHE)) {
            PreferenceCategory storage = category(screen, L10n.t("Storage"), SettingsIcons.STORAGE,
                    L10n.t("Keep Instagram's saved photos and videos from filling your phone."));
            storage.addPreference(toggle(context, Settings.CLEAR_MEDIA_CACHE, L10n.t("Clear the media cache"),
                    L10n.t("When Instagram has more than 500 MB of saved photos and videos, deletes the photos as "
                            + "you leave it and the videos the next time it starts. Your sign-in, drafts and "
                            + "settings stay.")));
            Row clearNow = new Row(context);
            clearNow.setKey(CLEAR_MEDIA_CACHE_NOW);
            clearNow.setPersistent(false);
            clearNow.setTitle(L10n.t("Clear saved copies now"));
            clearNow.setSummary(L10n.t("Deletes the saved photos Instagram keeps to show again, whatever their size, "
                    + "and the saved videos the next time it starts."));
            clearNow.setOnPreferenceClickListener(p -> {
                clearMediaCache(p);
                return true;
            });
            storage.addPreference(mark(clearNow, SettingsIcons.DELETE));
        }
    }
}
