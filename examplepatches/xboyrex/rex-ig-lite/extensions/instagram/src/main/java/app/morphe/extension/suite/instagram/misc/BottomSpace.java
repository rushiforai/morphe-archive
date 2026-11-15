/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.misc;

import app.morphe.extension.suite.instagram.settings.FamilyNames;
import app.morphe.extension.suite.instagram.settings.Settings;
import app.morphe.extension.suite.shared.Logger;
import app.morphe.extension.suite.shared.Utils;
import app.morphe.extension.suite.shared.diagnostics.HookStatus;

/**
 * Helper for the "Remove the empty space at the bottom" patch.
 *
 * <p>Each time Instagram lays out its window, it stores the height of the phone's navigation bar,
 * and its tab bar and screens leave that much room at the bottom. When the phone reports no
 * navigation bar there, Instagram asks the system whether the phone has one at all, and if it does,
 * stores the system's standard navigation bar height instead. On a phone whose gesture bar is
 * hidden, or in a pop-up window, that guess is the empty space under the tab bar. The patch passes
 * the guess through {@link #navigationBarHeight}.
 */
public final class BottomSpace {
    private static volatile boolean logged;
    private static volatile int guessed;

    private BottomSpace() {
    }

    /**
     * The navigation bar height Instagram last looked up for a phone that reported none, whether or not
     * the switch dropped it, or 0 before any. A Samsung with its gesture hint hidden reports none, yet a
     * swipe up from the screen's foot still leaves the app, so a reel's seek bar keeps clear of this
     * much there (#633).
     */
    public static int guessedHeight() {
        return guessed;
    }

    /** Forgets the last guess. */
    static void forgetGuess() {
        guessed = 0;
    }

    /**
     * Injected right after Instagram reads the system's navigation bar height to stand in for one
     * the phone didn't report. Answers 0 while the switch is on, and the height otherwise, or when
     * anything goes wrong. Never throws, and never waits for the settings: before they're ready
     * Instagram's guess stays.
     */
    public static int navigationBarHeight(int height) {
        try {
            HookStatus.invoked(FamilyNames.BOTTOM_SPACE);
            if (height > 0) guessed = height;
            if (height <= 0 || !Utils.settingsReady() || !Settings.REMOVE_BOTTOM_SPACE.get()) return height;
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Bottom space: left out a guessed navigation bar of " + height + " px");
            }
            return 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BOTTOM_SPACE, "window insets", failure);
            return height;
        }
    }
}
