/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.feed;

import java.util.function.BooleanSupplier;

import app.morphe.extension.suite.instagram.settings.FamilyNames;
import app.morphe.extension.suite.instagram.settings.Settings;
import app.morphe.extension.suite.shared.Logger;
import app.morphe.extension.suite.shared.Utils;
import app.morphe.extension.suite.shared.diagnostics.HookStatus;

/**
 * Helper for the "Hide comments" patch.
 *
 * <p>Feed draws each post's action row from a state that keeps whether the row shows the Comment
 * button and whether it shows the comment count. The patch passes both through {@link #feedState}
 * as each state is built, so while the switch is on the row has neither, however often Feed draws
 * it again. Nothing Instagram stores is written, so with the switch off or xboyrex paused the
 * button is back on the next post drawn.
 *
 * <p>The hook fails open: with the switch off, xboyrex paused, the settings not read yet or
 * anything thrown, the row keeps what Instagram built.
 */
public final class CommentsButton {
    /** The step a failed switch read is reported under. */
    static final String SWITCH = "feed state";

    private static volatile boolean logged;

    private CommentsButton() {
    }

    /**
     * Injected right before Feed's action-row state stores whether its row shows the Comment button
     * or the comment count, handed over as an int that reads any non-zero as yes. Answers no while
     * the switch is on, and Instagram's own answer otherwise. Never throws.
     */
    public static boolean feedState(int shown) {
        return feedState(shown != 0, CommentsButton::switchedOn);
    }

    static boolean feedState(boolean shown, BooleanSupplier on) {
        boolean hide = hidden(on);
        HookStatus.counted(FamilyNames.HIDE_COMMENTS, hide ? "comments off" : "comments on");
        return shown && !hide;
    }

    private static boolean hidden(BooleanSupplier on) {
        try {
            HookStatus.invoked(FamilyNames.HIDE_COMMENTS);
            if (!on.getAsBoolean()) return false;
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Hide comments: took the Comment button off a post's action row");
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_COMMENTS, SWITCH, failure);
            return false;
        }
    }

    private static boolean switchedOn() {
        return Utils.settingsReady() && Settings.HIDE_COMMENTS.get();
    }
}
