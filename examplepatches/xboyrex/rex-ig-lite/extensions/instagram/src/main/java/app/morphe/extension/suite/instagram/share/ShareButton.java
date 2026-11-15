/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.share;

import java.util.function.BooleanSupplier;

import app.morphe.extension.suite.instagram.settings.FamilyNames;
import app.morphe.extension.suite.instagram.settings.Settings;
import app.morphe.extension.suite.shared.Logger;
import app.morphe.extension.suite.shared.Utils;
import app.morphe.extension.suite.shared.diagnostics.HookStatus;

/**
 * Helper for the "Hide the Share button" patch.
 *
 * <p>Feed draws each post's action row from a state that keeps whether the row shows the Share
 * button and whether it shows the share count. The patch passes both through {@link #feedState}
 * as each state is built, so while the switch is on the row has neither, however often Feed draws
 * it again. Reels ask one check whether a reel's action column has the button, and the patch asks
 * {@link #hideInReels} first thing in it. Nothing Instagram stores is written, so with the switch
 * off or xboyrex paused the button is back on the next post or reel drawn.
 *
 * <p>Both hooks fail open: with the switch off, xboyrex paused, the settings not read yet or
 * anything thrown, Instagram decides as it would.
 */
public final class ShareButton {
    /** The steps a failed switch read is reported under. */
    static final String FEED = "feed state";
    static final String REELS = "reels check";

    private static volatile boolean logged;

    private ShareButton() {
    }

    /**
     * Injected right before Feed's action-row state stores whether its row shows the Share button
     * or the share count, handed over as an int that reads any non-zero as yes. Answers no while
     * the switch is on, and Instagram's own answer otherwise. Never throws.
     */
    public static boolean feedState(int shown) {
        return feedState(shown != 0, ShareButton::switchedOn);
    }

    static boolean feedState(boolean shown, BooleanSupplier on) {
        // Asked first, so every state built is counted, a row Instagram already leaves bare included.
        boolean hide = hidden(FEED, on);
        return shown && !hide;
    }

    /**
     * Injected first thing in the check that decides whether a reel shows the Share button. True
     * while the switch is on, and the check then answers no. Never throws.
     */
    public static boolean hideInReels() {
        return hideInReels(ShareButton::switchedOn);
    }

    static boolean hideInReels(BooleanSupplier on) {
        return hidden(REELS, on);
    }

    private static boolean hidden(String step, BooleanSupplier on) {
        boolean hide;
        try {
            HookStatus.invoked(FamilyNames.HIDE_SHARE_BUTTON);
            hide = on.getAsBoolean();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_SHARE_BUTTON, step, failure);
            hide = false;
        }
        HookStatus.counted(FamilyNames.HIDE_SHARE_BUTTON, (hide ? "share off in " : "share on in ") + step);
        if (hide && !logged) {
            logged = true;
            Logger.printDebug(() -> "Hide the Share button: took the Share button off a post or reel");
        }
        return hide;
    }

    private static boolean switchedOn() {
        return Utils.settingsReady() && Settings.HIDE_SHARE_BUTTON.get();
    }
}
