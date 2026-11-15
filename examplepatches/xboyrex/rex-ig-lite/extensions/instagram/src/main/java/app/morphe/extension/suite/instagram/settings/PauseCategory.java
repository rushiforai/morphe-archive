/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/rex-ig-lite
 *
 * Modified for xboyrex (Instagram), 2026.
 */
package app.morphe.extension.suite.instagram.settings;

import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.STAYS_WHILE_PAUSED;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.category;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.info;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.mark;
import static app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.toggle;

import android.content.Context;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;

import java.util.Set;

import app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.ClearRow;
import app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.ExportRow;
import app.morphe.extension.suite.instagram.settings.xboyrexPreferenceFragment.Row;
import app.morphe.extension.suite.shared.L10n;
import app.morphe.extension.suite.shared.settings.BaseSettings;
import app.morphe.extension.suite.shared.settings.preference.ClearLogBufferPreference;
import app.morphe.extension.suite.shared.settings.preference.ExportDiagnosticReportPreference;
import app.morphe.extension.suite.shared.settings.preference.LogBufferManager;

/** Builds the Pause and diagnostics category of xboyrex settings. */
final class PauseCategory {
    private PauseCategory() { }

    static void add(xboyrexPreferenceFragment page, PreferenceScreen screen, Context context, Set<PatchFamily> build) {
        // Named for its rows: the screen's own title already says xboyrex. It folds like the others,
        // and opens by itself while paused, locked or showing an interrupted save.
        PreferenceCategory xboyrex = category(screen, L10n.t("Pause and diagnostics"), SettingsIcons.PAUSE,
                L10n.t("Pause xboyrex, lock these settings, or make a report when something breaks."));
        page.recovery = xboyrex;
        xboyrex.addPreference(mark(toggle(context, BaseSettings.PAUSED, L10n.t("Pause xboyrex"),
                L10n.t("From the next start, every switch but Debug logging acts as if it were off. "
                        + "Changes made when you patched stay in, and your choices stay saved.")), SettingsIcons.PATCHED));
        // Lock these settings (#301), under Pause, which it locks too. Its words follow the lock's state.
        Row lock = page.settingsLock = new Row(context);
        lock.setKey(xboyrexPreferenceFragment.LOCK_ROW_KEY);
        lock.setPersistent(false);
        xboyrexPreferenceFragment.showLockRow(lock, SettingsLock.state());
        lock.setOnPreferenceClickListener(p -> {
            page.tapLock();
            return true;
        });
        xboyrex.addPreference(mark(lock, SettingsIcons.LOCK));
        // Debug logging also fills the exported report and turns on error toasts (Logger).
        xboyrex.addPreference(mark(toggle(context, BaseSettings.DEBUG, L10n.t("Debug logging"),
                L10n.t("Record patch activity and show errors for a bug report. Leave off during normal use.")), SettingsIcons.BUG));
        ExportDiagnosticReportPreference export = page.exportDiagnostics = page.new ExportRow(context);
        export.setTitle(L10n.t("Export diagnostic report"));
        export.setSummary(L10n.f("Copy a quick report or save the full one to %1$s. Links, IDs, cookies and sign-in "
                + "details are left out. Check it for other private text before you share it.",
                L10n.isolate(LogBufferManager.reportFolder(context))));
        xboyrex.addPreference(mark(export, SettingsIcons.LICENSE));
        ClearLogBufferPreference clear = new ClearRow(context);
        clear.setTitle(L10n.t("Clear diagnostic data"));
        clear.setClearAndUndoSummaries(L10n.t("Empties the activity log and any kept crash that a diagnostic report would include."),
                L10n.t("Diagnostic data cleared. Tap again to put it back."));
        xboyrex.addPreference(mark(clear, SettingsIcons.DELETE));
        String stays = PatchFamily.staysWhilePausedSummary(build);
        if (stays != null) xboyrex.addPreference(info(context, L10n.t(STAYS_WHILE_PAUSED), stays));
    }
}
