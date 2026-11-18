/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.devFlags;

import android.content.Context;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.settings.RestartPolicy;
import app.morphe.extension.instagram.settings.SettingRegistry;
import app.morphe.extension.instagram.settings.SettingsActivity;
import app.morphe.extension.instagram.settings.SettingsRestart;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.utils.InstaUtils;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public class RecommendedFlags {
    private static final Set<Runnable> changeListeners = new CopyOnWriteArraySet<>();

    public static final class ValidationReport {
        public final List<Flag> validFlags = new ArrayList<>();
        public final List<String> duplicateCodes = new ArrayList<>();
        public final List<String> malformedEntries = new ArrayList<>();
        public final List<String> unknownTypeEntries = new ArrayList<>();
        public int booleanCount;
        public int longCount;

        public boolean isClean() {
            return !validFlags.isEmpty() && malformedEntries.isEmpty();
        }
    }

    public static final class BulkActionResult {
        public final boolean success;
        public final int totalEligibleBoolean;
        public final int newlyChangedCount;
        public final int alreadyTargetStateCount;
        public final int preservedLongCount;
        public final int skippedInvalidCount;
        public final RestartPolicy strongestRestartPolicy;
        public final String summaryMessage;

        public BulkActionResult(
                boolean success,
                int totalEligibleBoolean,
                int newlyChangedCount,
                int alreadyTargetStateCount,
                int preservedLongCount,
                int skippedInvalidCount,
                RestartPolicy strongestRestartPolicy,
                String summaryMessage
        ) {
            this.success = success;
            this.totalEligibleBoolean = totalEligibleBoolean;
            this.newlyChangedCount = newlyChangedCount;
            this.alreadyTargetStateCount = alreadyTargetStateCount;
            this.preservedLongCount = preservedLongCount;
            this.skippedInvalidCount = skippedInvalidCount;
            this.strongestRestartPolicy = strongestRestartPolicy;
            this.summaryMessage = summaryMessage;
        }
    }

    public static void addChangeListener(Runnable listener) {
        changeListeners.add(listener);
    }

    public static void removeChangeListener(Runnable listener) {
        changeListeners.remove(listener);
    }

    public static File getRecommendedFlagsFile() {
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

    private static JSONArray readFlagsFromFileDir(boolean notifyErrors) {
        try {
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
                    try (InputStream in = ctx.getResources().openRawResource(rawId);
                         Scanner sc = new Scanner(in, "UTF-8").useDelimiter("\\A")) {
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
            } catch (Exception ignored) {
            }
        }
        return new JSONArray();
    }

    public static ValidationReport parseAndValidate(JSONArray arr) {
        ValidationReport report = new ValidationReport();
        if (arr == null) return report;
        Set<String> seenCodes = new HashSet<>();
        for (int i = 0; i < arr.length(); i++) {
            JSONObject obj = arr.optJSONObject(i);
            if (obj == null) {
                report.malformedEntries.add("Entry #" + i + " is not a JSON object");
                continue;
            }
            String name = obj.optString("name", "").trim();
            String code = obj.optString("code", "").trim();
            String type = obj.optString("type", "bool").trim();
            if (name.isEmpty() || code.isEmpty()) {
                report.malformedEntries.add("Entry #" + i + " missing required name or code");
                continue;
            }
            if (!"bool".equalsIgnoreCase(type) && !"long".equalsIgnoreCase(type)) {
                report.unknownTypeEntries.add(code + " (type=" + type + ")");
                continue;
            }
            if (!seenCodes.add(code)) {
                report.duplicateCodes.add(code);
                continue;
            }
            Flag flag = new Flag(obj);
            if (flag.getCode() != null) {
                SettingRegistry.register(flag.getCode().key, RestartPolicy.REQUIRED);
            }
            if (flag.isLongType()) {
                report.longCount++;
            } else {
                report.booleanCount++;
            }
            report.validFlags.add(flag);
        }
        return report;
    }

    public static List<Flag> getFlags() {
        return getFlags(true);
    }

    public static List<Flag> getFlags(boolean notifyErrors) {
        try {
            JSONArray arr = readFlagsFromFileDir(notifyErrors);
            ValidationReport report = parseAndValidate(arr);
            if (notifyErrors && (!report.malformedEntries.isEmpty() || !report.unknownTypeEntries.isEmpty())) {
                RexUtils.toast("Skipped " + (report.malformedEntries.size() + report.unknownTypeEntries.size()) + " invalid flag entries");
            }
            return report.validFlags;
        } catch (Exception e) {
            RexUtils.logger(e);
            if (notifyErrors) RexUtils.toast("getFlags failed");
            return new ArrayList<>();
        }
    }

    /**
     * Dedicated transactional controller for "Enable All Recommended Flags":
     * - Refreshes the PreferenceScreen in-place via SettingsActivity.refreshCurrentScreen(context)
     *   WITHOUT calling activity.recreate() before showing the confirmation dialog (fixes 23487.png blur & missing Restart button).
     */
    public static BulkActionResult enableAllBooleanFlagsTransactionally(Context context, Runnable onScreenRefresh) {
        RexDialogs.clearActivityBlur(context);
        Map<String, String> snapshot = FlagsSharedPref.snapshotRawStrings();
        try {
            JSONArray arr = readFlagsFromFileDir(false);
            ValidationReport report = parseAndValidate(arr);
            int skipped = report.malformedEntries.size() + report.unknownTypeEntries.size() + report.duplicateCodes.size();
            int changed = 0;
            int alreadyEnabled = 0;
            Map<String, String> stagedChanges = new LinkedHashMap<>();

            for (Flag f : report.validFlags) {
                if (f == null || f.getCode() == null || f.getCode().key == null || f.getCode().key.trim().isEmpty()) {
                    skipped++;
                    continue;
                }
                if (f.isLongType()) {
                    continue;
                }
                String key = f.getCode().key;
                String current = FlagsSharedPref.getStringPref(f.getCode());
                if (FlagState.ENABLE.toString().equalsIgnoreCase(current)) {
                    alreadyEnabled++;
                } else {
                    Boolean saved = FlagsSharedPref.setStringPref(key, FlagState.ENABLE.toString());
                    if (!Boolean.TRUE.equals(saved)) {
                        throw new IllegalStateException("Failed to persist flag override for " + key);
                    }
                    stagedChanges.put(key, current == null ? FlagState.DEFAULT.toString() : current);
                    changed++;
                }
            }

            if (!FlagsSharedPref.flush()) {
                throw new IllegalStateException("Failed to flush Recommended Flags store");
            }
            HookFlags.load();

            RestartPolicy strongest = (changed > 0 || alreadyEnabled > 0) ? RestartPolicy.REQUIRED : RestartPolicy.NOT_REQUIRED;
            for (Map.Entry<String, String> entry : stagedChanges.entrySet()) {
                SettingsRestart.markChanged(
                        entry.getKey(),
                        RestartPolicy.REQUIRED,
                        entry.getValue(),
                        FlagState.ENABLE.toString()
                );
            }

            String msg;
            if (changed > 0) {
                msg = "Enabled " + changed + " Boolean flags (" + alreadyEnabled + " already active, "
                        + report.longCount + " numeric preserved)";
            } else {
                msg = "All " + report.booleanCount + " Recommended Boolean flags are already enabled";
            }
            if (skipped > 0) {
                msg += " • Skipped " + skipped + " invalid";
            }
            Utils.showToastShort(msg);

            // Refresh screen in-place without recreating Activity so the Restart dialog stays visible & unblurred
            if (!SettingsActivity.refreshCurrentScreen(context) && onScreenRefresh != null && strongest == RestartPolicy.NOT_REQUIRED) {
                onScreenRefresh.run();
            }
            RexDialogs.clearActivityBlur(context);
            if (context != null) {
                final String dialogSummary = msg + ".\n\nTap 'Restart Now' below (or use the bottom Restart bar) to apply all "
                        + (changed + alreadyEnabled) + " active Recommended Flags to this session.";
                RexDialogs.showConfirmDialog(
                        context,
                        "Recommended Flags Applied",
                        dialogSummary,
                        "Restart Now",
                        false,
                        () -> SettingsRestart.restartNow(context)
                );
            }
            return new BulkActionResult(true, report.booleanCount, changed, alreadyEnabled, report.longCount, skipped, strongest, msg);
        } catch (Throwable t) {
            Logger.printException(() -> "enableAllBooleanFlagsTransactionally rollback", t);
            FlagsSharedPref.restoreSnapshot(snapshot);
            try {
                HookFlags.load();
            } catch (Throwable ignored) {
            }
            RexDialogs.clearActivityBlur(context);
            String err = "Failed to enable all flags — rolled back to previous state";
            Utils.showToastShort(err);
            return new BulkActionResult(false, 0, 0, 0, 0, 0, RestartPolicy.NOT_REQUIRED, err);
        }
    }

    public static BulkActionResult resetAllFlagsTransactionally(Context context, Runnable onScreenRefresh) {
        RexDialogs.clearActivityBlur(context);
        Map<String, String> snapshot = FlagsSharedPref.snapshotRawStrings();
        try {
            int activeBefore = snapshot.size();
            if (!FlagsSharedPref.clearAll()) {
                throw new IllegalStateException("Failed to clear Recommended Flags store");
            }
            HookFlags.load();
            RestartPolicy strongest = activeBefore > 0 ? RestartPolicy.REQUIRED : RestartPolicy.NOT_REQUIRED;
            for (Map.Entry<String, String> entry : snapshot.entrySet()) {
                if (!FlagState.DEFAULT.toString().equals(entry.getValue())) {
                    SettingsRestart.markChanged(
                            entry.getKey(),
                            RestartPolicy.REQUIRED,
                            entry.getValue(),
                            FlagState.DEFAULT.toString()
                    );
                }
            }
            String msg = activeBefore > 0
                    ? ("Reset " + activeBefore + " flag overrides back to Default")
                    : "All Recommended Flags are already at Default";
            Utils.showToastShort(msg);

            if (!SettingsActivity.refreshCurrentScreen(context) && onScreenRefresh != null && strongest == RestartPolicy.NOT_REQUIRED) {
                onScreenRefresh.run();
            }
            RexDialogs.clearActivityBlur(context);
            if (strongest == RestartPolicy.REQUIRED && context != null) {
                RexDialogs.showConfirmDialog(
                        context,
                        "Flags Reset to Default",
                        msg + ".\n\nRestart InstaRex now to restore default behavior?",
                        "Restart Now",
                        true,
                        () -> SettingsRestart.restartNow(context)
                );
            }
            return new BulkActionResult(true, 0, activeBefore, 0, 0, 0, strongest, msg);
        } catch (Throwable t) {
            Logger.printException(() -> "resetAllFlagsTransactionally rollback", t);
            FlagsSharedPref.restoreSnapshot(snapshot);
            try {
                HookFlags.load();
            } catch (Throwable ignored) {
            }
            RexDialogs.clearActivityBlur(context);
            String err = "Failed to reset flags — rolled back to previous state";
            Utils.showToastShort(err);
            return new BulkActionResult(false, 0, 0, 0, 0, 0, RestartPolicy.NOT_REQUIRED, err);
        }
    }

    public static boolean importRecommendedFlagsJson(String jsonContent) {
        if (jsonContent == null || jsonContent.trim().isEmpty()) return false;
        Map<String, String> snapshot = FlagsSharedPref.snapshotRawStrings();
        File catalogFile = getRecommendedFlagsFile();
        File backupFile = new File(catalogFile.getPath() + ".bak");
        try {
            String trimmed = jsonContent.trim();
            if (trimmed.startsWith("[")) {
                JSONArray arr = new JSONArray(trimmed);
                ValidationReport report = parseAndValidate(arr);
                if (report.validFlags.isEmpty()) {
                    return false;
                }
                if (catalogFile.exists()) {
                    copyFile(catalogFile, backupFile);
                }
                File tmp = new File(catalogFile.getPath() + ".tmp");
                try (FileOutputStream fos = new FileOutputStream(tmp)) {
                    fos.write(arr.toString(2).getBytes(StandardCharsets.UTF_8));
                }
                if (!tmp.renameTo(catalogFile)) {
                    if (catalogFile.exists()) catalogFile.delete();
                    if (!tmp.renameTo(catalogFile)) {
                        throw new IllegalStateException("Failed atomic replace of recommended_flags.json");
                    }
                }
                for (int i = 0; i < arr.length(); i++) {
                    JSONObject item = arr.optJSONObject(i);
                    if (item == null) continue;
                    String code = item.optString("code", "").trim();
                    String state = item.optString("state", "").trim();
                    if (!code.isEmpty() && !state.isEmpty()) {
                        FlagsSharedPref.setStringPref(code, state);
                    }
                }
                FlagsSharedPref.flush();
                HookFlags.load();
                if (backupFile.exists()) backupFile.delete();
                return true;
            }
        } catch (Throwable t) {
            FlagsSharedPref.restoreSnapshot(snapshot);
            if (backupFile.exists()) {
                try {
                    copyFile(backupFile, catalogFile);
                    backupFile.delete();
                } catch (Throwable ignored) {
                }
            }
            Logger.printException(() -> "importRecommendedFlagsJson failed", t);
        }
        return false;
    }

    public static JSONArray exportRecommendedFlagsWithState() {
        JSONArray out = new JSONArray();
        try {
            List<Flag> flags = getFlags(false);
            for (Flag f : flags) {
                if (f == null || f.getCode() == null) continue;
                JSONObject item = new JSONObject();
                item.put("name", f.getName());
                item.put("desc", f.getDesc());
                item.put("type", f.isLongType() ? "long" : "bool");
                item.put("code", f.getCode().key);
                item.put("state", FlagsSharedPref.getStringPref(f.getCode()));
                out.put(item);
            }
        } catch (Exception ignored) {
        }
        return out;
    }

    private static void copyFile(File src, File dst) throws Exception {
        try (java.io.FileInputStream in = new java.io.FileInputStream(src);
             FileOutputStream out = new FileOutputStream(dst)) {
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) != -1) out.write(buf, 0, n);
        }
    }

    public static void downloadRecommendedFlagsFile(Runnable onComplete) {
        String filename = Constants.REC_FLAGS + ".json";
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
