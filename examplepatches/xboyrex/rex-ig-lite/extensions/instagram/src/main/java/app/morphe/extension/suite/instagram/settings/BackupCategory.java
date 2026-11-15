/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/rex-ig-lite
 *
 * Modified for xboyrex (Instagram), 2026.
 */
package app.morphe.extension.suite.instagram.settings;

import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.category;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.mark;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.toggle;

import android.content.Context;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

import java.util.Set;

import app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.Row;
import app.morphe.extension.suite.shared.L10n;

/** Builds the Settings backup category of xboyrex settings. */
final class BackupCategory {
    private BackupCategory() { }

    static void add(xboyrexPreferenceFragment page, PreferenceScreen screen, Context context, Set<PatchFamily> build) {
        PreferenceCategory backup = category(screen, L10n.t("Settings backup"), SettingsIcons.TOOLS,
                L10n.t("Save your xboyrex choices to a file, or bring them back."));
        page.exportConfiguration = new Row(context);
        page.exportConfiguration.setKey("xboyrex_export_configuration");
        page.exportConfiguration.setPersistent(false);
        page.exportConfiguration.setTitle(L10n.t("Export xboyrex settings"));
        // With the profile picture patch in, the file carries the saved profiles too.
        page.exportConfiguration.setSummary(build.contains(PatchFamily.PROFILE_PICTURE)
                ? L10n.t("Choose a file for your installed patches' settings and saved profiles. Your login and history "
                        + "stay on this device.")
                : L10n.t("Choose a file for your installed patches' settings. Accounts and history stay on this device."));
        page.exportConfiguration.setOnPreferenceClickListener(p -> { page.pickConfiguration(false); return true; });
        backup.addPreference(mark(page.exportConfiguration, SettingsIcons.EXPORT));
        backup.addPreference(toggle(context, Settings.DATE_SETTINGS_EXPORT, L10n.t("Date in backup file names"),
                L10n.t("Add the current date and time when exporting settings. Off keeps xboyrex-settings.json.")));
        page.importConfiguration = new Row(context);
        page.importConfiguration.setKey("xboyrex_import_configuration");
        page.importConfiguration.setPersistent(false);
        page.importConfiguration.setTitle(L10n.t("Import xboyrex settings"));
        page.importConfiguration.setSummary(L10n.t("Choose a settings file. All valid choices apply together, and ones "
                + "this version doesn't know are skipped. The Undo row shows how long you can undo."));
        page.importConfiguration.setOnPreferenceClickListener(p -> { page.pickConfiguration(true); return true; });
        // A settings file comes in, so the download arrow, where it used to wear Export's own mark.
        backup.addPreference(mark(page.importConfiguration, SettingsIcons.DOWNLOADS));
        page.undoConfiguration = new Row(context);
        page.undoConfiguration.setKey("xboyrex_undo_configuration");
        page.undoConfiguration.setPersistent(false);
        page.undoConfiguration.setTitle(L10n.t("Undo settings import"));
        // Undo puts the earlier settings back for a while, which the history clock says better than a bin.
        backup.addPreference(mark(page.undoConfiguration, SettingsIcons.UPDATES));
        page.showConfiguration();
    }
}
