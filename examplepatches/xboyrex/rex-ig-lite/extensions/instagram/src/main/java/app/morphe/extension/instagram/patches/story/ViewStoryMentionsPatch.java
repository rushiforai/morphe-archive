/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.story;

import java.util.HashSet;
import java.util.ArrayList;
import java.util.List;
import android.content.Context;
import android.content.DialogInterface;
import android.view.View;

import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;

import com.instagram.igds.components.peoplecell.IgdsPeopleCell;
import com.instagram.common.typedurl.ImageUrl;

public class ViewStoryMentionsPatch {

    public static void viewMentions(Context context, Object mediaObject,
                                    DialogInterface.OnDismissListener onDismiss) {
        try {
            if (context == null) {
                if (onDismiss != null) onDismiss.onDismiss(null);
                return;
            }
            List<UserData> mentionsList = new ArrayList<>();
            boolean resolvedOk = false;
            if (mediaObject != null) {
                try {
                    HashSet<UserData> mentionSet = new MediaData(mediaObject).getMentionSet();
                    if (mentionSet != null) {
                        mentionsList.addAll(mentionSet);
                        resolvedOk = true;
                    }
                } catch (Throwable ignored) {
                    resolvedOk = false;
                }
            }
            RexDialogs.showStoryMentionsSheet(context, mentionsList, resolvedOk, onDismiss);
        } catch (Throwable ex) {
            try {
                PeopleCellDialogBox.showPeopleDialog(context, new ArrayList<>(), onDismiss);
            } catch (Throwable ignored) {
                if (onDismiss != null) onDismiss.onDismiss(null);
            }
        }
    }

    // The patch injects calls to the native methods resolved from the target apk.
    private static void setPrimaryText(IgdsPeopleCell cell, CharSequence text, boolean verified) {}

    private static void setSupportingText(IgdsPeopleCell cell, CharSequence text) {}

    private static void setProfileImage(IgdsPeopleCell cell, ImageUrl image, View.OnClickListener listener) {}
}
