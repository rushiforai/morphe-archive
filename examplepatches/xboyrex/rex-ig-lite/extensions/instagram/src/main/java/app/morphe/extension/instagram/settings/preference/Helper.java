/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference;

import android.app.Activity;
import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import java.util.Set;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.function.BooleanSupplier;

import app.morphe.extension.instagram.patches.ReelsPlayback;
import app.morphe.extension.instagram.patches.dm.InboxLock;
import app.morphe.extension.instagram.patches.story.StoryMentionIcon;

import app.morphe.extension.instagram.settings.preference.widgets.SwitchPref;
import app.morphe.extension.instagram.settings.preference.widgets.ListPref;
import app.morphe.extension.instagram.settings.preference.widgets.LikeAnimationPreference;
import app.morphe.extension.instagram.settings.preference.widgets.ButtonPref;
import app.morphe.extension.instagram.settings.preference.widgets.EditTextPref;
import app.morphe.extension.instagram.settings.preference.widgets.DownloadFileNameTemplatePref;
import app.morphe.extension.instagram.settings.preference.widgets.MultiSelectListPref;
import app.morphe.extension.instagram.settings.preference.widgets.NavigationBarPreference;
import app.morphe.extension.instagram.settings.preference.widgets.NavigationStartupPreference;
import app.morphe.extension.instagram.settings.SettingsRestart;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.theme.MaterialYouTheme;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.Logger;

import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.instagram.settings.BooleanSetting;
import app.morphe.extension.instagram.settings.StringSetting;

import app.morphe.extension.instagram.patches.devFlags.FlagsSharedPref;
import app.morphe.extension.instagram.patches.devFlags.HookFlags;

public class Helper {
    private final Context context;
    private final Map<Preference, BooleanSupplier> availabilityConditions = new LinkedHashMap<>();

    public Helper(Context context) {
        this.context = context;
    }

    public Preference availableWhen(Preference preference, BooleanSupplier condition) {
        availabilityConditions.put(preference, condition);
        updateAvailability(preference, condition.getAsBoolean());
        return preference;
    }

    public void updateDependencies(PreferenceScreen screen) {
        if (screen == null) return;

        for (Map.Entry<Preference, BooleanSupplier> entry : availabilityConditions.entrySet()) {
            Preference preference = entry.getKey();
            if (screen.findPreference(preference.getKey()) == preference) {
                updateAvailability(preference, entry.getValue().getAsBoolean());
            }
        }
    }

    private static void updateAvailability(Preference preference, boolean enabled) {
        if (preference instanceof SwitchPref) {
            ((SwitchPref) preference).setSwitchInteractionEnabled(enabled);
        } else {
            preference.setEnabled(enabled);
        }
    }

    public Preference switchPreference(String title, String summary, BooleanSetting setting) {
        SwitchPref preference = new SwitchPref(context);
        preference.setTitle(title);
        preference.setSummary(summary);
        preference.setKey(setting.key);
        preference.setDefaultValue(setting.defaultValue);
        return preference;
    }

    public Preference forcedSwitchPreference(
            String title,
            String summary,
            BooleanSetting setting,
            boolean forced,
            String forcedSummary
    ) {
        Preference preference = switchPreference(title, forced ? forcedSummary : summary, setting);
        if (forced && preference instanceof SwitchPref) {
            SwitchPref switchPreference = (SwitchPref) preference;
            switchPreference.setPersistent(false);
            switchPreference.setDefaultValue(Boolean.TRUE);
            switchPreference.setChecked(true);
            switchPreference.setSwitchInteractionEnabled(false);
        }
        return preference;
    }

    public Preference listPreference(String title, String summary, StringSetting setting) {
        ListPref preference = setting == Settings.CHANGE_LIKE_ANIMATION
                ? new LikeAnimationPreference(context) : new ListPref(context);
        String key = setting.key;
        preference.setTitle(title);
        preference.setDialogTitle(title);
        preference.setSummary(summary);
        preference.setKey(key);
        preference.setDefaultValue(setting.defaultValue);
        return preference;
    }

    public ButtonPref buttonPreference(String title, String summary, String setting) {
        ButtonPref preference = new ButtonPref(context);
        preference.setTitle(title);
        preference.setSummary(summary);
        preference.setKey(setting);
        return preference;
    }

    public Preference categoryPreference(String title, String summary, String setting) {
        ButtonPref preference = buttonPreference(title, summary, setting);
        preference.setPressedHighlightEnabled(true);
        return preference;
    }

    public Preference navigationBarPreference(String title, String summary) {
        NavigationBarPreference preference = new NavigationBarPreference(context);
        preference.setPersistent(false);
        preference.setKey("rex_navigation_tabs");
        preference.setTitle(title);
        preference.setSummary(summary);
        preference.setSingleLineTitle(false);
        return preference;
    }

    public Preference navigationStartupPreference(String title, String summary) {
        NavigationStartupPreference preference = new NavigationStartupPreference(context);
        preference.setKey("rex_navigation_startup_tab");
        preference.setTitle(title);
        preference.setDialogTitle(title);
        preference.setSummary(summary);
        preference.setSingleLineTitle(false);
        return preference;
    }

    public Preference editTextPreference(String title, String summary, StringSetting setting) {
        EditTextPref preference = new EditTextPref(context);
        preference.setTitle(title);
        preference.setDialogTitle(title);
        preference.setSummary(summary);
        preference.setKey(setting.key);
        preference.setDefaultValue(setting.defaultValue);
        return preference;
    }

    public Preference editTextNumPreference(String title, String summary, StringSetting setting) {
        EditTextPref preference = (EditTextPref) editTextPreference(title, summary, setting);
        preference.setNumericOnly(true);
        return preference;
    }

    public Preference downloadFileNameTemplatePreference(
            String title,
            String summary,
            StringSetting setting
    ) {
        DownloadFileNameTemplatePref preference = new DownloadFileNameTemplatePref(context);
        preference.setTitle(title);
        preference.setDialogTitle(title);
        preference.setSummary(summary);
        preference.setKey(setting.key);
        preference.setDefaultValue(setting.defaultValue);
        return preference;
    }

    public Preference multiSelectListPref(String title, String summary, StringSetting setting) {
        MultiSelectListPref preference = new MultiSelectListPref(context);
        String key = setting.key;
        preference.setTitle(title);
        preference.setDialogTitle(title);
        preference.setSummary(summary);
        preference.setKey(key);
        preference.setInitialValue(key);
        return preference;
    }

    public boolean setValue(Preference preference, Object newValue) {
        if (preference == null) return false;
        String key = preference.getKey();
        if (key == null || key.isEmpty()) return false;
        try {
            if (newValue != null) {
                Object previousValue = getValue(preference);
                boolean saved = false;

                if (newValue instanceof Boolean) {
                    Boolean val = (Boolean) newValue;
                    if (Settings.AMOLED_THEME.key.equals(key)) {
                        return MaterialYouTheme.requestAmoledChange(context, val);
                    }
                    if (Settings.MATERIAL_YOU_THEME.key.equals(key)) {
                        return MaterialYouTheme.requestMaterialYouChange(context, val);
                    }
                    boolean lockedKey = Settings.INBOX_LOCK.key.equals(key)
                            || Settings.INBOX_LOCK_NOTIFICATIONS.key.equals(key)
                            || Settings.HIDDEN_CHATS.key.equals(key);
                    if (lockedKey && !val && InboxLock.mustConfirmToDisable() && context instanceof Activity) {
                        InboxLock.confirm((Activity) context, () -> {
                            if (setValue(preference, newValue)) ((SwitchPreference) preference).setChecked(false);
                        });
                        return false;
                    }
                    saved = SharedPref.setBooleanPref(key, val);
                } else if (newValue instanceof String) {
                    String val = (String) newValue;
                    if (key.contains("_")) {
                        saved = SharedPref.setStringPref(key, val);
                    } else {
                        saved = FlagsSharedPref.setStringPref(key, val);
                    }
                } else if (newValue instanceof Set<?>) {
                    @SuppressWarnings("unchecked")
                    Set<String> setVal = (Set<String>) newValue;
                    saved = SharedPref.setSetPref(key, setVal);
                }

                if (saved) {
                    if (Settings.RESUME_REELS_AFTER_SCROLLING.key.equals(key)
                            || Settings.DISABLE_REELS_LOOPING.key.equals(key)) {
                        ReelsPlayback.onSettingChanged();
                    }
                    if (Settings.STORY_MENTION_ICON.key.equals(key)) {
                        StoryMentionIcon.refresh();
                    }
                    try {
                        HookFlags.load();
                    } catch (Throwable ignored) {}
                    SettingsRestart.markChanged(key, previousValue, newValue);
                } else {
                    Utils.showToastShort("Could not save setting: " + key);
                }
                return saved;
            }
            Utils.showToastShort("Invalid value for setting: " + key);
            return false;
        } catch (Exception ex) {
            Utils.showToastShort("Error saving setting: " + ex.getMessage());
            Logger.printException(() -> "Failed setting pref: ", ex);
            return false;
        }
    }

    private Object getValue(Preference preference) {
        if (preference instanceof SwitchPref) {
            return ((SwitchPref) preference).isChecked();
        }
        if (preference instanceof ListPref) {
            return ((ListPref) preference).getValue();
        }
        if (preference instanceof EditTextPref) {
            return ((EditTextPref) preference).getText();
        }
        if (preference instanceof MultiSelectListPref) {
            return ((MultiSelectListPref) preference).getValues();
        }
        return null;
    }
}
