/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.patches.story;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.preference.widgets.InstagramPreferenceStyle;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexHaptics;
import app.morphe.extension.instagram.settings.preference.widgets.RexIcon;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.sharedPreference.SharedPref;

@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class StoryMentionSettings {
    private static final String TAG = "StoryMentionIcon";
    private static final String PREFS = "xboyrex_story_mention";
    private static final String KEY_ENABLED = "pill_enabled";
    private static final String KEY_STYLE = "pill_style";
    private static final String KEY_POPUP_STYLE = "popup_style";

    private StoryMentionSettings() {
    }

    public static ArrayList addButtons(ArrayList list) {
        try {
            if (list != null) {
                for (Object item : list) {
                    if (item != null && item.toString().toLowerCase(Locale.ROOT).contains("mention pill")) {
                        return list;
                    }
                }
                list.add(menuLabel());
            }
        } catch (Throwable t) {
            Log.e(TAG, "addButtons failed", t);
        }
        return list;
    }

    public static boolean buttonAction(CharSequence text, Context context) {
        try {
            if (text == null || !menuLabel().contentEquals(text)) return false;
            showSettings(context);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "buttonAction failed", t);
            return false;
        }
    }

    private static volatile Boolean enabledCache;

    public static boolean isEnabled(Context context) {
        try {
            return Pref.storyMentionIcon();
        } catch (Throwable ignored) {
            Boolean cached = enabledCache;
            if (cached == null) {
                cached = prefs(context).getBoolean(KEY_ENABLED, true);
                enabledCache = cached;
            }
            return cached;
        }
    }

    private static void setEnabled(Context context, boolean enabled) {
        enabledCache = enabled;
        try {
            SharedPref.setBooleanPref(Settings.STORY_MENTION_ICON.key, enabled);
        } catch (Throwable ignored) {}
        prefs(context).edit().putBoolean(KEY_ENABLED, enabled).apply();
    }

    private static volatile Integer styleCache;

    public static int style(Context context) {
        Integer cached = styleCache;
        if (cached == null) {
            int stored = prefs(context).getInt(KEY_STYLE, StoryMentionIcon.STYLE_CLASSIC);
            cached = stored >= 0 && stored < StoryMentionIcon.STYLE_COUNT ? stored : StoryMentionIcon.STYLE_CLASSIC;
            styleCache = cached;
        }
        return cached;
    }

    private static void setStyle(Context context, int style) {
        styleCache = style;
        prefs(context).edit().putInt(KEY_STYLE, style).apply();
    }

    private static volatile Integer popupStyleCache;

    public static int popupStyle(Context context) {
        Integer cached = popupStyleCache;
        if (cached == null) {
            int stored = prefs(context).getInt(KEY_POPUP_STYLE, StoryMentionPopup.STYLE_MINIMAL);
            cached = stored >= 0 && stored < StoryMentionPopup.STYLE_COUNT ? stored : StoryMentionPopup.STYLE_MINIMAL;
            popupStyleCache = cached;
        }
        return cached;
    }

    private static void setPopupStyle(Context context, int style) {
        popupStyleCache = style;
        prefs(context).edit().putInt(KEY_POPUP_STYLE, style).apply();
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static boolean pt() {
        return "pt".equals(Locale.getDefault().getLanguage());
    }

    private static String menuLabel() {
        return pt() ? "Pílula de menções" : "Mention pill";
    }

    public static void showDialog(Context context) {
        showSettings(context);
    }

    public static void showSettings(Context context) {
        final AlertDialog dlg = new AlertDialog.Builder(context).create();
        LinearLayout content = RexDialogs.createDialogSheet(context, "at-sign", menuLabel());

        // Top row: on/off toggle card
        LinearLayout toggleCard = new LinearLayout(context);
        toggleCard.setOrientation(LinearLayout.HORIZONTAL);
        toggleCard.setGravity(Gravity.CENTER_VERTICAL);
        toggleCard.setPadding(dp(context, 14), dp(context, 10), dp(context, 14), dp(context, 10));
        GradientDrawable toggleBg = new GradientDrawable();
        toggleBg.setColor(RexDialogs.ELEVATED_SURFACE);
        toggleBg.setCornerRadius(dp(context, 16));
        toggleBg.setStroke(Math.max(1, dp(context, 1)), RexDialogs.BORDER_STROKE);
        toggleCard.setBackground(toggleBg);

        Switch toggle = new Switch(context);
        toggle.setText(pt() ? "Mostrar pílula de menções" : "Show mention pill");
        toggle.setTextColor(RexDialogs.TEXT_PRIMARY);
        toggle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
        toggle.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        toggle.setChecked(isEnabled(context));
        InstagramPreferenceStyle.applySwitchTint(toggle, toggle.isChecked());
        toggle.setOnCheckedChangeListener((button, checked) -> {
            RexHaptics.toggle(button);
            InstagramPreferenceStyle.applySwitchTint(toggle, checked);
            setEnabled(context, checked);
            StoryMentionIcon.refresh();
        });
        toggleCard.addView(toggle, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 48)));
        LinearLayout.LayoutParams toggleLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        toggleLp.bottomMargin = dp(context, 10);
        content.addView(toggleCard, toggleLp);

        // Style picker: one card per style, each with a live preview of the bubble (no unnecessary decorative icons)
        TextView section = new TextView(context);
        section.setText(pt() ? "Estilo da bolha" : "Bubble style");
        section.setTextColor(RexDialogs.BRAND_CYAN);
        section.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        section.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        section.setPadding(dp(context, 4), dp(context, 6), 0, dp(context, 8));
        content.addView(section);

        final List<ImageView> checks = new ArrayList<>();
        final List<GradientDrawable> styleCardBgs = new ArrayList<>();
        int selected = style(context);
        for (int i = 0; i < StoryMentionIcon.STYLE_COUNT; i++) {
            final int style = i;
            LinearLayout card = new LinearLayout(context);
            card.setOrientation(LinearLayout.HORIZONTAL);
            card.setGravity(Gravity.CENTER_VERTICAL);
            card.setMinimumHeight(dp(context, 48));
            card.setPadding(dp(context, 14), dp(context, 10), dp(context, 14), dp(context, 10));
            GradientDrawable cardBg = new GradientDrawable();
            cardBg.setColor(RexDialogs.ELEVATED_SURFACE);
            cardBg.setCornerRadius(dp(context, 16));
            cardBg.setStroke(Math.max(1, dp(context, 1)), style == selected ? RexDialogs.ACTIVE_TEAL : RexDialogs.BORDER_STROKE);
            card.setBackground(cardBg);
            styleCardBgs.add(cardBg);

            TextView preview = new TextView(context);
            preview.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            preview.setSingleLine(true);
            preview.setGravity(Gravity.CENTER);
            preview.setText("@1 mention");
            StoryMentionIcon.applyStyle(preview, style);
            card.addView(preview, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            TextView name = new TextView(context);
            name.setText(StoryMentionIcon.styleName(style, pt()));
            name.setTextColor(RexDialogs.TEXT_PRIMARY);
            name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            name.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            LinearLayout.LayoutParams nameLp = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            nameLp.setMarginStart(dp(context, 12));
            card.addView(name, nameLp);

            ImageView check = new ImageView(context);
            check.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            check.setImageDrawable(RexIcon.getDrawable(context, "check", RexDialogs.ACTIVE_TEAL, 20));
            check.setVisibility(style == selected ? View.VISIBLE : View.INVISIBLE);
            checks.add(check);
            card.addView(check, new LinearLayout.LayoutParams(dp(context, 20), dp(context, 20)));

            card.setOnClickListener(v -> {
                RexHaptics.tap(v);
                setStyle(context, style);
                for (int k = 0; k < checks.size(); k++) {
                    boolean isSel = (k == style);
                    checks.get(k).setVisibility(isSel ? View.VISIBLE : View.INVISIBLE);
                    styleCardBgs.get(k).setStroke(Math.max(1, dp(context, 1)), isSel ? RexDialogs.ACTIVE_TEAL : RexDialogs.BORDER_STROKE);
                    if (isSel) RexIcon.pulseIcon(checks.get(k));
                }
                StoryMentionIcon.refresh();
            });
            LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            cardLp.bottomMargin = dp(context, 8);
            content.addView(card, cardLp);
        }

        // Popup style: how the list of mentioned accounts looks when the bubble is tapped
        TextView popupSection = new TextView(context);
        popupSection.setText(pt() ? "Estilo do popup de menções" : "Mentions popup style");
        popupSection.setTextColor(RexDialogs.BRAND_CYAN);
        popupSection.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        popupSection.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        popupSection.setPadding(dp(context, 4), dp(context, 10), 0, dp(context, 8));
        content.addView(popupSection);

        final List<ImageView> popupChecks = new ArrayList<>();
        final List<GradientDrawable> popupCardBgs = new ArrayList<>();
        int popupSelected = popupStyle(context);
        for (int i = 0; i < StoryMentionPopup.STYLE_COUNT; i++) {
            final int style = i;
            LinearLayout card = new LinearLayout(context);
            card.setOrientation(LinearLayout.HORIZONTAL);
            card.setGravity(Gravity.CENTER_VERTICAL);
            card.setMinimumHeight(dp(context, 52));
            card.setPadding(dp(context, 14), dp(context, 12), dp(context, 14), dp(context, 12));
            GradientDrawable cardBg = new GradientDrawable();
            cardBg.setColor(RexDialogs.ELEVATED_SURFACE);
            cardBg.setCornerRadius(dp(context, 16));
            cardBg.setStroke(Math.max(1, dp(context, 1)), style == popupSelected ? RexDialogs.ACTIVE_TEAL : RexDialogs.BORDER_STROKE);
            card.setBackground(cardBg);
            popupCardBgs.add(cardBg);

            LinearLayout texts = new LinearLayout(context);
            texts.setOrientation(LinearLayout.VERTICAL);
            TextView name = new TextView(context);
            name.setText(StoryMentionPopup.styleName(style, pt()));
            name.setTextColor(RexDialogs.TEXT_PRIMARY);
            name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            name.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            texts.addView(name);
            TextView description = new TextView(context);
            description.setText(StoryMentionPopup.styleDescription(style, pt()));
            description.setTextColor(RexDialogs.TEXT_SECONDARY);
            description.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            texts.addView(description);
            card.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            ImageView check = new ImageView(context);
            check.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            check.setImageDrawable(RexIcon.getDrawable(context, "check", RexDialogs.ACTIVE_TEAL, 20));
            check.setVisibility(style == popupSelected ? View.VISIBLE : View.INVISIBLE);
            popupChecks.add(check);
            card.addView(check, new LinearLayout.LayoutParams(dp(context, 20), dp(context, 20)));

            card.setOnClickListener(v -> {
                RexHaptics.tap(v);
                setPopupStyle(context, style);
                for (int k = 0; k < popupChecks.size(); k++) {
                    boolean isSel = (k == style);
                    popupChecks.get(k).setVisibility(isSel ? View.VISIBLE : View.INVISIBLE);
                    popupCardBgs.get(k).setStroke(Math.max(1, dp(context, 1)), isSel ? RexDialogs.ACTIVE_TEAL : RexDialogs.BORDER_STROKE);
                    if (isSel) RexIcon.pulseIcon(popupChecks.get(k));
                }
            });
            LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            cardLp.bottomMargin = dp(context, 8);
            content.addView(card, cardLp);
        }

        RexDialogs.addDialogCloseFooter(context, content, dlg);
        ScrollView scroll = new ScrollView(context);
        scroll.addView(content);
        dlg.setView(scroll);
        RexDialogs.showBlurredDialog(context, dlg);
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }
}
