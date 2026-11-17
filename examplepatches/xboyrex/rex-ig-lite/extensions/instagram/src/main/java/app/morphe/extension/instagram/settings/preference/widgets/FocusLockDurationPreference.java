/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.preference.Preference;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import app.morphe.extension.instagram.patches.focusLock.FocusLockDuration;

public class FocusLockDurationPreference extends Preference {

    private ImageView iconView;
    private TextView titleView;
    private TextView valueView;
    private SeekBar seekBar;
    private boolean dragging;

    public FocusLockDurationPreference(Context context) {
        super(context);
        setKey("rex_focus_lock_duration");
        setPersistent(false);
        setSelectable(false);
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        Context context = getContext();

        LinearLayout outer = new LinearLayout(context);
        outer.setOrientation(LinearLayout.VERTICAL);
        outer.setBackgroundColor(InstagramPreferenceStyle.backgroundColor());
        outer.setPadding(
                InstagramPreferenceStyle.dp(context, 14),
                InstagramPreferenceStyle.dp(context, 5),
                InstagramPreferenceStyle.dp(context, 14),
                InstagramPreferenceStyle.dp(context, 6)
        );
        outer.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(
                InstagramPreferenceStyle.dp(context, 18),
                InstagramPreferenceStyle.dp(context, 16),
                InstagramPreferenceStyle.dp(context, 18),
                InstagramPreferenceStyle.dp(context, 14)
        );
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(InstagramPreferenceStyle.CARD_SURFACE);
        cardBg.setCornerRadius(InstagramPreferenceStyle.dp(context, 22));
        cardBg.setStroke(Math.max(2, InstagramPreferenceStyle.dp(context, 1)), InstagramPreferenceStyle.CARD_DIVIDER);
        row.setBackground(cardBg);

        LinearLayout header = new LinearLayout(context);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(header, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        ));

        iconView = new ImageView(context);
        iconView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        iconView.setImageDrawable(RexIcon.getDrawable(context, "clock", InstagramPreferenceStyle.primaryTextColor(), 24));
        LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(
                InstagramPreferenceStyle.dp(context, 24),
                InstagramPreferenceStyle.dp(context, 24)
        );
        iconLp.setMarginEnd(InstagramPreferenceStyle.dp(context, 14));
        header.addView(iconView, iconLp);

        titleView = new TextView(context);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16.5f);
        titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        header.addView(titleView, new LinearLayout.LayoutParams(
                0,
                LinearLayout.LayoutParams.WRAP_CONTENT,
                1f
        ));

        valueView = new TextView(context);
        valueView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        valueView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        header.addView(valueView, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        ));

        seekBar = new SeekBar(context);
        seekBar.setMax(FocusLockDuration.stepCount() - 1);
        seekBar.setPadding(
                seekBar.getPaddingLeft(),
                InstagramPreferenceStyle.dp(context, 10),
                seekBar.getPaddingRight(),
                0
        );
        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                if (!fromUser) return;
                showValue(progress);
                if (!dragging) FocusLockDuration.setStep(progress);
            }

            @Override
            public void onStartTrackingTouch(SeekBar bar) {
                dragging = true;
            }

            @Override
            public void onStopTrackingTouch(SeekBar bar) {
                dragging = false;
                FocusLockDuration.setStep(bar.getProgress());
                showValue(bar.getProgress());
            }
        });
        row.addView(seekBar, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        ));

        outer.addView(row, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        ));
        return outer;
    }

    private void showValue(int step) {
        if (valueView != null) valueView.setText(FocusLockDuration.labelForStep(step));
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);

        boolean enabled = isEnabled();
        int titleColor = enabled
                ? InstagramPreferenceStyle.primaryTextColor()
                : InstagramPreferenceStyle.disabledTextColor();
        int valueColor = enabled
                ? InstagramPreferenceStyle.REX_CYAN_ACCENT
                : InstagramPreferenceStyle.disabledTextColor();

        if (iconView != null) {
            iconView.setImageDrawable(RexIcon.getDrawable(getContext(), "clock", titleColor, 24));
        }
        if (titleView != null) {
            titleView.setText(getTitle());
            titleView.setTextColor(titleColor);
        }
        if (valueView != null) {
            valueView.setTextColor(valueColor);
        }
        if (seekBar != null) {
            seekBar.setEnabled(enabled);
            seekBar.setProgress(FocusLockDuration.currentStep());
            seekBar.getProgressDrawable().setColorFilter(
                    valueColor, PorterDuff.Mode.SRC_IN
            );
            if (seekBar.getThumb() != null) {
                seekBar.getThumb().setColorFilter(valueColor, PorterDuff.Mode.SRC_IN);
            }
            showValue(seekBar.getProgress());
        }
        view.setEnabled(enabled);
    }
}
