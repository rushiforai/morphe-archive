/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings;

import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

public final class SettingRegistry {
    private static final Map<String, RestartPolicy> restartPolicies = new ConcurrentHashMap<>();

    private SettingRegistry() {
    }

    public static void register(String key, RestartPolicy restartPolicy) {
        if (key == null || key.isEmpty()) return;
        Objects.requireNonNull(restartPolicy);
        RestartPolicy previous = restartPolicies.putIfAbsent(key, restartPolicy);
        // Dynamic flags and Focus Lock selections can recreate the same setting.
        if (previous != null && previous != restartPolicy) {
            restartPolicies.put(key, RestartPolicy.REQUIRED);
        }
    }

    public static boolean isRegistered(String key) {
        return key != null && restartPolicies.containsKey(key);
    }

    public static RestartPolicy restartPolicyFor(String key) {
        if (key == null || key.isEmpty()) {
            return RestartPolicy.NOT_REQUIRED;
        }
        RestartPolicy policy = restartPolicies.get(key);
        if (policy != null) {
            return policy;
        }
        // Dynamic MobileConfig / Recommended Flag / Initial Features keys require an app restart to reload session config
        if (key.startsWith("rec_") || key.startsWith("init_") || key.contains(",") || key.contains("::")) {
            return RestartPolicy.REQUIRED;
        }
        return RestartPolicy.NOT_REQUIRED;
    }
}
