/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */
package app.morphe.extension.instagram.settings.preference.widgets;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.SystemClock;
import android.preference.Preference;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.Locale;

import app.morphe.extension.instagram.patches.devFlags.FlagState;
import app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager;
import app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.FeatureEntry;
import app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.SubFlagSpec;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Utils;

/**
 * Interactive preference row for an entry in the 72-flag "Initial Features" section:
 * - Direct inline Switch for Boolean flags
 * - Direct selector pill for Enum flags (e.g. Calling Icon Variant 1-4, Notes Reply CTA Variants 1-3, WebP vs HEIC)
 * - Expandable sub-flag & parameter configurator dialog when the entry has child flags/numeric parameters
 * - Displays version badge ("Added in ..."), Stable ID badge, Support Status badge ("Supported", "Conflicting", "Experimental", "Unsupported"), and Reset chip.
 */
public final class InitialFeaturePreference extends Preference {
    private static final String TAG_TEXT_COLUMN = "rex_instagram_pref_text_column";
    private static final String TAG_META_BAR = "rex_init_feat_meta_bar";
    private static final String TAG_STATE_BADGE = "rex_init_feat_state_badge";
    private static final String TAG_SUPPORT_BADGE = "rex_init_feat_support_badge";
    private static final String TAG_SUBFLAGS_CHIP = "rex_init_feat_subflags_chip";
    private static final String TAG_RESET_CHIP = "rex_init_feat_reset_chip";

    private final FeatureEntry entry;
    private final String iconName;
    private View boundRowView;
    private long lastTapMs;

    public InitialFeaturePreference(Context context, FeatureEntry entry) {
        super(context);
        this.entry = entry;
        this.iconName = resolveIconForCategory(entry.category, entry.title);
        setTitle("#" + entry.index + " • " + entry.title);
        setSummary(buildRichSummary(entry));
        setKey(entry.id);
        setPersistent(false);
    }

    private static String buildRichSummary(FeatureEntry e) {
        StringBuilder sb = new StringBuilder();
        sb.append("Flag: ").append(e.rawFlagName);
        if (!e.stableId.isEmpty()) {
            sb.append("  •  ID: ").append(e.stableId);
        }
        if (!e.addedInVersion.isEmpty()) {
            sb.append("  •  v").append(e.addedInVersion);
        }
        if (!e.description.isEmpty()) {
            sb.append("\n").append(e.description);
        }
        if (!e.conflictNote.isEmpty()) {
            sb.append("\n⚠ ").append(e.conflictNote);
        }
        return sb.toString();
    }

    private static String resolveIconForCategory(String category, String title) {
        String c = (category == null ? "" : category).toLowerCase(Locale.ROOT);
        if (c.contains("reels")) return "video";
        if (c.contains("stories")) return "camera";
        if (c.contains("feed") || c.contains("explore")) return "layout-grid";
        if (c.contains("navigation")) return "compass";
        if (c.contains("messaging") || c.contains("calling")) return "message-circle";
        if (c.contains("notes")) return "sparkles";
        if (c.contains("profile")) return "user-round";
        if (c.contains("gallery") || c.contains("upload")) return "badge-hd";
        if (c.contains("ai")) return "wand";
        return "sliders-horizontal";
    }

    private boolean isDebounced() {
        long now = SystemClock.uptimeMillis();
        if (now - lastTapMs < 160L) return true;
        lastTapMs = now;
        return false;
    }

    private void onPrimaryRowTap(View view) {
        if (isDebounced()) return;
        RexHaptics.toggle(view != null ? view : boundRowView);
        if (entry.isEnum()) {
            showEnumAndSubFlagsDialog(getContext());
            return;
        }
        String cur = InitialFeaturesManager.getCurrentValue(entry);
        boolean isEnabled = FlagState.ENABLE.toString().equalsIgnoreCase(cur);
        String next = isEnabled ? FlagState.DISABLE.toString() : FlagState.ENABLE.toString();
        InitialFeaturesManager.setEntryValue(entry, next);
        bindStateToView(view != null ? view : boundRowView, true);
    }

    private void onResetTap(View view) {
        if (isDebounced()) return;
        RexHaptics.tap(view != null ? view : boundRowView);
        String def = entry.isEnum() ? entry.defaultValue : FlagState.DEFAULT.toString();
        InitialFeaturesManager.setEntryValue(entry, def);
        for (SubFlagSpec sub : entry.subFlags) {
            InitialFeaturesManager.setSubFlagValue(sub, FlagState.DEFAULT.toString());
        }
        bindStateToView(view != null ? view : boundRowView, true);
        Utils.showToastShort("Reset " + entry.title + " to Default");
    }

    private void showEnumAndSubFlagsDialog(final Context context) {
        try {
            final Context hostCtx = RexDialogs.resolveActivity(context) != null ? RexDialogs.resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            LinearLayout sheet = RexDialogs.createDialogSheet(hostCtx, iconName, entry.title);

            TextView meta = new TextView(hostCtx);
            meta.setText(buildRichSummary(entry));
            meta.setTextColor(RexDialogs.TEXT_SECONDARY);
            meta.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
            meta.setPadding(RexVectorIcons.dp(hostCtx, 4), 0, RexVectorIcons.dp(hostCtx, 4), RexVectorIcons.dp(hostCtx, 12));
            sheet.addView(meta);

            if (entry.isEnum() && !entry.enumOptions.isEmpty()) {
                TextView hdr = new TextView(hostCtx);
                hdr.setText("SELECT VARIANT / FORMAT");
                hdr.setTextColor(InstagramPreferenceStyle.accentColor());
                hdr.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
                hdr.setTypeface(Typeface.DEFAULT_BOLD);
                hdr.setPadding(RexVectorIcons.dp(hostCtx, 4), 0, 0, RexVectorIcons.dp(hostCtx, 6));
                sheet.addView(hdr);

                String curVal = InitialFeaturesManager.getCurrentValue(entry);
                for (final String opt : entry.enumOptions) {
                    boolean selected = opt.equalsIgnoreCase(curVal);
                    TextView btn = RexRuntimeFeatures.createActionButton(
                            hostCtx,
                            (selected ? "✓ " : "") + opt,
                            selected ? InstagramPreferenceStyle.accentColor() : RexDialogs.ELEVATED_SURFACE,
                            selected ? 0xFF0A1417 : Color.WHITE
                    );
                    btn.setOnClickListener(v -> {
                        RexHaptics.tap(v);
                        InitialFeaturesManager.setEntryValue(entry, opt);
                        Utils.showToastShort(entry.title + " = " + opt);
                        dialog.dismiss();
                        bindStateToView(boundRowView, true);
                    });
                    sheet.addView(btn);
                }
            }

            if (!entry.subFlags.isEmpty()) {
                TextView subHdr = new TextView(hostCtx);
                subHdr.setText("SUB-FLAGS & PARAMETERS (" + entry.subFlags.size() + ")");
                subHdr.setTextColor(InstagramPreferenceStyle.accentColor());
                subHdr.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
                subHdr.setTypeface(Typeface.DEFAULT_BOLD);
                subHdr.setPadding(RexVectorIcons.dp(hostCtx, 4), RexVectorIcons.dp(hostCtx, 8), 0, RexVectorIcons.dp(hostCtx, 6));
                sheet.addView(subHdr);

                for (final SubFlagSpec sub : entry.subFlags) {
                    LinearLayout subRow = new LinearLayout(hostCtx);
                    subRow.setOrientation(LinearLayout.HORIZONTAL);
                    subRow.setGravity(Gravity.CENTER_VERTICAL);
                    int p = RexVectorIcons.dp(hostCtx, 10);
                    subRow.setPadding(p, p, p, p);
                    GradientDrawable bg = new GradientDrawable();
                    bg.setColor(RexDialogs.ELEVATED_SURFACE);
                    bg.setCornerRadius(RexVectorIcons.dp(hostCtx, 14));
                    bg.setStroke(Math.max(1, RexVectorIcons.dp(hostCtx, 1)), RexDialogs.BORDER_STROKE);
                    subRow.setBackground(bg);

                    TextView lbl = new TextView(hostCtx);
                    lbl.setText(sub.name);
                    lbl.setTextColor(Color.WHITE);
                    lbl.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
                    subRow.addView(lbl, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

                    if ("long".equalsIgnoreCase(sub.type)) {
                        final EditText numIn = new EditText(hostCtx);
                        numIn.setInputType(InputType.TYPE_CLASS_NUMBER);
                        numIn.setText(InitialFeaturesManager.getSubFlagValue(sub));
                        numIn.setTextColor(InstagramPreferenceStyle.accentColor());
                        numIn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
                        numIn.setGravity(Gravity.CENTER);
                        int w = RexVectorIcons.dp(hostCtx, 74);
                        subRow.addView(numIn, new LinearLayout.LayoutParams(w, ViewGroup.LayoutParams.WRAP_CONTENT));

                        TextView saveNum = new TextView(hostCtx);
                        saveNum.setText("Save");
                        saveNum.setTextColor(InstagramPreferenceStyle.activeSwitchColor());
                        saveNum.setTypeface(Typeface.DEFAULT_BOLD);
                        saveNum.setPadding(RexVectorIcons.dp(hostCtx, 10), 0, RexVectorIcons.dp(hostCtx, 4), 0);
                        saveNum.setOnClickListener(v -> {
                            RexHaptics.tap(v);
                            String val = numIn.getText() == null ? sub.defaultVal : numIn.getText().toString().trim();
                            if (val.isEmpty()) val = sub.defaultVal;
                            InitialFeaturesManager.setSubFlagValue(sub, val);
                            Utils.showToastShort(sub.name + " = " + val);
                            bindStateToView(boundRowView, false);
                        });
                        subRow.addView(saveNum);
                    } else {
                        final TextView togglePill = new TextView(hostCtx);
                        updateSubFlagPill(hostCtx, togglePill, InitialFeaturesManager.getSubFlagValue(sub));
                        togglePill.setOnClickListener(v -> {
                            RexHaptics.toggle(v);
                            String cur = InitialFeaturesManager.getSubFlagValue(sub);
                            String next = FlagState.ENABLE.toString().equalsIgnoreCase(cur)
                                    ? FlagState.DISABLE.toString()
                                    : FlagState.ENABLE.toString();
                            InitialFeaturesManager.setSubFlagValue(sub, next);
                            updateSubFlagPill(hostCtx, togglePill, next);
                            bindStateToView(boundRowView, false);
                        });
                        subRow.addView(togglePill);
                    }

                    LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    sLp.bottomMargin = RexVectorIcons.dp(hostCtx, 6);
                    sheet.addView(subRow, sLp);
                }
            }

            RexDialogs.addDialogCloseFooter(hostCtx, sheet, dialog);
            ScrollView sv = new ScrollView(hostCtx);
            sv.addView(sheet);
            dialog.setView(sv);
            RexDialogs.showBlurredDialog(hostCtx, dialog);
        } catch (Throwable ignored) {}
    }

    private static void updateSubFlagPill(Context ctx, TextView pill, String state) {
        boolean on = FlagState.ENABLE.toString().equalsIgnoreCase(state) || "true".equalsIgnoreCase(state);
        pill.setText(on ? "Enabled" : "Disabled");
        int color = on ? InstagramPreferenceStyle.activeSwitchColor() : InstagramPreferenceStyle.DESTRUCTIVE_RED;
        pill.setTextColor(color);
        pill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        pill.setTypeface(Typeface.DEFAULT_BOLD);
        int ph = RexVectorIcons.dp(ctx, 10);
        int pv = RexVectorIcons.dp(ctx, 4);
        pill.setPadding(ph, pv, ph, pv);
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(RexVectorIcons.dp(ctx, 10));
        bg.setColor((color & 0x00FFFFFF) | 0x26000000);
        bg.setStroke(Math.max(1, RexVectorIcons.dp(ctx, 1)), color);
        pill.setBackground(bg);
    }

    private void bindStateToView(View view, boolean animate) {
        if (view == null) return;
        Context ctx = view.getContext();
        String cur = InitialFeaturesManager.getCurrentValue(entry);
        boolean isEnable = FlagState.ENABLE.toString().equalsIgnoreCase(cur)
                || (entry.isEnum() && !cur.isEmpty());
        boolean isDisable = FlagState.DISABLE.toString().equalsIgnoreCase(cur);
        boolean isDefault = FlagState.DEFAULT.toString().equalsIgnoreCase(cur);

        InstagramPreferenceStyle.bindIconState(view, iconName, isEnable && !isDefault, animate);
        InstagramPreferenceStyle.bindSwitchAccessibility(view, isEnable);

        CompoundButton switchView = InstagramPreferenceStyle.findSwitch(view);
        if (switchView != null) {
            if (entry.isEnum()) {
                switchView.setVisibility(View.GONE);
            } else {
                switchView.setVisibility(View.VISIBLE);
                switchView.setOnCheckedChangeListener(null);
                InstagramPreferenceStyle.setNativeSwitchChecked(switchView, FlagState.ENABLE.toString().equalsIgnoreCase(cur), animate);
                InstagramPreferenceStyle.applySwitchTint(switchView, FlagState.ENABLE.toString().equalsIgnoreCase(cur));
                switchView.setClickable(true);
                switchView.setFocusable(false);
                switchView.setOnClickListener(v -> onPrimaryRowTap(view));
            }
        }

        TextView stateBadge = view.findViewWithTag(TAG_STATE_BADGE);
        if (stateBadge != null) {
            String label = entry.isEnum()
                    ? ("Variant: " + cur)
                    : (isDefault ? ("Default (Rec: " + entry.recommendedValue + ")") : (isEnable ? "Enabled" : "Disabled"));
            stateBadge.setText(label);
            int fg = isDefault
                    ? InstagramPreferenceStyle.secondaryTextColor()
                    : (isDisable ? InstagramPreferenceStyle.DESTRUCTIVE_RED : InstagramPreferenceStyle.activeSwitchColor());
            styleChip(ctx, stateBadge, fg);
        }

        TextView supportBadge = view.findViewWithTag(TAG_SUPPORT_BADGE);
        if (supportBadge != null) {
            supportBadge.setText(entry.supportStatus);
            int sColor = "Supported".equalsIgnoreCase(entry.supportStatus)
                    ? InstagramPreferenceStyle.SUCCESS_GREEN
                    : ("Unsupported".equalsIgnoreCase(entry.supportStatus)
                    ? InstagramPreferenceStyle.DESTRUCTIVE_RED
                    : InstagramPreferenceStyle.WARNING_GOLD);
            styleChip(ctx, supportBadge, sColor);
        }

        TextView subChip = view.findViewWithTag(TAG_SUBFLAGS_CHIP);
        if (subChip != null) {
            if (!entry.subFlags.isEmpty() || entry.isEnum()) {
                subChip.setVisibility(View.VISIBLE);
                subChip.setText(entry.isEnum()
                        ? ("Select Option (" + entry.enumOptions.size() + ")")
                        : ("Sub-Flags (" + entry.subFlags.size() + ")"));
                styleChip(ctx, subChip, InstagramPreferenceStyle.accentColor());
                subChip.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    showEnumAndSubFlagsDialog(ctx);
                });
            } else {
                subChip.setVisibility(View.GONE);
            }
        }

        TextView resetChip = view.findViewWithTag(TAG_RESET_CHIP);
        if (resetChip != null) {
            resetChip.setAlpha(isDefault ? 0.45f : 1.0f);
            resetChip.setEnabled(!isDefault);
            resetChip.setOnClickListener(isDefault ? null : (v -> onResetTap(view)));
        }

        view.setOnClickListener(v -> onPrimaryRowTap(view));
        view.setOnLongClickListener(v -> {
            RexHaptics.longPress(v);
            showEnumAndSubFlagsDialog(ctx);
            return true;
        });
    }

    public static void showSearchDialog(final Context context, final Runnable onUpdated) {
        String current = InitialFeaturesManager.getSearchQuery();
        RexDialogs.showTextInputDialog(
                context,
                "filter",
                "Search Initial Features (72 Flags)",
                "Filter by flag name, category, parameter, or description (leave blank to show all):",
                current,
                "Search keyword...",
                false,
                "Apply Filter",
                val -> {
                    SharedPref.setStringPref(InitialFeaturesManager.PREF_SEARCH_QUERY, val == null ? "" : val.trim());
                    if (onUpdated != null) onUpdated.run();
                }
        );
    }

    public static void showCategoryFilterDialog(final Context context, final Runnable onUpdated) {
        showSimpleSingleSelectSheet(
                context,
                "filter-cog",
                "Filter Initial Features by Category",
                InitialFeaturesManager.CATEGORIES,
                InitialFeaturesManager.getActiveCategoryFilter(),
                selected -> {
                    SharedPref.setStringPref(InitialFeaturesManager.PREF_FILTER_CATEGORY, selected);
                    if (onUpdated != null) onUpdated.run();
                }
        );
    }

    public static void showStatusFilterDialog(final Context context, final Runnable onUpdated) {
        showSimpleSingleSelectSheet(
                context,
                "list-checks",
                "Filter Initial Features by Status",
                InitialFeaturesManager.STATUS_FILTERS,
                InitialFeaturesManager.getActiveStatusFilter(),
                selected -> {
                    SharedPref.setStringPref(InitialFeaturesManager.PREF_FILTER_STATUS, selected);
                    if (onUpdated != null) onUpdated.run();
                }
        );
    }

    public static void showPresetsDialog(final Context context, final Runnable onUpdated) {
        showSimpleSingleSelectSheet(
                context,
                "wand",
                "Apply Curated Initial Features Preset",
                InitialFeaturesManager.PRESETS,
                "",
                selected -> {
                    InitialFeaturesManager.applyPresetTransactionally(context, selected);
                    if (onUpdated != null) onUpdated.run();
                }
        );
    }

    private static void showSimpleSingleSelectSheet(
            final Context context,
            final String iconId,
            final String title,
            final String[] options,
            final String currentVal,
            final java.util.function.Consumer<String> onSelected
    ) {
        final AlertDialog dialog = new AlertDialog.Builder(context).create();
        LinearLayout sheet = RexDialogs.createDialogSheet(context, iconId, title);
        ScrollView scroll = new ScrollView(context);
        LinearLayout list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        int pad = RexVectorIcons.dp(context, 12);
        for (final String opt : options) {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(pad, pad, pad, pad);
            boolean sel = opt.equalsIgnoreCase(currentVal);
            ImageView icon = new ImageView(context);
            RexIcon.bindOrAnimateState(icon, sel ? "circle-check" : "circle", sel, 0xFFA4ACB8, InstagramPreferenceStyle.accentColor(), 20, false);
            LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(RexVectorIcons.dp(context, 20), RexVectorIcons.dp(context, 20));
            iLp.setMarginEnd(RexVectorIcons.dp(context, 12));
            row.addView(icon, iLp);

            TextView tv = new TextView(context);
            tv.setText(opt);
            tv.setTextColor(sel ? InstagramPreferenceStyle.accentColor() : InstagramPreferenceStyle.primaryTextColor());
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            row.addView(tv, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            row.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
                if (onSelected != null) onSelected.accept(opt);
            });
            list.addView(row);
        }
        scroll.addView(list);
        sheet.addView(scroll, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                RexVectorIcons.dp(context, 340)
        ));
        dialog.setView(sheet);
        RexDialogs.showBlurredDialog(context, dialog);
    }

    private static void styleChip(Context ctx, TextView chip, int fgColor) {
        chip.setTextColor(fgColor);
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(RexVectorIcons.dp(ctx, 10));
        bg.setColor((fgColor & 0x00FFFFFF) | 0x24000000);
        bg.setStroke(Math.max(1, RexVectorIcons.dp(ctx, 1)), (fgColor & 0x00FFFFFF) | 0x55000000);
        chip.setBackground(bg);
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
        if (textCol != null && textCol.findViewWithTag(TAG_META_BAR) == null) {
            LinearLayout metaBar = new LinearLayout(ctx);
            metaBar.setTag(TAG_META_BAR);
            metaBar.setOrientation(LinearLayout.HORIZONTAL);
            metaBar.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            barLp.topMargin = RexVectorIcons.dp(ctx, 6);
            metaBar.setLayoutParams(barLp);

            int bpH = RexVectorIcons.dp(ctx, 8);
            int bpV = RexVectorIcons.dp(ctx, 3);

            TextView stateBadge = new TextView(ctx);
            stateBadge.setTag(TAG_STATE_BADGE);
            stateBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
            stateBadge.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            stateBadge.setPadding(bpH, bpV, bpH, bpV);
            LinearLayout.LayoutParams lp1 = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp1.setMarginEnd(RexVectorIcons.dp(ctx, 6));
            metaBar.addView(stateBadge, lp1);

            TextView supportBadge = new TextView(ctx);
            supportBadge.setTag(TAG_SUPPORT_BADGE);
            supportBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f);
            supportBadge.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            supportBadge.setPadding(bpH, bpV, bpH, bpV);
            LinearLayout.LayoutParams lp2 = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp2.setMarginEnd(RexVectorIcons.dp(ctx, 6));
            metaBar.addView(supportBadge, lp2);

            TextView subFlagsChip = new TextView(ctx);
            subFlagsChip.setTag(TAG_SUBFLAGS_CHIP);
            subFlagsChip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
            subFlagsChip.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            subFlagsChip.setPadding(bpH, bpV, bpH, bpV);
            LinearLayout.LayoutParams lp3 = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp3.setMarginEnd(RexVectorIcons.dp(ctx, 6));
            metaBar.addView(subFlagsChip, lp3);

            TextView resetChip = new TextView(ctx);
            resetChip.setTag(TAG_RESET_CHIP);
            resetChip.setText("Reset");
            resetChip.setTextColor(InstagramPreferenceStyle.accentColor());
            resetChip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
            resetChip.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            resetChip.setPadding(bpH, bpV, bpH, bpV);
            metaBar.addView(resetChip);

            textCol.addView(metaBar);
        }
        boundRowView = view;
        return view;
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        boundRowView = view;
        InstagramPreferenceStyle.bindText(this, view);
        bindStateToView(view, false);
    }
}
