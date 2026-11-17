/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.instagram.common.session.UserSession;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.db.RexMessageDb;
import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.patches.dm.SavedMessagesHook;
import app.morphe.extension.instagram.patches.download.DownloadUtils;
import app.morphe.extension.instagram.patches.download.MediaActionRegistry;
import app.morphe.extension.instagram.patches.download.MediaActionRegistry.ActionGroup;
import app.morphe.extension.instagram.patches.download.MediaActionRegistry.ActionId;
import app.morphe.extension.instagram.patches.download.MediaActionRegistry.ActionSpec;
import app.morphe.extension.instagram.patches.download.MediaContextResolver;
import app.morphe.extension.instagram.patches.download.MediaContextResolver.MediaCapabilities;
import app.morphe.extension.instagram.patches.userprofile.ProfilePictureViewer;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.instagram.theme.MaterialYouTheme;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public final class RexDialogs {

    // Master Prompt Section 6.2 — Refined AMOLED Design Tokens
    public static final int SURFACE_CARD = 0xFF15181D;
    public static final int ELEVATED_SURFACE = 0xFF20252C;
    public static final int BORDER_STROKE = 0xFF303741;
    public static final int TEXT_PRIMARY = 0xFFF5F7FA;
    public static final int TEXT_SECONDARY = 0xFFA4ACB8;
    public static final int TEXT_MUTED = 0xFF737D8A;
    public static final int BRAND_CYAN = 0xFF23C6D8;
    public static final int ACTIVE_TEAL = 0xFF35CDBB;
    public static final int ACTION_BLUE = 0xFF3998E8;
    public static final int SUCCESS_GREEN = 0xFF35B779;
    public static final int WARNING_GOLD = 0xFFE6B450;
    public static final int DESTRUCTIVE_RED = 0xFFF06470;

    // Single modal owner tracking so popups never stack uncontrollably (Section 7.2)
    private static WeakReference<Dialog> activeModalDialog;

    private RexDialogs() {}

    /**
     * Converts any runtime exception into a short, friendly user message without leaking
     * internal Java/Instagram class names or obfuscated method names (BUG-ERROR-001).
     */
    public static String userSafeErrorMessage(Throwable error, String fallbackMessage) {
        String safeFallback = (fallbackMessage == null || fallbackMessage.trim().isEmpty())
                ? "Couldn't complete action. Try again."
                : fallbackMessage;
        if (error == null) return safeFallback;
        String msg = error.getMessage();
        if (msg == null || msg.trim().isEmpty()) return safeFallback;
        String trimmed = msg.trim();
        if (trimmed.contains("com.instagram.")
                || trimmed.contains("java.lang.")
                || trimmed.contains("app.morphe.")
                || trimmed.contains("ImageInfo")
                || trimmed.contains("NoSuchMethod")
                || trimmed.contains("NoSuchField")
                || trimmed.contains("NullPointer")
                || trimmed.contains("ClassCast")
                || trimmed.contains("[]")) {
            return safeFallback;
        }
        return trimmed.length() > 80 ? safeFallback : trimmed;
    }

    public static synchronized void dismissActiveModalIfPresent() {
        if (activeModalDialog != null) {
            Dialog prev = activeModalDialog.get();
            activeModalDialog = null;
            if (prev != null && prev.isShowing()) {
                try {
                    prev.dismiss();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    public static void showNotificationCenterDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout sheet = createDialogSheet(context, "bell-cog", "Notification Center");

            addQuickAccessSectionHeader(context, sheet, "PUSH NOTIFICATION FILTERS");
            LinearLayout card = createGroupedMenuCard(context);
            addGroupedMenuRow(context, card, "bell-ringing", "Filter by Notification Type", true, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.showNotificationTypeFilterDialog(context);
            });
            addGroupedMenuRow(context, card, "filter", "Filter by Keywords", false, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.showNotificationKeywordFilterDialog(context);
            });
            sheet.addView(card);

            addDialogCloseFooter(context, sheet, dialog);
            dialog.setView(sheet);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            RexRuntimeFeatures.showNotificationTypeFilterDialog(context);
        }
    }

    public static void showAppLanguagePicker(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout sheet = createDialogSheet(context, "globe", "App Language & Translator");

            String currentTrans = SharedPref.getStringPref(Settings.TRANSLATOR_LANGUAGE);
            addQuickAccessSectionHeader(context, sheet, "LANGUAGE & TRANSLATION");
            LinearLayout card = createGroupedMenuCard(context);
            addGroupedMenuRow(context, card, "globe", "Instagram App Language", true, () -> {
                dialog.dismiss();
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                    try {
                        Intent intent = new Intent(android.provider.Settings.ACTION_APP_LOCALE_SETTINGS);
                        intent.setData(Uri.fromParts("package", context.getPackageName(), null));
                        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        context.startActivity(intent);
                    } catch (Throwable error) {
                        Utils.showToastShort("Couldn't open Android app language settings");
                    }
                } else {
                    showConfirmDialog(
                            context,
                            "Android 13+ Required",
                            "Per-app language settings are managed by Android 13 and newer. You can still configure the built-in translator language right now.",
                            "Translator Language",
                            false,
                            () -> RexRuntimeFeatures.showTranslatorLanguagePicker(context, null)
                    );
                }
            });
            addGroupedMenuRow(
                    context,
                    card,
                    "language",
                    "Translator Target Language (" + (currentTrans == null || currentTrans.isEmpty() ? "English" : currentTrans) + ")",
                    false,
                    () -> {
                        dialog.dismiss();
                        RexRuntimeFeatures.showTranslatorLanguagePicker(context, null);
                    }
            );
            sheet.addView(card);

            addDialogCloseFooter(context, sheet, dialog);
            dialog.setView(sheet);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            RexRuntimeFeatures.showTranslatorLanguagePicker(context, null);
        }
    }

    public static Activity resolveActivity(Context context) {
        Context c = context;
        while (c instanceof ContextWrapper) {
            if (c instanceof Activity) return (Activity) c;
            Context base = ((ContextWrapper) c).getBaseContext();
            if (base == c) break;
            c = base;
        }
        return Utils.getActivity();
    }

    /**
     * Attaches real-time Gaussian background blur (RenderEffect on underlying Activity decorView +
     * WindowManager FLAG_BLUR_BEHIND) on Android 12+ (API 31+) with a clean dim-scrim fallback
     * on older Android versions or reduced-motion/low-power configurations.
     */
    public static void attachBlurBehind(final Dialog dialog, Context context) {
        if (dialog == null) return;
        final Activity host = resolveActivity(context);
        final boolean reducedMotion = RexIcon.isReducedMotionEnabled(context);
        try {
            Window w = dialog.getWindow();
            if (w != null) {
                w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                w.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
                WindowManager.LayoutParams lp = w.getAttributes();
                lp.dimAmount = reducedMotion ? 0.72f : 0.58f;
                if (!reducedMotion && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    w.addFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
                    lp.setBlurBehindRadius(46);
                }
                w.setAttributes(lp);
            }
            if (!reducedMotion && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && host != null && host.getWindow() != null) {
                final View decor = host.getWindow().getDecorView();
                if (decor != null) {
                    decor.setRenderEffect(RenderEffect.createBlurEffect(28f, 28f, Shader.TileMode.CLAMP));
                    dialog.setOnDismissListener(d -> {
                        try {
                            decor.setRenderEffect(null);
                        } catch (Throwable ignored) {}
                    });
                }
            }
        } catch (Throwable ignored) {}
    }

    public static void styleSystemPreferenceDialog(final Dialog dialog, final Context context) {
        if (dialog == null) return;
        attachBlurBehind(dialog, context);
        try {
            Window w = dialog.getWindow();
            if (w != null) {
                GradientDrawable bg = new GradientDrawable();
                bg.setColor(SURFACE_CARD);
                bg.setCornerRadius(RexVectorIcons.dp(context, 26));
                bg.setStroke(Math.max(2, RexVectorIcons.dp(context, 1)), BORDER_STROKE);
                w.setBackgroundDrawable(bg);
            }
        } catch (Throwable ignored) {}
    }

    public static void showBlurredDialog(Context context, Dialog dialog) {
        if (dialog == null) return;
        dismissActiveModalIfPresent();
        synchronized (RexDialogs.class) {
            activeModalDialog = new WeakReference<>(dialog);
        }
        attachBlurBehind(dialog, context);
        dialog.show();
    }

    public static LinearLayout createDialogSheet(Context context, String headerIconId, String titleText) {
        LinearLayout sheet = new LinearLayout(context);
        sheet.setOrientation(LinearLayout.VERTICAL);
        int pad = RexVectorIcons.dp(context, 18);
        sheet.setPadding(pad, RexVectorIcons.dp(context, 20), pad, pad);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(SURFACE_CARD);
        bg.setCornerRadius(RexVectorIcons.dp(context, 26));
        bg.setStroke(Math.max(2, RexVectorIcons.dp(context, 1)), BORDER_STROKE);
        sheet.setBackground(bg);

        LinearLayout headerRow = new LinearLayout(context);
        headerRow.setOrientation(LinearLayout.HORIZONTAL);
        headerRow.setGravity(Gravity.CENTER_VERTICAL);
        headerRow.setPadding(RexVectorIcons.dp(context, 4), 0, RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 12));

        if (headerIconId != null && !headerIconId.isEmpty()) {
            ImageView icon = new ImageView(context);
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            icon.setImageDrawable(RexIcon.getDrawable(context, headerIconId, BRAND_CYAN, 23));
            LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(
                    RexVectorIcons.dp(context, 23), RexVectorIcons.dp(context, 23));
            iLp.setMarginEnd(RexVectorIcons.dp(context, 10));
            headerRow.addView(icon, iLp);
        }

        TextView header = new TextView(context);
        header.setText(titleText);
        header.setTextColor(TEXT_PRIMARY);
        header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19.5f);
        header.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        headerRow.addView(header, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        sheet.addView(headerRow);
        return sheet;
    }

    public static void addDialogCloseFooter(Context context, LinearLayout sheet, final Dialog dialog) {
        LinearLayout footer = new LinearLayout(context);
        footer.setOrientation(LinearLayout.HORIZONTAL);
        footer.setGravity(Gravity.END);
        footer.setPadding(0, RexVectorIcons.dp(context, 10), 0, 0);

        TextView close = new TextView(context);
        close.setText("Close");
        close.setTextColor(BRAND_CYAN);
        close.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
        close.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        int p = RexVectorIcons.dp(context, 10);
        close.setPadding(p, p, p, p);
        close.setOnClickListener(v -> {
            RexHaptics.tap(v);
            dialog.dismiss();
        });
        footer.addView(close);
        sheet.addView(footer);
    }

    // -------------------------------------------------------------------------
    // 1. Quick Access Menu (SETTINGS & FEATURES)
    // -------------------------------------------------------------------------
    public static void showHomeQuickMenu(final Context context) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();

            LinearLayout sheet = new LinearLayout(hostCtx);
            sheet.setOrientation(LinearLayout.VERTICAL);
            int pad = RexVectorIcons.dp(hostCtx, 18);
            sheet.setPadding(pad, RexVectorIcons.dp(hostCtx, 20), pad, pad);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(SURFACE_CARD);
            bg.setCornerRadius(RexVectorIcons.dp(hostCtx, 26));
            bg.setStroke(Math.max(2, RexVectorIcons.dp(hostCtx, 1)), BORDER_STROKE);
            sheet.setBackground(bg);

            TextView header = new TextView(hostCtx);
            header.setText("Quick Access");
            header.setTextColor(TEXT_PRIMARY);
            header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
            header.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            header.setGravity(Gravity.CENTER);
            header.setPadding(0, 0, 0, RexVectorIcons.dp(hostCtx, 14));
            sheet.addView(header);

            boolean ghostOn = Pref.getTurnOnAllGhostModes();
            boolean darkOn = Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.AMOLED_THEME)) || MaterialYouTheme.isAmoledEnabled();
            boolean dndOn = Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.DND_MODE_ENABLED));
            int deletedCount = getDeletedMessagesCount(hostCtx);

            // Section 1: SETTINGS
            addQuickAccessSectionHeader(hostCtx, sheet, "SETTINGS");
            LinearLayout settingsCard = createGroupedMenuCard(hostCtx);
            addGroupedMenuRow(hostCtx, settingsCard, "settings", "Rex IG Lite Settings", true, () -> {
                dialog.dismiss();
                FragmentHook.startSettings();
            });
            addGroupedMenuRow(hostCtx, settingsCard, "code-2", "Developer Options", true, () -> {
                dialog.dismiss();
                showDevWarningDialog(hostCtx, () -> FragmentHook.startFragment(Constants.REX_FRAGMENT_DEV_OPTIONS));
            });
            addGroupedMenuRow(hostCtx, settingsCard, "refresh-cw", "Restart App", false, () -> {
                dialog.dismiss();
                Utils.restartApp(hostCtx);
            });
            sheet.addView(settingsCard);

            // Section 2: FEATURES
            addQuickAccessSectionHeader(hostCtx, sheet, "FEATURES");
            LinearLayout featuresCard = createGroupedMenuCard(hostCtx);
            addGroupedToggleMenuRow(hostCtx, featuresCard, "ghost", "Ghost Mode", ghostOn, true, (iconView, labelView) -> {
                boolean next = !Pref.getTurnOnAllGhostModes();
                Pref.setTurnOnAllGhostModes(next);
                labelView.setText("Ghost Mode: (" + (next ? "Enabled" : "Disabled") + ")");
                RexIcon.bindOrAnimateState(iconView, "ghost", next, TEXT_PRIMARY, ACTIVE_TEAL, 22, true);
                Utils.showToastShort("Ghost Mode: " + (next ? "Enabled" : "Disabled"));
            });
            addGroupedToggleMenuRow(hostCtx, featuresCard, "bell-off", "DND Mode", dndOn, true, (iconView, labelView) -> {
                boolean next = !Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.DND_MODE_ENABLED));
                SharedPref.setBooleanPref(Settings.DND_MODE_ENABLED.key, next);
                labelView.setText("DND Mode: (" + (next ? "Enabled" : "Disabled") + ")");
                RexIcon.bindOrAnimateState(iconView, "bell-off", next, TEXT_PRIMARY, ACTIVE_TEAL, 22, true);
                Utils.showToastShort("DND Mode: " + (next ? "Enabled" : "Disabled"));
            });
            addGroupedMenuRow(hostCtx, featuresCard, "history", "Activity & Watch History", true, () -> {
                dialog.dismiss();
                RexVault.showWatchHistoryDialog(hostCtx);
            });
            addGroupedMenuRow(hostCtx, featuresCard, "bookmarks", "Saved Copies (Bios, Captions & Profiles)", true, () -> {
                dialog.dismiss();
                showSavedCopiesDialog(hostCtx);
            });
            addGroupedMenuRow(hostCtx, featuresCard, "trash-2", "Deleted Messages (" + deletedCount + ")", true, () -> {
                dialog.dismiss();
                SavedMessagesHook.openDeletedMessages(hostCtx);
            });
            addGroupedMenuRow(hostCtx, featuresCard, "scissors", "Long Video Splitter", true, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.showVideoSplitterDialog(hostCtx);
            });
            addGroupedToggleMenuRow(hostCtx, featuresCard, "moon", "Dark Mode", darkOn, false, (iconView, labelView) -> {
                boolean next = !Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.AMOLED_THEME));
                SharedPref.setBooleanPref(Settings.AMOLED_THEME.key, next);
                labelView.setText("Dark Mode: (" + (next ? "Enabled" : "Disabled") + ")");
                RexIcon.bindOrAnimateState(iconView, "moon", next, TEXT_PRIMARY, ACTIVE_TEAL, 22, true);
                Utils.showToastShort("AMOLED Dark Mode: " + (next ? "Enabled" : "Disabled"));
            });
            sheet.addView(featuresCard);

            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showHomeQuickMenu failure", e);
            FragmentHook.startSettings();
        }
    }

    public static void showSavedCopiesDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout sheet = createDialogSheet(context, "bookmarks", "Saved Copies");

            addQuickAccessSectionHeader(context, sheet, "SAVED DATA");
            LinearLayout card = createGroupedMenuCard(context);
            addGroupedMenuRow(context, card, "file-text", "Saved Bio", true, () -> {
                dialog.dismiss();
                RexVault.showSavedBiosDialog(context);
            });
            addGroupedMenuRow(context, card, "scroll-text", "Saved Captions", true, () -> {
                dialog.dismiss();
                RexVault.showSavedCaptionsDialog(context);
            });
            addGroupedMenuRow(context, card, "users", "Saved Profiles", false, () -> {
                dialog.dismiss();
                RexVault.showSavedProfilesDialog(context);
            });
            sheet.addView(card);

            addDialogCloseFooter(context, sheet, dialog);
            dialog.setView(sheet);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            RexVault.showSavedCaptionsDialog(context);
        }
    }

    private interface ToggleRowCallback {
        void onToggle(ImageView iconView, TextView labelView);
    }

    private static void addQuickAccessSectionHeader(Context context, LinearLayout parent, String text) {
        TextView label = new TextView(context);
        label.setText(text);
        label.setTextColor(BRAND_CYAN);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        label.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        label.setLetterSpacing(0.06f);
        label.setPadding(RexVectorIcons.dp(context, 6), RexVectorIcons.dp(context, 10), 0, RexVectorIcons.dp(context, 6));
        parent.addView(label);
    }

    private static LinearLayout createGroupedMenuCard(Context context) {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(ELEVATED_SURFACE);
        bg.setCornerRadius(RexVectorIcons.dp(context, 20));
        bg.setStroke(Math.max(2, RexVectorIcons.dp(context, 1)), BORDER_STROKE);
        card.setBackground(bg);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        lp.bottomMargin = RexVectorIcons.dp(context, 6);
        card.setLayoutParams(lp);
        return card;
    }

    private static void addGroupedMenuRow(
            Context context,
            LinearLayout card,
            String iconType,
            String label,
            boolean showDividerBelow,
            Runnable onClick
    ) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(RexVectorIcons.dp(context, 48));
        int hPad = RexVectorIcons.dp(context, 16);
        int vPad = RexVectorIcons.dp(context, 13);
        row.setPadding(hPad, vPad, hPad, vPad);

        final ImageView icon = new ImageView(context);
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        int iconPx = RexVectorIcons.dp(context, 22);
        icon.setImageDrawable(RexIcon.getDrawable(context, iconType, TEXT_PRIMARY, 22));
        LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(iconPx, iconPx);
        iLp.setMarginEnd(RexVectorIcons.dp(context, 14));
        row.addView(icon, iLp);

        TextView text = new TextView(context);
        text.setText(label);
        text.setTextColor(TEXT_PRIMARY);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        text.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        row.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final ImageView chevron = new ImageView(context);
        chevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        chevron.setImageDrawable(RexIcon.getDrawable(context, "chevron-right", TEXT_SECONDARY, 18));
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(
                RexVectorIcons.dp(context, 18),
                RexVectorIcons.dp(context, 18)
        );
        row.addView(chevron, cLp);

        row.setOnClickListener(v -> {
            RexHaptics.tap(v);
            RexIcon.pulseIcon(icon);
            RexIcon.nudgeChevron(chevron);
            if (onClick != null) onClick.run();
        });
        card.addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        if (showDividerBelow) {
            View div = new View(context);
            div.setBackgroundColor(BORDER_STROKE);
            LinearLayout.LayoutParams dLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    Math.max(1, RexVectorIcons.dp(context, 1))
            );
            card.addView(div, dLp);
        }
    }

    private static void addGroupedToggleMenuRow(
            Context context,
            LinearLayout card,
            String iconType,
            String baseLabel,
            boolean initialActive,
            boolean showDividerBelow,
            ToggleRowCallback callback
    ) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(RexVectorIcons.dp(context, 48));
        int hPad = RexVectorIcons.dp(context, 16);
        int vPad = RexVectorIcons.dp(context, 13);
        row.setPadding(hPad, vPad, hPad, vPad);

        final ImageView icon = new ImageView(context);
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        int iconPx = RexVectorIcons.dp(context, 22);
        RexIcon.bindOrAnimateState(icon, iconType, initialActive, TEXT_PRIMARY, ACTIVE_TEAL, 22, false);
        LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(iconPx, iconPx);
        iLp.setMarginEnd(RexVectorIcons.dp(context, 14));
        row.addView(icon, iLp);

        final TextView text = new TextView(context);
        text.setText(baseLabel + ": (" + (initialActive ? "Enabled" : "Disabled") + ")");
        text.setTextColor(TEXT_PRIMARY);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        text.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        row.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final ImageView chevron = new ImageView(context);
        chevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        chevron.setImageDrawable(RexIcon.getDrawable(context, "chevron-right", TEXT_SECONDARY, 18));
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(
                RexVectorIcons.dp(context, 18),
                RexVectorIcons.dp(context, 18)
        );
        row.addView(chevron, cLp);

        row.setOnClickListener(v -> {
            RexHaptics.toggle(v);
            if (callback != null) callback.onToggle(icon, text);
        });
        card.addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        if (showDividerBelow) {
            View div = new View(context);
            div.setBackgroundColor(BORDER_STROKE);
            LinearLayout.LayoutParams dLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    Math.max(1, RexVectorIcons.dp(context, 1))
            );
            card.addView(div, dLp);
        }
    }

    private static int getDeletedMessagesCount(Context context) {
        try {
            return RexMessageDb.getInstance(context).getDeletedMessages().size();
        } catch (Throwable ignored) {
            return 0;
        }
    }

    // -------------------------------------------------------------------------
    // 2. Interactive Bio, Caption & Comment Hold/Edit/Copy Studio
    // -------------------------------------------------------------------------
    public static void showTextStudioDialog(
            final Context context,
            final String studioTitle,
            final String authorUsername,
            final String initialText,
            final String sourceLink
    ) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            final String rawOriginal = initialText == null ? "" : initialText;
            final String safeUser = (authorUsername == null || authorUsername.isEmpty()) ? "instagram" : authorUsername;

            LinearLayout sheet = createDialogSheet(
                    hostCtx,
                    "edit",
                    studioTitle + (safeUser.isEmpty() ? "" : " (@" + safeUser + ")")
            );

            final TextView statsView = new TextView(hostCtx);
            statsView.setTextColor(BRAND_CYAN);
            statsView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            statsView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            statsView.setPadding(RexVectorIcons.dp(hostCtx, 4), 0, 0, RexVectorIcons.dp(hostCtx, 8));
            sheet.addView(statsView);

            final EditText editor = new EditText(hostCtx);
            editor.setText(rawOriginal);
            editor.setHint("Text is empty — type or paste to edit & copy...");
            editor.setHintTextColor(TEXT_SECONDARY);
            editor.setTextColor(TEXT_PRIMARY);
            editor.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.8f);
            editor.setMinLines(3);
            editor.setMaxLines(7);
            editor.setGravity(Gravity.TOP | Gravity.START);
            editor.setTextIsSelectable(true);
            int ePad = RexVectorIcons.dp(hostCtx, 14);
            editor.setPadding(ePad, ePad, ePad, ePad);
            GradientDrawable edBg = new GradientDrawable();
            edBg.setColor(ELEVATED_SURFACE);
            edBg.setCornerRadius(RexVectorIcons.dp(hostCtx, 16));
            edBg.setStroke(Math.max(2, RexVectorIcons.dp(hostCtx, 1)), BORDER_STROKE);
            editor.setBackground(edBg);
            LinearLayout.LayoutParams edLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            edLp.bottomMargin = RexVectorIcons.dp(hostCtx, 10);
            sheet.addView(editor, edLp);

            Runnable updateStats = () -> {
                String current = editor.getText() == null ? "" : editor.getText().toString();
                int chars = current.length();
                String trimmed = current.trim();
                int words = trimmed.isEmpty() ? 0 : trimmed.split("\\s+").length;
                statsView.setText("Editable Studio • " + chars + " chars • " + words + " words");
            };
            updateStats.run();
            editor.addTextChangedListener(new TextWatcher() {
                @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
                @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                    updateStats.run();
                }
                @Override public void afterTextChanged(Editable s) {}
            });

            HorizontalScrollView chipScroll = new HorizontalScrollView(hostCtx);
            chipScroll.setHorizontalScrollBarEnabled(false);
            LinearLayout chipRow = new LinearLayout(hostCtx);
            chipRow.setOrientation(LinearLayout.HORIZONTAL);
            chipRow.setPadding(0, 0, 0, RexVectorIcons.dp(hostCtx, 10));

            addTransformChip(hostCtx, chipRow, "hash", "Strip #Tags", () -> {
                String cur = editor.getText().toString();
                editor.setText(cur.replaceAll("#\\S+", "").replaceAll("\\s{2,}", " ").trim());
                editor.setSelection(editor.getText().length());
            });
            addTransformChip(hostCtx, chipRow, "at-sign", "Strip @Mentions", () -> {
                String cur = editor.getText().toString();
                editor.setText(cur.replaceAll("@[\\w.]+", "").replaceAll("\\s{2,}", " ").trim());
                editor.setSelection(editor.getText().length());
            });
            addTransformChip(hostCtx, chipRow, "wand", "Bold Unicode", () -> {
                String cur = editor.getText().toString();
                editor.setText(RexRuntimeFeatures.toStyledUnicode(cur, "𝐁𝐨𝐥𝐝 (Bold Serif)"));
                editor.setSelection(editor.getText().length());
            });
            addTransformChip(hostCtx, chipRow, "refresh-cw", "Reset Text", () -> {
                editor.setText(rawOriginal);
                editor.setSelection(editor.getText().length());
            });
            chipScroll.addView(chipRow);
            sheet.addView(chipScroll);

            LinearLayout actionsCard = createGroupedMenuCard(hostCtx);
            addGroupedMenuRow(hostCtx, actionsCard, "copy", "Copy Current / Edited Text", true, () -> {
                String val = editor.getText().toString();
                if (val.isEmpty()) {
                    Utils.showToastShort("Text is empty");
                } else {
                    Utils.setClipboard(val);
                    Utils.showToastShort("Copied edited text to clipboard");
                    dialog.dismiss();
                }
            });
            addGroupedMenuRow(hostCtx, actionsCard, "sparkles", "Copy Clean (Without #Hashtags)", true, () -> {
                String val = editor.getText().toString().replaceAll("#\\S+", "").replaceAll("\\s{2,}", " ").trim();
                if (val.isEmpty()) {
                    Utils.showToastShort("Text is empty");
                } else {
                    Utils.setClipboard(val);
                    Utils.showToastShort("Copied clean text without hashtags");
                    dialog.dismiss();
                }
            });
            addGroupedMenuRow(hostCtx, actionsCard, "language", "Translate Text", true, () -> {
                String val = editor.getText().toString();
                dialog.dismiss();
                RexRuntimeFeatures.translateText(hostCtx, val, studioTitle);
            });
            addGroupedMenuRow(hostCtx, actionsCard, "bookmark", "Save to xboyrex Vault", true, () -> {
                String val = editor.getText().toString();
                if (studioTitle.toLowerCase().contains("bio")) {
                    RexVault.saveBio(hostCtx, safeUser, val);
                } else {
                    RexVault.saveCaption(hostCtx, safeUser, val, sourceLink);
                }
                dialog.dismiss();
            });
            addGroupedMenuRow(hostCtx, actionsCard, "share-2", "Share Text Externally", true, () -> {
                String val = editor.getText().toString();
                dialog.dismiss();
                shareText(hostCtx, val);
            });
            addGroupedMenuRow(hostCtx, actionsCard, "search", "Search Text on Web", false, () -> {
                String val = editor.getText().toString().trim();
                dialog.dismiss();
                if (!val.isEmpty()) {
                    try {
                        RexUtils.openUrl("https://www.google.com/search?q=" + Uri.encode(val), true);
                    } catch (Throwable ignored) {}
                }
            });
            sheet.addView(actionsCard);

            addDialogCloseFooter(hostCtx, sheet, dialog);
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            if (initialText != null && !initialText.isEmpty()) {
                Utils.setClipboard(initialText);
                Utils.showToastShort("Copied to clipboard");
            }
        }
    }

    private static void addTransformChip(
            Context context,
            LinearLayout parent,
            String iconId,
            String label,
            Runnable onClick
    ) {
        LinearLayout chip = new LinearLayout(context);
        chip.setOrientation(LinearLayout.HORIZONTAL);
        chip.setGravity(Gravity.CENTER_VERTICAL);
        int hPad = RexVectorIcons.dp(context, 12);
        int vPad = RexVectorIcons.dp(context, 8);
        chip.setPadding(hPad, vPad, hPad, vPad);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(ELEVATED_SURFACE);
        bg.setCornerRadius(RexVectorIcons.dp(context, 14));
        bg.setStroke(Math.max(1, RexVectorIcons.dp(context, 1)), BORDER_STROKE);
        chip.setBackground(bg);

        final ImageView icon = new ImageView(context);
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        icon.setImageDrawable(RexIcon.getDrawable(context, iconId, BRAND_CYAN, 16));
        LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(
                RexVectorIcons.dp(context, 16), RexVectorIcons.dp(context, 16));
        iLp.setMarginEnd(RexVectorIcons.dp(context, 6));
        chip.addView(icon, iLp);

        TextView tv = new TextView(context);
        tv.setText(label);
        tv.setTextColor(TEXT_PRIMARY);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        chip.addView(tv);

        chip.setOnClickListener(v -> {
            RexHaptics.tap(v);
            RexIcon.pulseIcon(icon);
            if (onClick != null) onClick.run();
        });

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.setMarginEnd(RexVectorIcons.dp(context, 8));
        parent.addView(chip, lp);
    }

    // -------------------------------------------------------------------------
    // 3. Profile Smart More Options Popup (Grouped + Bio Studio)
    // -------------------------------------------------------------------------
    public static void showProfilePopup(final Context context, final UserData userData, final Callable<String> refreshUrl) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();

            final String username = safeCall(() -> userData.getUsername(), "");
            final String fullName = safeCall(() -> userData.getFullName(), "");
            final String userId = safeCall(() -> userData.getUserId(), "");
            final String bio = safeCall(() -> userData.getBio(), "");
            final boolean isPrivate = safeBool(() -> userData.isPrivate(), false);
            String[] counts = extractFollowerFollowingCounts(hostCtx, userData);
            final String followersStr = counts[0];
            final String followingStr = counts[1];
            final String cleanProfileLink = "https://www.instagram.com/" + username + "/";

            LinearLayout sheet = createDialogSheet(
                    hostCtx,
                    "user-round",
                    username.isEmpty() ? "Profile Options" : ("@" + username)
            );

            addQuickAccessSectionHeader(hostCtx, sheet, "AVATAR & BIO");
            LinearLayout mediaCard = createGroupedMenuCard(hostCtx);
            addGroupedMenuRow(hostCtx, mediaCard, "download", "Download Profile Picture (HD)", true, () -> {
                dialog.dismiss();
                downloadProfilePictureHd(hostCtx, userData, refreshUrl, username);
            });
            addGroupedMenuRow(hostCtx, mediaCard, "eye", "View Profile Picture", true, () -> {
                dialog.dismiss();
                ProfilePictureViewer.show(hostCtx, userData, refreshUrl);
            });
            addGroupedMenuRow(hostCtx, mediaCard, "edit", "View, Edit & Copy Bio", true, () -> {
                dialog.dismiss();
                showTextStudioDialog(hostCtx, "Profile Bio Studio", username, bio, cleanProfileLink);
            });
            addGroupedMenuRow(hostCtx, mediaCard, "copy", "Copy Bio", true, () -> {
                dialog.dismiss();
                if (bio != null && !bio.isEmpty()) {
                    Utils.setClipboard(bio);
                    Utils.showToastShort("Bio copied to clipboard");
                } else {
                    Utils.showToastShort("Bio is empty");
                }
            });
            addGroupedMenuRow(hostCtx, mediaCard, "bookmark", "Save Bio", true, () -> {
                dialog.dismiss();
                RexVault.saveBio(hostCtx, username, bio);
            });
            addGroupedMenuRow(hostCtx, mediaCard, "language", "Translate Bio", false, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.translateText(hostCtx, bio, "Bio");
            });
            sheet.addView(mediaCard);

            addQuickAccessSectionHeader(hostCtx, sheet, "IDENTITY & LINKS");
            LinearLayout idCard = createGroupedMenuCard(hostCtx);
            addGroupedMenuRow(hostCtx, idCard, "at-sign", "Copy Username", true, () -> {
                dialog.dismiss();
                if (username != null && !username.isEmpty()) {
                    Utils.setClipboard(username);
                    Utils.showToastShort("Copied @" + username);
                }
            });
            if (fullName != null && !fullName.isEmpty()) {
                addGroupedMenuRow(hostCtx, idCard, "user-round", "Copy Full Name", true, () -> {
                    dialog.dismiss();
                    Utils.setClipboard(fullName);
                    Utils.showToastShort("Copied full name: " + fullName);
                });
            }
            addGroupedMenuRow(hostCtx, idCard, "link", "Copy Profile Link", true, () -> {
                dialog.dismiss();
                Utils.setClipboard(cleanProfileLink);
                Utils.showToastShort("Copied clean profile link");
            });
            addGroupedMenuRow(hostCtx, idCard, "share-2", "Share Profile Link", true, () -> {
                dialog.dismiss();
                shareText(hostCtx, cleanProfileLink);
            });
            addGroupedMenuRow(hostCtx, idCard, "id-badge", "Copy User ID", true, () -> {
                dialog.dismiss();
                if (userId != null && !userId.isEmpty()) {
                    Utils.setClipboard(userId);
                    Utils.showToastShort("Copied User ID: " + userId);
                }
            });
            addGroupedMenuRow(hostCtx, idCard, isPrivate ? "lock" : "lock-open", isPrivate ? "Private Profile" : "Public Profile", true, () -> {
                dialog.dismiss();
                Utils.setClipboard(cleanProfileLink);
                Utils.showToastShort((isPrivate ? "Private Profile" : "Public Profile") + " • Link copied");
            });
            addGroupedMenuRow(hostCtx, idCard, "users", "Followers: " + followersStr, true, () -> {
                dialog.dismiss();
                Utils.setClipboard(followersStr);
                Utils.showToastShort("Followers: " + followersStr + " (Copied)");
            });
            addGroupedMenuRow(hostCtx, idCard, "user-check", "Following: " + followingStr, true, () -> {
                dialog.dismiss();
                Utils.setClipboard(followingStr);
                Utils.showToastShort("Following: " + followingStr + " (Copied)");
            });
            addGroupedMenuRow(hostCtx, idCard, "user-plus", "Add to Saved Profiles", false, () -> {
                dialog.dismiss();
                RexVault.saveProfile(hostCtx, username, fullName, userId);
            });
            sheet.addView(idCard);

            addDialogCloseFooter(hostCtx, sheet, dialog);
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showProfilePopup failure", e);
            Utils.showToastShort(userSafeErrorMessage(e, "Couldn't load profile options. Try again."));
        }
    }

    private static void downloadProfilePictureHd(
            final Context context,
            final UserData userData,
            final Callable<String> refreshUrl,
            final String username
    ) {
        Utils.runOnBackgroundThread(() -> {
            String hdUrl = null;
            try {
                if (refreshUrl != null) {
                    hdUrl = refreshUrl.call();
                }
            } catch (Throwable ignored) {}
            if (hdUrl == null || hdUrl.isEmpty()) {
                try {
                    hdUrl = userData.getProfilePictureUrl();
                } catch (Throwable ignored) {}
            }
            final String finalUrl = hdUrl;
            Utils.runOnMainThread(() -> {
                if (finalUrl == null || finalUrl.isEmpty()) {
                    Utils.showToastShort("Unable to resolve profile picture URL");
                    return;
                }
                try {
                    String safeUser = (username == null || username.isEmpty()) ? "profile" : username;
                    String fileName = safeUser + "_profile_hd_" + (System.currentTimeMillis() / 1000L) + ".jpg";
                    DownloadUtils.downloadMediaUrl(context, finalUrl, DownloadUtils.getSubfolderName(safeUser), fileName);
                } catch (Throwable e) {
                    Utils.showToastShort(userSafeErrorMessage(e, "Profile picture download failed. Try again."));
                }
            });
        });
    }

    private static void shareText(Context context, String text) {
        try {
            Intent sendIntent = new Intent(Intent.ACTION_SEND);
            sendIntent.setType("text/plain");
            sendIntent.putExtra(Intent.EXTRA_TEXT, text);
            Intent chooser = Intent.createChooser(sendIntent, "Share via");
            if (!(context instanceof Activity)) {
                chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }
            context.startActivity(chooser);
        } catch (Throwable e) {
            Utils.setClipboard(text);
            Utils.showToastShort("Link copied to clipboard");
        }
    }

    private static String[] extractFollowerFollowingCounts(Context context, UserData userData) {
        String followers = "—";
        String following = "—";
        try {
            Activity act = resolveActivity(context);
            if (act != null && act.getWindow() != null) {
                View decor = act.getWindow().getDecorView();
                List<String> texts = new ArrayList<>();
                collectVisibleTexts(decor, texts);
                for (int i = 0; i < texts.size(); i++) {
                    String t = texts.get(i).trim();
                    String lower = t.toLowerCase();
                    if ((lower.equals("followers") || lower.equals("follower")) && i > 0) {
                        String prev = texts.get(i - 1).trim();
                        if (prev.matches(".*[0-9].*")) followers = prev;
                    } else if (lower.endsWith(" followers") || lower.endsWith(" follower")) {
                        followers = t.replaceAll("(?i)\\s*followers?$", "").trim();
                    }
                    if (lower.equals("following") && i > 0) {
                        String prev = texts.get(i - 1).trim();
                        if (prev.matches(".*[0-9].*")) following = prev;
                    } else if (lower.endsWith(" following")) {
                        following = t.replaceAll("(?i)\\s*following$", "").trim();
                    }
                }
            }
        } catch (Throwable ignored) {}
        return new String[]{followers, following};
    }

    private static void collectVisibleTexts(View view, List<String> out) {
        if (view == null || view.getVisibility() != View.VISIBLE) return;
        if (view instanceof TextView) {
            CharSequence cs = ((TextView) view).getText();
            if (cs != null && cs.length() > 0 && cs.length() < 40) {
                out.add(cs.toString());
            }
        } else if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                collectVisibleTexts(vg.getChildAt(i), out);
            }
        }
    }

    // -------------------------------------------------------------------------
    // 4. Capability-Aware Post / Reel / Carousel Smart Options Sheet
    //    (Uses MediaContextResolver + MediaActionRegistry across 4 clean groups)
    // -------------------------------------------------------------------------
    public static void showPostOptionsSheet(
            final Context context,
            final UserSession userSession,
            final Object mediaObject,
            final int currentMediaIndex
    ) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final MediaCapabilities caps = MediaContextResolver.resolveForPost(mediaObject, userSession, currentMediaIndex);
            final List<ActionSpec> actions = MediaActionRegistry.buildActions(caps, false);

            RexVault.recordWatchedMedia(
                    hostCtx,
                    caps.username,
                    caps.rawCaption.isEmpty() ? ("Post @" + caps.username) : caps.rawCaption,
                    caps.postLink
            );

            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            String sheetTitle = caps.isCarousel && caps.totalCount > 1
                    ? "Post Options (Slide " + caps.displayIndex + " of " + caps.totalCount + ")"
                    : (caps.currentItemIsVideo ? "Video & Reel Options" : "Post Options");
            LinearLayout sheet = createDialogSheet(hostCtx, "hexagon", sheetTitle);

            for (ActionGroup group : ActionGroup.values()) {
                List<ActionSpec> groupActions = new ArrayList<>();
                for (ActionSpec spec : actions) {
                    if (spec.group == group) groupActions.add(spec);
                }
                if (groupActions.isEmpty()) continue;

                addQuickAccessSectionHeader(hostCtx, sheet, group.headerTitle);
                LinearLayout groupCard = createGroupedMenuCard(hostCtx);
                for (int i = 0; i < groupActions.size(); i++) {
                    final ActionSpec spec = groupActions.get(i);
                    boolean hasDivider = i < groupActions.size() - 1;
                    addGroupedMenuRow(hostCtx, groupCard, spec.iconId, spec.label, hasDivider, () -> {
                        dialog.dismiss();
                        dispatchMediaAction(hostCtx, caps, spec.id);
                    });
                }
                sheet.addView(groupCard);
            }

            addDialogCloseFooter(hostCtx, sheet, dialog);
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showPostOptionsSheet failure", e);
            Utils.showToastShort(userSafeErrorMessage(e, "Couldn't load media options. Try again."));
        }
    }

    private static void dispatchMediaAction(
            Context context,
            MediaCapabilities caps,
            ActionId actionId
    ) {
        try {
            final int filenameIndex = caps.group.currentFilenameIndex(caps.currentIndex);
            switch (actionId) {
                case DOWNLOAD_CURRENT:
                case DOWNLOAD_ALL_CAROUSEL:
                case DOWNLOAD_FIRST_10:
                case SELECT_SLIDES:
                case IMAGE_VARIANTS:
                case VIDEO_VARIANTS:
                case DOWNLOAD_AUDIO:
                case DOWNLOAD_COVER:
                case COPY_CLEAN_LINK:
                case OPEN_EXTERNAL_APP:
                    DownloadUtils.executeMediaAction(
                            context,
                            caps,
                            actionId,
                            filenameIndex,
                            null,
                            null
                    );
                    break;
                case COPY_AUTHOR_USERNAME:
                    if (caps.username != null && !caps.username.isEmpty()) {
                        Utils.setClipboard(caps.username);
                        Utils.showToastShort("Copied @" + caps.username);
                    }
                    break;
                case CAPTION_STUDIO:
                    showTextStudioDialog(context, "Caption Studio", caps.username, caps.rawCaption, caps.postLink);
                    break;
                case COPY_CAPTION: {
                    String cleaned = RexRuntimeFeatures.stripHashtagsIfConfigured(caps.rawCaption);
                    if (cleaned == null || cleaned.isEmpty()) {
                        Utils.showToastShort("Caption is empty");
                    } else {
                        Utils.setClipboard(cleaned);
                        Utils.showToastShort("Caption copied to clipboard");
                    }
                    break;
                }
                case SAVE_CAPTION:
                    RexVault.saveCaption(context, caps.username, caps.rawCaption, caps.postLink);
                    break;
                case TRANSLATE_CAPTION:
                    RexRuntimeFeatures.translateText(context, caps.rawCaption, "Caption");
                    break;
                case COPY_HASHTAGS: {
                    String tags = RexRuntimeFeatures.extractHashtags(caps.rawCaption);
                    if (tags.isEmpty()) {
                        Utils.showToastShort("No hashtags found in caption");
                    } else {
                        Utils.setClipboard(tags);
                        Utils.showToastShort("Copied hashtags: " + tags);
                    }
                    break;
                }
                case OCR_COVER_TEXT:
                    RexRuntimeFeatures.extractOcrFromMedia(context, caps.rootMedia, caps.currentIndex);
                    break;
                case REPOST_IG_POST:
                    RexRuntimeFeatures.repostMedia(context, caps.rootMedia, caps.currentIndex, "IG_POST");
                    break;
                case REPOST_IG_STORY:
                    RexRuntimeFeatures.repostMedia(context, caps.rootMedia, caps.currentIndex, "IG_STORY");
                    break;
                case REPOST_WHATSAPP_STORY:
                    RexRuntimeFeatures.repostMedia(context, caps.rootMedia, caps.currentIndex, "WHATSAPP");
                    break;
            }
        } catch (Throwable e) {
            Logger.printException(() -> "handlePostOptionClick error", e);
            Utils.showToastShort(userSafeErrorMessage(e, "Couldn't complete media action. Try again."));
        }
    }

    // -------------------------------------------------------------------------
    // 5. Semantic Icon Menu Dialog (Used by DownloadUtils, DeletedMessages, InstantsVault)
    // -------------------------------------------------------------------------
    public static void showSemanticMenuDialog(
            final Context context,
            final String headerIconId,
            final String titleText,
            final List<String> labels,
            final List<String> iconIds,
            final DialogInterface.OnClickListener onItemClick,
            final DialogInterface.OnDismissListener onDismiss
    ) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            LinearLayout sheet = createDialogSheet(hostCtx, headerIconId, titleText);

            LinearLayout card = createGroupedMenuCard(hostCtx);
            int count = labels.size();
            for (int i = 0; i < count; i++) {
                final int which = i;
                String lbl = labels.get(i);
                String ic = (iconIds != null && i < iconIds.size()) ? iconIds.get(i) : "download";
                addGroupedMenuRow(hostCtx, card, ic, lbl, i < count - 1, () -> {
                    dialog.dismiss();
                    if (onItemClick != null) {
                        onItemClick.onClick(dialog, which);
                    }
                });
            }
            sheet.addView(card);
            addDialogCloseFooter(hostCtx, sheet, dialog);

            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            if (onDismiss != null) {
                dialog.setOnDismissListener(onDismiss);
            }
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showSemanticMenuDialog error", e);
            if (onDismiss != null) onDismiss.onDismiss(null);
        }
    }

    // -------------------------------------------------------------------------
    // 6. Changelogs Dialog
    // -------------------------------------------------------------------------
    public static void showChangelogDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout root = createDialogSheet(context, "scroll-text", "Changelogs");

            TextView meta = new TextView(context);
            meta.setText("Release Date: 17/11/2026\n" +
                    "Base: 453.0.0.57.79 & 452.1.0.53.64 / Universal\n" +
                    "Version: 3.14.0 (AMOLED Suite)");
            meta.setTextColor(TEXT_SECONDARY);
            meta.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            meta.setPadding(RexVectorIcons.dp(context, 4), 0, RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 12));
            root.addView(meta);

            ScrollView scroll = new ScrollView(context);
            TextView body = new TextView(context);
            body.setText(
                    "Fixed: ImageInfoImpl and ImmutablePandoImageInfo variant resolution across Instagram v452–v453 (BUG-DL-001 & BUG-DL-002).\n" +
                    "Fixed: Automatic Carousel item count and slide detection (Download All (N), Download First 10, and Select Slides).\n" +
                    "Fixed: Root Settings category icons and subpage preference icons so every option displays its unique semantic Tabler icon.\n" +
                    "Added: Capability-aware MediaContextResolver & MediaActionRegistry across 4 clean groups (Download, Copy & Caption, Tools, Share).\n" +
                    "Added: Upgraded AMOLED #15181D / #20252C / #23C6D8 palette, Reduced Motion support, and Legal & Open-Source Licences screen."
            );
            body.setTextColor(TEXT_PRIMARY);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.8f);
            body.setLineSpacing(RexVectorIcons.dp(context, 3), 1.05f);
            body.setPadding(RexVectorIcons.dp(context, 4), 0, RexVectorIcons.dp(context, 4), 0);
            scroll.addView(body);
            root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

            addDialogCloseFooter(context, root, dialog);
            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable ignored) {}
    }

    // -------------------------------------------------------------------------
    // 7. Legal & Open-Source Licences Dialog (Master Prompt Section 5.1)
    // -------------------------------------------------------------------------
    public static void showLegalLicensesDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout root = createDialogSheet(context, "file-text", "Legal & Open-Source Licences");

            ScrollView scroll = new ScrollView(context);
            TextView body = new TextView(context);
            body.setText(
                    "1. Rex IG Lite — GNU General Public License v3.0 (GPLv3)\n" +
                    "Copyright (C) 2026 xboyrex (https://github.com/xboyrex/rex-ig-lite).\n" +
                    "Licensed under GNU GPLv3 with Section 7(b) attribution preservation.\n\n" +
                    "2. Tabler Icons — MIT License\n" +
                    "Copyright (c) 2020-2026 Paweł Kuna (https://tablericons.com/ • https://github.com/tabler/tabler-icons).\n" +
                    "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files to deal in the Software without restriction, subject to the MIT License notice.\n\n" +
                    "3. Brand Marks (GitHub, YouTube, Telegram, Instagram, WhatsApp)\n" +
                    "Official brand marks are trademarks of their respective owners and are used solely to identify official community links and share targets."
            );
            body.setTextColor(TEXT_SECONDARY);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            body.setLineSpacing(RexVectorIcons.dp(context, 3), 1.06f);
            body.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 12));
            scroll.addView(body);
            root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

            addDialogCloseFooter(context, root, dialog);
            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable ignored) {}
    }

    // -------------------------------------------------------------------------
    // 8. Support Developer Dialog
    // -------------------------------------------------------------------------
    public static void showSupportDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout root = createDialogSheet(context, "heart-handshake", "Support Developer");

            TextView body = new TextView(context);
            body.setText(
                    "We're dedicated to providing a high-quality, reliable, and continuously improving AMOLED Instagram experience through xboyrex.\n\n" +
                    "Your support helps us maintain updates, implement new features, fix bugs, and ensure long-term development.\n\n" +
                    "If you've found value in Rex IG Lite, please consider starring our repository on GitHub or joining our community channels.\n\n" +
                    "Thank you for being part of our journey."
            );
            body.setTextColor(TEXT_SECONDARY);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            body.setLineSpacing(RexVectorIcons.dp(context, 2), 1.05f);
            body.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 6), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 16));
            root.addView(body);

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.END);
            footer.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            int p = RexVectorIcons.dp(context, 12);
            TextView close = new TextView(context);
            close.setText("Close");
            close.setTextColor(TEXT_SECONDARY);
            close.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            close.setTypeface(Typeface.DEFAULT_BOLD);
            close.setPadding(p, p, p, p);
            close.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
            });
            footer.addView(close);

            TextView star = new TextView(context);
            star.setText("Star on GitHub");
            star.setTextColor(ACTION_BLUE);
            star.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            star.setTypeface(Typeface.DEFAULT_BOLD);
            star.setPadding(p, p, p, p);
            star.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
                RexUtils.openUrl("https://github.com/xboyrex/rex-ig-lite", false);
            });
            footer.addView(star);
            root.addView(footer);

            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable ignored) {}
    }

    // -------------------------------------------------------------------------
    // 9. Developer Options Warning Dialog
    // -------------------------------------------------------------------------
    public static void showDevWarningDialog(final Context context, final Runnable onProceed) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout root = createDialogSheet(context, "code-2", "Developer Options Warning");

            TextView body = new TextView(context);
            body.setText(
                    "You are about to enter Developer Options. Changing internal MetaConfig flags without proper knowledge may cause unexpected behavior.\n\n" +
                    "• Proceed only if you know what you are modifying.\n" +
                    "• You can export or reset overrides at any time."
            );
            body.setTextColor(TEXT_SECONDARY);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            body.setLineSpacing(RexVectorIcons.dp(context, 2), 1.05f);
            body.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 6), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 16));
            root.addView(body);

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.END);

            int p = RexVectorIcons.dp(context, 12);
            TextView cancel = new TextView(context);
            cancel.setText("Cancel");
            cancel.setTextColor(TEXT_SECONDARY);
            cancel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            cancel.setTypeface(Typeface.DEFAULT_BOLD);
            cancel.setPadding(p, p, p, p);
            cancel.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
            });
            footer.addView(cancel);

            TextView proceed = new TextView(context);
            proceed.setText("Proceed");
            proceed.setTextColor(ACTION_BLUE);
            proceed.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            proceed.setTypeface(Typeface.DEFAULT_BOLD);
            proceed.setPadding(p, p, p, p);
            proceed.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
                if (onProceed != null) onProceed.run();
            });
            footer.addView(proceed);
            root.addView(footer);

            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            if (onProceed != null) onProceed.run();
        }
    }

    private static String safeCall(Callable<String> c, String fallback) {
        try {
            String r = c.call();
            return r != null ? r : fallback;
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    private static boolean safeBool(Callable<Boolean> c, boolean fallback) {
        try {
            Boolean r = c.call();
            return r != null ? r : fallback;
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    public static void showConfirmDialog(
            final Context context,
            final String titleText,
            final String messageText,
            final String confirmLabel,
            final boolean destructive,
            final Runnable onConfirm
    ) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout root = createDialogSheet(context, destructive ? "trash-2" : "info", titleText);

            TextView body = new TextView(context);
            body.setText(messageText);
            body.setTextColor(TEXT_SECONDARY);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            body.setLineSpacing(RexVectorIcons.dp(context, 2), 1.05f);
            body.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 6), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 18));
            root.addView(body);

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.END);

            int p = RexVectorIcons.dp(context, 12);
            TextView cancel = new TextView(context);
            cancel.setText("Cancel");
            cancel.setTextColor(TEXT_SECONDARY);
            cancel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            cancel.setTypeface(Typeface.DEFAULT_BOLD);
            cancel.setPadding(p, p, p, p);
            cancel.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
            });
            footer.addView(cancel);

            TextView confirm = new TextView(context);
            confirm.setText(confirmLabel);
            confirm.setTextColor(destructive ? DESTRUCTIVE_RED : ACTION_BLUE);
            confirm.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            confirm.setTypeface(Typeface.DEFAULT_BOLD);
            confirm.setPadding(p, p, p, p);
            confirm.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
                if (onConfirm != null) onConfirm.run();
            });
            footer.addView(confirm);
            root.addView(footer);

            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            if (onConfirm != null) onConfirm.run();
        }
    }

    public static void showBackupRestoreDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout root = createDialogSheet(context, "database", "Backup, Restore & Reset");

            Activity act = resolveActivity(context);
            LinearLayout card = createGroupedMenuCard(context);
            addGroupedMenuRow(context, card, "file-upload", "Export Settings Backup (.json)", true, () -> {
                dialog.dismiss();
                if (act != null) ActivityHook.launchFragment(act, "rex_export_pref");
            });
            addGroupedMenuRow(context, card, "file-download", "Import Settings Backup (.json)", true, () -> {
                dialog.dismiss();
                if (act != null) ActivityHook.launchFragment(act, "rex_import_pref");
            });
            addGroupedMenuRow(context, card, "trash-2", "Reset All Settings to Default", false, () -> {
                dialog.dismiss();
                app.morphe.extension.instagram.utils.InstaUtils.showResetSettingsDialog(context);
            });
            root.addView(card);
            addDialogCloseFooter(context, root, dialog);

            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            Utils.showToastShort(userSafeErrorMessage(e, "Backup dialog unavailable. Try again."));
        }
    }
}
