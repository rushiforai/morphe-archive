/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches;

import android.content.Context;

import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public class WelcomeMessage {

    public static void openWelcomeMessage(Context context) {
        try {
            if (Pref.firstTimeRex()) {
                Pref.setFirstTimeRex(false);
                RexDialogs.showChangelogDialog(context);
            }
        } catch (Exception ex) {
            Logger.printException(() -> "openWelcomeMessage failure", ex);
        }
    }
}
