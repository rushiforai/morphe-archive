/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.feed;

import android.content.Context;

import com.instagram.common.session.UserSession;

import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.shared.Logger;

public class MoreOptionsOnPostPatch {

    public static void postMoreOptions(Context context, UserSession userSession, Object mediaObject, int currentMediaIndex) {
        try {
            RexDialogs.showPostOptionsSheet(context, userSession, mediaObject, currentMediaIndex);
        } catch (Exception e) {
            Logger.printException(() -> "postMoreOptions failure", e);
        }
    }
}
