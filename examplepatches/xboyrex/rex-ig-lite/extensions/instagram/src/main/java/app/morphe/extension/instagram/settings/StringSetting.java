/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings;

/** Restart behavior must be chosen where each Instagram setting is declared. */
public final class StringSetting extends app.morphe.extension.rex.settings.StringSetting {
    public StringSetting(String key, String defaultValue, RestartPolicy restartPolicy) {
        super(key, defaultValue);
        SettingRegistry.register(key, restartPolicy);
    }
}
