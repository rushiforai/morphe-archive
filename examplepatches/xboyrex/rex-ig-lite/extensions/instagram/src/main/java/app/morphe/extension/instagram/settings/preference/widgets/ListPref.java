/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.content.Context;
import android.os.Bundle;
import android.preference.ListPreference;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.preference.Helper;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

public class ListPref extends ListPreference {
    private final Helper helper;
    private View rowView;

    public ListPref(Context context) {
        super(InstagramPreferenceStyle.dialogContext(context));
        this.helper = new Helper(context);
        init();
    }

    public ListPref(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.helper = new Helper(context);
        init();
    }

    public ListPref(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.helper = new Helper(context);
        init();
    }

    private void init() {
        setOnPreferenceChangeListener(new OnPreferenceChangeListener() {
            @Override
            public boolean onPreferenceChange(Preference preference, Object newValue) {
                RexHaptics.tap(getContext());
                String previousValue = getValue();
                boolean saved = helper.setValue(preference, newValue);
                if (!saved) {
                    if (previousValue != null) {
                        setValue(previousValue);
                    }
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

    @Override
    protected void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        super.onSetInitialValue(restoreValue, defaultValue);
        String key = getKey();
        if (key == null) return;

        CharSequence[] entries = new CharSequence[]{};
        CharSequence[] entriesValues = new CharSequence[]{};
        if (key.contains("_")) {
            if (Settings.CUSTOMISE_STORY_TIMESTAMP.key.equals(key)) {
                entries = ResourceUtils.getStringArray("rex_array_customise_story_timestamp");
                entriesValues = ResourceUtils.getStringArray("rex_array_customise_story_timestamp_val");
            } else if (Settings.HIDDEN_CHATS_TAPS.key.equals(key)) {
                entries = ResourceUtils.getStringArray("rex_array_hidden_chats_taps");
                entriesValues = entries;
            } else if (Settings.CHANGE_LIKE_ANIMATION.key.equals(key)) {
                entries = ResourceUtils.getStringArray("rex_array_change_like_animation");
                entriesValues = ResourceUtils.getStringArray("rex_array_change_like_animation_val");
            }
        } else {
            entries = ResourceUtils.getStringArray("rex_array_recmd_flag_states");
            entriesValues = ResourceUtils.getStringArray("rex_array_recmd_flag_states_val");
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
