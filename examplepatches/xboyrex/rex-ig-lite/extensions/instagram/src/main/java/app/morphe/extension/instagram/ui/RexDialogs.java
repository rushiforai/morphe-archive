/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 */
package app.morphe.extension.instagram.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.AlphaAnimation;
import android.view.animation.AnimationSet;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.ScaleAnimation;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import org.json.JSONArray;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.constants.UI;
import app.morphe.extension.instagram.db.RexMessageDb;
import app.morphe.extension.instagram.patches.dm.SavedMessagesHook;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.instagram.settings.preference.widgets.InstagramPreferenceStyle;
import app.morphe.extension.instagram.theme.MaterialYouTheme;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Custom modal dialogs, floating quick menu, changelogs, developer warning, support developer,
 * hardware-accelerated Gaussian background blur, and local saved items.
 */
public final class RexDialogs {

    public static final String KEY_SAVED_BIOS = "rex_saved_bios_json";
    public static final String KEY_SAVED_CAPTIONS = "rex_saved_captions_json";
    public static final String KEY_SAVED_PROFILES = "rex_saved_profiles_json";
    public static final String KEY_WATCH_HISTORY = "rex_watch_history_json";

    private RexDialogs() {}

    public static int dp(Context context, float value) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics());
    }

    public static Activity resolveActivity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return Utils.getActivity();
    }

    /**
     * Applies real hardware-accelerated Gaussian Blur to the underlying Activity window
     * while the dialog is visible (Android 12+ RenderEffect + Window blur behind fallback),
     * matching Screenshots 062921, 062929, 062943, 062952, 063144, 063301, and 063322.
     */
    public static void attachBlurBehind(Dialog dialog, Context context) {
        if (dialog == null) return;
        final Activity activity = resolveActivity(context);
        final View decorView = (activity != null && activity.getWindow() != null)
                ? activity.getWindow().getDecorView()
                : null;

        Window window = dialog.getWindow();
        if (window != null) {
            WindowManager.LayoutParams lp = window.getAttributes();
            lp.dimAmount = 0.52f;
            window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                try {
                    window.addFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
                    lp.setBlurBehindRadius(42);
                } catch (Throwable ignored) {}
            }
            window.setAttributes(lp);
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && decorView != null) {
            try {
                decorView.setRenderEffect(
                        RenderEffect.createBlurEffect(26f, 26f, Shader.TileMode.CLAMP)
                );
            } catch (Throwable ignored) {}
            dialog.setOnDismissListener(d -> {
                try {
                    decorView.setRenderEffect(null);
                } catch (Throwable ignored) {}
            });
        }
    }

    public static void applySmoothEntrance(View view) {
        if (view == null) return;
        AnimationSet set = new AnimationSet(true);
        set.setInterpolator(new DecelerateInterpolator());
        ScaleAnimation scale = new ScaleAnimation(
                0.94f, 1.0f, 0.94f, 1.0f,
                ScaleAnimation.RELATIVE_TO_SELF, 0.5f,
                ScaleAnimation.RELATIVE_TO_SELF, 0.5f);
        AlphaAnimation alpha = new AlphaAnimation(0.0f, 1.0f);
        set.addAnimation(scale);
        set.addAnimation(alpha);
        set.setDuration(200L);
        view.startAnimation(set);
    }

    public static GradientDrawable roundedCardBackground(Context context, int fillColor, int strokeColor, float radiusDp) {
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(fillColor);
        bg.setCornerRadius(dp(context, radiusDp));
        if (strokeColor != 0) {
            bg.setStroke(dp(context, 1f), strokeColor);
        }
        return bg;
    }

    private static Dialog createDarkCardDialog(Context context, View cardContent, int gravity, int widthDp) {
        Activity activity = resolveActivity(context);
        Context hostCtx = activity != null ? activity : context;
        Dialog dialog = new Dialog(hostCtx);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(cardContent);
        dialog.setCancelable(true);
        dialog.setCanceledOnTouchOutside(true);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            WindowManager.LayoutParams lp = window.getAttributes();
            lp.gravity = gravity;
            if (widthDp > 0) {
                lp.width = dp(hostCtx, widthDp);
            } else {
                lp.width = (int) (hostCtx.getResources().getDisplayMetrics().widthPixels * 0.90f);
            }
            lp.height = WindowManager.LayoutParams.WRAP_CONTENT;
            window.setAttributes(lp);
        }
        attachBlurBehind(dialog, hostCtx);
        applySmoothEntrance(cardContent);
        return dialog;
    }

    // -----------------------------------------------------------------------
    // 1. Changelogs / Welcome Dialog (Matches Screenshot_20261101-062921_Instagram.png)
    // -----------------------------------------------------------------------
    public static void showChangelogsDialog(Context context) {
        try {
            Activity activity = resolveActivity(context);
            Context ctx = activity != null ? activity : context;

            LinearLayout card = new LinearLayout(ctx);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setBackground(roundedCardBackground(ctx, 0xFF0A0A0A, 0xFF1F272B, 26f));
            int padH = dp(ctx, 24);
            int padV = dp(ctx, 24);
            card.setPadding(padH, padV, padH, dp(ctx, 18));

            TextView title = new TextView(ctx);
            title.setText("Changelogs");
            title.setTextColor(Color.WHITE);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 23);
            title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            card.addView(title);

            TextView meta = new TextView(ctx);
            String appVer = Utils.getAppVersionName();
            if (appVer == null || appVer.isEmpty()) appVer = "453.0.0.57.79";
            meta.setText("Release Date: 01/11/2026\nBase: " + appVer + "\nVersion: 3.12.0 (xboyrex Edition)");
            meta.setTextColor(0xFFF2F2F2);
            meta.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            meta.setLineSpacing(dp(ctx, 3), 1.0f);
            meta.setPadding(0, dp(ctx, 14), 0, dp(ctx, 16));
            card.addView(meta);

            ScrollView scroll = new ScrollView(ctx);
            scroll.setVerticalScrollBarEnabled(false);
            TextView body = new TextView(ctx);
            body.setText(
                    "Added: Auto Mark as Seen for specific users in DMs — No need to manually mark DMs as seen.\n" +
                    "Added: Ability to view Last Seen status with the exact date and time in DMs.\n" +
                    "Added: Anti-Delete Messages. (Realtime)\n" +
                    "Added: Mark as Seen on Reaction.\n" +
                    "Added: Quick Settings Shortcut — Added a home screen shortcut to access xboyrex Settings quickly.\n" +
                    "Added: Reel Download & Options icons directly in the reels section for quicker and easier access.\n" +
                    "Added: Download and xboyrex Options icons directly in the feed for quicker and easier access.\n" +
                    "Added: Enable or disable the Download and xboyrex Options icons directly in the feed.\n" +
                    "Added: Saved Profiles, Saved Bios, Saved Captions & Watch History.\n" +
                    "Added: Liquid Glass Customizations & SakuraTunes-style About Screen.\n" +
                    "Added: Real-time Gaussian Blur behind all xboyrex popups and menus.\n" +
                    "Added: Filter Stories (Based on types).\n" +
                    "Fixed: Audio to Voice Note issue causing robotic or distorted voice output.\n" +
                    "Fixed: Liquid Glass crashes."
            );
            body.setTextColor(0xFFEEEEEE);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            body.setLineSpacing(dp(ctx, 3), 1.0f);
            scroll.addView(body);

            int maxScrollHeight = (int) (ctx.getResources().getDisplayMetrics().heightPixels * 0.50f);
            LinearLayout.LayoutParams scrollLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, maxScrollHeight);
            card.addView(scroll, scrollLp);

            LinearLayout buttonRow = new LinearLayout(ctx);
            buttonRow.setOrientation(LinearLayout.HORIZONTAL);
            buttonRow.setGravity(Gravity.END);
            buttonRow.setPadding(0, dp(ctx, 16), 0, 0);

            TextView settingsBtn = new TextView(ctx);
            settingsBtn.setText("xboyrex Settings");
            settingsBtn.setTextColor(0xFF88C2CE);
            settingsBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            settingsBtn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            settingsBtn.setPadding(dp(ctx, 12), dp(ctx, 8), dp(ctx, 16), dp(ctx, 8));
            buttonRow.addView(settingsBtn);

            TextView closeBtn = new TextView(ctx);
            closeBtn.setText("Close");
            closeBtn.setTextColor(Color.WHITE);
            closeBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            closeBtn.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            closeBtn.setPadding(dp(ctx, 16), dp(ctx, 8), dp(ctx, 8), dp(ctx, 8));
            buttonRow.addView(closeBtn);
            card.addView(buttonRow);

            Dialog dialog = createDarkCardDialog(ctx, card, Gravity.CENTER, 0);
            settingsBtn.setOnClickListener(v -> {
                dialog.dismiss();
                FragmentHook.startSettings();
            });
            closeBtn.setOnClickListener(v -> dialog.dismiss());
            dialog.show();
        } catch (Exception e) {
            Logger.printException(() -> "showChangelogsDialog failure", e);
        }
    }

    // -----------------------------------------------------------------------
    // 2. Developer Options Warning Dialog (Matches Screenshot_20261101-063144_Instagram.png)
    // -----------------------------------------------------------------------
    public static void showDeveloperWarningDialog(Context context, Runnable onProceed) {
        try {
            Activity activity = resolveActivity(context);
            Context ctx = activity != null ? activity : context;

            LinearLayout card = new LinearLayout(ctx);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setBackground(roundedCardBackground(ctx, 0xFF0A0A0A, 0xFF1F272B, 26f));
            int pad = dp(ctx, 24);
            card.setPadding(pad, pad, pad, dp(ctx, 18));

            TextView title = new TextView(ctx);
            title.setText("⚠️ Warning!");
            title.setTextColor(Color.WHITE);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
            title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            card.addView(title);

            TextView msg = new TextView(ctx);
            msg.setText(
                    "You're about to enter Developer Options — This is only for advanced users. " +
                    "Changing settings here without proper knowledge may cause the app to misbehave or crash.\n\n" +
                    "🛠️ Proceed only if you're sure. The developer is not responsible for any issues caused.\n\n" +
                    "❌ Don't blame the developer if something goes wrong.\n\n" +
                    "✅ Use with caution and at your own risk."
            );
            msg.setTextColor(0xFFF0F0F0);
            msg.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            msg.setLineSpacing(dp(ctx, 3), 1.0f);
            msg.setPadding(0, dp(ctx, 16), 0, dp(ctx, 20));
            card.addView(msg);

            LinearLayout actions = new LinearLayout(ctx);
            actions.setOrientation(LinearLayout.HORIZONTAL);
            actions.setGravity(Gravity.END);

            TextView cancelBtn = new TextView(ctx);
            cancelBtn.setText("Cancel");
            cancelBtn.setTextColor(Color.WHITE);
            cancelBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            cancelBtn.setPadding(dp(ctx, 16), dp(ctx, 8), dp(ctx, 16), dp(ctx, 8));

            TextView proceedBtn = new TextView(ctx);
            proceedBtn.setText("Proceed");
            proceedBtn.setTextColor(0xFF88C2CE);
            proceedBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            proceedBtn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            proceedBtn.setPadding(dp(ctx, 16), dp(ctx, 8), dp(ctx, 8), dp(ctx, 8));

            actions.addView(cancelBtn);
            actions.addView(proceedBtn);
            card.addView(actions);

            Dialog dialog = createDarkCardDialog(ctx, card, Gravity.CENTER, 0);
            cancelBtn.setOnClickListener(v -> dialog.dismiss());
            proceedBtn.setOnClickListener(v -> {
                dialog.dismiss();
                if (onProceed != null) onProceed.run();
            });
            dialog.show();
        } catch (Exception e) {
            Logger.printException(() -> "showDeveloperWarningDialog failure", e);
            if (onProceed != null) onProceed.run();
        }
    }

    // -----------------------------------------------------------------------
    // 3. Support Developer Dialog (Matches Screenshot_20261101-063301_Instagram.png)
    // -----------------------------------------------------------------------
    public static void showSupportDeveloperDialog(Context context) {
        try {
            Activity activity = resolveActivity(context);
            Context ctx = activity != null ? activity : context;

            LinearLayout card = new LinearLayout(ctx);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setBackground(roundedCardBackground(ctx, 0xFF0A0A0A, 0xFF1F272B, 26f));
            int pad = dp(ctx, 24);
            card.setPadding(pad, pad, pad, dp(ctx, 18));

            TextView title = new TextView(ctx);
            title.setText("Support Developer");
            title.setTextColor(Color.WHITE);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
            title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            card.addView(title);

            TextView msg = new TextView(ctx);
            msg.setGravity(Gravity.CENTER_HORIZONTAL);
            msg.setText(
                    "We're dedicated to providing a high-quality 📱, reliable 🔧, and continuously improving 🚀 experience through this app.\n\n" +
                    "Your support helps us maintain servers 🖥️, implement new features ✨, fix bugs 🐞, and ensure long-term development 🛠️.\n\n" +
                    "If you've found value in this app, please consider making a donation 💖.\n\n" +
                    "Your contribution—big or small—goes directly toward keeping the app active 🔄 and improving for everyone 🌍.\n\n" +
                    "Thank you for being part of our journey 🙏."
            );
            msg.setTextColor(0xFFF0F0F0);
            msg.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            msg.setLineSpacing(dp(ctx, 3), 1.0f);
            msg.setPadding(0, dp(ctx, 18), 0, dp(ctx, 22));
            card.addView(msg);

            LinearLayout actions = new LinearLayout(ctx);
            actions.setOrientation(LinearLayout.HORIZONTAL);
            actions.setGravity(Gravity.END);

            TextView closeBtn = new TextView(ctx);
            closeBtn.setText("Close");
            closeBtn.setTextColor(Color.WHITE);
            closeBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            closeBtn.setPadding(dp(ctx, 16), dp(ctx, 8), dp(ctx, 16), dp(ctx, 8));

            TextView donateBtn = new TextView(ctx);
            donateBtn.setText("Donate Now");
            donateBtn.setTextColor(0xFF88C2CE);
            donateBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            donateBtn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            donateBtn.setPadding(dp(ctx, 16), dp(ctx, 8), dp(ctx, 8), dp(ctx, 8));

            actions.addView(closeBtn);
            actions.addView(donateBtn);
            card.addView(actions);

            Dialog dialog = createDarkCardDialog(ctx, card, Gravity.CENTER, 0);
            closeBtn.setOnClickListener(v -> dialog.dismiss());
            donateBtn.setOnClickListener(v -> {
                dialog.dismiss();
                RexUtils.openUrl(Constants.TELEGRAM_URL, false);
            });
            dialog.show();
        } catch (Exception e) {
            Logger.printException(() -> "showSupportDeveloperDialog failure", e);
        }
    }

    // -----------------------------------------------------------------------
    // 4. Floating Quick Action Menu (Matches Screenshot_20261101-062952_Instagram.png)
    // -----------------------------------------------------------------------
    public static void showQuickActionMenu(Context context) {
        try {
            Activity activity = resolveActivity(context);
            Context ctx = activity != null ? activity : context;

            LinearLayout card = new LinearLayout(ctx);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setBackground(roundedCardBackground(ctx, 0xFF0E1114, 0xFF232C31, 22f));
            card.setPadding(0, dp(ctx, 10), 0, dp(ctx, 10));

            final Dialog dialog = createDarkCardDialog(ctx, card, Gravity.START | Gravity.CENTER_VERTICAL, 255);

            boolean ghostEnabled = Pref.getTurnOnAllGhostModes();
            boolean darkEnabled = UI.isDarkMode() || MaterialYouTheme.isAmoledEnabled();
            boolean dndEnabled = SharedPref.getBooleanPref(Settings.DISABLE_FILTER_NOTIFICATIONS);
            int deletedCount = 0;
            try {
                deletedCount = RexMessageDb.getInstance(ctx).getDeletedCount();
            } catch (Throwable ignored) {}

            card.addView(createPopupMenuItem(ctx, RexVectorIcons.IC_HEXAGON_NUT, "xboyrex Settings", () -> {
                dialog.dismiss();
                FragmentHook.startSettings();
            }));

            card.addView(createPopupMenuItem(ctx, RexVectorIcons.IC_GHOST,
                    "Ghost Mode: (" + (ghostEnabled ? "Enabled" : "Disabled") + ")", () -> {
                        dialog.dismiss();
                        boolean next = !Pref.getTurnOnAllGhostModes();
                        Pref.setTurnOnAllGhostModes(next);
                        Utils.showToastShort("Ghost Mode: " + (next ? "Enabled" : "Disabled"));
                    }));

            card.addView(createPopupMenuItem(ctx, RexVectorIcons.IC_SCISSORS, "Long Video Splitter", () -> {
                dialog.dismiss();
                showSplitVideoDurationDialog(ctx);
            }));

            card.addView(createPopupMenuItem(ctx, RexVectorIcons.IC_SUN,
                    "Dark Mode: (" + (darkEnabled ? "Enabled" : "Disabled") + ")", () -> {
                        dialog.dismiss();
                        boolean next = !SharedPref.getBooleanPref(Settings.AMOLED_THEME);
                        SharedPref.setBooleanPref(Settings.AMOLED_THEME.key, next);
                        Utils.showToastShort("AMOLED Dark Mode: " + (next ? "Enabled" : "Disabled"));
                    }));

            card.addView(createPopupMenuItem(ctx, RexVectorIcons.IC_DEV_BRACES, "Developer Options", () -> {
                dialog.dismiss();
                showDeveloperWarningDialog(ctx, () -> FragmentHook.startFragment(Constants.REX_FRAGMENT_DEV_OPTIONS));
            }));

            card.addView(createPopupMenuItem(ctx, RexVectorIcons.IC_REFRESH, "Restart App", () -> {
                dialog.dismiss();
                Utils.restartApp(ctx);
            }));

            card.addView(createPopupMenuItem(ctx, RexVectorIcons.IC_BAN,
                    "DND Mode: (" + (dndEnabled ? "Enabled" : "Disabled") + ")", () -> {
                        dialog.dismiss();
                        boolean next = !SharedPref.getBooleanPref(Settings.DISABLE_FILTER_NOTIFICATIONS);
                        SharedPref.setBooleanPref(Settings.DISABLE_FILTER_NOTIFICATIONS.key, next);
                        Utils.showToastShort("DND Mode: " + (next ? "Enabled" : "Disabled"));
                    }));

            card.addView(createPopupMenuItem(ctx, RexVectorIcons.IC_WATCH_HISTORY, "Watch History", () -> {
                dialog.dismiss();
                showSavedItemsDialog(ctx, "Watch History", KEY_WATCH_HISTORY);
            }));

            card.addView(createPopupMenuItem(ctx, RexVectorIcons.IC_PEOPLE, "Saved Profiles", () -> {
                dialog.dismiss();
                showSavedItemsDialog(ctx, "Saved Profiles", KEY_SAVED_PROFILES);
            }));

            card.addView(createPopupMenuItem(ctx, RexVectorIcons.IC_CHAT_DELETE,
                    "Deleted Messages (" + deletedCount + ")", () -> {
                        dialog.dismiss();
                        SavedMessagesHook.openDeletedMessages(ctx);
                    }));

            dialog.show();
        } catch (Exception e) {
            Logger.printException(() -> "showQuickActionMenu failure", e);
            FragmentHook.startSettings();
        }
    }

    public static View createPopupMenuItem(Context ctx, String vectorIconName, String label, Runnable onClick) {
        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(ctx, 18), dp(ctx, 13), dp(ctx, 18), dp(ctx, 13));

        if (vectorIconName != null) {
            ImageView icon = new ImageView(ctx);
            icon.setImageDrawable(RexVectorIcons.create(ctx, vectorIconName, Color.WHITE, 23));
            LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(dp(ctx, 24), dp(ctx, 24));
            iconLp.rightMargin = dp(ctx, 16);
            row.addView(icon, iconLp);
        }

        TextView text = new TextView(ctx);
        text.setText(label);
        text.setTextColor(Color.WHITE);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        text.setSingleLine(true);
        row.addView(text, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        row.setOnClickListener(v -> {
            if (onClick != null) onClick.run();
        });
        return row;
    }

    // -----------------------------------------------------------------------
    // 5. Saved Items Store & Viewers
    // -----------------------------------------------------------------------
    public static void addSavedItem(String key, String value) {
        if (value == null || value.trim().isEmpty()) return;
        try {
            if (KEY_WATCH_HISTORY.equals(key) && SharedPref.getBooleanPref(Settings.DISABLE_WATCH_HISTORY)) {
                return;
            }
            String raw = SharedPref.getStringPref(key, "[]");
            JSONArray arr = new JSONArray(raw);
            JSONArray next = new JSONArray();
            next.put(value.trim());
            for (int i = 0; i < arr.length() && next.length() < 100; i++) {
                String item = arr.optString(i, "");
                if (!item.isEmpty() && !item.equals(value.trim())) {
                    next.put(item);
                }
            }
            SharedPref.setStringPref(key, next.toString());
        } catch (Exception ignored) {}
    }

    public static List<String> getSavedItems(String key) {
        List<String> list = new ArrayList<>();
        try {
            String raw = SharedPref.getStringPref(key, "[]");
            JSONArray arr = new JSONArray(raw);
            for (int i = 0; i < arr.length(); i++) {
                String item = arr.optString(i, "");
                if (!item.isEmpty()) list.add(item);
            }
        } catch (Exception ignored) {}
        return list;
    }

    public static void showSavedItemsDialog(Context context, String titleText, String prefKey) {
        try {
            Activity activity = resolveActivity(context);
            Context ctx = activity != null ? activity : context;
            List<String> items = getSavedItems(prefKey);
            if (items.isEmpty()) {
                Utils.showToastShort("No items saved in " + titleText + " yet");
                return;
            }
            CharSequence[] array = items.toArray(new CharSequence[0]);
            new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(ctx))
                    .setTitle(titleText)
                    .setItems(array, (d, which) -> {
                        String chosen = items.get(which);
                        if (KEY_SAVED_PROFILES.equals(prefKey) && chosen.startsWith("@")) {
                            String username = chosen.substring(1).split(" ")[0];
                            RexUtils.openUrl("https://www.instagram.com/" + username + "/", true);
                        } else {
                            Utils.setClipboard(chosen);
                            Utils.showToastShort("Copied to clipboard");
                        }
                    })
                    .setNeutralButton("Clear All", (d, w) -> {
                        SharedPref.setStringPref(prefKey, "[]");
                        Utils.showToastShort(titleText + " cleared");
                    })
                    .setNegativeButton("Close", null)
                    .show();
        } catch (Exception e) {
            Logger.printException(() -> "showSavedItemsDialog failure", e);
        }
    }

    public static void showTranslatorLanguageDialog(Context context) {
        showTranslatorLanguagePicker(context, null);
    }

    public static void showSplitVideoDurationDialog(Context context) {
        showSplitDurationPicker(context, null);
    }

    public static void showWhatsAppTypeDialog(Context context) {
        showWhatsAppTypePicker(context, null);
    }

    public interface SelectionCallback {
        void onSelected(String value);
    }

    public static void showDevOptionsWarningDialog(Context context, Runnable onProceed) {
        showDeveloperWarningDialog(context, onProceed);
    }

    public static void showSupportDialog(Context context) {
        showSupportDeveloperDialog(context);
    }

    public static List<String> getSavedItems(Context context, String key) {
        return getSavedItems(key);
    }

    public static void showSavedListDialog(Context context, String titleText, String prefKey) {
        showSavedItemsDialog(context, titleText, prefKey);
    }

    public static void showTranslatorLanguagePicker(Context context, SelectionCallback callback) {
        try {
            Activity activity = resolveActivity(context);
            Context ctx = activity != null ? activity : context;
            final String[] langs = {
                "English", "Hindi", "Spanish", "French", "German", "Japanese",
                "Korean", "Portuguese", "Russian", "Turkish", "Arabic", "Indonesian"
            };
            new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(ctx))
                    .setTitle("Change Translator Language")
                    .setItems(langs, (d, which) -> {
                        SharedPref.setStringPref(Settings.TRANSLATOR_LANGUAGE.key, langs[which]);
                        Utils.showToastShort("Selected: " + langs[which]);
                        if (callback != null) callback.onSelected(langs[which]);
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
        } catch (Exception e) {
            Logger.printException(() -> "showTranslatorLanguagePicker failure", e);
        }
    }

    public static void showSplitDurationPicker(Context context, SelectionCallback callback) {
        try {
            Activity activity = resolveActivity(context);
            Context ctx = activity != null ? activity : context;
            final String[] durations = {"15 Seconds", "30 Seconds", "60 Seconds", "90 Seconds"};
            new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(ctx))
                    .setTitle("Change Split Video Duration")
                    .setItems(durations, (d, which) -> {
                        SharedPref.setStringPref(Settings.SPLIT_VIDEO_DURATION.key, durations[which]);
                        Utils.showToastShort("Selected: " + durations[which]);
                        if (callback != null) callback.onSelected(durations[which]);
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
        } catch (Exception e) {
            Logger.printException(() -> "showSplitDurationPicker failure", e);
        }
    }

    public static void showWhatsAppTypePicker(Context context, SelectionCallback callback) {
        try {
            Activity activity = resolveActivity(context);
            Context ctx = activity != null ? activity : context;
            final String[] types = {"WhatsApp", "WhatsApp Business"};
            new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(ctx))
                    .setTitle("Choose WhatsApp Type")
                    .setItems(types, (d, which) -> {
                        String pkg = which == 0 ? "com.whatsapp" : "com.whatsapp.w4b";
                        SharedPref.setStringPref(Settings.WHATSAPP_TYPE.key, types[which]);
                        SharedPref.setStringPref(Settings.WHATSAPP_PACKAGE_TYPE.key, pkg);
                        Utils.showToastShort("Selected: " + types[which]);
                        if (callback != null) callback.onSelected(types[which]);
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
        } catch (Exception e) {
            Logger.printException(() -> "showWhatsAppTypePicker failure", e);
        }
    }
}
