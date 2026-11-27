package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;

import dev.vortexnode.sbrowserx.extension.SBrowserXHooks;
import dev.vortexnode.sbrowserx.extension.SBrowserXPrefs;
import dev.vortexnode.sbrowserx.extension.SBrowserXStrings;
import dev.vortexnode.sbrowserx.extension.SBrowserXWebRtcManager;

public final class SBrowserXTransparencyDialogActivity extends Activity {
    private static final int ONEUI_BLUE = 0xFF387AFF;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SBrowserXPrefs.init(this);

        boolean night = SBrowserXHooks.isBrowserNightMode(this);
        boolean isCompact = SBrowserXHooks.isCompactLayoutActivePublic();
        int theme = night
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
        int textPrimary = night ? 0xFFF5F5F7 : 0xFF141416;
        int textSecondary = night ? 0xFF9EA2AD : 0xFF6B707C;

        ScrollView scroll = new ScrollView(this);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(20), dp(12), dp(20), dp(8));

        addToggleSliderBlock(root, night, textPrimary, textSecondary,
                SBrowserXStrings.get(SBrowserXStrings.BOTTOM_BLUR_TITLE),
                !isCompact, SBrowserXStrings.get(SBrowserXStrings.LAYOUT_ONLY_STANDARD),
                SBrowserXPrefs.isBottomBarBlurEnabled(this),
                SBrowserXPrefs.getBottomBarTransparency(this),
                enabled -> SBrowserXPrefs.setBottomBarBlurEnabled(this, enabled),
                pct -> SBrowserXPrefs.setBottomBarTransparency(this, pct));

        addToggleSliderBlock(root, night, textPrimary, textSecondary,
                SBrowserXStrings.get(SBrowserXStrings.URL_BAR_BLUR_TITLE),
                !isCompact, SBrowserXStrings.get(SBrowserXStrings.LAYOUT_ONLY_STANDARD),
                SBrowserXPrefs.isUrlBarBlurEnabled(this),
                SBrowserXPrefs.getUrlBarTransparency(this),
                enabled -> SBrowserXPrefs.setUrlBarBlurEnabled(this, enabled),
                pct -> SBrowserXPrefs.setUrlBarTransparency(this, pct));

        addToggleSliderBlock(root, night, textPrimary, textSecondary,
                SBrowserXStrings.get(SBrowserXStrings.COMPACT_BAR_BLUR_TITLE),
                isCompact, SBrowserXStrings.get(SBrowserXStrings.LAYOUT_ONLY_COMPACT),
                SBrowserXPrefs.isCompactBarBlurEnabled(this),
                SBrowserXPrefs.getCompactBarTransparency(this),
                enabled -> SBrowserXPrefs.setCompactBarBlurEnabled(this, enabled),
                pct -> SBrowserXPrefs.setCompactBarTransparency(this, pct));

        scroll.addView(root);

        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.LAYOUT_TRANSPARENCY_TITLE))
                .setView(scroll)
                .setPositiveButton(android.R.string.ok, (d, w) -> finish())
                .setNeutralButton(SBrowserXStrings.get(SBrowserXStrings.BTN_RESTART), (d, w) -> {
                    SBrowserXWebRtcManager.restartBrowser(this);
                    finish();
                })
                .setOnCancelListener(d -> finish())
                .show();
    }

    private interface BoolCb { void onChanged(boolean value); }
    private interface IntCb { void onChanged(int value); }

    private void addToggleSliderBlock(
            LinearLayout parent, boolean night, int textPrimary, int textSecondary,
            String title, boolean layoutApplicable, String disabledHint,
            boolean initialOn, int initialPct,
            BoolCb onToggle, IntCb onSlide
    ) {
        LinearLayout block = new LinearLayout(this);
        block.setOrientation(LinearLayout.VERTICAL);
        block.setAlpha(layoutApplicable ? 1.0f : 0.42f);

        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(0, dp(10), 0, dp(2));

        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        tvTitle.setTextColor(textPrimary);
        tvTitle.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        header.addView(tvTitle);

        TextView tvVal = new TextView(this);
        tvVal.setText(initialPct + "%");
        tvVal.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tvVal.setTextColor(ONEUI_BLUE);
        tvVal.setPadding(dp(8), 0, dp(10), 0);
        header.addView(tvVal);

        Switch sw = new Switch(this);
        SBrowserXSettingsActivity.styleOneUiBlueSwitch(sw, night);
        sw.setChecked(initialOn);
        sw.setEnabled(layoutApplicable);
        header.addView(sw);
        block.addView(header);

        if (!layoutApplicable) {
            TextView tvHint = new TextView(this);
            tvHint.setText(disabledHint);
            tvHint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            tvHint.setTextColor(textSecondary);
            tvHint.setPadding(0, 0, 0, dp(4));
            block.addView(tvHint);
        }

        SeekBar sb = new SeekBar(this);
        SBrowserXSettingsActivity.styleOneUiSeekBar(sb, night);
        sb.setMax(70); // 15%..85%
        sb.setProgress(Math.max(0, Math.min(70, initialPct - 15)));
        sb.setEnabled(layoutApplicable && initialOn);
        sb.setAlpha((layoutApplicable && initialOn) ? 1.0f : 0.45f);
        sb.setPadding(0, dp(4), 0, dp(10));
        sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser && layoutApplicable) {
                    int pct = progress + 15;
                    tvVal.setText(pct + "%");
                    onSlide.onChanged(pct);
                }
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) {}
            @Override public void onStopTrackingTouch(SeekBar seekBar) {}
        });
        block.addView(sb);

        sw.setOnCheckedChangeListener((btn, checked) -> {
            if (!layoutApplicable) return;
            onToggle.onChanged(checked);
            sb.setEnabled(checked);
            sb.setAlpha(checked ? 1.0f : 0.45f);
        });
        parent.addView(block);
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics()));
    }
}
