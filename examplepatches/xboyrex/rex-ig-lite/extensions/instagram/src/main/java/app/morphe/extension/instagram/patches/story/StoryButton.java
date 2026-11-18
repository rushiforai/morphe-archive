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

import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.patches.download.DownloadUtils;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.ObjectBrowser;
import app.morphe.extension.shared.Logger;

public class StoryButton {

    private static boolean isViewStoryMentionsEnabled() {
        return Pref.viewStoryMentions() && SettingsStatus.viewStoryMentions;
    }

    private static boolean isDownloadEnabled() {
        return Pref.enableDownload() && SettingsStatus.downloadMedia;
    }

    private static boolean isExternalDownloaderConfigured() {
        if (!Pref.downloadWithExternalDownloader()) return false;
        String pkg = Pref.getExternalDownloaderPackageName();
        return pkg != null && !pkg.trim().isEmpty();
    }

    private static boolean isDebugEnabled() {
        return Pref.rexDebug();
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static ArrayList addButtons(ArrayList buttonList) {
        if (buttonList == null) return new ArrayList();
        if (isDebugEnabled() && !buttonList.contains(str("rex_debug"))) {
            buttonList.add(str("rex_debug"));
        }
        addUnique(buttonList, "Story Quick Settings");
        addUnique(buttonList, "Story Likes History");
        if (isViewStoryMentionsEnabled()) {
            addUnique(buttonList, str("rex_view_story_mentions"));
            addUnique(buttonList, "Mention Pill Settings");
        }
        if (isDownloadEnabled()) {
            addUnique(buttonList, "Download Story");
            addUnique(buttonList, str("rex_download_options"));
        }
        if (isExternalDownloaderConfigured()) {
            addUnique(buttonList, str("rex_download_with_external_downloader"));
        }
        return buttonList;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static void addUnique(ArrayList list, CharSequence item) {
        if (item == null) return;
        for (Object existing : list) {
            if (existing != null && existing.toString().equalsIgnoreCase(item.toString())) {
                return;
            }
        }
        list.add(item);
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
            if (buttonText == null) return false;
            String label = buttonText.toString();
            if (label.equals("Story Quick Settings") || label.equals("xboyrex Options") || label.equals("InstaRex Story Options")) {
                RexDialogs.showStoryOptionsSheet(context, userSession, mediaObject, reelObject);
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
            } else if (label.equals("Download Story")) {
                DownloadUtils.downloadStory(null, userSession, mediaObject, reelObject, false);
                if (onDismiss != null) onDismiss.onDismiss(null);
                return true;
            } else if (label.equals(str("rex_download_options")) || label.equals(str("rex_category_download_media"))) {
                DownloadUtils.showStoryDownloadOptions(context, userSession, mediaObject, reelObject, onDismiss);
                return true;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "StoryDialogAction failure", ex);
            if (onDismiss != null) onDismiss.onDismiss(null);
        }
        return false;
    }

    public static boolean storyButtonAction(CharSequence buttonText, Context ctx, Object mediaObject) {
        try {
            if (buttonText == null) return false;
            String label = buttonText.toString();
            if (label.equals(str("rex_debug"))) {
                ObjectBrowser.browseObject(ctx, new MediaData(mediaObject));
                return true;
            } else if (label.equals(str("rex_download_with_external_downloader"))) {
                DownloadUtils.externalDownloader(mediaObject, 0);
                return true;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Failed storyButtonAction", ex);
        }
        return false;
    }
}
