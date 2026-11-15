/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.direct;

import app.morphe.extension.suite.instagram.settings.FamilyNames;
import app.morphe.extension.suite.instagram.settings.Settings;
import app.morphe.extension.suite.shared.Utils;
import app.morphe.extension.suite.shared.diagnostics.HookStatus;
import app.morphe.extension.suite.shared.settings.xboyrexPause;

/**
 * Keeps "Help keep Instagram a supportive place" off the bottom of a chat (#588).
 *
 * <p>Instagram shows that banner from two places. A chat with one person asks its server about the
 * other account and then calls back with whether to show it, which is {@link #mayShow}. A public
 * chat shows it until a count on the phone reaches one, which is {@link #timesShown}. Neither
 * answer leaves the phone, and the banner's own close button is never involved.
 *
 * <p>Fails open: anything unexpected hands Instagram its own answer back.
 */
public final class KindnessReminder {
    /** What's counted each time the banner stays away. */
    static final String KEPT_OUT = "reminders kept out of chats";

    private KindnessReminder() {
    }

    /** A chat with one person. [wanted] is non-zero when Instagram would show the banner, and the answer replaces it. */
    public static int mayShow(int wanted) {
        try {
            HookStatus.invoked(FamilyNames.KINDNESS_REMINDER);
            if (wanted != 0 && hidden()) {
                HookStatus.counted(FamilyNames.KINDNESS_REMINDER, KEPT_OUT);
                return 0;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KINDNESS_REMINDER, "one person chat", failure);
        }
        return wanted;
    }

    /** A public chat. [times] is how often Instagram has shown the banner, and any answer above zero keeps it away. */
    public static int timesShown(int times) {
        try {
            HookStatus.invoked(FamilyNames.KINDNESS_REMINDER);
            if (times < 1 && hidden()) {
                HookStatus.counted(FamilyNames.KINDNESS_REMINDER, KEPT_OUT);
                return Integer.MAX_VALUE;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KINDNESS_REMINDER, "public chat", failure);
        }
        return times;
    }

    private static boolean hidden() {
        return Utils.settingsReady() && !xboyrexPause.isPaused() && Settings.HIDE_KINDNESS_REMINDER.get();
    }
}
