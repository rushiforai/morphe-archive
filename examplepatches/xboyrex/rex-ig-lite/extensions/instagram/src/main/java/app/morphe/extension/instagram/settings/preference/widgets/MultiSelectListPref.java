/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.content.Context;
import android.os.Bundle;
import android.preference.MultiSelectListPreference;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.patches.navigation.NavigationBarPatch;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.preference.Helper;
import app.morphe.extension.instagram.settings.preference.widgets.NavigationSettingsAccessPolicy.ActionBar;
import app.morphe.extension.instagram.utils.Pref;

import java.util.HashSet;
import java.util.Set;

public class MultiSelectListPref extends MultiSelectListPreference {
    private final Helper helper;
    private View rowView;

    public MultiSelectListPref(Context context) {
        super(InstagramPreferenceStyle.dialogContext(context));
        this.helper = new Helper(context);
        init();
    }

    public MultiSelectListPref(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.helper = new Helper(context);
        init();
    }

    public MultiSelectListPref(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.helper = new Helper(context);
        init();
    }

    private void init() {
        setOnPreferenceChangeListener(new OnPreferenceChangeListener() {
            @Override
            public boolean onPreferenceChange(Preference preference, Object newValue) {
                RexHaptics.tap(getContext());
                Set<String> previousValues = getValues() == null
                        ? new HashSet<>()
                        : new HashSet<>(getValues());
                ActionBar changed = actionBarForKey(preference.getKey());
                HashSet<String> proposed = copyStringSet(newValue);
                if (changed != null && needsSettingsLockoutWarning(changed, proposed)) {
                    NavigationSettingsAccessWarning.show(getContext(), () -> {
                        if (proposed == null) return false;
                        if (!helper.setValue(preference, proposed)) {
                            setValues(previousValues);
                            Utils.showToastShort("Failed to save selection");
                            return false;
                        }
                        setValues(proposed);
                        return true;
                    });
                    return false;
                }
                boolean saved = helper.setValue(preference, proposed != null ? proposed : newValue);
                if (!saved) {
                    setValues(previousValues);
                    Utils.showToastShort("Failed to save selection");
                    return false;
                }
                return true;
            }
        });
    }

    @Override
    protected void onClick() {
        if (rowView != null) RexHaptics.tap(rowView); else RexHaptics.tap(getContext());
        if (rowView != null) {
            InstagramPreferenceStyle.pulseRowIcon(rowView);
        }
        super.onClick();
    }

    @Override
    protected void showDialog(Bundle state) {
        super.showDialog(state);
        RexDialogs.styleSystemPreferenceDialog(getDialog(), getContext());
    }

    private static boolean needsSettingsLockoutWarning(
            ActionBar changed,
            Set<String> proposed
    ) {
        try {
            return proposed == null || !NavigationSettingsAccessPolicy
                    .hasDirectAccessAfterActionBarChange(
                            NavigationBarPatch.loadConfig().visible(),
                            changed,
                            proposed.contains(Constants.AB_SETTINGS_ICON)
                    );
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static ActionBar actionBarForKey(String key) {
        if (Settings.ACTION_BAR_MAIN_FEED.key.equals(key)) return ActionBar.MAIN_FEED;
        if (Settings.ACTION_BAR_USER_PROFILE.key.equals(key)) return ActionBar.PROFILE;
        if (Settings.ACTION_BAR_INBOX.key.equals(key)) return ActionBar.INBOX;
        if (Settings.ACTION_BAR_CHAT.key.equals(key)) return ActionBar.CHAT;
        return null;
    }

    private static HashSet<String> copyStringSet(Object value) {
        if (!(value instanceof Set<?>)) return null;

        HashSet<String> copy = new HashSet<>();
        for (Object entry : (Set<?>) value) {
            if (!(entry instanceof String)) return null;
            copy.add((String) entry);
        }
        return copy;
    }

    public void setInitialValue(String key) {
        if (key == null) return;
        CharSequence[] entries = new CharSequence[]{};
        CharSequence[] entriesValues = new CharSequence[]{};
        if (Settings.ACTION_BAR_MAIN_FEED.key.equals(key)) {
            Pref.mainFeedActionBarButtons();
            entries = ResourceUtils.getStringArray("rex_array_action_bar_main_feed");
            entriesValues = ResourceUtils.getStringArray("rex_array_action_bar_main_feed_val");
        } else if (Settings.ACTION_BAR_USER_PROFILE.key.equals(key)) {
            Pref.userProfileActionBarButtons();
            entries = ResourceUtils.getStringArray("rex_array_action_bar_user_profile");
            entriesValues = ResourceUtils.getStringArray("rex_array_action_bar_user_profile_val");
        } else if (Settings.ACTION_BAR_CHAT.key.equals(key)) {
            Pref.chatActionsWithCallDefaults();
            entries = ResourceUtils.getStringArray("rex_array_action_bar_chat");
            entriesValues = ResourceUtils.getStringArray("rex_array_action_bar_chat_val");
        } else if (Settings.ACTION_BAR_INBOX.key.equals(key)) {
            entries = ResourceUtils.getStringArray("rex_array_action_bar_inbox");
            entriesValues = ResourceUtils.getStringArray("rex_array_action_bar_inbox_val");
        } else if (Settings.FILTER_STORY_BY_TYPE.key.equals(key)) {
            entries = ResourceUtils.getStringArray("rex_array_reel_type");
            entriesValues = ResourceUtils.getStringArray("rex_array_reel_type_val");
        } else if (Settings.FILTER_STORY_BY_USER_TYPE.key.equals(key)) {
            entries = ResourceUtils.getStringArray("rex_array_user_type");
            entriesValues = ResourceUtils.getStringArray("rex_array_user_type_val");
        } else if (Settings.HIDE_SAVE_BUTTON_SURFACES.key.equals(key)) {
            Pref.hideSaveButtonSurfaces();
            entries = ResourceUtils.getStringArray("rex_array_hide_save_button_surfaces");
            entriesValues = ResourceUtils.getStringArray("rex_array_hide_save_button_surfaces_val");
        }
        setEntries(entries);
        setEntryValues(entriesValues);
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        View view = InstagramPreferenceStyle.createPreferenceView(
                getContext(),
                InstagramPreferenceStyle.TRAILING_CHEVRON,
                ButtonPref.iconResourceNameForKey(getKey())
        );
        rowView = view;
        return view;
    }

    @Override
    protected void onBindView(View view) {
        rowView = view;
        InstagramPreferenceStyle.bindText(this, view);
        InstagramPreferenceStyle.bindIcon(view, ButtonPref.iconResourceNameForKey(getKey()));
    }
}
