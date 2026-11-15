/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.direct;

import app.morphe.extension.suite.instagram.settings.FamilyNames;
import app.morphe.extension.suite.instagram.settings.Settings;
import app.morphe.extension.suite.shared.Logger;
import app.morphe.extension.suite.shared.Utils;
import app.morphe.extension.suite.shared.diagnostics.HookStatus;

/** Decides whether the visual-only DM receipt should complete locally without being sent. */
public final class VisualSeen {
    private VisualSeen() {}

    /** Default off. Paused, before settings load or on a failed read, Instagram's request proceeds. */
    public static boolean hold() {
        try {
            HookStatus.invoked(FamilyNames.DM_MEDIA_SEEN);
            boolean held = Utils.settingsReady() && Settings.VIEW_DM_MEDIA_ANONYMOUSLY.get();
            if (held) Logger.printDebug(() -> "DM photos and videos: opened receipt held back");
            return held;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DM_MEDIA_SEEN, "switch read", failure);
            return false;
        }
    }
}
