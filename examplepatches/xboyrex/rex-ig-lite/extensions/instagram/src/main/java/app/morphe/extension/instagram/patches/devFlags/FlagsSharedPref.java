/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.devFlags;

import org.json.JSONObject;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.HashMap;

import app.morphe.extension.rex.sharedPreference.BaseSharedPref;
import app.morphe.extension.instagram.settings.StringSetting;
import app.morphe.extension.instagram.constants.Constants;

public class FlagsSharedPref extends BaseSharedPref {

    private static final FlagsSharedPref INSTANCE = new FlagsSharedPref();

    public FlagsSharedPref() {
        super(Constants.REC_FLAGS);
    }

    // Static Wrapper Delegates
    public static String getStringPref(StringSetting setting) {
        if (setting == null) return FlagState.DEFAULT.toString();
        return INSTANCE.getString(setting.key, setting.defaultValue);
    }

    public static String getStringPref(String key, String defaultValue) {
        return INSTANCE.getString(key, defaultValue);
    }

    public static Boolean setStringPref(String key, String val) {
        Boolean ok = INSTANCE.setString(key, val);
        INSTANCE.flushPreferences();
        return ok;
    }

    public static boolean clearAll() {
        boolean ok = INSTANCE.clear();
        INSTANCE.flushPreferences();
        return ok;
    }

    public static boolean flush() {
        return INSTANCE.flushPreferences();
    }

    public static Map<String, String> snapshotRawStrings() {
        Map<String, String> snap = new LinkedHashMap<>();
        try {
            JSONObject flags = INSTANCE.all();
            Iterator<String> keys = flags.keys();
            while (keys.hasNext()) {
                String k = keys.next();
                snap.put(k, flags.optString(k, FlagState.DEFAULT.toString()));
            }
        } catch (Exception ignored) {
        }
        return snap;
    }

    public static boolean restoreSnapshot(Map<String, String> snapshot) {
        try {
            INSTANCE.clear();
            if (snapshot != null) {
                for (Map.Entry<String, String> entry : snapshot.entrySet()) {
                    if (entry.getKey() != null && entry.getValue() != null) {
                        INSTANCE.setString(entry.getKey(), entry.getValue());
                    }
                }
            }
            return INSTANCE.flushPreferences();
        } catch (Exception e) {
            return false;
        }
    }

    public static JSONObject exportAllAsJsonObject() {
        try {
            return INSTANCE.all();
        } catch (Exception e) {
            return new JSONObject();
        }
    }

    public static Map<String, Boolean> getAll() {
        Map<String, Boolean> outFlags = new HashMap<>();
        try {
            JSONObject flags = INSTANCE.all();
            Iterator<String> keys = flags.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                String flagState = String.valueOf(flags.get(key));
                if (!flagState.equals(FlagState.ENABLE.toString()) && !flagState.equals(FlagState.DISABLE.toString())) {
                    continue;
                }
                Boolean value = flagState.equals(FlagState.ENABLE.toString());
                if (!key.contains(",")) outFlags.put(key, value);
            }
            // A grouped choice takes precedence over older individual overrides, including Default.
            keys = flags.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                if (!key.contains(",")) continue;
                String state = flags.optString(key);
                if (!state.equals(FlagState.DEFAULT.toString())
                        && !state.equals(FlagState.ENABLE.toString())
                        && !state.equals(FlagState.DISABLE.toString())) continue;
                for (String rawCode : key.split(",")) {
                    String code = rawCode == null ? "" : rawCode.trim();
                    if (code.isEmpty()) continue;
                    if (state.equals(FlagState.DEFAULT.toString())) {
                        outFlags.remove(code);
                    } else {
                        outFlags.put(code, state.equals(FlagState.ENABLE.toString()));
                    }
                }
            }
        } catch (Exception ignored) {
        }
        return outFlags;
    }

    public static Map<String, Long> getAllLong() {
        Map<String, Long> outFlags = new HashMap<>();
        try {
            JSONObject flags = INSTANCE.all();
            Iterator<String> keys = flags.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                String flagState = String.valueOf(flags.get(key));
                try {
                    Long value = Long.parseLong(flagState);
                    outFlags.put(key, value);
                } catch (NumberFormatException ignored) {
                    // Not a long override (empty, or a bool flag's own state) -- skip.
                }
            }
        } catch (Exception ignored) {
        }
        return outFlags;
    }
}
