/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/rex-ig-lite
 *
 * Modified for xboyrex (Instagram), 2026.
 */
package app.morphe.extension.suite.instagram.settings;

import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.category;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.toggle;

import android.content.Context;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

import java.util.Set;

import app.morphe.extension.suite.shared.L10n;

/** Builds the Version warnings category of xboyrex settings, named Updates until 2026-10-27. */
final class UpdatesCategory {
    private UpdatesCategory() { }

    static void add(xboyrexPreferenceFragment page, PreferenceScreen screen, Context context, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.BUILD_EXPIRED_POPUP)) {
            PreferenceCategory updates = category(screen, L10n.t("Version warnings"), SettingsIcons.UPDATES,
                    L10n.t("Stop Instagram from saying this version is too old."));
            updates.addPreference(toggle(context, Settings.REMOVE_BUILD_EXPIRED_POPUP,
                    L10n.t("Remove build expired popup"),
                    L10n.t("Instagram stops showing the screen that says this version is too old. A patched build "
                            + "doesn't update on its own, so this keeps it usable.")));
        }
    }
}
