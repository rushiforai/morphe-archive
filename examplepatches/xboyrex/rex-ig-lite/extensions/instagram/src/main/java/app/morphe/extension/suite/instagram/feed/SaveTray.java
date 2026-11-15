/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.feed;

import app.morphe.extension.suite.instagram.settings.FamilyNames;
import app.morphe.extension.suite.instagram.settings.Settings;
import app.morphe.extension.suite.shared.Utils;
import app.morphe.extension.suite.shared.diagnostics.HookStatus;

/** Helper for the "Skip the collections tray" patch. */
public final class SaveTray {

    private SaveTray() {}

    /**
     * Asked first in Instagram's check of whether a save opens the tray that asks you to start a
     * collection. True makes the check answer no, so the save shows the Saved message instead. False
     * while the switch is off, xboyrex is paused or the settings aren't ready. Never throws.
     */
    public static boolean skip() {
        HookStatus.invoked(FamilyNames.SAVE_TRAY);
        try {
            return Utils.settingsReady() && Settings.SKIP_COLLECTIONS_TRAY.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SAVE_TRAY, "switch read", t);
            return false;
        }
    }
}
