/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.Bundle;
import android.preference.Preference;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

import app.morphe.extension.instagram.patches.customise.font.CustomFont;
import app.morphe.extension.instagram.patches.customise.font.CustomFontContext;
import app.morphe.extension.instagram.settings.ActivityHook;

public final class InstagramPreferenceStyle {
    static final long NAVIGATION_DRAG_DURATION_MS = 120L;
    public static final String EXTRA_CARD_FIRST = "rex_card_first";
    public static final String EXTRA_CARD_LAST = "rex_card_last";
    private static final String TAG_TITLE = "rex_instagram_pref_title";
    private static final String TAG_SUMMARY = "rex_instagram_pref_summary";
    private static final String TAG_TEXT_COLUMN = "rex_instagram_pref_text_column";
    private static final String TAG_RESULT_CATEGORY = "rex_instagram_search_result_category";
    private static final String TAG_RESULT_CATEGORY_ROW = "rex_instagram_search_result_category_row";
    private static final String TAG_RESULT_CATEGORY_ICON = "rex_instagram_search_result_category_icon";
    private static final String TAG_SWITCH = "rex_instagram_pref_switch";
    private static final String TAG_TRAILING = "rex_instagram_pref_trailing";
    private static final String IGDS_SWITCH_CLASS_NAME =
            "com.instagram.igds.components.switchbutton.IgdsSwitch";

    // Master Prompt Section 6.2 — Refined AMOLED Design Tokens + 6 Curated Color Modes
    public static final int AMOLED_BLACK = 0xFF000000;
    public static final int CARD_SURFACE = 0xFF15181D;
    public static final int ELEVATED_SURFACE = 0xFF20252C;
    public static final int CARD_PRESSED_SURFACE = 0xFF20252C;
    public static final int CARD_DIVIDER = 0xFF303741;
    public static final int TEXT_PRIMARY_WHITE = 0xFFF5F7FA;
    public static final int TEXT_SECONDARY_GREY = 0xFFA4ACB8;
    public static final int TEXT_DISABLED_GREY = 0xFF737D8A;
    public static final int ACTIVE_SWITCH_TEAL = 0xFF35CDBB;
    public static final int INACTIVE_SWITCH_TRACK = 0xFF303741;
    public static final int INACTIVE_SWITCH_THUMB = 0xFF737D8A;
    public static final int PRIMARY_BLUE = 0xFF3998E8;
    public static final int SUCCESS_GREEN = 0xFF35B779;
    public static final int WARNING_GOLD = 0xFFE6B450;
    public static final int DESTRUCTIVE_RED = 0xFFF06470;
    public static final int REX_CYAN_ACCENT = 0xFF23C6D8;

    public static final String[] COLOR_MODES = {
            "Rex Cyan AMOLED",
            "Prime Crimson Rose",
            "Royal Violet Glass",
            "Emerald Matrix Pro",
            "Sunset Amber Gold",
            "Monochrome Titanium"
    };

    public static final class ColorPalette {
        public final String name;
        public final int background;
        public final int cardSurface;
        public final int elevatedSurface;
        public final int borderStroke;
        public final int accentPrimary;
        public final int activeSwitch;

        public ColorPalette(String name, int background, int cardSurface, int elevatedSurface,
                            int borderStroke, int accentPrimary, int activeSwitch) {
            this.name = name;
            this.background = background;
            this.cardSurface = cardSurface;
            this.elevatedSurface = elevatedSurface;
            this.borderStroke = borderStroke;
            this.accentPrimary = accentPrimary;
            this.activeSwitch = activeSwitch;
        }
    }

    public static ColorPalette currentPalette() {
        String mode = "Rex Cyan AMOLED";
        try {
            mode = app.morphe.extension.instagram.utils.Pref.rexColorMode();
        } catch (Throwable ignored) {}
        if (mode == null) mode = "Rex Cyan AMOLED";
        String lower = mode.toLowerCase();
        if (lower.contains("crimson") || lower.contains("rose") || lower.contains("prime")) {
            return new ColorPalette("Prime Crimson Rose", 0xFF000000, 0xFF15181D, 0xFF20252C, 0xFF303741, 0xFFF10623, 0xFFFF2E4C);
        }
        if (lower.contains("violet") || lower.contains("royal") || lower.contains("purple")) {
            return new ColorPalette("Royal Violet Glass", 0xFF000000, 0xFF14131D, 0xFF1E1C2B, 0xFF312E45, 0xFF9D4EDD, 0xFFB565F2);
        }
        if (lower.contains("emerald") || lower.contains("matrix") || lower.contains("green")) {
            return new ColorPalette("Emerald Matrix Pro", 0xFF000000, 0xFF111815, 0xFF18231E, 0xFF283B33, 0xFF10B981, 0xFF34D399);
        }
        if (lower.contains("amber") || lower.contains("sunset") || lower.contains("gold")) {
            return new ColorPalette("Sunset Amber Gold", 0xFF000000, 0xFF181511, 0xFF231E18, 0xFF3A3227, 0xFFF59E0B, 0xFFFBBF24);
        }
        if (lower.contains("monochrome") || lower.contains("titanium") || lower.contains("silver")) {
            return new ColorPalette("Monochrome Titanium", 0xFF000000, 0xFF161618, 0xFF202024, 0xFF323238, 0xFFE2E8F0, 0xFF94A3B8);
        }
        return new ColorPalette("Rex Cyan AMOLED", 0xFF000000, 0xFF15181D, 0xFF20252C, 0xFF303741, 0xFF23C6D8, 0xFF35CDBB);
    }

    public static int cardSurfaceColor() {
        return currentPalette().cardSurface;
    }

    public static int elevatedSurfaceColor() {
        return currentPalette().elevatedSurface;
    }

    public static int borderStrokeColor() {
        return currentPalette().borderStroke;
    }

    public static int accentColor() {
        return currentPalette().accentPrimary;
    }

    public static int activeSwitchColor() {
        return currentPalette().activeSwitch;
    }

    public static final int TRAILING_NONE = 0;
    public static final int TRAILING_SWITCH = 1;
    public static final int TRAILING_CHEVRON = 2;
    private static final int TRAILING_CHECK = 3;

    private InstagramPreferenceStyle() {
    }

    public static int dp(Context context, float value) {
        if (context == null) return Math.round(value * 2.75f);
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                value,
                context.getResources().getDisplayMetrics()
        );
    }

    public static void applyToolbarLayout(
            Context context,
            LinearLayout toolbar,
            ImageView back,
            TextView title,
            boolean isRootSettings
    ) {
        toolbar.setOrientation(LinearLayout.HORIZONTAL);
        toolbar.setGravity(Gravity.CENTER_VERTICAL);
        toolbar.setPadding(dp(context, 16), dp(context, 10),
                dp(context, 16), dp(context, 8));
        toolbar.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(context, 68)));

        back.setScaleType(ImageView.ScaleType.CENTER);
        back.setPaddingRelative(0, 0, dp(context, 12), 0);
        LinearLayout.LayoutParams backParams = new LinearLayout.LayoutParams(
                dp(context, 48), dp(context, 48));
        backParams.gravity = Gravity.CENTER_VERTICAL;
        back.setLayoutParams(backParams);

        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, isRootSettings ? 24 : 20);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        title.setIncludeFontPadding(false);
        title.setMaxLines(1);
        if (!isRootSettings) {
            title.setAutoSizeTextTypeUniformWithConfiguration(
                    18, 20, 1, TypedValue.COMPLEX_UNIT_SP);
        }
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        titleParams.gravity = Gravity.CENTER_VERTICAL;
        titleParams.leftMargin = dp(context, 6);
        title.setLayoutParams(titleParams);
    }

    /** Matches platform preference dialogs to dark AMOLED reference theme. */
    public static Context dialogContext(Context context) {
        int themeRes = android.R.style.Theme_DeviceDefault_Dialog_Alert;
        return new CustomFontContext(context, themeRes);
    }

    public static int backgroundColor() {
        return AMOLED_BLACK;
    }

    public static int pressedBackgroundColor() {
        return elevatedSurfaceColor();
    }

    public static int searchBackgroundColor() {
        return cardSurfaceColor();
    }

    public static int primaryTextColor() {
        return TEXT_PRIMARY_WHITE;
    }

    public static int secondaryTextColor() {
        return TEXT_SECONDARY_GREY;
    }

    public static int disabledTextColor() {
        return TEXT_DISABLED_GREY;
    }

    private static void alignTextToLocaleStart(TextView textView) {
        textView.setTextDirection(View.TEXT_DIRECTION_LOCALE);
        textView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
    }

    public static int selectionColor() {
        return PRIMARY_BLUE;
    }

    public static void applySystemBarStyle(Activity activity) {
        activity.getWindow().setStatusBarColor(AMOLED_BLACK);
        activity.getWindow().setNavigationBarColor(AMOLED_BLACK);

        int flags = activity.getWindow().getDecorView().getSystemUiVisibility();
        flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
        flags &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
        activity.getWindow().getDecorView().setSystemUiVisibility(flags);
    }

    public static View createPreferenceView(Context context, int trailingType) {
        return createPreferenceView(context, trailingType, null);
    }

    public static View createPreferenceView(Context context, int trailingType, String iconResName) {
        PreferenceRow row = new PreferenceRow(context, trailingType);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(context, 64));
        row.setPadding(dp(context, 28), dp(context, 16), dp(context, 28), dp(context, 16));
        row.setBackgroundColor(AMOLED_BLACK);
        row.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        row.setIcon(iconResName != null ? iconResName : "settings");

        LinearLayout textColumn = new LinearLayout(context);
        textColumn.setTag(TAG_TEXT_COLUMN);
        textColumn.setOrientation(LinearLayout.VERTICAL);
        textColumn.setGravity(Gravity.CENTER_VERTICAL);

        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                0,
                LinearLayout.LayoutParams.WRAP_CONTENT,
                1f
        );
        textParams.setMarginEnd(dp(context, 14));
        row.addView(textColumn, textParams);
        row.setHighlightView(textColumn);

        TextView title = new TextView(context);
        title.setTag(TAG_TITLE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16.5f);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        title.setTextColor(primaryTextColor());
        title.setIncludeFontPadding(true);
        title.setSingleLine(false);
        alignTextToLocaleStart(title);
        textColumn.addView(title, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        ));

        TextView summary = new TextView(context);
        summary.setTag(TAG_SUMMARY);
        summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        summary.setTextColor(secondaryTextColor());
        summary.setLineSpacing(dp(context, 2), 1.06f);
        summary.setIncludeFontPadding(true);
        alignTextToLocaleStart(summary);
        summary.setPadding(0, dp(context, 4), 0, dp(context, 2));
        textColumn.addView(summary, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        ));

        if (trailingType == TRAILING_SWITCH) {
            CompoundButton switchView = createNativeSwitch(nativeSwitchContext(context));
            switchView.setClickable(false);
            switchView.setFocusable(false);
            switchView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            switchView.setTag(TAG_SWITCH);
            applySwitchTint(switchView, switchView.isChecked());
            LinearLayout.LayoutParams switchLp = new LinearLayout.LayoutParams(dp(context, 52), dp(context, 32));
            switchLp.gravity = Gravity.CENTER_VERTICAL;
            row.addView(switchView, switchLp);
            return row;
        }

        if (trailingType == TRAILING_CHEVRON) {
            ImageView trailing = new ImageView(context);
            trailing.setTag(TAG_TRAILING);
            trailing.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            trailing.setImageDrawable(RexIcon.getDrawable(context, "chevron-right", TEXT_SECONDARY_GREY, 19));
            trailing.setScaleType(ImageView.ScaleType.CENTER);
            LinearLayout.LayoutParams trailLp = new LinearLayout.LayoutParams(dp(context, 24), dp(context, 36));
            trailLp.gravity = Gravity.CENTER_VERTICAL;
            row.addView(trailing, trailLp);
        }

        CustomFont.applyToViewTree(row);
        return row;
    }

    public static void applySwitchTint(CompoundButton switchView, boolean checked) {
        if (switchView == null) return;
        try {
            int[][] states = new int[][]{
                    new int[]{android.R.attr.state_checked},
                    new int[]{-android.R.attr.state_checked}
            };
            int activeColor = activeSwitchColor();
            int activeTrack = (activeColor & 0x00FFFFFF) | 0x80000000;
            ColorStateList thumbTint = new ColorStateList(states, new int[]{
                    activeColor,
                    INACTIVE_SWITCH_THUMB
            });
            ColorStateList trackTint = new ColorStateList(states, new int[]{
                    activeTrack,
                    INACTIVE_SWITCH_TRACK
            });
            if (switchView instanceof Switch) {
                ((Switch) switchView).setThumbTintList(thumbTint);
                ((Switch) switchView).setTrackTintList(trackTint);
            }
            switchView.setButtonTintList(thumbTint);
        } catch (Throwable ignored) {}
    }

    public static void applyActionRoleStyling(View view, String key, boolean enabled) {
        if (view == null) return;
        TextView title = view.findViewWithTag(TAG_TITLE);
        ImageView trailing = view.findViewWithTag(TAG_TRAILING);
        int roleColor = 0;
        if (key != null) {
            if (ButtonPref.isDestructiveActionKey(key)) {
                roleColor = DESTRUCTIVE_RED;
            } else if (ButtonPref.isPrimaryActionKey(key)) {
                roleColor = PRIMARY_BLUE;
            }
        }
        if (roleColor != 0 && enabled) {
            if (title != null) {
                title.setTextColor(roleColor);
                title.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            }
            if (trailing != null) {
                trailing.setColorFilter(new PorterDuffColorFilter(roleColor, PorterDuff.Mode.SRC_ATOP));
            }
            if (view instanceof PreferenceRow) {
                ((PreferenceRow) view).tintIcon(roleColor);
            }
        } else {
            if (title != null) {
                title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            }
            if (view instanceof PreferenceRow) {
                ((PreferenceRow) view).tintIcon(0);
            }
        }
    }

    public static View createSearchResultView(Context context) {
        View view = createPreferenceView(context, TRAILING_CHEVRON);

        TextView description = view.findViewWithTag(TAG_SUMMARY);
        if (description != null) {
            description.setMaxLines(2);
            description.setEllipsize(TextUtils.TruncateAt.END);
        }

        LinearLayout textColumn = view.findViewWithTag(TAG_TEXT_COLUMN);
        if (textColumn != null) {
            LinearLayout categoryRow = new LinearLayout(context);
            categoryRow.setTag(TAG_RESULT_CATEGORY_ROW);
            categoryRow.setOrientation(LinearLayout.HORIZONTAL);
            categoryRow.setGravity(Gravity.CENTER_VERTICAL);
            categoryRow.setVisibility(View.GONE);
            textColumn.addView(categoryRow, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT
            ));

            ImageView categoryIcon = new ImageView(context);
            categoryIcon.setTag(TAG_RESULT_CATEGORY_ICON);
            categoryIcon.setScaleType(ImageView.ScaleType.FIT_CENTER);
            categoryIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(
                    dp(context, 16),
                    dp(context, 16)
            );
            iconParams.setMarginEnd(dp(context, 6));
            categoryRow.addView(categoryIcon, iconParams);

            TextView category = new TextView(context);
            category.setTag(TAG_RESULT_CATEGORY);
            category.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            category.setTextColor(accentColor());
            category.setIncludeFontPadding(true);
            category.setLineSpacing(dp(context, 1), 1.0f);
            alignTextToLocaleStart(category);
            category.setMaxLines(1);
            category.setEllipsize(TextUtils.TruncateAt.END);
            categoryRow.addView(category, new LinearLayout.LayoutParams(
                    0,
                    LinearLayout.LayoutParams.WRAP_CONTENT,
                    1f
            ));
        }

        return view;
    }

    public static void bindText(Preference preference, View view) {
        boolean enabled = preference.isEnabled();
        boolean chevron = view instanceof PreferenceRow
                && ((PreferenceRow) view).trailingType == TRAILING_CHEVRON;
        boolean useNormalColors = enabled || chevron;

        if (view instanceof PreferenceRow) {
            Bundle extras = preference.peekExtras();
            boolean first = extras == null || extras.getBoolean(EXTRA_CARD_FIRST, true);
            boolean last = extras == null || extras.getBoolean(EXTRA_CARD_LAST, true);
            ((PreferenceRow) view).setCardGroupPosition(first, last);
        }

        TextView title = view.findViewWithTag(TAG_TITLE);
        TextView summary = view.findViewWithTag(TAG_SUMMARY);
        View trailing = view.findViewWithTag(TAG_TRAILING);

        int titleColor = useNormalColors ? primaryTextColor() : disabledTextColor();
        int summaryColor = useNormalColors ? secondaryTextColor() : disabledTextColor();

        if (title != null) {
            title.setText(preference.getTitle());
            title.setTextColor(titleColor);
            title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            title.setEnabled(enabled);
        }

        if (summary != null) {
            CharSequence summaryText = preference.getSummary();
            boolean hasSummary = !TextUtils.isEmpty(summaryText);
            summary.setText(hasSummary ? summaryText : "");
            summary.setVisibility(hasSummary ? View.VISIBLE : View.GONE);
            summary.setTextColor(summaryColor);
            summary.setEnabled(enabled);
            if (view instanceof PreferenceRow) {
                ((PreferenceRow) view).setHasSummary(hasSummary);
            }
        }

        if (trailing != null) {
            trailing.setEnabled(enabled);
            if (trailing instanceof ImageView) {
                int trailingColor = useNormalColors ? secondaryTextColor() : disabledTextColor();
                ((ImageView) trailing).setColorFilter(new PorterDuffColorFilter(
                        trailingColor,
                        PorterDuff.Mode.SRC_ATOP
                ));
            }
            trailing.invalidate();
        }

        if (chevron) {
            view.setAlpha(enabled ? 1.0f : 0.5f);
        }
        view.setEnabled(enabled);
    }

    public static void bindSearchResult(
            Preference preference,
            View view,
            CharSequence categoryText,
            String categoryIconResourceName
    ) {
        bindText(preference, view);

        Context context = view.getContext();
        TextView description = view.findViewWithTag(TAG_SUMMARY);
        View categoryRow = view.findViewWithTag(TAG_RESULT_CATEGORY_ROW);
        ImageView categoryIcon = view.findViewWithTag(TAG_RESULT_CATEGORY_ICON);
        TextView category = view.findViewWithTag(TAG_RESULT_CATEGORY);
        boolean hasDescription = description != null
                && description.getVisibility() == View.VISIBLE;
        boolean hasCategory = !TextUtils.isEmpty(categoryText);
        boolean hasCategoryIcon = hasCategory
                && !TextUtils.isEmpty(categoryIconResourceName);

        if (categoryRow != null) {
            categoryRow.setVisibility(hasCategory ? View.VISIBLE : View.GONE);
            categoryRow.setPaddingRelative(
                    0,
                    dp(context, hasDescription ? 4 : 8),
                    0,
                    0
            );
        }

        if (categoryIcon != null) {
            categoryIcon.setVisibility(hasCategoryIcon ? View.VISIBLE : View.GONE);
            if (hasCategoryIcon) {
                categoryIcon.setImageDrawable(RexIcon.getDrawable(context, categoryIconResourceName, accentColor(), 16));
            }
        }

        if (category != null) {
            category.setText(hasCategory ? categoryText : "");
            category.setTextColor(preference.isEnabled()
                    ? accentColor()
                    : disabledTextColor());
            category.setEnabled(preference.isEnabled());
        }

        if (view instanceof PreferenceRow) {
            PreferenceRow row = (PreferenceRow) view;
            row.setCardGroupPosition(true, true);
            row.setHasSummary(hasDescription || hasCategory);
        }
    }

    public static void setTrailingVisible(View view, boolean visible) {
        View trailing = view.findViewWithTag(TAG_TRAILING);
        if (trailing != null) {
            trailing.setVisibility(visible ? View.VISIBLE : View.GONE);
            trailing.invalidate();
        }
    }

    public static void bindIcon(View view, String iconResName) {
        if (view instanceof PreferenceRow) {
            ((PreferenceRow) view).setIcon(iconResName != null ? iconResName : "settings");
        }
    }

    public static void bindIconState(View view, String iconResName, boolean active, boolean animate) {
        if (view instanceof PreferenceRow) {
            ((PreferenceRow) view).setIconState(iconResName != null ? iconResName : "settings", active, animate);
        }
    }

    public static void pulseRowIcon(View view) {
        if (view instanceof PreferenceRow) {
            ((PreferenceRow) view).pulseIconAndChevron();
        }
    }

    public static void setPressedHighlightEnabled(View view, boolean enabled) {
        if (view instanceof PreferenceRow) {
            ((PreferenceRow) view).setPressedHighlightEnabled(enabled);
        }
    }

    public static CompoundButton findSwitch(View view) {
        return view.findViewWithTag(TAG_SWITCH);
    }

    public static View createNavigationCheckRow(
            Context context,
            CharSequence title,
            String iconName,
            boolean checked
    ) {
        PreferenceRow row = new PreferenceRow(context, TRAILING_CHECK);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(context, 56));
        row.setPadding(dp(context, 24), dp(context, 8), dp(context, 24), dp(context, 8));

        CheckBox checkBox = new CheckBox(context);
        checkBox.setClickable(false);
        checkBox.setFocusable(false);
        checkBox.setGravity(Gravity.CENTER);
        checkBox.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        checkBox.setChecked(checked);
        checkBox.setButtonTintList(ColorStateList.valueOf(activeSwitchColor()));
        row.addView(checkBox, new LinearLayout.LayoutParams(dp(context, 32), dp(context, 48)));

        ImageView iconView = new ImageView(context);
        String tablerTabIcon = resolveNavigationTabIcon(iconName);
        iconView.setImageDrawable(RexIcon.getDrawable(
                context,
                tablerTabIcon,
                checked ? activeSwitchColor() : primaryTextColor(),
                22,
                checked
        ));
        iconView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        iconView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(
                dp(context, 24),
                dp(context, 24)
        );
        iconParams.setMarginStart(dp(context, 8));
        iconParams.setMarginEnd(dp(context, 12));
        row.addView(iconView, iconParams);

        TextView titleView = new TextView(context);
        titleView.setText(title);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16.5f);
        titleView.setTextColor(primaryTextColor());
        titleView.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                0,
                LinearLayout.LayoutParams.MATCH_PARENT,
                1f
        );
        titleParams.setMarginEnd(dp(context, 8));
        row.addView(titleView, titleParams);
        row.setHighlightView(titleView);

        FrameLayout dragTarget = new FrameLayout(context);
        dragTarget.setTag(TAG_TRAILING);
        dragTarget.setContentDescription(title);
        DragHandleView dragIcon = new DragHandleView(context);
        dragIcon.setAlpha(0.72f);
        FrameLayout.LayoutParams dragIconParams = new FrameLayout.LayoutParams(
                dp(context, 24),
                dp(context, 24),
                Gravity.CENTER
        );
        dragTarget.addView(dragIcon, dragIconParams);
        row.addView(dragTarget, new LinearLayout.LayoutParams(
                dp(context, 48),
                dp(context, 48)
        ));

        row.setSwitchAccessibilityChecked(checked);
        row.setContentDescription(title);

        return row;
    }

    private static String resolveNavigationTabIcon(String rawIconName) {
        if (rawIconName == null) return "layout-bottombar";
        String lower = rawIconName.toLowerCase();
        if (lower.contains("home") || lower.contains("feed")) return "layout-grid";
        if (lower.contains("clip") || lower.contains("reel") || lower.contains("video")) return "video";
        if (lower.contains("direct") || lower.contains("message") || lower.contains("chat")) return "message-circle";
        if (lower.contains("search") || lower.contains("explore")) return "search";
        if (lower.contains("add") || lower.contains("create") || lower.contains("camera")) return "camera";
        if (lower.contains("profile") || lower.contains("user") || lower.contains("avatar")) return "user-round";
        return RexIcon.resolveSemanticId(rawIconName);
    }

    public static boolean isNavigationDragHandleHit(View row, float rawX, float rawY) {
        View dragTarget = row.findViewWithTag(TAG_TRAILING);
        if (dragTarget == null || dragTarget.getVisibility() != View.VISIBLE) {
            return false;
        }
        int[] location = new int[2];
        dragTarget.getLocationOnScreen(location);
        return rawX >= location[0]
                && rawX < location[0] + dragTarget.getWidth()
                && rawY >= location[1]
                && rawY < location[1] + dragTarget.getHeight();
    }

    public static void setNavigationRowDragging(
            View view,
            boolean dragging,
            boolean animate
    ) {
        if (view instanceof PreferenceRow
                && ((PreferenceRow) view).trailingType == TRAILING_CHECK) {
            ((PreferenceRow) view).setDragState(dragging, animate);
        }
    }

    public static void setNativeSwitchChecked(
            CompoundButton switchView,
            boolean checked,
            boolean animate
    ) {
        if (!animate || switchView.isChecked() == checked) {
            switchView.setChecked(checked);
            applySwitchTint(switchView, checked);
            return;
        }

        try {
            switchView.getClass()
                    .getMethod("setCheckedAnimated", boolean.class)
                    .invoke(switchView, checked);
        } catch (ReflectiveOperationException ignored) {
            switchView.setChecked(checked);
        }
        applySwitchTint(switchView, checked);
    }

    private static Context nativeSwitchContext(Context context) {
        Configuration overrideConfiguration = new Configuration();
        overrideConfiguration.uiMode = Configuration.UI_MODE_NIGHT_YES;

        ContextThemeWrapper switchContext = new ContextThemeWrapper(context, 0);
        switchContext.applyOverrideConfiguration(overrideConfiguration);
        switchContext.getTheme().setTo(context.getTheme());
        return switchContext;
    }

    public static boolean useMaterialSwitchStyle(View view, boolean original) {
        Context context = view.getContext();
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity && ActivityHook.isRex((Activity) context)) {
                return true;
            }
            context = ((ContextWrapper) context).getBaseContext();
        }
        if (context instanceof Activity && ActivityHook.isRex((Activity) context)) {
            return true;
        }
        return original;
    }

    private static CompoundButton createNativeSwitch(Context context) {
        try {
            CompoundButton switchView = Class
                    .forName(IGDS_SWITCH_CLASS_NAME, true, context.getClassLoader())
                    .asSubclass(CompoundButton.class)
                    .getConstructor(Context.class)
                    .newInstance(context);
            applySwitchTint(switchView, switchView.isChecked());
            return switchView;
        } catch (ReflectiveOperationException | ClassCastException exception) {
            Switch fallback = new Switch(context);
            applySwitchTint(fallback, false);
            return fallback;
        }
    }

    public static void bindSwitchAccessibility(View view, boolean checked) {
        if (view instanceof PreferenceRow) {
            ((PreferenceRow) view).setSwitchAccessibilityChecked(checked);
        }
    }

    public static boolean consumeSwitchClickAllowed(View view) {
        if (view instanceof PreferenceRow) {
            return ((PreferenceRow) view).consumeSwitchClickAllowed();
        }
        return true;
    }

    private static class PreferenceRow extends LinearLayout {
        private final Paint cardPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint dividerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path cardPath = new Path();
        private final RectF cardRect = new RectF();
        private final Rect switchHitRect = new Rect();
        private final int trailingType;
        private View highlightView;
        private boolean pressedHighlightEnabled = true;
        private boolean pressedHighlightAllowed;
        private boolean switchClickAllowed = true;
        private boolean drawPressedHighlight;
        private boolean drawDragHighlight;
        private int dragOverlayColor;
        private boolean switchAccessibilityChecked;
        private boolean firstInCardGroup = true;
        private boolean lastInCardGroup = true;
        private boolean hasSummaryText;
        private ImageView iconView;
        private String currentIconName;
        private boolean currentActiveState;

        PreferenceRow(Context context, int trailingType) {
            super(context);
            this.trailingType = trailingType;
            setOrientation(LinearLayout.HORIZONTAL);
            setGravity(Gravity.CENTER_VERTICAL);
            setWillNotDraw(false);
            if (trailingType == TRAILING_CHECK) {
                setOutlineProvider(ViewOutlineProvider.BOUNDS);
                setClipToOutline(false);
            }
        }

        private void initIconView(Context context) {
            iconView = new ImageView(context);
            iconView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            int iconSize = dp(context, 24);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(iconSize, iconSize);
            params.setMarginStart(dp(context, 4));
            params.setMarginEnd(dp(context, 16));
            params.gravity = Gravity.CENTER_VERTICAL;
            iconView.setLayoutParams(params);
            iconView.setScaleType(ImageView.ScaleType.FIT_CENTER);
            addView(iconView, 0);
        }

        void setIcon(String iconResName) {
            setIconState(iconResName, false, false);
        }

        void setIconState(String iconResName, boolean active, boolean animate) {
            int horizontalPadding = dp(getContext(), 28);
            setPadding(horizontalPadding, getPaddingTop(), horizontalPadding, getPaddingBottom());
            if (iconResName == null) {
                if (iconView != null) {
                    iconView.setImageDrawable(null);
                    iconView.setVisibility(View.GONE);
                }
                return;
            }
            if (iconView == null) {
                initIconView(getContext());
            }
            currentIconName = iconResName;
            currentActiveState = active;
            RexIcon.bindOrAnimateState(
                    iconView,
                    iconResName,
                    active,
                    primaryTextColor(),
                    activeSwitchColor(),
                    24,
                    animate
            );
            iconView.clearColorFilter();
            iconView.setVisibility(View.VISIBLE);
        }

        void pulseIconAndChevron() {
            if (iconView != null) {
                RexIcon.pulseIcon(iconView);
            }
            View trailing = findViewWithTag(TAG_TRAILING);
            if (trailing != null) {
                RexIcon.nudgeChevron(trailing);
            }
        }

        void tintIcon(int color) {
            if (iconView != null) {
                if (color == 0) {
                    iconView.clearColorFilter();
                } else {
                    iconView.setColorFilter(new PorterDuffColorFilter(color, PorterDuff.Mode.SRC_ATOP));
                }
            }
        }

        void setHighlightView(View highlightView) {
            this.highlightView = highlightView;
            pressedHighlightEnabled = true;
        }

        void setPressedHighlightEnabled(boolean enabled) {
            pressedHighlightEnabled = enabled;
            if (!enabled) {
                pressedHighlightAllowed = false;
                setDrawPressedHighlight(false);
            }
        }

        void setSwitchAccessibilityChecked(boolean checked) {
            switchAccessibilityChecked = checked;
        }

        void setDragState(boolean dragging, boolean animateState) {
            drawDragHighlight = dragging;
            dragOverlayColor = elevatedSurfaceColor();
            invalidate();

            animate().cancel();
            float translationZ = dragging ? dp(getContext(), 5f) : 0f;
            if (animateState) {
                animate()
                        .translationZ(translationZ)
                        .setDuration(NAVIGATION_DRAG_DURATION_MS)
                        .start();
            } else {
                setTranslationZ(translationZ);
            }
        }

        void setCardGroupPosition(boolean first, boolean last) {
            boolean changed = (this.firstInCardGroup != first) || (this.lastInCardGroup != last);
            this.firstInCardGroup = first;
            this.lastInCardGroup = last;
            updateVerticalPadding();
            if (changed) {
                invalidate();
            }
        }

        void setHasSummary(boolean hasSummary) {
            this.hasSummaryText = hasSummary;
            updateVerticalPadding();
        }

        private void updateVerticalPadding() {
            int baseTop = dp(getContext(), 15);
            int baseBottom = dp(getContext(), 15);
            int extraTop = firstInCardGroup ? dp(getContext(), 6) : 0;
            int extraBottom = lastInCardGroup ? dp(getContext(), 7) : 0;
            setMinimumHeight(dp(getContext(), hasSummaryText ? 74 : 58) + extraTop + extraBottom);
            setPadding(getPaddingLeft(), baseTop + extraTop, getPaddingRight(), baseBottom + extraBottom);
        }

        @Override
        public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
            super.onInitializeAccessibilityEvent(event);
            if (trailingType == TRAILING_SWITCH || trailingType == TRAILING_CHECK) {
                event.setClassName(trailingType == TRAILING_SWITCH
                        ? "android.widget.Switch"
                        : "android.widget.CheckBox");
                event.setChecked(switchAccessibilityChecked);
            }
        }

        @Override
        public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(info);
            if (trailingType == TRAILING_SWITCH || trailingType == TRAILING_CHECK) {
                info.setClassName(trailingType == TRAILING_SWITCH
                        ? "android.widget.Switch"
                        : "android.widget.CheckBox");
                info.setCheckable(true);
                info.setChecked(switchAccessibilityChecked);
            }
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                pressedHighlightAllowed = shouldDrawPressedHighlight(event.getX(), event.getY());
                switchClickAllowed = shouldHandleSwitchClick(event.getY());
            } else if (action == MotionEvent.ACTION_CANCEL) {
                pressedHighlightAllowed = false;
                setDrawPressedHighlight(false);
            }
            return super.dispatchTouchEvent(event);
        }

        @Override
        public void setPressed(boolean pressed) {
            super.setPressed(pressed);
            setDrawPressedHighlight(pressed && pressedHighlightAllowed);
            if (!pressed) {
                pressedHighlightAllowed = false;
            }
        }

        @Override
        protected void dispatchDraw(Canvas canvas) {
            float marginH = dp(getContext(), 14f);
            boolean first = firstInCardGroup;
            boolean last = lastInCardGroup;
            float strokeW = Math.max(2f, dp(getContext(), 1f));
            float halfStroke = strokeW * 0.5f;
            float left = marginH + halfStroke;
            float right = getWidth() - marginH - halfStroke;
            float r = dp(getContext(), 22f);

            float top = first ? (dp(getContext(), 5f) + halfStroke) : (-r * 2f);
            float bottom = last ? (getHeight() - dp(getContext(), 6f) - halfStroke) : (getHeight() + r * 2f);

            int saveCount = canvas.save();
            canvas.clipRect(0, 0, getWidth(), getHeight());

            cardRect.set(left, top, right, bottom);
            cardPath.reset();
            cardPath.addRoundRect(cardRect, r, r, Path.Direction.CW);

            ColorPalette pal = currentPalette();
            cardPaint.setStyle(Paint.Style.FILL);
            cardPaint.setColor(
                    drawDragHighlight ? dragOverlayColor
                            : (drawPressedHighlight ? pal.elevatedSurface : pal.cardSurface)
            );
            canvas.drawPath(cardPath, cardPaint);

            borderPaint.setStyle(Paint.Style.STROKE);
            borderPaint.setStrokeWidth(strokeW);
            borderPaint.setColor(pal.borderStroke);
            canvas.drawPath(cardPath, borderPaint);

            if (!last) {
                dividerPaint.setStyle(Paint.Style.FILL);
                dividerPaint.setColor(pal.borderStroke);
                canvas.drawRect(left, getHeight() - strokeW, right, getHeight(), dividerPaint);
            }

            canvas.restoreToCount(saveCount);
            super.dispatchDraw(canvas);
        }

        private boolean shouldDrawPressedHighlight(float x, float y) {
            if (!pressedHighlightEnabled || !isEnabled()) {
                return false;
            }
            if (trailingType != TRAILING_SWITCH) {
                return true;
            }
            View excludedView = findViewWithTag(TAG_SWITCH);
            if (excludedView == null) {
                return true;
            }
            int horizontalSlop = dp(getContext(), 10);
            int verticalSlop = dp(getContext(), 3);
            switchHitRect.set(0, 0, excludedView.getWidth(), excludedView.getHeight());
            offsetDescendantRectToMyCoords(excludedView, switchHitRect);
            switchHitRect.inset(-horizontalSlop, -verticalSlop);
            return !switchHitRect.contains(Math.round(x), Math.round(y));
        }

        private boolean shouldHandleSwitchClick(float y) {
            return true;
        }

        private boolean consumeSwitchClickAllowed() {
            boolean allowed = switchClickAllowed;
            switchClickAllowed = true;
            return allowed;
        }

        private void setDrawPressedHighlight(boolean drawPressedHighlight) {
            if (this.drawPressedHighlight == drawPressedHighlight) {
                return;
            }
            this.drawPressedHighlight = drawPressedHighlight;
            invalidate();
        }
    }

    private static final class DragHandleView extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        DragHandleView(Context context) {
            super(context);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);

            float lineWidth = dp(getContext(), 16f);
            float stroke = dp(getContext(), 2f);
            float left = (getWidth() - lineWidth) / 2.0f;
            float right = left + lineWidth;
            float radius = stroke / 2.0f;

            paint.setStyle(Paint.Style.FILL);
            paint.setColor(secondaryTextColor());
            for (int line = 0; line < 3; line++) {
                float centerY = dp(
                        getContext(),
                        8f + 4f * line
                );
                canvas.drawRoundRect(
                        left,
                        centerY - radius,
                        right,
                        centerY + radius,
                        radius,
                        radius,
                        paint
                );
            }
        }
    }
}
