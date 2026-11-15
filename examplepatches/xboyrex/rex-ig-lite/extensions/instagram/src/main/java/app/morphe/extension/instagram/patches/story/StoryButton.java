/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.story;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.content.Context;
import android.content.DialogInterface;

import java.util.ArrayList;

import com.instagram.common.session.UserSession;

import app.morphe.extension.instagram.patches.download.DownloadUtils;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.ObjectBrowser;
import app.morphe.extension.shared.Logger;

public class StoryButton {
    private static final boolean VIEW_STORY_MENTIONS;
    private static final boolean ENABLE_DOWNLOAD;
    private static final boolean DEBUG;

    static {
        VIEW_STORY_MENTIONS = Pref.viewStoryMentions() && SettingsStatus.viewStoryMentions;
        ENABLE_DOWNLOAD = Pref.enableDownload() && SettingsStatus.downloadMedia;
        DEBUG = Pref.rexDebug();
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static ArrayList addButtons(ArrayList buttonList) {
        if (DEBUG) {
            buttonList.add(str("rex_debug"));
        }
        buttonList.add("xboyrex Options");
        buttonList.add("Story Likes History");
        buttonList.add("Mention Pill Settings");
        if (VIEW_STORY_MENTIONS) {
            buttonList.add(str("rex_view_story_mentions"));
        }
        if (ENABLE_DOWNLOAD) {
            buttonList.add(str("rex_download_options"));
        }
        if (Pref.downloadWithExternalDownloader()) {
            buttonList.add(str("rex_download_with_external_downloader"));
        }
        return buttonList;
    }

    public static boolean storyDialogAction(
            CharSequence buttonText,
            Context context,
            UserSession userSession,
            Object mediaObject,
            Object reelObject,
            DialogInterface.OnDismissListener onDismiss
    ) {
        try {
            String label = buttonText.toString();
            if (label.equals("xboyrex Options")) {
                RexDialogs.showPostOptionsSheet(context, userSession, mediaObject, 0);
                if (onDismiss != null) onDismiss.onDismiss(null);
                return true;
            } else if (label.equals("Story Likes History")) {
                StoryLikeHistoryActivity.open(context);
                if (onDismiss != null) onDismiss.onDismiss(null);
                return true;
            } else if (label.equals("Mention Pill Settings")) {
                StoryMentionSettings.showSettings(context);
                if (onDismiss != null) onDismiss.onDismiss(null);
                return true;
            } else if (label.equals(str("rex_view_story_mentions"))) {
                ViewStoryMentionsPatch.viewMentions(context, mediaObject, onDismiss);
                return true;
            } else if (label.equals(str("rex_download_options"))) {
                DownloadUtils.showStoryDownloadOptions(context, userSession, mediaObject, reelObject, onDismiss);
                return true;
            } else if (label.equals(str("rex_debug"))) {
                if (onDismiss != null) onDismiss.onDismiss(null);
                ObjectBrowser.browseObject(context, mediaObject);
                return true;
            } else if (label.equals(str("rex_download_with_external_downloader"))) {
                DownloadUtils.externalDownloader(mediaObject, 0);
                if (onDismiss != null) onDismiss.onDismiss(null);
                return true;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "StoryDialogAction failure", ex);
            if (onDismiss != null) onDismiss.onDismiss(null);
        }
        return false;
    }
}
