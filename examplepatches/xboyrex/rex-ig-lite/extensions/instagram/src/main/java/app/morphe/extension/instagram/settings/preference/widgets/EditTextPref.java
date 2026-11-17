/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.content.Context;
import android.os.Bundle;
import android.preference.EditTextPreference;
import android.preference.Preference;
import android.text.InputFilter;
import android.text.InputType;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import java.util.Arrays;
import app.morphe.extension.instagram.patches.Links;
import app.morphe.extension.instagram.patches.devFlags.FlagState;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.preference.Helper;
import app.morphe.extension.shared.Utils;

public class EditTextPref extends EditTextPreference {
    private static final InputFilter SINGLE_LINE_FILTER = (source, start, end, dest, dstart, dend) -> {
        CharSequence input = source.subSequence(start, end);
        String sanitized = removeLineBreaks(input.toString());
        return sanitized.contentEquals(input) ? null : sanitized;
    };
    private final Helper helper;
    private boolean numericOnly;
    private View rowView;

    private static String removeLineBreaks(String value) {
        return value.replace("\r", "").replace("\n", "");
    }

    public EditTextPref(Context context) {
        super(InstagramPreferenceStyle.dialogContext(context));
        this.helper = new Helper(context);
        init();
    }

    public EditTextPref(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.helper = new Helper(context);
        init();
    }

    public EditTextPref(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.helper = new Helper(context);
        init();
    }

    public void setNumericOnly(boolean numericOnly) {
        this.numericOnly = numericOnly;
        if (numericOnly) {
            getEditText().setInputType(InputType.TYPE_CLASS_NUMBER);
            getEditText().setSingleLine(true);
        } else {
            getEditText().setInputType(InputType.TYPE_CLASS_TEXT);
        }
    }

    private void init() {
        getEditText().setSingleLine(true);
        InputFilter[] filters = getEditText().getFilters();
        InputFilter[] singleLineFilters = Arrays.copyOf(filters, filters.length + 1);
        singleLineFilters[filters.length] = SINGLE_LINE_FILTER;
        getEditText().setFilters(singleLineFilters);

        setOnPreferenceChangeListener(new OnPreferenceChangeListener() {
            @Override
            public boolean onPreferenceChange(Preference preference, Object newValue) {
                RexHaptics.tap(getContext());
                String previousText = getText();
                boolean saved = helper.setValue(preference, newValue);
                if (!saved) {
                    if (previousText != null) {
                        setText(previousText);
                    }
                    Utils.showToastShort("Failed to save value");
                    return false;
                }
                String summary = newValue == null ? "" : String.valueOf(newValue);
                if (Settings.CUSTOM_SHARING_DOMAIN.key.equals(preference.getKey())) {
                    summary = Links.customSharingDomainSummary(summary);
                }
                preference.setSummary(summary);
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

    @Override
    protected void onAddEditTextToDialogView(View dialogView, EditText editText) {
        super.onAddEditTextToDialogView(dialogView, editText);
        if (numericOnly && FlagState.DEFAULT.toString().equals(editText.getText().toString())) {
            editText.setText("");
        }
    }
}
