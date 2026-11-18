/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.patches.devFlags;

import android.content.Context;
import java.util.List;
import java.util.ArrayList;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.File;

import static app.morphe.extension.instagram.utils.IgStr.str;

import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.instagram.entity.DeveloperOptions;
import app.morphe.extension.instagram.entity.DeveloperOptionsItem;
import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.utils.InstaUtils;

public class RecommendedFlags {
    private static final Set<Runnable> changeListeners = new CopyOnWriteArraySet<>();

    public static void addChangeListener(Runnable listener) {
        changeListeners.add(listener);
    }

    public static void removeChangeListener(Runnable listener) {
        changeListeners.remove(listener);
    }

    private static File getRecommendedFlagsFile() {
        Context context = RexUtils.getContext();
        return new File(context.getFilesDir(), Constants.REC_FLAGS + ".json");
    }

    public static long getLastModified() {
        File file = getRecommendedFlagsFile();
        return file.exists() ? file.lastModified() : 0L;
    }

    private static final String DEFAULT_RECOMMENDED_FLAGS_JSON = "["
            + "{\"name\":\"Button with a black layout that appears when clicking on something in Stories\",\"desc\":\"Enable dark floating contextual pill layout on interactive Story stickers\",\"type\":\"bool\",\"code\":\"rec_story_black_layout_button\"},"
            + "{\"name\":\"Edit stories after you have been posted\",\"desc\":\"Allow editing story captions and stickers after publishing\",\"type\":\"bool\",\"code\":\"rec_edit_posted_stories\"},"
            + "{\"name\":\"New fonts and animations for Stories\",\"desc\":\"Unlock latest Story text typefaces and keyframe text animations\",\"type\":\"bool\",\"code\":\"rec_new_story_fonts_animations\"},"
            + "{\"name\":\"New Instagram Plus fonts for Stories\",\"desc\":\"Enable exclusive creator Story font collection\",\"type\":\"bool\",\"code\":\"rec_story_plus_fonts\"},"
            + "{\"name\":\"Show Instagram Plus upsells\",\"desc\":\"Toggle visibility of promotional Plus upsell cards\",\"type\":\"bool\",\"code\":\"rec_show_plus_upsells\"},"
            + "{\"name\":\"Selected Instagram Plus features and entry points\",\"desc\":\"Unlock experimental Plus creator tools and entry points\",\"type\":\"bool\",\"code\":\"rec_selected_plus_entry_points\"}"
            + "]";

    private static JSONArray readFlagsFromFileDir(boolean notifyErrors){
        try{
            File recFlagsFile = getRecommendedFlagsFile();
            if (recFlagsFile.exists()) {
                String data = RexUtils.readFile(recFlagsFile);
                if (data != null && !data.trim().isEmpty()) {
                    JSONArray parsed = new JSONArray(data);
                    if (parsed.length() >= 66) return parsed;
                }
            }
            Context ctx = RexUtils.getContext();
            if (ctx != null && ctx.getResources() != null) {
                int rawId = ctx.getResources().getIdentifier("rex_recommended_flags_v3", "raw", ctx.getPackageName());
                if (rawId != 0) {
                    try (java.io.InputStream in = ctx.getResources().openRawResource(rawId);
                         java.util.Scanner sc = new java.util.Scanner(in, "UTF-8").useDelimiter("\\A")) {
                        String bundled = sc.hasNext() ? sc.next() : "";
                        if (!bundled.trim().isEmpty()) return new JSONArray(bundled);
                    }
                }
            }
            return new JSONArray(DEFAULT_RECOMMENDED_FLAGS_JSON);
        } catch (Exception e) {
            RexUtils.logger(e);
            try {
                return new JSONArray(DEFAULT_RECOMMENDED_FLAGS_JSON);
            } catch (Exception ignored) {}
        }
        return new JSONArray();
    }

    public static List<Flag> getFlags() {
        return getFlags(true);
    }

    public static List<Flag> getFlags(boolean notifyErrors) {
        List<Flag> flags = new ArrayList();
        try {
            JSONArray arr = readFlagsFromFileDir(notifyErrors);
            for (int i = 0; i < arr.length(); i++) {
                JSONObject obj = arr.getJSONObject(i);
                flags.add(new Flag(obj));
            }
        } catch (Exception e) {
            RexUtils.logger(e);
            if (notifyErrors) RexUtils.toast("getFlags failed");
        }
        return flags;
    }

    public static void downloadRecommendedFlagsFile(Runnable onComplete) {
        String filename = Constants.REC_FLAGS+".json";
        String host = Constants.REX_MAPPINGS_PATH;
        InstaUtils.downloadFile(host, filename, getRecommendedFlagsFile(), () -> {
            for (Runnable listener : changeListeners) {
                listener.run();
            }
            if (onComplete != null) {
                onComplete.run();
            }
        });
    }
}
