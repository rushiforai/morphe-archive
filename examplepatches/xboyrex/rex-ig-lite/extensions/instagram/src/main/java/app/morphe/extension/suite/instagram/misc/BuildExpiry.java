/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.misc;

import app.morphe.extension.suite.instagram.settings.FamilyNames;
import app.morphe.extension.suite.instagram.settings.Settings;
import app.morphe.extension.suite.shared.Utils;
import app.morphe.extension.suite.shared.diagnostics.HookStatus;

/** Helper for the "Remove build expired popup" patch. */
public final class BuildExpiry {

    private BuildExpiry() {}

    /**
     * Asked at the start of the method that shows the screen saying this version of Instagram is
     * too old to use. True makes it return before it shows anything. False while the switch is off,
     * xboyrex is paused or the settings aren't ready. Never throws.
     */
    public static boolean suppress() {
        HookStatus.invoked(FamilyNames.BUILD_EXPIRED_POPUP);
        try {
            return Utils.settingsReady() && Settings.REMOVE_BUILD_EXPIRED_POPUP.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.BUILD_EXPIRED_POPUP, "switch read", t);
            return false;
        }
    }
}
