/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 */
package app.morphe.extension.instagram.patches;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import app.morphe.extension.instagram.ui.RexDialogs;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public class WelcomeMessage {

    private static boolean shownThisSession = false;

    public static void openWelcomeMessage(Context context) {
        try {
            if (!shownThisSession && Pref.firstTimeRex()) {
                shownThisSession = true;
                Pref.setFirstTimeRex(false);
                new Handler(Looper.getMainLooper()).postDelayed(() -> {
                    try {
                        RexDialogs.showChangelogsDialog(context);
                    } catch (Exception e) {
                        Logger.printException(() -> "Deferred welcome dialog failure", e);
                    }
                }, 600L);
            }
        } catch (Exception ex) {
            Logger.printException(() -> "openWelcomeMessage failure", ex);
        }
    }
}
