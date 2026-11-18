/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.story;

import android.content.Context;
import android.icu.text.MeasureFormat;
import android.icu.util.Measure;
import android.icu.util.MeasureUnit;
import android.text.format.DateFormat;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Locale;

import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public class StoryTimestamp {

    private static String currentMode() {
        String val = Pref.customiseStoryTimestamp();
        return val == null ? "default" : val.trim();
    }

    public static String customiseStoryTimestamp(long postedTS) {
        return customiseStoryTimestamp(postedTS, null);
    }

    public static String customiseStoryTimestamp(long postedTS, Object reelItem) {
        String formatedTS = null;

        try {
            String mode = currentMode();
            if (!mode.equals("detailed")
                    && !mode.equals("posttime")
                    && !mode.equals("timeleft")) {
                return null;
            }

            Context context = Utils.getContext();
            if (context == null) return null;
            Locale locale = context.getResources().getConfiguration().getLocales().get(0);
            postedTS = postedTS * 1000;

            if (mode.equals("detailed") || mode.equals("posttime")) {
                String skeleton = DateFormat.is24HourFormat(context) ? "Hms" : "hms";
                if (mode.equals("detailed")) {
                    skeleton = "EEEEMMMMd" + skeleton;
                }
                Date date = new Date(postedTS);
                SimpleDateFormat format = new SimpleDateFormat(
                        DateFormat.getBestDateTimePattern(locale, skeleton), locale);
                formatedTS = format.format(date);

            } else if (mode.equals("timeleft")) {
                long now = System.currentTimeMillis();
                long expireTS = postedTS + 86400000L; // +24 hours
                long diff = expireTS - now;

                if (diff <= 0) {
                    MeasureFormat format = MeasureFormat.getInstance(locale, MeasureFormat.FormatWidth.SHORT);
                    formatedTS = format.formatMeasures(new Measure(0, MeasureUnit.SECOND));
                } else {
                    long totalSeconds = diff / 1000;
                    long hours = totalSeconds / 3600;
                    long minutes = (totalSeconds % 3600) / 60;
                    if (hours > 0) {
                        formatedTS = hours + "h " + minutes + "m left";
                    } else {
                        long seconds = totalSeconds % 60;
                        formatedTS = minutes + "m " + seconds + "s left";
                    }
                }
            }

            if (formatedTS != null && reelItem != null) {
                formatedTS = appendHiddenMentionLabel(formatedTS, reelItem);
            }
        } catch (Exception e) {
            Logger.printException(() -> "customiseStoryTimestamp failure", e);
        }

        return formatedTS;
    }

    public static String appendHiddenMentionLabel(String baseTimestamp, Object reelItem) {
        if (baseTimestamp == null || reelItem == null) return baseTimestamp;
        try {
            if (!Pref.viewStoryMentions()) return baseTimestamp;
            if (baseTimestamp.contains("(Hidden Mention)")) return baseTimestamp;
            Object media = extractMediaFromReelItem(reelItem);
            if (media == null) return baseTimestamp;
            HashSet<UserData> mentions = new MediaData(media).getMentionSet();
            if (mentions != null && !mentions.isEmpty()) {
                return baseTimestamp + " (Hidden Mention)";
            }
        } catch (Throwable ignored) {
        }
        return baseTimestamp;
    }

    private static Object extractMediaFromReelItem(Object reelItem) {
        if (reelItem == null) return null;
        String clsName = reelItem.getClass().getName();
        if ("com.instagram.feed.media.Media".equals(clsName)) return reelItem;
        try {
            Object viaBridge = app.morphe.extension.instagram.patches.download.StoryDownloadMedia.media(reelItem);
            if (viaBridge != null) return viaBridge;
        } catch (Throwable ignored) {
        }
        try {
            for (Field f : reelItem.getClass().getDeclaredFields()) {
                if ("com.instagram.feed.media.Media".equals(f.getType().getName())) {
                    f.setAccessible(true);
                    Object media = f.get(reelItem);
                    if (media != null) return media;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }
}
