/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */
package app.morphe.extension.instagram.settings.preference.widgets;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.SystemClock;
import android.preference.Preference;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Locale;

import app.morphe.extension.instagram.patches.devFlags.FlagState;
import app.morphe.extension.instagram.patches.devFlags.FlagsSharedPref;
import app.morphe.extension.instagram.patches.devFlags.HookFlags;
import app.morphe.extension.instagram.settings.RestartPolicy;
import app.morphe.extension.instagram.settings.SettingsRestart;
import app.morphe.extension.instagram.settings.StringSetting;
import app.morphe.extension.shared.Utils;

/**
 * Inline Recommended Flag row:
 * - Uses InstagramPreferenceStyle grouped card geometry (14dp margins, 22dp corner radius, #303741 border, semantic SVG icon)
 * - Immediate Boolean Enable/Disable switch without opening a nested dialog
 * - Adjacent "Reset" pill that removes overrides atomically (including grouped comma-separated codes)
 * - Full ListView view-recycling safety via onBindView tag lookups and listener rebinding
 */
public final class RecommendedFlagPreference extends Preference {
    private static final String TAG_TEXT_COLUMN = "rex_instagram_pref_text_column";
    private static final String TAG_FLAG_BAR = "rex_rec_flag_bar";
    private static final String TAG_FLAG_BADGE = "rex_rec_flag_badge";
    private static final String TAG_FLAG_RESET = "rex_rec_flag_reset";

    private final StringSetting setting;
    private final String iconName;
    private View boundRowView;
    private long lastActionUptimeMs;

    public RecommendedFlagPreference(Context context, String title, String summary, StringSetting setting) {
        super(context);
        this.setting = setting;
        this.iconName = resolveSemanticIcon(title, summary);
        setTitle(title);
        setSummary(summary);
        setKey(setting.key);
        setPersistent(false);
    }

    private static String resolveSemanticIcon(String title, String summary) {
        String text = ((title == null ? "" : title) + " " + (summary == null ? "" : summary)).toLowerCase(Locale.ROOT);
        if (text.contains("font") || text.contains("typography") || text.contains("text")) {
            return "typography";
        }
        if (text.contains("highlight") || text.contains("stories") || text.contains("story")) {
            return "camera";
        }
        if (text.contains("reel") || text.contains("clip") || text.contains("playback") || text.contains("video")) {
            return "video";
        }
        if (text.contains("plus") || text.contains("upsell") || text.contains("super like")) {
            return "sparkles";
        }
        if (text.contains("note") || text.contains("direct") || text.contains("chat") || text.contains("message")) {
            return "message-circle";
        }
        if (text.contains("profile") || text.contains("bio") || text.contains("avatar")) {
            return "user-round";
        }
        if (text.contains("comment") || text.contains("mention")) {
            return "at-sign";
        }
        if (text.contains("share") || text.contains("repost")) {
            return "share-2";
        }
        return "sliders-horizontal";
    }

    public String currentState() {
        String val = FlagsSharedPref.getStringPref(setting);
        if (val == null || val.trim().isEmpty()) {
            return FlagState.DEFAULT.toString();
        }
        String trimmed = val.trim();
        if (FlagState.ENABLE.toString().equalsIgnoreCase(trimmed) || "true".equalsIgnoreCase(trimmed)) {
            return FlagState.ENABLE.toString();
        }
        if (FlagState.DISABLE.toString().equalsIgnoreCase(trimmed) || "false".equalsIgnoreCase(trimmed)) {
            return FlagState.DISABLE.toString();
        }
        return FlagState.DEFAULT.toString();
    }

    private boolean isDebounced() {
        long now = SystemClock.uptimeMillis();
        if (now - lastActionUptimeMs < 180L) {
            return true;
        }
        lastActionUptimeMs = now;
        return false;
    }

    private void applyState(String nextState, View activeView, boolean animate) {
        String prev = currentState();
        if (prev.equals(nextState)) {
            bindStateToView(activeView != null ? activeView : boundRowView, false);
            return;
        }
        boolean saved = Boolean.TRUE.equals(FlagsSharedPref.setStringPref(setting.key, nextState));
        if (!saved) {
            Utils.showToastShort("Failed to save flag override");
            bindStateToView(activeView != null ? activeView : boundRowView, false);
            return;
        }
        try {
            HookFlags.load();
        } catch (Throwable ignored) {}
        SettingsRestart.markChanged(setting.key, RestartPolicy.REQUIRED, prev, nextState);
        View targetView = activeView != null ? activeView : boundRowView;
        if (targetView != null) {
            bindStateToView(targetView, animate);
        }
    }

    private void toggleFromUi(View targetView) {
        if (isDebounced()) return;
        if (targetView != null) {
            RexHaptics.toggle(targetView);
        } else {
            RexHaptics.toggle(getContext());
        }
        boolean currentlyEnabled = FlagState.ENABLE.toString().equals(currentState());
        String nextState = currentlyEnabled
                ? FlagState.DISABLE.toString()
                : FlagState.ENABLE.toString();
        applyState(nextState, targetView, true);
    }

    private void resetFromUi(View targetView) {
        if (isDebounced()) return;
        if (targetView != null) {
            RexHaptics.tap(targetView);
        } else {
            RexHaptics.tap(getContext());
        }
        applyState(FlagState.DEFAULT.toString(), targetView, true);
    }

    private void bindStateToView(View view, boolean animate) {
        if (view == null) return;
        Context ctx = view.getContext();
        String st = currentState();
        boolean isEnable = FlagState.ENABLE.toString().equals(st);
        boolean isDisable = FlagState.DISABLE.toString().equals(st);
        boolean isDefault = !isEnable && !isDisable;

        InstagramPreferenceStyle.bindIconState(view, iconName, isEnable, animate);
        InstagramPreferenceStyle.bindSwitchAccessibility(view, isEnable);

        CompoundButton switchView = InstagramPreferenceStyle.findSwitch(view);
        if (switchView != null) {
            switchView.setOnCheckedChangeListener(null);
            InstagramPreferenceStyle.setNativeSwitchChecked(switchView, isEnable, animate);
            InstagramPreferenceStyle.applySwitchTint(switchView, isEnable);
            switchView.setClickable(true);
            switchView.setFocusable(false);
            switchView.setFocusableInTouchMode(false);
            switchView.setOnClickListener(v -> toggleFromUi(view));
        }

        TextView stateBadge = view.findViewWithTag(TAG_FLAG_BADGE);
        if (stateBadge != null) {
            stateBadge.setText(isDefault ? "Default" : (isEnable ? "Enabled" : "Disabled"));
            int fgColor = isDefault
                    ? InstagramPreferenceStyle.secondaryTextColor()
                    : (isEnable ? InstagramPreferenceStyle.activeSwitchColor() : InstagramPreferenceStyle.DESTRUCTIVE_RED);
            stateBadge.setTextColor(fgColor);
            GradientDrawable badgeBg = new GradientDrawable();
            badgeBg.setCornerRadius(RexVectorIcons.dp(ctx, 10));
            int fillAlpha = isDefault ? 0x22000000 : 0x28000000;
            badgeBg.setColor((fgColor & 0x00FFFFFF) | fillAlpha);
            badgeBg.setStroke(Math.max(1, RexVectorIcons.dp(ctx, 1)), (fgColor & 0x00FFFFFF) | 0x45000000);
            stateBadge.setBackground(badgeBg);
        }

        TextView resetChip = view.findViewWithTag(TAG_FLAG_RESET);
        if (resetChip != null) {
            resetChip.setAlpha(isDefault ? 0.42f : 1.0f);
            resetChip.setEnabled(!isDefault);
            resetChip.setClickable(!isDefault);
            resetChip.setFocusable(false);
            resetChip.setFocusableInTouchMode(false);
            resetChip.setOnClickListener(isDefault ? null : (v -> resetFromUi(view)));
        }

        view.setOnClickListener(v -> toggleFromUi(view));
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        Context ctx = getContext();
        View view = InstagramPreferenceStyle.createPreferenceView(
                ctx,
                InstagramPreferenceStyle.TRAILING_SWITCH,
                iconName
        );
        if (view instanceof ViewGroup) {
            ((ViewGroup) view).setDescendantFocusability(ViewGroup.FOCUS_BLOCK_DESCENDANTS);
        }

        LinearLayout textCol = view.findViewWithTag(TAG_TEXT_COLUMN);
        if (textCol != null && textCol.findViewWithTag(TAG_FLAG_BAR) == null) {
            LinearLayout statusRow = new LinearLayout(ctx);
            statusRow.setTag(TAG_FLAG_BAR);
            statusRow.setOrientation(LinearLayout.HORIZONTAL);
            statusRow.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            barLp.topMargin = RexVectorIcons.dp(ctx, 6);
            statusRow.setLayoutParams(barLp);

            TextView stateBadge = new TextView(ctx);
            stateBadge.setTag(TAG_FLAG_BADGE);
            stateBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            stateBadge.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            int bpH = RexVectorIcons.dp(ctx, 9);
            int bpV = RexVectorIcons.dp(ctx, 3);
            stateBadge.setPadding(bpH, bpV, bpH, bpV);
            LinearLayout.LayoutParams badgeLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            badgeLp.setMarginEnd(RexVectorIcons.dp(ctx, 8));
            statusRow.addView(stateBadge, badgeLp);

            TextView resetChip = new TextView(ctx);
            resetChip.setTag(TAG_FLAG_RESET);
            resetChip.setText("Reset");
            resetChip.setTextColor(InstagramPreferenceStyle.accentColor());
            resetChip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            resetChip.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            int cpH = RexVectorIcons.dp(ctx, 10);
            int cpV = RexVectorIcons.dp(ctx, 3);
            resetChip.setPadding(cpH, cpV, cpH, cpV);
            GradientDrawable chipBg = new GradientDrawable();
            chipBg.setColor(InstagramPreferenceStyle.elevatedSurfaceColor());
            chipBg.setCornerRadius(RexVectorIcons.dp(ctx, 10));
            chipBg.setStroke(Math.max(1, RexVectorIcons.dp(ctx, 1)), InstagramPreferenceStyle.borderStrokeColor());
            resetChip.setBackground(chipBg);
            resetChip.setFocusable(false);
            resetChip.setFocusableInTouchMode(false);
            statusRow.addView(resetChip, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));

            textCol.addView(statusRow);
        }

        boundRowView = view;
        return view;
    }

    @Override
    protected void onBindView(View view) {
        boundRowView = view;
        InstagramPreferenceStyle.bindText(this, view);
        bindStateToView(view, false);
    }

    @Override
    protected void onClick() {
        toggleFromUi(boundRowView);
    }
}
