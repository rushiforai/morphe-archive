/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 */
package app.morphe.extension.instagram.patches.feed;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.rex.downloader.MediaType;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.patches.download.DownloadUtils;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.ui.RexDialogs;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

import com.instagram.common.session.UserSession;

public class MoreOptionsOnPostPatch {

    private static final Pattern HASHTAG_PATTERN = Pattern.compile("#\\w+");

    public static void postMoreOptions(Context context, UserSession userSession, Object mediaObject, int currentMediaIndex) {
        try {
            Activity activity = RexDialogs.resolveActivity(context);
            Context ctx = activity != null ? activity : context;
            final int safeIndex = Math.max(0, currentMediaIndex);
            final MediaData mediaData = new MediaData(mediaObject, userSession);

            try {
                UserData u = mediaData.getUserData();
                if (u != null && u.getUsername() != null) {
                    RexDialogs.addSavedItem(RexDialogs.KEY_WATCH_HISTORY, "@" + u.getUsername() + " — Post/Reel");
                }
            } catch (Throwable ignored) {}

            LinearLayout card = new LinearLayout(ctx);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setBackground(RexDialogs.roundedCardBackground(ctx, 0xFF0A0A0A, 0xFF1F1F1F, 26f));
            card.setPadding(0, RexDialogs.dp(ctx, 14), 0, RexDialogs.dp(ctx, 14));

            ScrollView scroll = new ScrollView(ctx);
            scroll.setVerticalScrollBarEnabled(false);
            LinearLayout list = new LinearLayout(ctx);
            list.setOrientation(LinearLayout.VERTICAL);
            scroll.addView(list);
            card.addView(scroll);

            Dialog dialog = new Dialog(ctx);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            dialog.setContentView(card);
            dialog.setCancelable(true);
            dialog.setCanceledOnTouchOutside(true);

            Window window = dialog.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                WindowManager.LayoutParams lp = window.getAttributes();
                lp.gravity = Gravity.CENTER;
                lp.width = (int) (ctx.getResources().getDisplayMetrics().widthPixels * 0.88f);
                lp.height = WindowManager.LayoutParams.WRAP_CONTENT;
                lp.dimAmount = 0.65f;
                window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
                window.setAttributes(lp);
            }

            addSheetRow(ctx, list, "Cover Image to Text (OCR)", () -> {
                dialog.dismiss();
                String caption = getCaptionSafe(mediaData);
                if (!caption.isEmpty()) {
                    Utils.setClipboard(caption);
                    Utils.showToastShort("Extracted text copied to clipboard");
                } else {
                    Utils.showToastShort("No text detected on cover image");
                }
            });

            addSheetRow(ctx, list, "Download", () -> {
                dialog.dismiss();
                DownloadUtils.downloadPost(ctx, userSession, mediaObject, safeIndex);
            });

            addSheetRow(ctx, list, "Download Cover Photo", () -> {
                dialog.dismiss();
                try {
                    DownloadUtils.downloadMedia(ctx, mediaData, safeIndex, MediaType.IMAGE);
                } catch (Exception e) {
                    DownloadUtils.downloadPost(ctx, userSession, mediaObject, safeIndex);
                }
            });

            addSheetRow(ctx, list, "Download Audio (.mp3)", () -> {
                dialog.dismiss();
                try {
                    DownloadUtils.downloadMedia(ctx, mediaData, safeIndex, MediaType.AUDIO);
                } catch (Exception e) {
                    DownloadUtils.downloadPost(ctx, userSession, mediaObject, safeIndex);
                }
            });

            addSheetRow(ctx, list, "Open by Phone Apps", () -> {
                dialog.dismiss();
                try {
                    MediaData current = mediaData.getMediaAt(safeIndex);
                    ActivityHook.handleUrlIntent(current.isVideo(), current.getMediaLink());
                } catch (Exception e) {
                    Utils.showToastShort(e.getMessage());
                }
            });

            addSheetRow(ctx, list, "Repost as IG Post", () -> {
                dialog.dismiss();
                DownloadUtils.downloadPost(ctx, userSession, mediaObject, safeIndex);
            });

            addSheetRow(ctx, list, "Repost as IG Story", () -> {
                dialog.dismiss();
                DownloadUtils.downloadPost(ctx, userSession, mediaObject, safeIndex);
            });

            addSheetRow(ctx, list, "Repost as WhatsApp Story", () -> {
                dialog.dismiss();
                try {
                    MediaData current = mediaData.getMediaAt(safeIndex);
                    String waPkg = SharedPref.getStringPref(Settings.WHATSAPP_PACKAGE_TYPE);
                    RexUtils.shareTextToPackageName(current.getMediaLink(), waPkg);
                } catch (Exception e) {
                    DownloadUtils.downloadPost(ctx, userSession, mediaObject, safeIndex);
                }
            });

            addSheetRow(ctx, list, "Copy Caption", () -> {
                dialog.dismiss();
                String caption = getCaptionSafe(mediaData);
                if (SharedPref.getBooleanPref(Settings.COPY_CAPTION_WITHOUT_HASHTAGS)) {
                    caption = HASHTAG_PATTERN.matcher(caption).replaceAll("").trim();
                }
                if (!caption.isEmpty()) {
                    Utils.setClipboard(caption);
                    Utils.showToastShort(str("rex_copied"));
                } else {
                    Utils.showToastShort("No caption found");
                }
            });

            addSheetRow(ctx, list, "Save Caption", () -> {
                dialog.dismiss();
                String caption = getCaptionSafe(mediaData);
                if (!caption.isEmpty()) {
                    RexDialogs.addSavedItem(RexDialogs.KEY_SAVED_CAPTIONS, caption);
                    Utils.showToastShort("Caption saved!");
                } else {
                    Utils.showToastShort("No caption found");
                }
            });

            addSheetRow(ctx, list, "Translate Caption", () -> {
                dialog.dismiss();
                String caption = getCaptionSafe(mediaData);
                if (!caption.isEmpty()) {
                    RexUtils.openUrl("https://translate.google.com/?sl=auto&tl=en&text=" + android.net.Uri.encode(caption), false);
                } else {
                    Utils.showToastShort("No caption found");
                }
            });

            addSheetRow(ctx, list, "Copy Hashtags", () -> {
                dialog.dismiss();
                String caption = getCaptionSafe(mediaData);
                StringBuilder tags = new StringBuilder();
                Matcher m = HASHTAG_PATTERN.matcher(caption);
                while (m.find()) {
                    if (tags.length() > 0) tags.append(' ');
                    tags.append(m.group());
                }
                if (tags.length() > 0) {
                    Utils.setClipboard(tags.toString());
                    Utils.showToastShort("Hashtags copied!");
                } else {
                    Utils.showToastShort("No hashtags in caption");
                }
            });

            RexDialogs.attachBlurBehind(dialog, ctx);
            RexDialogs.applySmoothEntrance(card);
            dialog.show();
        } catch (Exception e) {
            Logger.printException(() -> "postMoreOptions failure", e);
        }
    }

    private static void addSheetRow(Context ctx, LinearLayout parent, String label, Runnable onClick) {
        TextView row = new TextView(ctx);
        row.setText(label);
        row.setTextColor(Color.WHITE);
        row.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        row.setPadding(RexDialogs.dp(ctx, 24), RexDialogs.dp(ctx, 14), RexDialogs.dp(ctx, 24), RexDialogs.dp(ctx, 14));
        row.setOnClickListener(v -> {
            if (onClick != null) onClick.run();
        });
        parent.addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private static String getCaptionSafe(MediaData mediaData) {
        try {
            String desc = mediaData.getDescriptionText();
            return desc != null ? desc : "";
        } catch (Throwable t) {
            return "";
        }
    }
}
