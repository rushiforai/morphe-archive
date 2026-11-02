/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 */
package app.morphe.extension.instagram.patches.story;

import static app.morphe.extension.instagram.utils.IgStr.str;

import java.util.ArrayList;
import android.content.Context;

import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.instagram.patches.download.DownloadUtils;
import app.morphe.extension.instagram.patches.feed.MoreOptionsOnPostPatch;
import app.morphe.extension.rex.ObjectBrowser;

public class StoryButton {
    private static final String STORY_REX_OPTIONS = "xboyrex Options";

    public static ArrayList addButtons(ArrayList buttonList) {
        if (Pref.rexDebug()) {
            buttonList.add(str("rex_debug"));
        }
        buttonList.add(STORY_REX_OPTIONS);
        if (Pref.viewStoryMentions() && SettingsStatus.viewStoryMentions) {
            buttonList.add(str("rex_view_story_mentions"));
        }
        if (Pref.enableDownload() && SettingsStatus.downloadMedia) {
            if (Pref.enableDirectDownload()) {
                buttonList.add(str("rex_category_download_media"));
            } else {
                buttonList.add(str("rex_download_options"));
            }
        }
        if (Pref.downloadWithExternalDownloader()) {
            buttonList.add(str("rex_download_with_external_downloader"));
        }
        return buttonList;
    }

    public static boolean storyButtonAction(CharSequence buttonText, Context ctx, Object mediaObject) {
        try {
            if (STORY_REX_OPTIONS.contentEquals(buttonText)) {
                MoreOptionsOnPostPatch.postMoreOptions(ctx, null, mediaObject, 0);
                return true;
            } else if (buttonText.equals(str("rex_view_story_mentions"))) {
                ViewStoryMentionsPatch.viewMentions(ctx, mediaObject);
                return true;
            } else if (buttonText.equals(str("rex_download_options")) || buttonText.equals(str("rex_category_download_media"))) {
                DownloadUtils.downloadPost(ctx, null, mediaObject, 0);
                return true;
            } else if (buttonText.equals(str("rex_debug"))) {
                ObjectBrowser.browseObject(ctx, new MediaData(mediaObject));
                return true;
            } else if (buttonText.equals(str("rex_download_with_external_downloader"))) {
                DownloadUtils.externalDownloader(mediaObject, 0);
                return true;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Failed storyButtonAction", ex);
        }
        return false;
    }
}
