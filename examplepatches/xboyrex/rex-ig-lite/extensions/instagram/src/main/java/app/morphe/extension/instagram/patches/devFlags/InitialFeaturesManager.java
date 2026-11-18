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
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Scanner;

import app.morphe.extension.instagram.settings.RestartPolicy;
import app.morphe.extension.instagram.settings.SettingRegistry;
import app.morphe.extension.instagram.settings.SettingsActivity;
import app.morphe.extension.instagram.settings.SettingsRestart;
import app.morphe.extension.instagram.settings.StringSetting;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Dedicated controller & registry for the 72-Entry "Initial Features" Experimental Flag Catalogue
 * across 10 categories:
 * 1. Reels & Playback
 * 2. Stories & Mentions
 * 3. Feed & Explore
 * 4. Navigation & Interface
 * 5. Messaging & Calling
 * 6. Notes & Reactions
 * 7. Profile & Social
 * 8. Gallery & Upload Quality
 * 9. AI & Experimental
 * 10. Developer & Diagnostics
 */
public final class InitialFeaturesManager {

    public static final String PREF_FILTER_CATEGORY = "rex_init_features_filter_category";
    public static final String PREF_FILTER_STATUS = "rex_init_features_filter_status";
    public static final String PREF_SEARCH_QUERY = "rex_init_features_search_query";
    public static final String PREF_CONFLICT_MODE = "rex_init_features_conflict_mode";
    public static final String PRESET_RECOMMENDED_SAFE = "Apply Recommended Safe Preset";

    public static final String[] CATEGORIES = {
            "All Categories",
            "Reels & Playback",
            "Stories & Mentions",
            "Feed & Explore",
            "Navigation & Interface",
            "Messaging & Calling",
            "Notes & Reactions",
            "Profile & Social",
            "Gallery & Upload Quality",
            "AI & Experimental",
            "Developer & Diagnostics"
    };

    public static final String[] STATUS_FILTERS = {
            "All Flags (72)",
            "Supported Only",
            "Enabled Only",
            "Disabled Only",
            "Modified (Non-Default)",
            "Experimental / Conflicting",
            "Unsupported / Broken"
    };

    public static final String[] PRESETS = {
            "Apply Recommended Safe Preset",
            "Apply High Quality Upload Preset",
            "Apply Reels Preset",
            "Apply Stories Preset",
            "Apply Navigation Preset",
            "Apply Notes Preset",
            "Enable All Supported Flags",
            "Conflict Preset A: Modern Reels UFI (Enable Follow UFI)",
            "Conflict Preset B: Classic Clean Reels (Disable Follow UFI & Organic Profile UFI)",
            "Reset All Initial Features to Default"
    };

    public static final class SubFlagSpec {
        public final String name;
        public final String key;
        public final String type;
        public final String defaultVal;

        public SubFlagSpec(String name, String key, String type, String defaultVal) {
            this.name = name;
            this.key = key;
            this.type = type;
            this.defaultVal = defaultVal;
        }
    }

    public static final class FeatureEntry {
        public final int index;
        public final String id;
        public final String title;
        public final String rawFlagName;
        public final String category;
        public final String controlType;
        public final List<String> enumOptions;
        public final String addedInVersion;
        public final String stableId;
        public final String mobileConfigCode;
        public final String recommendedValue;
        public final String defaultValue;
        public final String supportStatus;
        public final boolean restartRequired;
        public final String description;
        public final String conflictNote;
        public final List<SubFlagSpec> subFlags;
        public final StringSetting setting;

        public FeatureEntry(JSONObject obj) {
            this.index = obj.optInt("index", 0);
            this.id = obj.optString("id", "").trim();
            this.title = obj.optString("title", "").trim();
            this.rawFlagName = obj.optString("rawFlagName", "").trim();
            this.category = obj.optString("category", "Developer & Diagnostics").trim();
            this.controlType = obj.optString("controlType", "bool").trim();

            List<String> enums = new ArrayList<>();
            JSONArray enumArr = obj.optJSONArray("enumOptions");
            if (enumArr != null) {
                for (int i = 0; i < enumArr.length(); i++) {
                    String opt = enumArr.optString(i, "").trim();
                    if (!opt.isEmpty()) enums.add(opt);
                }
            }
            this.enumOptions = Collections.unmodifiableList(enums);

            this.addedInVersion = obj.optString("addedInVersion", "").trim();
            this.stableId = obj.optString("stableId", "").trim();
            this.mobileConfigCode = obj.optString("mobileConfigCode", this.id).trim();
            this.recommendedValue = obj.optString("recommendedValue", "ENABLE").trim();
            this.defaultValue = obj.optString("defaultValue", "DEFAULT").trim();
            this.supportStatus = obj.optString("supportStatus", "Supported").trim();
            this.restartRequired = obj.optBoolean("restartRequired", true);
            this.description = obj.optString("description", "").trim();
            this.conflictNote = obj.optString("conflictNote", "").trim();

            List<SubFlagSpec> subs = new ArrayList<>();
            JSONArray subArr = obj.optJSONArray("subFlags");
            if (subArr != null) {
                for (int i = 0; i < subArr.length(); i++) {
                    JSONObject s = subArr.optJSONObject(i);
                    if (s != null) {
                        String sKey = s.optString("key", "").trim();
                        String sDef = s.optString("default", "ENABLE").trim();
                        subs.add(new SubFlagSpec(
                                s.optString("name", sKey),
                                sKey,
                                s.optString("type", "bool"),
                                sDef
                        ));
                        SettingRegistry.register(sKey, RestartPolicy.REQUIRED);
                    }
                }
            }
            this.subFlags = Collections.unmodifiableList(subs);

            String keyToUse = this.mobileConfigCode.isEmpty() ? this.id : this.mobileConfigCode;
            SettingRegistry.register(keyToUse, RestartPolicy.REQUIRED);
            SettingRegistry.register(this.id, RestartPolicy.REQUIRED);
            this.setting = new StringSetting(
                    keyToUse,
                    "enum".equalsIgnoreCase(this.controlType) ? this.defaultValue : FlagState.DEFAULT.toString(),
                    RestartPolicy.REQUIRED
            );
        }

        public boolean isBoolean() {
            return "bool".equalsIgnoreCase(controlType);
        }

        public boolean isEnum() {
            return "enum".equalsIgnoreCase(controlType);
        }

        public boolean isNumeric() {
            return "long".equalsIgnoreCase(controlType);
        }

        public boolean isUnsupported() {
            return "Unsupported".equalsIgnoreCase(supportStatus);
        }
    }

    private static volatile List<FeatureEntry> cachedEntries;

    private InitialFeaturesManager() {}

    public static List<FeatureEntry> getAllEntries(Context context) {
        return getAllEntries();
    }

    public static List<FeatureEntry> getFilteredEntries(Context context) {
        return getFilteredEntries();
    }

    public static String getSearchQuery() {
        return SharedPref.getStringPref(PREF_SEARCH_QUERY, "").trim();
    }

    public static String getActiveCategoryFilter() {
        return SharedPref.getStringPref(PREF_FILTER_CATEGORY, "All Categories");
    }

    public static String getActiveStatusFilter() {
        return SharedPref.getStringPref(PREF_FILTER_STATUS, "All Flags (72)");
    }

    public static void applyPreset(final Context context, final String presetName, final Runnable onDone) {
        applyPresetTransactionally(context, presetName);
        if (onDone != null) onDone.run();
    }

    public static void resetAllFlagsTransactionally(final Context context, final Runnable onDone) {
        applyPresetTransactionally(context, "Reset All Initial Features to Default");
        if (onDone != null) onDone.run();
    }

    public static String exportJsonConfig() {
        try {
            JSONObject root = new JSONObject();
            root.put("schema", "InstaRex.InitialFeatures.v1");
            JSONObject overrides = new JSONObject();
            for (FeatureEntry e : getAllEntries()) {
                overrides.put(e.id, getCurrentValue(e));
                for (SubFlagSpec sub : e.subFlags) {
                    overrides.put(sub.key, getSubFlagValue(sub));
                }
            }
            root.put("overrides", overrides);
            return root.toString(2);
        } catch (Exception ex) {
            return "{}";
        }
    }

    public static int importJsonConfig(String json) {
        if (json == null || json.trim().isEmpty()) return 0;
        try {
            JSONObject root = new JSONObject(json);
            JSONObject overrides = root.optJSONObject("overrides");
            if (overrides == null) overrides = root;
            int count = 0;
            for (FeatureEntry e : getAllEntries()) {
                if (overrides.has(e.id)) {
                    setEntryValue(e, String.valueOf(overrides.opt(e.id)));
                    count++;
                }
                for (SubFlagSpec sub : e.subFlags) {
                    if (overrides.has(sub.key)) {
                        setSubFlagValue(sub, String.valueOf(overrides.opt(sub.key)));
                        count++;
                    }
                }
            }
            FlagsSharedPref.flush();
            HookFlags.load();
            return count;
        } catch (Exception ex) {
            Logger.printException(() -> "importJsonConfig failed", ex);
            return 0;
        }
    }

    public static synchronized List<FeatureEntry> getAllEntries() {
        if (cachedEntries != null && !cachedEntries.isEmpty()) {
            return cachedEntries;
        }
        List<FeatureEntry> loaded = new ArrayList<>();
        try {
            Context ctx = RexUtils.getContext();
            if (ctx != null && ctx.getResources() != null) {
                int rawId = ctx.getResources().getIdentifier("rex_initial_features_catalogue", "raw", ctx.getPackageName());
                if (rawId != 0) {
                    try (InputStream in = ctx.getResources().openRawResource(rawId);
                         Scanner sc = new Scanner(in, "UTF-8").useDelimiter("\\A")) {
                        String rawJson = sc.hasNext() ? sc.next() : "";
                        if (!rawJson.trim().isEmpty()) {
                            JSONArray arr = new JSONArray(rawJson);
                            for (int i = 0; i < arr.length(); i++) {
                                JSONObject obj = arr.optJSONObject(i);
                                if (obj != null) {
                                    loaded.add(new FeatureEntry(obj));
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Logger.printException(() -> "InitialFeaturesManager load failed", t);
        }
        cachedEntries = Collections.unmodifiableList(loaded);
        return cachedEntries;
    }

    public static String getCurrentValue(FeatureEntry entry) {
        if (entry == null) return FlagState.DEFAULT.toString();
        String val = FlagsSharedPref.getStringPref(entry.setting);
        if (val == null || val.trim().isEmpty()) {
            return entry.isEnum() ? entry.defaultValue : FlagState.DEFAULT.toString();
        }
        return val.trim();
    }

    public static boolean setEntryValue(FeatureEntry entry, String newValue) {
        if (entry == null || newValue == null) return false;
        String prev = getCurrentValue(entry);
        boolean saved = Boolean.TRUE.equals(FlagsSharedPref.setStringPref(entry.setting.key, newValue));
        if (saved) {
            FlagsSharedPref.setStringPref(entry.id, newValue);
            // Propagate parent state to boolean sub-flags when toggling a parent boolean entry
            if (entry.isBoolean() && !entry.subFlags.isEmpty()) {
                for (SubFlagSpec sub : entry.subFlags) {
                    if ("bool".equalsIgnoreCase(sub.type)) {
                        String subVal = FlagState.DEFAULT.toString().equals(newValue)
                                ? FlagState.DEFAULT.toString()
                                : (FlagState.ENABLE.toString().equals(newValue) ? sub.defaultVal : FlagState.DISABLE.toString());
                        FlagsSharedPref.setStringPref(sub.key, subVal);
                    } else if ("long".equalsIgnoreCase(sub.type) && FlagState.ENABLE.toString().equals(newValue)) {
                        FlagsSharedPref.setStringPref(sub.key, sub.defaultVal);
                    }
                }
            }
            FlagsSharedPref.flush();
            try {
                HookFlags.load();
            } catch (Throwable ignored) {}
            SettingsRestart.markChanged(entry.setting.key, RestartPolicy.REQUIRED, prev, newValue);
        }
        return saved;
    }

    public static String getSubFlagValue(SubFlagSpec sub) {
        if (sub == null) return "";
        StringSetting ss = new StringSetting(sub.key, sub.defaultVal, RestartPolicy.REQUIRED);
        String val = FlagsSharedPref.getStringPref(ss);
        return (val == null || val.trim().isEmpty()) ? sub.defaultVal : val.trim();
    }

    public static void setSubFlagValue(SubFlagSpec sub, String newValue) {
        if (sub == null || newValue == null) return;
        String prev = getSubFlagValue(sub);
        FlagsSharedPref.setStringPref(sub.key, newValue);
        FlagsSharedPref.flush();
        try {
            HookFlags.load();
        } catch (Throwable ignored) {}
        SettingsRestart.markChanged(sub.key, RestartPolicy.REQUIRED, prev, newValue);
    }

    public static List<FeatureEntry> getFilteredEntries() {
        List<FeatureEntry> all = getAllEntries();
        String catFilter = SharedPref.getStringPref(PREF_FILTER_CATEGORY, "All Categories");
        String statusFilter = SharedPref.getStringPref(PREF_FILTER_STATUS, "All Flags (72)");
        String query = SharedPref.getStringPref(PREF_SEARCH_QUERY, "").trim().toLowerCase(Locale.ROOT);

        List<FeatureEntry> out = new ArrayList<>();
        for (FeatureEntry e : all) {
            if (catFilter != null && !"All Categories".equalsIgnoreCase(catFilter)
                    && !catFilter.equalsIgnoreCase(e.category)) {
                continue;
            }
            String cur = getCurrentValue(e);
            if ("Supported Only".equalsIgnoreCase(statusFilter) && !"Supported".equalsIgnoreCase(e.supportStatus)) {
                continue;
            } else if ("Enabled Only".equalsIgnoreCase(statusFilter) && !FlagState.ENABLE.toString().equalsIgnoreCase(cur)) {
                continue;
            } else if ("Disabled Only".equalsIgnoreCase(statusFilter) && !FlagState.DISABLE.toString().equalsIgnoreCase(cur)) {
                continue;
            } else if ("Modified (Non-Default)".equalsIgnoreCase(statusFilter)
                    && (FlagState.DEFAULT.toString().equalsIgnoreCase(cur) || cur.equalsIgnoreCase(e.defaultValue))) {
                continue;
            } else if ("Experimental / Conflicting".equalsIgnoreCase(statusFilter)
                    && !"Experimental".equalsIgnoreCase(e.supportStatus)
                    && !"Conflicting".equalsIgnoreCase(e.supportStatus)) {
                continue;
            } else if ("Unsupported / Broken".equalsIgnoreCase(statusFilter)
                    && !"Unsupported".equalsIgnoreCase(e.supportStatus)) {
                continue;
            }

            if (!query.isEmpty()) {
                String haystack = (e.title + " " + e.rawFlagName + " " + e.category + " "
                        + e.stableId + " " + e.addedInVersion + " " + e.description).toLowerCase(Locale.ROOT);
                boolean matched = haystack.contains(query);
                if (!matched) {
                    for (SubFlagSpec sub : e.subFlags) {
                        if (sub.name.toLowerCase(Locale.ROOT).contains(query)
                                || sub.key.toLowerCase(Locale.ROOT).contains(query)) {
                            matched = true;
                            break;
                        }
                    }
                }
                if (!matched) continue;
            }
            out.add(e);
        }
        return out;
    }

    public static String buildStatusSummary() {
        List<FeatureEntry> all = getAllEntries();
        int enabled = 0;
        int modified = 0;
        for (FeatureEntry e : all) {
            String cur = getCurrentValue(e);
            if (FlagState.ENABLE.toString().equalsIgnoreCase(cur)) enabled++;
            if (!FlagState.DEFAULT.toString().equalsIgnoreCase(cur)) modified++;
        }
        String cat = SharedPref.getStringPref(PREF_FILTER_CATEGORY, "All Categories");
        String st = SharedPref.getStringPref(PREF_FILTER_STATUS, "All Flags (72)");
        String q = SharedPref.getStringPref(PREF_SEARCH_QUERY, "").trim();
        StringBuilder sb = new StringBuilder();
        sb.append(all.size()).append(" flags • ").append(enabled).append(" enabled • ").append(modified).append(" active overrides");
        if (!"All Categories".equals(cat)) sb.append(" • Category: ").append(cat);
        if (!"All Flags (72)".equals(st)) sb.append(" • Filter: ").append(st);
        if (!q.isEmpty()) sb.append(" • Search: \"").append(q).append("\"");
        return sb.toString();
    }

    public static void applyPresetTransactionally(final Context context, final String presetName) {
        RexDialogs.clearActivityBlur(context);
        Map<String, String> snapshot = FlagsSharedPref.snapshotRawStrings();
        try {
            List<FeatureEntry> all = getAllEntries();
            int changed = 0;

            if ("Reset All Initial Features to Default".equalsIgnoreCase(presetName)) {
                for (FeatureEntry e : all) {
                    FlagsSharedPref.setStringPref(e.setting.key, e.isEnum() ? e.defaultValue : FlagState.DEFAULT.toString());
                    FlagsSharedPref.setStringPref(e.id, e.isEnum() ? e.defaultValue : FlagState.DEFAULT.toString());
                    for (SubFlagSpec sub : e.subFlags) {
                        FlagsSharedPref.setStringPref(sub.key, FlagState.DEFAULT.toString());
                    }
                    changed++;
                }
            } else {
                for (FeatureEntry e : all) {
                    if (e.isUnsupported()) {
                        // Never enable unsupported/broken flags in safe presets
                        continue;
                    }
                    boolean match = false;
                    String targetVal = e.recommendedValue;

                    if ("Apply Recommended Safe Preset".equalsIgnoreCase(presetName)) {
                        match = "Supported".equalsIgnoreCase(e.supportStatus);
                    } else if ("Enable All Supported Flags".equalsIgnoreCase(presetName)) {
                        match = !"Unsupported".equalsIgnoreCase(e.supportStatus);
                    } else if ("Apply High Quality Upload Preset".equalsIgnoreCase(presetName)) {
                        match = "Gallery & Upload Quality".equalsIgnoreCase(e.category);
                    } else if ("Apply Reels Preset".equalsIgnoreCase(presetName)) {
                        match = "Reels & Playback".equalsIgnoreCase(e.category);
                    } else if ("Apply Stories Preset".equalsIgnoreCase(presetName)) {
                        match = "Stories & Mentions".equalsIgnoreCase(e.category);
                    } else if ("Apply Navigation Preset".equalsIgnoreCase(presetName)) {
                        match = "Navigation & Interface".equalsIgnoreCase(e.category)
                                || "Feed & Explore".equalsIgnoreCase(e.category);
                    } else if ("Apply Notes Preset".equalsIgnoreCase(presetName)) {
                        match = "Notes & Reactions".equalsIgnoreCase(e.category);
                    } else if (presetName.startsWith("Conflict Preset A:")) {
                        if ("init_reels_overlay_follow_ufi".equals(e.id) || "init_reels_android_profile_in_ufi".equals(e.id)) {
                            match = true;
                            targetVal = FlagState.ENABLE.toString();
                        }
                    } else if (presetName.startsWith("Conflict Preset B:")) {
                        if ("init_reels_overlay_follow_ufi".equals(e.id) || "init_reels_android_profile_in_ufi".equals(e.id)) {
                            match = true;
                            targetVal = FlagState.DISABLE.toString();
                        }
                    }

                    if (match) {
                        setEntryValue(e, targetVal);
                        changed++;
                    }
                }
            }

            FlagsSharedPref.flush();
            HookFlags.load();
            SettingsRestart.markChanged("init_preset_applied", RestartPolicy.REQUIRED, "", presetName + "_" + System.currentTimeMillis());

            String summary = presetName + " applied (" + changed + " entries updated)";
            Utils.showToastShort(summary);

            SettingsActivity.refreshCurrentScreen(context);
            RexDialogs.clearActivityBlur(context);
            if (context != null) {
                RexDialogs.showConfirmDialog(
                        context,
                        "Initial Features Preset Applied",
                        summary + ".\n\nRestart InstaRex now to activate these MobileConfig and runtime overrides?",
                        "Restart Now",
                        false,
                        () -> SettingsRestart.restartNow(context)
                );
            }
        } catch (Throwable t) {
            FlagsSharedPref.restoreSnapshot(snapshot);
            try {
                HookFlags.load();
            } catch (Throwable ignored) {}
            RexDialogs.clearActivityBlur(context);
            Utils.showToastShort("Preset failed — rolled back safely");
            Logger.printException(() -> "applyPresetTransactionally failed", t);
        }
    }
}
