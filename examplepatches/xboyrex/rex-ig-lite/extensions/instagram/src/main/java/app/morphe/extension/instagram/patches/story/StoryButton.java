/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.story;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ReplacementSpan;

import java.util.ArrayList;

import com.instagram.common.session.UserSession;

import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.patches.download.DownloadUtils;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexIcon;
import app.morphe.extension.instagram.settings.preference.widgets.RexVectorIcons;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.ObjectBrowser;
import app.morphe.extension.rex.RexUtils;
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

    /**
     * Wraps a Story 3-dot overflow menu label with a leading 24dp semantic vector icon + 14dp gap
     * so custom rows in Instagram's "About this story" sheet (23486.png) display crisp left icons
     * aligned with native rows (Delete, Archive, Save video, Share).
     */
    private static CharSequence iconifiedStoryMenuLabel(String iconId, String labelText) {
        if (labelText == null || labelText.isEmpty()) return "";
        try {
            Context ctx = RexUtils.getContext();
            if (ctx == null) return labelText;
            final int iconSizePx = RexVectorIcons.dp(ctx, 22);
            final int totalAdvancePx = RexVectorIcons.dp(ctx, 38);
            final Drawable icon = RexIcon.getDrawable(ctx, iconId, Color.WHITE, 22);
            if (icon == null) return labelText;
            icon.setBounds(0, 0, iconSizePx, iconSizePx);

            SpannableString ss = new SpannableString("\u200B" + labelText);
            ss.setSpan(new ReplacementSpan() {
                @Override
                public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
                    return totalAdvancePx;
                }

                @Override
                public void draw(Canvas canvas, CharSequence text, int start, int end,
                                 float x, int top, int y, int bottom, Paint paint) {
                    canvas.save();
                    float centerY = (top + bottom) * 0.5f;
                    float transY = centerY - (iconSizePx * 0.5f);
                    canvas.translate(x, transY);
                    icon.draw(canvas);
                    canvas.restore();
                }
            }, 0, 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            return ss;
        } catch (Throwable ignored) {
            return labelText;
        }
    }

    private static String normalizeMenuLabel(CharSequence cs) {
        if (cs == null) return "";
        return cs.toString().replace("\u200B", "").trim();
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static ArrayList addButtons(ArrayList buttonList) {
        if (buttonList == null) return new ArrayList();
        if (isDebugEnabled()) {
            addUnique(buttonList, iconifiedStoryMenuLabel("bug", str("rex_debug")));
        }
        addUnique(buttonList, iconifiedStoryMenuLabel("sliders-horizontal", "Story Quick Settings"));
        addUnique(buttonList, iconifiedStoryMenuLabel("heart-spark", "Story Likes History"));
        if (isViewStoryMentionsEnabled()) {
            addUnique(buttonList, iconifiedStoryMenuLabel("at-sign", str("rex_view_story_mentions")));
            addUnique(buttonList, iconifiedStoryMenuLabel("adjustments", "Mention Pill Settings"));
        }
        if (isDownloadEnabled()) {
            addUnique(buttonList, iconifiedStoryMenuLabel("download", "Download Story"));
            addUnique(buttonList, iconifiedStoryMenuLabel("folder-down", str("rex_download_options")));
        }
        if (isExternalDownloaderConfigured()) {
            addUnique(buttonList, iconifiedStoryMenuLabel("external-link", str("rex_download_with_external_downloader")));
        }
        return buttonList;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static void addUnique(ArrayList list, CharSequence item) {
        if (item == null) return;
        String target = normalizeMenuLabel(item);
        for (Object existing : list) {
            if (existing instanceof CharSequence && normalizeMenuLabel((CharSequence) existing).equalsIgnoreCase(target)) {
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
            String label = normalizeMenuLabel(buttonText);
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
            } else if (label.equals(str("rex_view_story_mentions")) || label.equalsIgnoreCase("View story mentions")) {
                ViewStoryMentionsPatch.viewMentions(context, mediaObject, onDismiss);
                return true;
            } else if (label.equals("Download Story")) {
                DownloadUtils.downloadStory(null, userSession, mediaObject, reelObject, false);
                if (onDismiss != null) onDismiss.onDismiss(null);
                return true;
            } else if (label.equals(str("rex_download_options"))
                    || label.equals(str("rex_category_download_media"))
                    || label.equalsIgnoreCase("Download options")) {
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
            String label = normalizeMenuLabel(buttonText);
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
