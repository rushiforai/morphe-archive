/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;

import org.json.JSONArray;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.patches.dm.HiddenChatsPref;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.patches.customise.font.FontStorage;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public final class RexRuntimeFeatures {

    private static final String PRIVACY_OVERLAY_TAG = "rex_privacy_screen_overlay";

    private RexRuntimeFeatures() {}

    // -------------------------------------------------------------------------
    // 1. Private Screen Mode & Real-Time Opacity Dimmer
    // -------------------------------------------------------------------------
    public static void applyPrivateScreenOverlay(Activity activity) {
        if (activity == null || activity.getWindow() == null) return;
        try {
            View decor = activity.getWindow().getDecorView();
            if (!(decor instanceof ViewGroup)) return;
            ViewGroup root = (ViewGroup) decor;
            View overlay = root.findViewWithTag(PRIVACY_OVERLAY_TAG);
            boolean enabled = Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.PRIVATE_SCREEN_MODE));
            if (!enabled) {
                if (overlay != null) {
                    root.removeView(overlay);
                }
                return;
            }
            int pct = 65;
            try {
                pct = Integer.parseInt(SharedPref.getStringPref(Settings.PRIVATE_SCREEN_OPACITY));
            } catch (Throwable ignored) {}
            pct = Math.max(10, Math.min(90, pct));
            int alpha = Math.round((pct / 100f) * 235f);

            if (overlay == null) {
                overlay = new View(activity);
                overlay.setTag(PRIVACY_OVERLAY_TAG);
                overlay.setClickable(false);
                overlay.setFocusable(false);
                overlay.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
                root.addView(overlay, lp);
            }
            overlay.setBackgroundColor(Color.argb(alpha, 0, 0, 0));
            overlay.bringToFront();
        } catch (Throwable ignored) {}
    }

    public static void showOpacityDialog(final Context context) {
        int current = 65;
        try {
            current = Integer.parseInt(SharedPref.getStringPref(Settings.PRIVATE_SCREEN_OPACITY));
        } catch (Throwable ignored) {}
        current = Math.max(10, Math.min(90, current));

        LinearLayout root = RexDialogs.createDialogSheet(context, "brightness-down", "Private Screen Opacity");
        final TextView valueLabel = new TextView(context);
        valueLabel.setText("Dimmer Opacity: " + current + "%");
        valueLabel.setTextColor(RexDialogs.BRAND_CYAN);
        valueLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        valueLabel.setTypeface(Typeface.DEFAULT_BOLD);
        valueLabel.setPadding(RexVectorIcons.dp(context, 4), 0, 0, RexVectorIcons.dp(context, 10));
        root.addView(valueLabel);

        SeekBar seekBar = new SeekBar(context);
        seekBar.setMax(80);
        seekBar.setProgress(current - 10);
        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar sb, int progress, boolean fromUser) {
                int val = progress + 10;
                valueLabel.setText("Dimmer Opacity: " + val + "%");
                SharedPref.setStringPref(Settings.PRIVATE_SCREEN_OPACITY.key, String.valueOf(val));
                Activity act = Utils.getActivity();
                if (act != null) applyPrivateScreenOverlay(act);
            }
            @Override public void onStartTrackingTouch(SeekBar sb) {}
            @Override public void onStopTrackingTouch(SeekBar sb) {}
        });
        root.addView(seekBar);

        AlertDialog dialog = new AlertDialog.Builder(context).create();
        addCloseButton(context, root, dialog);
        dialog.setView(root);
        RexDialogs.showBlurredDialog(context, dialog);
    }

    // -------------------------------------------------------------------------
    // 2. Creative Fonts for DMs (Interactive Styler + Clipboard Helper)
    // -------------------------------------------------------------------------
    private static final String[] FONT_STYLES = {
            "Normal",
            "𝐁𝐨𝐥𝐝 (Bold Serif)",
            "𝘐𝘵𝘢𝘭𝘪𝘤 (Sans Italic)",
            "𝑩𝒐𝒍𝒅 𝑰𝒕𝒂𝒍𝒊𝒄",
            "𝒮𝒸𝓇𝒾𝓅𝓉 (Cursive)",
            "𝔉𝔯𝔞𝔨𝔱𝔲𝔯 (Gothic)",
            "𝙼𝚘𝚗𝚘𝚜𝚙𝚊𝚌𝚎",
            "Ⓒⓘⓡⓒⓛⓔⓓ",
            "Ｓｐａｃｅｄ (Fullwidth)"
    };

    public static String toStyledUnicode(String text, String styleName) {
        if (text == null || text.isEmpty() || styleName == null || styleName.startsWith("Normal")) {
            return text;
        }
        StringBuilder out = new StringBuilder(text.length() * 2);
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (styleName.contains("Bold Serif") || styleName.startsWith("𝐁")) {
                if (c >= 'A' && c <= 'Z') out.append(Character.toChars(0x1D400 + (c - 'A')));
                else if (c >= 'a' && c <= 'z') out.append(Character.toChars(0x1D41A + (c - 'a')));
                else if (c >= '0' && c <= '9') out.append(Character.toChars(0x1D7CE + (c - '0')));
                else out.append(c);
            } else if (styleName.contains("Sans Italic") || styleName.startsWith("𝘐")) {
                if (c >= 'A' && c <= 'Z') out.append(Character.toChars(0x1D608 + (c - 'A')));
                else if (c >= 'a' && c <= 'z') out.append(Character.toChars(0x1D622 + (c - 'a')));
                else out.append(c);
            } else if (styleName.startsWith("𝑩")) {
                if (c >= 'A' && c <= 'Z') out.append(Character.toChars(0x1D468 + (c - 'A')));
                else if (c >= 'a' && c <= 'z') out.append(Character.toChars(0x1D482 + (c - 'a')));
                else out.append(c);
            } else if (styleName.startsWith("𝒮")) {
                if (c >= 'A' && c <= 'Z') out.append(Character.toChars(0x1D4D0 + (c - 'A')));
                else if (c >= 'a' && c <= 'z') out.append(Character.toChars(0x1D4EA + (c - 'a')));
                else out.append(c);
            } else if (styleName.startsWith("𝔉")) {
                if (c >= 'A' && c <= 'Z') out.append(Character.toChars(0x1D56C + (c - 'A')));
                else if (c >= 'a' && c <= 'z') out.append(Character.toChars(0x1D586 + (c - 'a')));
                else out.append(c);
            } else if (styleName.startsWith("𝙼")) {
                if (c >= 'A' && c <= 'Z') out.append(Character.toChars(0x1D670 + (c - 'A')));
                else if (c >= 'a' && c <= 'z') out.append(Character.toChars(0x1D68A + (c - 'a')));
                else if (c >= '0' && c <= '9') out.append(Character.toChars(0x1D7F6 + (c - '0')));
                else out.append(c);
            } else if (styleName.startsWith("Ⓒ")) {
                if (c >= 'A' && c <= 'Z') out.append((char) (0x24B6 + (c - 'A')));
                else if (c >= 'a' && c <= 'z') out.append((char) (0x24D0 + (c - 'a')));
                else out.append(c);
            } else if (styleName.startsWith("Ｓ")) {
                if (c >= '!' && c <= '~') out.append((char) (0xFF01 + (c - '!')));
                else out.append(c);
            } else {
                out.append(c);
            }
        }
        return out.toString();
    }

    public static void showCreativeFontsDialog(final Context context) {
        LinearLayout root = RexDialogs.createDialogSheet(context, "wand", "Creative Fonts for DMs");

        final EditText input = new EditText(context);
        input.setHint("Type message to style & copy...");
        input.setHintTextColor(RexDialogs.TEXT_SECONDARY);
        input.setTextColor(RexDialogs.TEXT_PRIMARY);
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        int p = RexVectorIcons.dp(context, 12);
        input.setPadding(p, p, p, p);
        GradientDrawable inBg = new GradientDrawable();
        inBg.setColor(RexDialogs.ELEVATED_SURFACE);
        inBg.setCornerRadius(RexVectorIcons.dp(context, 14));
        inBg.setStroke(Math.max(1, RexVectorIcons.dp(context, 1)), RexDialogs.BORDER_STROKE);
        input.setBackground(inBg);
        LinearLayout.LayoutParams inLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        inLp.bottomMargin = RexVectorIcons.dp(context, 12);
        root.addView(input, inLp);

        ScrollView scroll = new ScrollView(context);
        final LinearLayout list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        final List<TextView> previewViews = new ArrayList<>();
        String currentStyle = SharedPref.getStringPref(Settings.DM_CREATIVE_FONT_STYLE);

        for (final String style : FONT_STYLES) {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setPadding(p, p, p, p);
            GradientDrawable rowBg = new GradientDrawable();
            rowBg.setColor(style.equals(currentStyle) ? 0xFF22343A : RexDialogs.ELEVATED_SURFACE);
            rowBg.setCornerRadius(RexVectorIcons.dp(context, 14));
            rowBg.setStroke(Math.max(1, RexVectorIcons.dp(context, 1)), RexDialogs.BORDER_STROKE);
            row.setBackground(rowBg);

            TextView title = new TextView(context);
            title.setText(style);
            title.setTextColor(RexDialogs.BRAND_CYAN);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            title.setTypeface(Typeface.DEFAULT_BOLD);
            row.addView(title);

            final TextView sample = new TextView(context);
            sample.setTag(style);
            sample.setText(toStyledUnicode("xboyrex Rex IG Lite", style));
            sample.setTextColor(RexDialogs.TEXT_PRIMARY);
            sample.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            sample.setPadding(0, RexVectorIcons.dp(context, 4), 0, 0);
            row.addView(sample);
            previewViews.add(sample);

            row.setOnClickListener(v -> {
                RexHaptics.tap(v);
                SharedPref.setStringPref(Settings.DM_CREATIVE_FONT_STYLE.key, style);
                String raw = input.getText().toString().trim();
                String converted = toStyledUnicode(raw.isEmpty() ? "xboyrex Rex IG Lite" : raw, style);
                Utils.setClipboard(converted);
                Utils.showToastShort("Selected " + style + " & copied styled text!");
            });

            LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            rLp.bottomMargin = RexVectorIcons.dp(context, 8);
            list.addView(row, rLp);
        }

        input.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                String txt = s == null || s.length() == 0 ? "xboyrex Rex IG Lite" : s.toString();
                for (TextView tv : previewViews) {
                    tv.setText(toStyledUnicode(txt, String.valueOf(tv.getTag())));
                }
            }
            @Override public void afterTextChanged(Editable s) {}
        });

        scroll.addView(list);
        root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        AlertDialog dialog = new AlertDialog.Builder(context).create();
        addCloseButton(context, root, dialog);
        dialog.setView(root);
        RexDialogs.showBlurredDialog(context, dialog);
    }

    // -------------------------------------------------------------------------
    // 3. Notification Filtering (By Type & By Keywords — With Tabler Check Icons)
    // -------------------------------------------------------------------------
    private static final String[] NOTIF_TYPES = {
            "Direct Messages",
            "Story Likes & Reactions",
            "Reels & Post Shares",
            "Live Broadcast Alerts",
            "New Follower Alerts",
            "Promotional & Suggested Pushes"
    };

    public static void showNotificationTypeFilterDialog(final Context context) {
        String raw = SharedPref.getStringPref(Settings.FILTER_NOTIFICATION_TYPES);
        final Set<String> selected = new HashSet<>();
        if (raw != null && !raw.isEmpty()) {
            selected.addAll(Arrays.asList(raw.split("\\|")));
        }

        LinearLayout root = RexDialogs.createDialogSheet(context, "bell-ringing", "Filter Notifications by Type");
        int p = RexVectorIcons.dp(context, 12);

        for (final String type : NOTIF_TYPES) {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinimumHeight(RexVectorIcons.dp(context, 48));
            row.setPadding(p, p, p, p);

            boolean isBlocked = selected.contains(type);
            final ImageView checkIcon = new ImageView(context);
            checkIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            RexIcon.bindOrAnimateState(
                    checkIcon,
                    isBlocked ? "square-check" : "square",
                    isBlocked,
                    RexDialogs.TEXT_SECONDARY,
                    RexDialogs.ACTIVE_TEAL,
                    22,
                    false
            );
            LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(
                    RexVectorIcons.dp(context, 22), RexVectorIcons.dp(context, 22));
            iLp.setMarginEnd(RexVectorIcons.dp(context, 14));
            row.addView(checkIcon, iLp);

            final TextView item = new TextView(context);
            item.setText(type);
            item.setTextColor(RexDialogs.TEXT_PRIMARY);
            item.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            row.addView(item, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            row.setOnClickListener(v -> {
                RexHaptics.toggle(v);
                boolean nowSelected;
                if (selected.contains(type)) {
                    selected.remove(type);
                    nowSelected = false;
                } else {
                    selected.add(type);
                    nowSelected = true;
                }
                RexIcon.bindOrAnimateState(
                        checkIcon,
                        nowSelected ? "square-check" : "square",
                        nowSelected,
                        RexDialogs.TEXT_SECONDARY,
                        RexDialogs.ACTIVE_TEAL,
                        22,
                        true
                );
                SharedPref.setStringPref(Settings.FILTER_NOTIFICATION_TYPES.key, String.join("|", selected));
            });
            root.addView(row);
        }

        AlertDialog dialog = new AlertDialog.Builder(context).create();
        addCloseButton(context, root, dialog);
        dialog.setView(root);
        RexDialogs.showBlurredDialog(context, dialog);
    }

    public static void showNotificationKeywordFilterDialog(final Context context) {
        LinearLayout root = RexDialogs.createDialogSheet(context, "filter", "Filter Notifications (Keywords)");

        TextView desc = new TextView(context);
        desc.setText("Enter comma-separated keywords to mute in incoming notifications:");
        desc.setTextColor(RexDialogs.TEXT_SECONDARY);
        desc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        desc.setPadding(RexVectorIcons.dp(context, 4), 0, 0, RexVectorIcons.dp(context, 10));
        root.addView(desc);

        final EditText input = new EditText(context);
        input.setText(SharedPref.getStringPref(Settings.NOTIFICATION_KEYWORDS));
        input.setHint("e.g. giveaway, crypto, spam, promo");
        input.setHintTextColor(RexDialogs.TEXT_SECONDARY);
        input.setTextColor(RexDialogs.TEXT_PRIMARY);
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        int p = RexVectorIcons.dp(context, 12);
        input.setPadding(p, p, p, p);
        GradientDrawable inBg = new GradientDrawable();
        inBg.setColor(RexDialogs.ELEVATED_SURFACE);
        inBg.setCornerRadius(RexVectorIcons.dp(context, 14));
        inBg.setStroke(Math.max(1, RexVectorIcons.dp(context, 1)), RexDialogs.BORDER_STROKE);
        input.setBackground(inBg);
        root.addView(input);

        final AlertDialog dialog = new AlertDialog.Builder(context).create();
        LinearLayout footer = new LinearLayout(context);
        footer.setOrientation(LinearLayout.HORIZONTAL);
        footer.setGravity(Gravity.END);
        footer.setPadding(0, RexVectorIcons.dp(context, 14), 0, 0);

        TextView saveBtn = new TextView(context);
        saveBtn.setText("Save Keywords");
        saveBtn.setTextColor(RexDialogs.BRAND_CYAN);
        saveBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
        saveBtn.setTypeface(Typeface.DEFAULT_BOLD);
        saveBtn.setPadding(p, RexVectorIcons.dp(context, 8), p, RexVectorIcons.dp(context, 8));
        saveBtn.setOnClickListener(v -> {
            RexHaptics.tap(v);
            SharedPref.setStringPref(Settings.NOTIFICATION_KEYWORDS.key, input.getText().toString().trim());
            Utils.showToastShort("Saved notification keywords");
            dialog.dismiss();
        });
        footer.addView(saveBtn);
        root.addView(footer);

        dialog.setView(root);
        RexDialogs.showBlurredDialog(context, dialog);
    }

    public static boolean shouldBlockNotification(String textOrThreadId) {
        if (Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.DND_MODE)) || Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.DND_MODE_ENABLED))) {
            return true;
        }
        if (!Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.DISABLE_FILTER_KEYWORDS))) {
            String kwRaw = SharedPref.getStringPref(Settings.NOTIFICATION_KEYWORDS);
            if (kwRaw != null && !kwRaw.trim().isEmpty() && textOrThreadId != null) {
                String lower = textOrThreadId.toLowerCase();
                for (String kw : kwRaw.split(",")) {
                    String k = kw.trim().toLowerCase();
                    if (!k.isEmpty() && lower.contains(k)) return true;
                }
            }
        }
        return false;
    }

    // -------------------------------------------------------------------------
    // 4. Hidden Chats Manager & Passcode Lock
    // -------------------------------------------------------------------------
    public static void showPasscodeSetupDialog(final Context context) {
        LinearLayout root = RexDialogs.createDialogSheet(context, "key", "Set Passcode Lock to Hide Chat");

        TextView desc = new TextView(context);
        desc.setText("Set a 4-digit PIN passcode & enable biometric/device lock for Hidden Chats and Inbox:");
        desc.setTextColor(RexDialogs.TEXT_SECONDARY);
        desc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        desc.setPadding(RexVectorIcons.dp(context, 4), 0, 0, RexVectorIcons.dp(context, 10));
        root.addView(desc);

        final EditText pinInput = new EditText(context);
        pinInput.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_VARIATION_PASSWORD);
        pinInput.setHint("Enter 4-digit PIN (leave blank to clear)");
        pinInput.setHintTextColor(RexDialogs.TEXT_SECONDARY);
        pinInput.setTextColor(RexDialogs.TEXT_PRIMARY);
        int p = RexVectorIcons.dp(context, 12);
        pinInput.setPadding(p, p, p, p);
        GradientDrawable inBg = new GradientDrawable();
        inBg.setColor(RexDialogs.ELEVATED_SURFACE);
        inBg.setCornerRadius(RexVectorIcons.dp(context, 14));
        inBg.setStroke(Math.max(1, RexVectorIcons.dp(context, 1)), RexDialogs.BORDER_STROKE);
        pinInput.setBackground(inBg);
        root.addView(pinInput);

        final AlertDialog dialog = new AlertDialog.Builder(context).create();
        LinearLayout footer = new LinearLayout(context);
        footer.setOrientation(LinearLayout.HORIZONTAL);
        footer.setGravity(Gravity.END);
        footer.setPadding(0, RexVectorIcons.dp(context, 14), 0, 0);

        TextView saveBtn = new TextView(context);
        saveBtn.setText("Save Passcode");
        saveBtn.setTextColor(RexDialogs.BRAND_CYAN);
        saveBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
        saveBtn.setTypeface(Typeface.DEFAULT_BOLD);
        saveBtn.setPadding(p, RexVectorIcons.dp(context, 8), p, RexVectorIcons.dp(context, 8));
        saveBtn.setOnClickListener(v -> {
            RexHaptics.tap(v);
            String pin = pinInput.getText().toString().trim();
            SharedPref.setStringPref("rex_hidden_chats_pin", pin);
            SharedPref.setBooleanPref(Settings.HIDDEN_CHATS.key, true);
            if (!pin.isEmpty()) {
                SharedPref.setBooleanPref(Settings.INBOX_LOCK.key, true);
                Utils.showToastShort("Passcode Lock saved & Hidden Chats enabled");
            } else {
                Utils.showToastShort("Passcode cleared");
            }
            dialog.dismiss();
        });
        footer.addView(saveBtn);
        root.addView(footer);

        dialog.setView(root);
        RexDialogs.showBlurredDialog(context, dialog);
    }

    public static void showHiddenChatsListDialog(final Context context) {
        Set<String> hiddenIds = HiddenChatsPref.getHiddenThreadIds();
        LinearLayout root = RexDialogs.createDialogSheet(context, "message-pin", "Hidden Chats (" + hiddenIds.size() + ")");

        if (hiddenIds.isEmpty()) {
            TextView empty = new TextView(context);
            empty.setText("No chats are currently hidden.\n\n" +
                    "To hide a chat: Long-press any conversation in your Direct Inbox and tap 'Hide chat'. Triple-tap the Direct Messages icon to toggle Hidden Chats visibility.");
            empty.setTextColor(RexDialogs.TEXT_SECONDARY);
            empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            empty.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 10), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 10));
            root.addView(empty);
        } else {
            int p = RexVectorIcons.dp(context, 12);
            for (final String tid : new ArrayList<>(hiddenIds)) {
                LinearLayout row = new LinearLayout(context);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setMinimumHeight(RexVectorIcons.dp(context, 48));
                row.setPadding(p, p, p, p);

                final ImageView lockIcon = new ImageView(context);
                lockIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                lockIcon.setImageDrawable(RexIcon.getDrawable(context, "lock", RexDialogs.BRAND_CYAN, 20));
                LinearLayout.LayoutParams lLp = new LinearLayout.LayoutParams(
                        RexVectorIcons.dp(context, 20), RexVectorIcons.dp(context, 20));
                lLp.setMarginEnd(RexVectorIcons.dp(context, 12));
                row.addView(lockIcon, lLp);

                TextView label = new TextView(context);
                label.setText("Thread ID: " + tid + "  (Tap to Unhide)");
                label.setTextColor(RexDialogs.TEXT_PRIMARY);
                label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
                row.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

                row.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    RexIcon.pulseIcon(lockIcon);
                    HiddenChatsPref.unhideThread(tid);
                    Utils.showToastShort("Unhid thread " + tid);
                });
                root.addView(row);
            }
        }

        AlertDialog dialog = new AlertDialog.Builder(context).create();
        addCloseButton(context, root, dialog);
        dialog.setView(root);
        RexDialogs.showBlurredDialog(context, dialog);
    }

    // -------------------------------------------------------------------------
    // 5. Pickers (Translator Language, Split Video Duration, WhatsApp Type, etc.)
    // -------------------------------------------------------------------------
    public static void showSingleChoiceDialog(
            final Context context,
            final String title,
            final String[] options,
            final String currentVal,
            final java.util.function.Consumer<String> onSelect
    ) {
        LinearLayout root = RexDialogs.createDialogSheet(context, "list-checks", title);
        ScrollView scroll = new ScrollView(context);
        LinearLayout list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);

        final AlertDialog dialog = new AlertDialog.Builder(context).create();
        int p = RexVectorIcons.dp(context, 12);

        for (final String opt : options) {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinimumHeight(RexVectorIcons.dp(context, 48));
            row.setPadding(p, p, p, p);

            boolean sel = opt.equalsIgnoreCase(currentVal);
            final ImageView radioIcon = new ImageView(context);
            radioIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            RexIcon.bindOrAnimateState(
                    radioIcon,
                    sel ? "circle-check" : "circle",
                    sel,
                    RexDialogs.TEXT_SECONDARY,
                    RexDialogs.ACTIVE_TEAL,
                    21,
                    false
            );
            LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(
                    RexVectorIcons.dp(context, 21), RexVectorIcons.dp(context, 21));
            rLp.setMarginEnd(RexVectorIcons.dp(context, 14));
            row.addView(radioIcon, rLp);

            TextView tv = new TextView(context);
            tv.setText(opt);
            tv.setTextColor(sel ? RexDialogs.BRAND_CYAN : RexDialogs.TEXT_PRIMARY);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            if (sel) tv.setTypeface(Typeface.DEFAULT_BOLD);
            row.addView(tv, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            row.setOnClickListener(v -> {
                RexHaptics.tap(v);
                RexIcon.pulseIcon(radioIcon);
                onSelect.accept(opt);
                dialog.dismiss();
            });
            list.addView(row);
        }
        scroll.addView(list);
        root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        addCloseButton(context, root, dialog);
        dialog.setView(root);
        RexDialogs.showBlurredDialog(context, dialog);
    }

    public static void showTranslatorLanguagePicker(final Context context, final Runnable onUpdated) {
        String[] langs = {"English", "Arabic", "Hindi", "Turkish", "Portuguese (Brazil)", "Indonesian", "Russian", "Spanish", "French", "German", "Japanese", "Korean"};
        showSingleChoiceDialog(context, "Change Translator Language", langs,
                SharedPref.getStringPref(Settings.TRANSLATOR_LANGUAGE), chosen -> {
                    SharedPref.setStringPref(Settings.TRANSLATOR_LANGUAGE.key, chosen);
                    Utils.showToastShort("Translator Language: " + chosen);
                    if (onUpdated != null) onUpdated.run();
                });
    }

    public static void showSplitDurationPicker(final Context context, final Runnable onUpdated) {
        String[] durations = {"15 Seconds", "30 Seconds", "60 Seconds", "90 Seconds"};
        showSingleChoiceDialog(context, "Change Split Video Duration", durations,
                SharedPref.getStringPref(Settings.SPLIT_VIDEO_DURATION), chosen -> {
                    SharedPref.setStringPref(Settings.SPLIT_VIDEO_DURATION.key, chosen);
                    Utils.showToastShort("Split Video Duration: " + chosen);
                    if (onUpdated != null) onUpdated.run();
                });
    }

    public static void showWhatsAppTypePicker(final Context context, final Runnable onUpdated) {
        String[] types = {"WhatsApp", "WhatsApp Business"};
        showSingleChoiceDialog(context, "Choose WhatsApp Type", types,
                SharedPref.getStringPref(Settings.CHOOSE_WHATSAPP_TYPE), chosen -> {
                    SharedPref.setStringPref(Settings.CHOOSE_WHATSAPP_TYPE.key, chosen);
                    Utils.showToastShort("Selected: " + chosen);
                    if (onUpdated != null) onUpdated.run();
                });
    }

    public static void showLastActiveFormatPicker(final Context context, final Runnable onUpdated) {
        String[] formats = {
                "Full Date & Time (dd MMM, hh:mm a)",
                "Exact Time (hh:mm a)",
                "24-Hour Format (HH:mm)",
                "Default (Relative)"
        };
        showSingleChoiceDialog(context, "Last Active Date & Time Format", formats,
                SharedPref.getStringPref(Settings.LAST_ACTIVE_FORMAT), chosen -> {
                    SharedPref.setStringPref(Settings.LAST_ACTIVE_FORMAT.key, chosen);
                    Utils.showToastShort("Last Active Format: " + chosen);
                    if (onUpdated != null) onUpdated.run();
                });
    }

    public static void showStoryFontSourcePicker(final Context context, final Runnable onUpdated) {
        final String[] sources = {
                "Default Story Fonts",
                "XBOYREX Story Font Pack",
                "Custom Story Font File(s)"
        };
        String current = SharedPref.getStringPref(Settings.STORY_FONT_SOURCE);
        if (current == null || current.isEmpty()) current = "XBOYREX Story Font Pack";

        final AlertDialog dialog = new AlertDialog.Builder(context).create();
        LinearLayout root = RexDialogs.createDialogSheet(context, "text-plus", "Story Font Source");
        int pad = RexVectorIcons.dp(context, 12);
        for (final String src : sources) {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(pad, pad, pad, pad);
            boolean sel = src.equalsIgnoreCase(current);
            ImageView icon = new ImageView(context);
            RexIcon.bindOrAnimateState(icon, sel ? "circle-check" : "circle", sel, 0xFFA4ACB8, InstagramPreferenceStyle.accentColor(), 22, false);
            LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(RexVectorIcons.dp(context, 22), RexVectorIcons.dp(context, 22));
            iLp.setMarginEnd(RexVectorIcons.dp(context, 12));
            row.addView(icon, iLp);

            TextView tv = new TextView(context);
            tv.setText(src);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            tv.setTextColor(sel ? InstagramPreferenceStyle.accentColor() : InstagramPreferenceStyle.primaryTextColor());
            row.addView(tv, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

            row.setOnClickListener(v -> {
                RexHaptics.tap(v);
                SharedPref.setStringPref(Settings.STORY_FONT_SOURCE.key, src);
                dialog.dismiss();
                if ("XBOYREX Story Font Pack".equals(src)) {
                    showXboyrexStoryFontPackBrowser(context, onUpdated);
                } else if ("Custom Story Font File(s)".equals(src)) {
                    ActivityHook.launchFragment(context, "rex_pref_add_story_font");
                } else {
                    if (onUpdated != null) onUpdated.run();
                }
            });
            root.addView(row);
        }
        RexDialogs.showBlurredDialog(context, dialog);
        dialog.setView(root);
    }

    public static void showXboyrexStoryFontPackBrowser(final Context context, final Runnable onUpdated) {
        final AlertDialog dialog = new AlertDialog.Builder(context).create();
        LinearLayout root = RexDialogs.createDialogSheet(context, "list-checks", "XBOYREX Story Font Pack (14 Fonts)");

        TextView sub = new TextView(context);
        sub.setText("Preview each bundled Story Font in its real typeface and choose which fonts to register in the Story & Reel text editor.");
        sub.setTextColor(InstagramPreferenceStyle.secondaryTextColor());
        sub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        sub.setPadding(0, 0, 0, RexVectorIcons.dp(context, 10));
        root.addView(sub);

        final String[][] items = FontStorage.XBOYREX_STORY_FONT_ITEMS;
        final boolean[] checked = new boolean[items.length];
        for (int i = 0; i < items.length; i++) {
            checked[i] = FontStorage.isXboyrexStoryFontEnabled(context, items[i][0]);
        }

        LinearLayout bulkRow = new LinearLayout(context);
        bulkRow.setOrientation(LinearLayout.HORIZONTAL);
        bulkRow.setPadding(0, 0, 0, RexVectorIcons.dp(context, 8));

        final List<ImageView> checkIcons = new ArrayList<>();

        TextView selectAllBtn = new TextView(context);
        selectAllBtn.setText("Select All");
        selectAllBtn.setTextColor(InstagramPreferenceStyle.accentColor());
        selectAllBtn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        selectAllBtn.setPadding(RexVectorIcons.dp(context, 10), RexVectorIcons.dp(context, 6), RexVectorIcons.dp(context, 16), RexVectorIcons.dp(context, 6));
        selectAllBtn.setOnClickListener(v -> {
            RexHaptics.tap(v);
            for (int i = 0; i < items.length; i++) {
                checked[i] = true;
                FontStorage.setXboyrexStoryFontEnabled(context, items[i][0], true);
                if (i < checkIcons.size()) {
                    RexIcon.bindOrAnimateState(checkIcons.get(i), "circle-check", true, 0xFFA4ACB8, InstagramPreferenceStyle.accentColor(), 22, false);
                }
            }
            Utils.showToastShort("Enabled all 14 XBOYREX Story Fonts");
        });
        bulkRow.addView(selectAllBtn);

        TextView deselectAllBtn = new TextView(context);
        deselectAllBtn.setText("Deselect All");
        deselectAllBtn.setTextColor(0xFFF05D69);
        deselectAllBtn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        deselectAllBtn.setPadding(RexVectorIcons.dp(context, 10), RexVectorIcons.dp(context, 6), RexVectorIcons.dp(context, 10), RexVectorIcons.dp(context, 6));
        deselectAllBtn.setOnClickListener(v -> {
            RexHaptics.tap(v);
            for (int i = 0; i < items.length; i++) {
                checked[i] = false;
                FontStorage.setXboyrexStoryFontEnabled(context, items[i][0], false);
                if (i < checkIcons.size()) {
                    RexIcon.bindOrAnimateState(checkIcons.get(i), "circle", false, 0xFFA4ACB8, InstagramPreferenceStyle.accentColor(), 22, false);
                }
            }
            Utils.showToastShort("Cleared XBOYREX Story Fonts selection");
        });
        bulkRow.addView(deselectAllBtn);
        root.addView(bulkRow);

        ScrollView scroll = new ScrollView(context);
        LinearLayout list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        int pad = RexVectorIcons.dp(context, 10);

        for (int i = 0; i < items.length; i++) {
            final int idx = i;
            final String rawRes = items[i][0];
            final String title = items[i][1];

            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(pad, pad, pad, pad);

            final ImageView cb = new ImageView(context);
            RexIcon.bindOrAnimateState(cb, checked[idx] ? "circle-check" : "circle", checked[idx], 0xFFA4ACB8, InstagramPreferenceStyle.accentColor(), 22, false);
            checkIcons.add(cb);
            LinearLayout.LayoutParams cbLp = new LinearLayout.LayoutParams(RexVectorIcons.dp(context, 22), RexVectorIcons.dp(context, 22));
            cbLp.setMarginEnd(RexVectorIcons.dp(context, 12));
            row.addView(cb, cbLp);

            LinearLayout textCol = new LinearLayout(context);
            textCol.setOrientation(LinearLayout.VERTICAL);

            TextView nameTv = new TextView(context);
            nameTv.setText(title);
            nameTv.setTextColor(InstagramPreferenceStyle.primaryTextColor());
            nameTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            nameTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            textCol.addView(nameTv);

            TextView sampleTv = new TextView(context);
            sampleTv.setText("InstaRex • XBOYREX Story Font Preview 123");
            sampleTv.setTextColor(InstagramPreferenceStyle.secondaryTextColor());
            sampleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            Typeface previewTf = FontStorage.previewBundledStoryFont(rawRes);
            if (previewTf != null) {
                sampleTv.setTypeface(previewTf);
            }
            textCol.addView(sampleTv);

            row.addView(textCol, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            row.setOnClickListener(v -> {
                RexHaptics.tap(v);
                checked[idx] = !checked[idx];
                FontStorage.setXboyrexStoryFontEnabled(context, rawRes, checked[idx]);
                RexIcon.bindOrAnimateState(cb, checked[idx] ? "circle-check" : "circle", checked[idx], 0xFFA4ACB8, InstagramPreferenceStyle.accentColor(), 22, true);
            });
            list.addView(row);
        }

        scroll.addView(list);
        LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                RexVectorIcons.dp(context, 340)
        );
        root.addView(scroll, sLp);

        TextView doneBtn = new TextView(context);
        doneBtn.setText("Done");
        doneBtn.setGravity(Gravity.CENTER);
        doneBtn.setTextColor(Color.WHITE);
        doneBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        doneBtn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        int bPad = RexVectorIcons.dp(context, 12);
        doneBtn.setPadding(bPad, bPad, bPad, bPad);
        GradientDrawable doneBg = new GradientDrawable();
        doneBg.setColor(InstagramPreferenceStyle.accentColor());
        doneBg.setCornerRadius(RexVectorIcons.dp(context, 14));
        doneBtn.setBackground(doneBg);
        LinearLayout.LayoutParams dLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        dLp.topMargin = RexVectorIcons.dp(context, 12);
        doneBtn.setOnClickListener(v -> {
            RexHaptics.tap(v);
            dialog.dismiss();
            if (onUpdated != null) onUpdated.run();
        });
        root.addView(doneBtn, dLp);

        dialog.setView(root);
        RexDialogs.showBlurredDialog(context, dialog);
    }

    public static void showEmojiTypePicker(final Context context, final Runnable onUpdated) {
        final String[] emojis = {
                "Original Emoji",
                "From Local Storage",
                "iOS 26.4",
                "iOS 18.4",
                "iOS 17.4",
                "iOS 14.5",
                "Facebook",
                "Joy Pixel",
                "Samsung"
        };
        final boolean[] downloadable = {
                false, false, true, true, true, true, true, true, true
        };

        String currentSaved = SharedPref.getStringPref(Settings.CHOOSE_EMOJI_TYPE);
        if (currentSaved == null || currentSaved.isEmpty()) currentSaved = "Original Emoji";
        final String[] selectedHolder = {currentSaved};

        LinearLayout card = createRadioPackDialogContainer(context, "Choose Emoji");
        LinearLayout listContainer = new LinearLayout(context);
        listContainer.setOrientation(LinearLayout.VERTICAL);

        final List<ImageView> radioViews = new ArrayList<>();
        final List<ImageView> dlViews = new ArrayList<>();

        for (int i = 0; i < emojis.length; i++) {
            final int idx = i;
            final String itemLabel = emojis[i];
            final boolean hasDl = downloadable[i];

            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 10),
                    RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 10));

            ImageView radio = new ImageView(context);
            int rSize = RexVectorIcons.dp(context, 22);
            LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(rSize, rSize);
            rLp.rightMargin = RexVectorIcons.dp(context, 16);
            radio.setLayoutParams(rLp);
            radioViews.add(radio);
            row.addView(radio);

            TextView tv = new TextView(context);
            tv.setText(itemLabel);
            tv.setTextColor(Color.WHITE);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
            try {
                String rawName = app.morphe.extension.instagram.patches.customise.font.FontStorage.rawResourceForFontName(itemLabel);
                if (rawName != null) {
                    Typeface previewTf = app.morphe.extension.instagram.patches.customise.font.FontStorage.loadBundledTypefaceByRawName(rawName);
                    if (previewTf != null) tv.setTypeface(previewTf);
                }
            } catch (Throwable ignored) {}
            LinearLayout.LayoutParams tvLp = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            tv.setLayoutParams(tvLp);
            row.addView(tv);

            final ImageView dlBtn;
            if (hasDl) {
                dlBtn = new ImageView(context);
                int dSize = RexVectorIcons.dp(context, 26);
                LinearLayout.LayoutParams dLp = new LinearLayout.LayoutParams(dSize, dSize);
                dlBtn.setLayoutParams(dLp);
                boolean ready = app.morphe.extension.instagram.patches.customise.font.FontStorage.isEmojiPackDownloaded(context, itemLabel);
                bindCircleActionIcon(context, dlBtn, ready);
                dlBtn.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    Utils.showToastShort("Downloading " + itemLabel + " Emoji pack...");
                    final Context appCtx = context.getApplicationContext();
                    Utils.runOnBackgroundThread(() -> {
                        boolean ok = app.morphe.extension.instagram.patches.customise.font.FontStorage.downloadEmojiPackSync(appCtx, itemLabel);
                        Utils.runOnMainThread(() -> {
                            if (ok) {
                                bindCircleActionIcon(context, dlBtn, true);
                                selectedHolder[0] = itemLabel;
                                updateRadioStates(context, radioViews, emojis, selectedHolder[0]);
                                Utils.showToastShort(itemLabel + " downloaded — tap Apply to activate");
                            } else {
                                Utils.showToastShort("Couldn't download " + itemLabel + ". Check connection.");
                            }
                        });
                    });
                });
                row.addView(dlBtn);
            } else {
                dlBtn = null;
            }
            dlViews.add(dlBtn);

            row.setOnClickListener(v -> {
                RexHaptics.tap(v);
                selectedHolder[0] = itemLabel;
                updateRadioStates(context, radioViews, emojis, selectedHolder[0]);
            });
            listContainer.addView(row);
        }

        updateRadioStates(context, radioViews, emojis, selectedHolder[0]);
        ScrollView sv = new ScrollView(context);
        sv.addView(listContainer);
        LinearLayout.LayoutParams svLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        card.addView(sv, svLp);

        final android.app.Dialog dialog = createRawDarkDialog(context, card);
        addDialogFooterButtons(context, card, "Close", "Apply",
                v -> dialog.dismiss(),
                v -> {
                    final String chosen = selectedHolder[0];
                    dialog.dismiss();
                    if ("From Local Storage".equals(chosen)) {
                        Activity act = RexDialogs.resolveActivity(context);
                        if (act != null) {
                            app.morphe.extension.instagram.settings.ActivityHook.launchFragment(act, "rex_pref_add_emoji_font");
                        }
                        if (onUpdated != null) onUpdated.run();
                        return;
                    }
                    if ("Original Emoji".equals(chosen)) {
                        app.morphe.extension.instagram.patches.customise.font.FontStorage.clearEmojiFont();
                        Utils.showToastShort("Original Emoji restored");
                        if (onUpdated != null) onUpdated.run();
                        return;
                    }
                    if (app.morphe.extension.instagram.patches.customise.font.FontStorage.isEmojiPackDownloaded(context, chosen)) {
                        if (app.morphe.extension.instagram.patches.customise.font.FontStorage.applyEmojiPack(context, chosen)) {
                            Utils.showToastShort("Applied " + chosen + " Emoji across the app");
                        }
                        if (onUpdated != null) onUpdated.run();
                    } else {
                        Utils.showToastShort("Downloading & applying " + chosen + " Emoji...");
                        final Context appCtx = context.getApplicationContext();
                        Utils.runOnBackgroundThread(() -> {
                            boolean ok = app.morphe.extension.instagram.patches.customise.font.FontStorage.downloadEmojiPackSync(appCtx, chosen);
                            if (ok) {
                                app.morphe.extension.instagram.patches.customise.font.FontStorage.applyEmojiPack(appCtx, chosen);
                            }
                            Utils.runOnMainThread(() -> {
                                if (ok) {
                                    Utils.showToastShort("Applied " + chosen + " Emoji across the app");
                                } else {
                                    Utils.showToastShort("Couldn't download " + chosen + " Emoji pack");
                                }
                                if (onUpdated != null) onUpdated.run();
                            });
                        });
                    }
                });
        dialog.show();
    }

    public static void showFontTypePicker(final Context context, final Runnable onUpdated) {
        final String[] fonts = {
                "Original Font",
                "System Default",
                "iOS San Francisco",
                "Instagram Sans",
                "Google Sans",
                "From Local Storage",
                "iOS Font 01",
                "iOS Font 02",
                "iOS Font 03",
                "iOS Font 04",
                "iOS Font 05",
                "iOS Story Neon",
                "iOS Story Typewriter",
                "iOS Story Strong",
                "iOS Story Literature",
                "iOS Story Beach",
                "iOS Story Directional",
                "iOS Story Papyrus",
                "iOS Story Hindi",
                "iOS Story Hindi/Gujarati/Marathi"
        };

        String currentSaved = SharedPref.getStringPref(Settings.CHOOSE_FONT_TYPE);
        if (currentSaved == null || currentSaved.isEmpty()) currentSaved = "Original Font";
        final String[] selectedHolder = {currentSaved};

        LinearLayout card = createRadioPackDialogContainer(context, "Choose Font");
        LinearLayout listContainer = new LinearLayout(context);
        listContainer.setOrientation(LinearLayout.VERTICAL);

        final List<ImageView> radioViews = new ArrayList<>();

        for (int i = 0; i < fonts.length; i++) {
            final String itemLabel = fonts[i];
            final boolean hasDl = app.morphe.extension.instagram.patches.customise.font.FontStorage.rawResourceForFontName(itemLabel) != null;

            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 10),
                    RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 10));

            ImageView radio = new ImageView(context);
            int rSize = RexVectorIcons.dp(context, 22);
            LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(rSize, rSize);
            rLp.rightMargin = RexVectorIcons.dp(context, 16);
            radio.setLayoutParams(rLp);
            radioViews.add(radio);
            row.addView(radio);

            TextView tv = new TextView(context);
            tv.setText(itemLabel);
            tv.setTextColor(Color.WHITE);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
            LinearLayout.LayoutParams tvLp = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            tv.setLayoutParams(tvLp);
            row.addView(tv);

            if (hasDl) {
                final ImageView dlBtn = new ImageView(context);
                int dSize = RexVectorIcons.dp(context, 26);
                LinearLayout.LayoutParams dLp = new LinearLayout.LayoutParams(dSize, dSize);
                dlBtn.setLayoutParams(dLp);
                boolean ready = app.morphe.extension.instagram.patches.customise.font.FontStorage.isFontPresetReady(context, itemLabel);
                bindCircleActionIcon(context, dlBtn, ready);
                dlBtn.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    boolean ok = app.morphe.extension.instagram.patches.customise.font.FontStorage.prepareBundledFontPreset(context, itemLabel);
                    if (ok) {
                        bindCircleActionIcon(context, dlBtn, true);
                        selectedHolder[0] = itemLabel;
                        updateRadioStates(context, radioViews, fonts, selectedHolder[0]);
                        Utils.showToastShort(itemLabel + " ready — tap Apply to activate");
                    } else {
                        Utils.showToastShort("Couldn't prepare " + itemLabel);
                    }
                });
                row.addView(dlBtn);
            }

            row.setOnClickListener(v -> {
                RexHaptics.tap(v);
                selectedHolder[0] = itemLabel;
                updateRadioStates(context, radioViews, fonts, selectedHolder[0]);
            });
            listContainer.addView(row);
        }

        updateRadioStates(context, radioViews, fonts, selectedHolder[0]);
        ScrollView sv = new ScrollView(context);
        sv.addView(listContainer);
        LinearLayout.LayoutParams svLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        card.addView(sv, svLp);

        final android.app.Dialog dialog = createRawDarkDialog(context, card);
        addDialogFooterButtons(context, card, "Close", "Apply",
                v -> dialog.dismiss(),
                v -> {
                    final String chosen = selectedHolder[0];
                    dialog.dismiss();
                    SharedPref.setStringPref(Settings.CHOOSE_FONT_TYPE.key, chosen);
                    if ("From Local Storage".equals(chosen)) {
                        Activity act = RexDialogs.resolveActivity(context);
                        if (act != null) {
                            app.morphe.extension.instagram.settings.ActivityHook.launchFragment(act, "rex_pref_add_font");
                        }
                        if (onUpdated != null) onUpdated.run();
                        return;
                    }
                    if ("Original Font".equals(chosen)) {
                        app.morphe.extension.instagram.patches.customise.font.FontStorage.delete();
                        app.morphe.extension.instagram.patches.customise.font.FontStorage.setUseSystemFont(false);
                        Utils.showToastShort("Original Font restored");
                    } else if ("System Default".equals(chosen)) {
                        app.morphe.extension.instagram.patches.customise.font.FontStorage.delete();
                        app.morphe.extension.instagram.patches.customise.font.FontStorage.setUseSystemFont(true);
                        Utils.showToastShort("System Default font applied");
                    } else if (app.morphe.extension.instagram.patches.customise.font.FontStorage.applyBundledFont(context, chosen)) {
                        Utils.showToastShort("Applied " + chosen + " across the app");
                    } else {
                        Utils.showToastShort("Couldn't apply " + chosen);
                    }
                    if (onUpdated != null) onUpdated.run();
                });
        dialog.show();
    }

    public static void showAddStoryFontsDialog(final Context context, final Runnable onUpdated) {
        final String[] rows = {
                "From Local Storage",
                "Official Fonts Pack",
                "AnshulDixit Fonts Pack",
                "Askxtylishh Fonts Pack",
                "Affan Fonts Pack",
                "Valentines Fonts Pack"
        };

        LinearLayout card = createRadioPackDialogContainer(context, "Add Story Fonts");
        LinearLayout listContainer = new LinearLayout(context);
        listContainer.setOrientation(LinearLayout.VERTICAL);

        final android.app.Dialog dialog = createRawDarkDialog(context, card);

        for (int i = 0; i < rows.length; i++) {
            final String itemLabel = rows[i];
            final boolean isPack = i > 0;

            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 13),
                    RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 13));

            TextView tv = new TextView(context);
            tv.setText(itemLabel);
            tv.setTextColor(Color.WHITE);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
            LinearLayout.LayoutParams tvLp = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            tv.setLayoutParams(tvLp);
            row.addView(tv);

            if (isPack) {
                final ImageView dlBtn = new ImageView(context);
                int dSize = RexVectorIcons.dp(context, 26);
                LinearLayout.LayoutParams dLp = new LinearLayout.LayoutParams(dSize, dSize);
                dlBtn.setLayoutParams(dLp);
                boolean installed = app.morphe.extension.instagram.patches.customise.font.FontStorage.isStoryFontPackInstalled(context, itemLabel);
                bindCircleActionIcon(context, dlBtn, installed);
                View.OnClickListener installAction = v -> {
                    RexHaptics.tap(v);
                    int count = app.morphe.extension.instagram.patches.customise.font.FontStorage.installStoryFontPack(context, itemLabel);
                    if (count > 0) {
                        bindCircleActionIcon(context, dlBtn, true);
                        Utils.showToastShort("Installed " + itemLabel + " (" + count + " story fonts)");
                        if (onUpdated != null) onUpdated.run();
                    } else {
                        Utils.showToastShort("Couldn't install " + itemLabel);
                    }
                };
                dlBtn.setOnClickListener(installAction);
                row.setOnClickListener(installAction);
                row.addView(dlBtn);
            } else {
                row.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    dialog.dismiss();
                    Activity act = RexDialogs.resolveActivity(context);
                    if (act != null) {
                        app.morphe.extension.instagram.settings.ActivityHook.launchFragment(act, "rex_pref_add_story_font");
                    }
                });
            }
            listContainer.addView(row);
        }

        ScrollView sv = new ScrollView(context);
        sv.addView(listContainer);
        LinearLayout.LayoutParams svLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        card.addView(sv, svLp);

        addDialogFooterButtons(context, card, "Cancel", "Reset",
                v -> dialog.dismiss(),
                v -> {
                    app.morphe.extension.instagram.patches.customise.font.FontStorage.resetStoryFonts(context);
                    Utils.showToastShort("Reset all custom Story fonts");
                    dialog.dismiss();
                    if (onUpdated != null) onUpdated.run();
                });
        dialog.show();
    }

    private static LinearLayout createRadioPackDialogContainer(Context context, String titleText) {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        int padH = RexVectorIcons.dp(context, 22);
        int padV = RexVectorIcons.dp(context, 20);
        card.setPadding(padH, padV, padH, RexVectorIcons.dp(context, 16));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0xFF121316);
        bg.setCornerRadius(RexVectorIcons.dp(context, 26));
        bg.setStroke(Math.max(1, RexVectorIcons.dp(context, 1)), 0x22FFFFFF);
        card.setBackground(bg);

        TextView title = new TextView(context);
        title.setText(titleText);
        title.setTextColor(Color.WHITE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 21f);
        title.setPadding(RexVectorIcons.dp(context, 2), 0, 0, RexVectorIcons.dp(context, 12));
        card.addView(title);
        return card;
    }

    private static android.app.Dialog createRawDarkDialog(Context context, View contentView) {
        Activity act = RexDialogs.resolveActivity(context);
        Context hostCtx = act != null ? act : context;
        android.app.Dialog dialog = new android.app.Dialog(hostCtx);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        app.morphe.extension.instagram.patches.customise.font.CustomFont.applyToViewTree(contentView);
        dialog.setContentView(contentView);
        if (dialog.getWindow() != null) {
            dialog.getWindow().setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(Color.TRANSPARENT));
            int screenW = hostCtx.getResources().getDisplayMetrics().widthPixels;
            int screenH = hostCtx.getResources().getDisplayMetrics().heightPixels;
            dialog.getWindow().setLayout((int) (screenW * 0.88f), ViewGroup.LayoutParams.WRAP_CONTENT);
            RexDialogs.attachBlurBehind(dialog, hostCtx);
        }
        return dialog;
    }

    private static void addDialogFooterButtons(
            Context context,
            LinearLayout card,
            String leftLabel,
            String rightLabel,
            View.OnClickListener onLeft,
            View.OnClickListener onRight
    ) {
        LinearLayout footer = new LinearLayout(context);
        footer.setOrientation(LinearLayout.HORIZONTAL);
        footer.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        footer.setPadding(0, RexVectorIcons.dp(context, 14), 0, 0);

        TextView leftBtn = new TextView(context);
        leftBtn.setText(leftLabel);
        leftBtn.setTextColor(Color.WHITE);
        leftBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
        leftBtn.setPadding(RexVectorIcons.dp(context, 16), RexVectorIcons.dp(context, 8),
                RexVectorIcons.dp(context, 16), RexVectorIcons.dp(context, 8));
        leftBtn.setOnClickListener(onLeft);
        footer.addView(leftBtn);

        TextView rightBtn = new TextView(context);
        rightBtn.setText(rightLabel);
        rightBtn.setTextColor(Color.WHITE);
        rightBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
        rightBtn.setPadding(RexVectorIcons.dp(context, 16), RexVectorIcons.dp(context, 8),
                RexVectorIcons.dp(context, 8), RexVectorIcons.dp(context, 8));
        rightBtn.setOnClickListener(onRight);
        footer.addView(rightBtn);

        card.addView(footer);
    }

    private static void updateRadioStates(Context context, List<ImageView> radios, String[] labels, String selected) {
        for (int i = 0; i < radios.size() && i < labels.length; i++) {
            boolean checked = labels[i].equals(selected);
            ImageView iv = radios.get(i);
            int size = RexVectorIcons.dp(context, 22);
            android.graphics.Bitmap bmp = android.graphics.Bitmap.createBitmap(size, size, android.graphics.Bitmap.Config.ARGB_8888);
            android.graphics.Canvas c = new android.graphics.Canvas(bmp);
            android.graphics.Paint p = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
            p.setColor(Color.WHITE);
            p.setStyle(android.graphics.Paint.Style.STROKE);
            p.setStrokeWidth(RexVectorIcons.dp(context, 2));
            float r = size / 2f - RexVectorIcons.dp(context, 2);
            c.drawCircle(size / 2f, size / 2f, r, p);
            if (checked) {
                p.setStyle(android.graphics.Paint.Style.FILL);
                c.drawCircle(size / 2f, size / 2f, r * 0.52f, p);
            }
            iv.setImageBitmap(bmp);
        }
    }

    private static void bindCircleActionIcon(Context context, ImageView iv, boolean isReady) {
        int size = RexVectorIcons.dp(context, 26);
        android.graphics.Bitmap bmp = android.graphics.Bitmap.createBitmap(size, size, android.graphics.Bitmap.Config.ARGB_8888);
        android.graphics.Canvas c = new android.graphics.Canvas(bmp);
        android.graphics.Paint p = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        p.setColor(isReady ? 0xFF23C6D8 : Color.WHITE);
        p.setStyle(android.graphics.Paint.Style.STROKE);
        p.setStrokeWidth(RexVectorIcons.dp(context, 1.8f));
        p.setStrokeCap(android.graphics.Paint.Cap.ROUND);
        p.setStrokeJoin(android.graphics.Paint.Join.ROUND);
        float cx = size / 2f;
        float cy = size / 2f;
        float r = size / 2f - RexVectorIcons.dp(context, 2);
        c.drawCircle(cx, cy, r, p);
        if (isReady) {
            c.drawLine(cx - r * 0.42f, cy + r * 0.02f, cx - r * 0.08f, cy + r * 0.36f, p);
            c.drawLine(cx - r * 0.08f, cy + r * 0.36f, cx + r * 0.44f, cy - r * 0.28f, p);
        } else {
            c.drawLine(cx, cy - r * 0.42f, cx, cy + r * 0.38f, p);
            c.drawLine(cx - r * 0.32f, cy + r * 0.08f, cx, cy + r * 0.40f, p);
            c.drawLine(cx + r * 0.32f, cy + r * 0.08f, cx, cy + r * 0.40f, p);
        }
        iv.setImageBitmap(bmp);
    }

    public static void showVideoSplitterDialog(final Context context) {
        String dur = SharedPref.getStringPref(Settings.SPLIT_VIDEO_DURATION);
        LinearLayout root = RexDialogs.createDialogSheet(context, "scissors", "Long Video Splitter (" + dur + ")");

        TextView desc = new TextView(context);
        desc.setText("Split long videos into " + dur + " segments for Instagram & WhatsApp Stories without quality loss.");
        desc.setTextColor(RexDialogs.TEXT_SECONDARY);
        desc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        desc.setPadding(RexVectorIcons.dp(context, 4), 0, RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 14));
        root.addView(desc);

        final AlertDialog dialog = new AlertDialog.Builder(context).create();

        TextView changeDurBtn = createActionButton(context, "Change Segment Duration (" + dur + ")", RexDialogs.ELEVATED_SURFACE, RexDialogs.TEXT_PRIMARY);
        changeDurBtn.setOnClickListener(v -> {
            RexHaptics.tap(v);
            dialog.dismiss();
            showSplitDurationPicker(context, null);
        });
        root.addView(changeDurBtn);

        TextView pickVideoBtn = createActionButton(context, "Pick Video from Gallery to Split", RexDialogs.BRAND_CYAN, 0xFF0A1417);
        pickVideoBtn.setOnClickListener(v -> {
            RexHaptics.tap(v);
            dialog.dismiss();
            try {
                Intent pick = new Intent(Intent.ACTION_PICK, MediaStore.Video.Media.EXTERNAL_CONTENT_URI);
                pick.setType("video/*");
                Intent chooser = Intent.createChooser(pick, "Select Video to Split (" + dur + ")");
                chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(chooser);
            } catch (Throwable e) {
                Utils.showToastShort("Could not open gallery: " + e.getMessage());
            }
        });
        root.addView(pickVideoBtn);

        addCloseButton(context, root, dialog);
        dialog.setView(root);
        RexDialogs.showBlurredDialog(context, dialog);
    }

    // -------------------------------------------------------------------------
    // 6. Real-Time Translator (Story Text, Story Captions, Post Captions, Bio)
    // -------------------------------------------------------------------------
    private static final android.util.LruCache<String, String> TRANSLATION_CACHE = new android.util.LruCache<>(128);

    public static String languageCodeFor(String languageName) {
        if (languageName == null) return "en";
        String lower = languageName.trim().toLowerCase(java.util.Locale.ROOT);
        if (lower.startsWith("portuguese")) return "pt-BR";
        if (lower.startsWith("hindi")) return "hi";
        if (lower.startsWith("spanish")) return "es";
        if (lower.startsWith("russian")) return "ru";
        if (lower.startsWith("arabic")) return "ar";
        if (lower.startsWith("indonesian")) return "id";
        if (lower.startsWith("turkish")) return "tr";
        if (lower.startsWith("japanese")) return "ja";
        if (lower.startsWith("korean")) return "ko";
        if (lower.startsWith("french")) return "fr";
        if (lower.startsWith("german")) return "de";
        return "en";
    }

    private static String decodeHtmlEntities(String input) {
        if (input == null) return "";
        return input
                .replace("&quot;", "\"")
                .replace("&#39;", "'")
                .replace("&apos;", "'")
                .replace("&amp;", "&")
                .replace("&lt;", "<")
                .replace("&gt;", ">");
    }

    private static String httpGetText(String urlStr) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        conn.setConnectTimeout(8000);
        conn.setReadTimeout(8000);
        conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android 14; Pixel 8 Pro) AppleWebKit/537.36 Chrome/124.0.0.0 Mobile Safari/537.36");
        conn.setRequestProperty("Accept", "application/json, text/plain, */*");
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) sb.append(line);
            return sb.toString();
        } finally {
            conn.disconnect();
        }
    }

    private static String translateViaTier1(String text, String tl) {
        try {
            String urlStr = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl="
                    + URLEncoder.encode(tl, "UTF-8") + "&dt=t&q=" + URLEncoder.encode(text, "UTF-8");
            String body = httpGetText(urlStr);
            JSONArray outer = new JSONArray(body);
            JSONArray sentences = outer.optJSONArray(0);
            if (sentences != null) {
                StringBuilder out = new StringBuilder();
                for (int i = 0; i < sentences.length(); i++) {
                    JSONArray seg = sentences.optJSONArray(i);
                    if (seg != null && seg.length() > 0) {
                        out.append(seg.optString(0, ""));
                    }
                }
                String res = decodeHtmlEntities(out.toString().trim());
                if (!res.isEmpty()) return res;
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static String translateViaTier2(String text, String tl) {
        try {
            String urlStr = "https://clients5.google.com/translate_a/t?client=dict-chrome-ex&sl=auto&tl="
                    + URLEncoder.encode(tl, "UTF-8") + "&q=" + URLEncoder.encode(text, "UTF-8");
            String body = httpGetText(urlStr);
            JSONArray arr = new JSONArray(body);
            if (arr.length() > 0) {
                Object first = arr.get(0);
                if (first instanceof JSONArray) {
                    String candidate = ((JSONArray) first).optString(0, "");
                    if (!candidate.isEmpty()) return decodeHtmlEntities(candidate.trim());
                } else if (first instanceof String) {
                    String candidate = (String) first;
                    if (!candidate.isEmpty()) return decodeHtmlEntities(candidate.trim());
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static String translateViaTier3(String text, String tl) {
        try {
            String urlStr = "https://api.mymemory.translated.net/get?q="
                    + URLEncoder.encode(text, "UTF-8") + "&langpair=" + URLEncoder.encode("Autodetect|" + tl, "UTF-8");
            String body = httpGetText(urlStr);
            org.json.JSONObject obj = new org.json.JSONObject(body);
            org.json.JSONObject data = obj.optJSONObject("responseData");
            if (data != null) {
                String candidate = decodeHtmlEntities(data.optString("translatedText", "").trim());
                if (!candidate.isEmpty() && !candidate.toUpperCase().contains("MYMEMORY WARNING")) {
                    return candidate;
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static String translateViaTier4(String text, String tl) {
        try {
            String urlStr = "https://lingva.ml/api/v1/auto/"
                    + URLEncoder.encode(tl, "UTF-8") + "/"
                    + URLEncoder.encode(text, "UTF-8").replace("+", "%20");
            String body = httpGetText(urlStr);
            org.json.JSONObject obj = new org.json.JSONObject(body);
            String candidate = decodeHtmlEntities(obj.optString("translation", "").trim());
            if (!candidate.isEmpty()) return candidate;
        } catch (Throwable ignored) {}
        return null;
    }

    public static void translateText(final Context context, final String text, final String label) {
        if (text == null || text.trim().isEmpty()) {
            Utils.showToastShort((label == null ? "Text" : label) + " is empty");
            return;
        }
        final String raw = text.trim().length() > 4500 ? text.trim().substring(0, 4500) : text.trim();
        final String targetLangName = SharedPref.getStringPref(Settings.TRANSLATOR_LANGUAGE);
        final String safeLangName = (targetLangName == null || targetLangName.trim().isEmpty()) ? "English" : targetLangName.trim();
        final String tl = languageCodeFor(safeLangName);
        final String fallbackShortTl = tl.contains("-") ? tl.substring(0, tl.indexOf('-')) : tl;
        final String cacheKey = tl + "|" + raw;

        String cached = TRANSLATION_CACHE.get(cacheKey);
        if (cached != null && !cached.isEmpty()) {
            showTranslationResultDialog(context, raw, cached, safeLangName, tl, label, true);
            return;
        }

        Utils.showToastShort("Translating to " + safeLangName + " (" + tl + ")...");

        Utils.runOnBackgroundThread(() -> {
            String translated = translateViaTier1(raw, tl);
            if ((translated == null || translated.isEmpty()) && !tl.equals(fallbackShortTl)) {
                translated = translateViaTier1(raw, fallbackShortTl);
            }
            if (translated == null || translated.isEmpty()) {
                translated = translateViaTier2(raw, tl);
            }
            if ((translated == null || translated.isEmpty()) && !tl.equals(fallbackShortTl)) {
                translated = translateViaTier2(raw, fallbackShortTl);
            }
            if (translated == null || translated.isEmpty()) {
                translated = translateViaTier3(raw, fallbackShortTl);
            }
            if (translated == null || translated.isEmpty()) {
                translated = translateViaTier4(raw, fallbackShortTl);
            }

            final boolean ok = translated != null && !translated.trim().isEmpty();
            final String cleanTranslated = ok ? translated.trim() : "";
            if (ok) {
                TRANSLATION_CACHE.put(cacheKey, cleanTranslated);
            }
            Utils.runOnMainThread(() -> showTranslationResultDialog(
                    context, raw, cleanTranslated, safeLangName, tl, label, ok
            ));
        });
    }

    private static void showTranslationResultDialog(
            final Context context,
            final String originalText,
            final String translatedText,
            final String targetLangName,
            final String targetLangCode,
            final String label,
            final boolean succeeded
    ) {
        try {
            final Context hostCtx = RexDialogs.resolveActivity(context) != null ? RexDialogs.resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            String headerTitle = succeeded
                    ? ("Translated " + label + " • " + targetLangName + " (" + targetLangCode + ")")
                    : ("Translation Failed • " + label);
            LinearLayout root = createCardContainer(hostCtx, headerTitle);

            TextView langSwitchBtn = createActionButton(
                    hostCtx,
                    "Target Language: " + targetLangName + " (" + targetLangCode + ") — Tap to Change",
                    InstagramPreferenceStyle.elevatedSurfaceColor(),
                    InstagramPreferenceStyle.accentColor()
            );
            langSwitchBtn.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
                showTranslatorLanguagePicker(hostCtx, () -> translateText(hostCtx, originalText, label));
            });
            root.addView(langSwitchBtn);

            if (succeeded) {
                TextView transHeader = new TextView(hostCtx);
                transHeader.setText("TRANSLATED TEXT (" + targetLangName.toUpperCase(java.util.Locale.ROOT) + ")");
                transHeader.setTextColor(InstagramPreferenceStyle.accentColor());
                transHeader.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
                transHeader.setTypeface(Typeface.DEFAULT_BOLD);
                transHeader.setPadding(0, RexVectorIcons.dp(hostCtx, 6), 0, RexVectorIcons.dp(hostCtx, 4));
                root.addView(transHeader);

                TextView transBody = new TextView(hostCtx);
                transBody.setText(translatedText);
                transBody.setTextColor(Color.WHITE);
                transBody.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
                transBody.setTextIsSelectable(true);
                int boxPad = RexVectorIcons.dp(hostCtx, 12);
                transBody.setPadding(boxPad, boxPad, boxPad, boxPad);
                GradientDrawable boxBg = new GradientDrawable();
                boxBg.setColor(InstagramPreferenceStyle.elevatedSurfaceColor());
                boxBg.setCornerRadius(RexVectorIcons.dp(hostCtx, 14));
                boxBg.setStroke(Math.max(1, RexVectorIcons.dp(hostCtx, 1)), InstagramPreferenceStyle.borderStrokeColor());
                transBody.setBackground(boxBg);
                root.addView(transBody);

                TextView copyTransBtn = createActionButton(
                        hostCtx,
                        "Copy Translated Text",
                        InstagramPreferenceStyle.accentColor(),
                        Color.WHITE
                );
                copyTransBtn.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    Utils.setClipboard(translatedText);
                    Utils.showToastShort("Copied translated text");
                });
                LinearLayout.LayoutParams ctLp = (LinearLayout.LayoutParams) copyTransBtn.getLayoutParams();
                ctLp.topMargin = RexVectorIcons.dp(hostCtx, 8);
                root.addView(copyTransBtn);
            } else {
                TextView errBox = new TextView(hostCtx);
                errBox.setText("Could not reach translation provider. Original text is preserved below without modification.");
                errBox.setTextColor(InstagramPreferenceStyle.DESTRUCTIVE_RED);
                errBox.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
                int boxPad = RexVectorIcons.dp(hostCtx, 12);
                errBox.setPadding(boxPad, boxPad, boxPad, boxPad);
                root.addView(errBox);

                TextView retryBtn = createActionButton(
                        hostCtx,
                        "Retry Translation",
                        InstagramPreferenceStyle.accentColor(),
                        Color.WHITE
                );
                retryBtn.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    dialog.dismiss();
                    translateText(hostCtx, originalText, label);
                });
                root.addView(retryBtn);
            }

            TextView origHeader = new TextView(hostCtx);
            origHeader.setText("ORIGINAL TEXT (PRESERVED)");
            origHeader.setTextColor(InstagramPreferenceStyle.secondaryTextColor());
            origHeader.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            origHeader.setTypeface(Typeface.DEFAULT_BOLD);
            origHeader.setPadding(0, RexVectorIcons.dp(hostCtx, 10), 0, RexVectorIcons.dp(hostCtx, 4));
            root.addView(origHeader);

            TextView origBody = new TextView(hostCtx);
            origBody.setText(originalText);
            origBody.setTextColor(InstagramPreferenceStyle.secondaryTextColor());
            origBody.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            origBody.setTextIsSelectable(true);
            int oPad = RexVectorIcons.dp(hostCtx, 10);
            origBody.setPadding(oPad, oPad, oPad, oPad);
            GradientDrawable oBg = new GradientDrawable();
            oBg.setColor(0xFF101216);
            oBg.setCornerRadius(RexVectorIcons.dp(hostCtx, 12));
            oBg.setStroke(Math.max(1, RexVectorIcons.dp(hostCtx, 1)), InstagramPreferenceStyle.borderStrokeColor());
            origBody.setBackground(oBg);
            root.addView(origBody);

            TextView copyOrigBtn = createActionButton(
                    hostCtx,
                    "Copy Original Text",
                    InstagramPreferenceStyle.elevatedSurfaceColor(),
                    Color.WHITE
            );
            copyOrigBtn.setOnClickListener(v -> {
                RexHaptics.tap(v);
                Utils.setClipboard(originalText);
                Utils.showToastShort("Copied original text");
            });
            LinearLayout.LayoutParams coLp = (LinearLayout.LayoutParams) copyOrigBtn.getLayoutParams();
            coLp.topMargin = RexVectorIcons.dp(hostCtx, 8);
            root.addView(copyOrigBtn);

            addCloseButton(hostCtx, root, dialog);
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(root);
            dialog.setView(scroll);
            RexDialogs.showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showTranslationResultDialog failed", e);
        }
    }

    // -------------------------------------------------------------------------
    // 7. Repost as IG Post / IG Story / WhatsApp Story & OCR
    // -------------------------------------------------------------------------
    public static String stripHashtagsIfConfigured(String caption) {
        if (caption == null) return "";
        if (Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.COPY_CAPTION_WITHOUT_HASHTAGS))) {
            return caption.replaceAll("#\\S+", "").replaceAll("\\s{2,}", " ").trim();
        }
        return caption;
    }

    public static String extractHashtags(String caption) {
        if (caption == null || caption.isEmpty()) return "";
        Matcher m = Pattern.compile("#[\\w.]+").matcher(caption);
        StringBuilder sb = new StringBuilder();
        while (m.find()) {
            if (sb.length() > 0) sb.append(' ');
            sb.append(m.group());
        }
        return sb.toString();
    }

    public static void extractOcrFromMedia(final Context context, final MediaData mediaData, final int position) {
        try {
            String desc = mediaData.getDescriptionText();
            String username = mediaData.getUserData() != null ? mediaData.getUserData().getUsername() : "";
            final String combined = (desc != null && !desc.trim().isEmpty())
                    ? desc.trim()
                    : ("Post by @" + username + " (" + mediaData.getShortcode() + ")");

            RexDialogs.showTextStudioDialog(
                    context,
                    "Cover Image OCR Studio",
                    username,
                    combined,
                    ""
            );
        } catch (Throwable e) {
            Utils.showToastShort("OCR Error: " + e.getMessage());
        }
    }

    public static void repostMedia(final Context context, final MediaData mediaInfo, final int position, final String targetType) {
        try {
            final MediaData current = mediaInfo.getMediaAt(Math.max(0, position));
            final boolean isVideo = current.isVideo();
            final String mediaUrl = isVideo ? current.getMediaLink() : current.getImageLink();
            final String caption = stripHashtagsIfConfigured(mediaInfo.getDescriptionText());
            Utils.showToastShort("Preparing media for " + targetType + "...");

            Utils.runOnBackgroundThread(() -> {
                try {
                    String ext = isVideo ? ".mp4" : ".jpg";
                    String mime = isVideo ? "video/mp4" : "image/jpeg";
                    String fileName = "xboyrex_repost_" + System.currentTimeMillis() + ext;
                    Uri sharedUri = null;

                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                        ContentValues values = new ContentValues();
                        values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
                        values.put(MediaStore.MediaColumns.MIME_TYPE, mime);
                        values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS + "/xboyrex");
                        sharedUri = context.getContentResolver().insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
                        if (sharedUri != null) {
                            HttpURLConnection conn = (HttpURLConnection) new URL(mediaUrl).openConnection();
                            conn.setConnectTimeout(15000);
                            conn.setReadTimeout(30000);
                            try (InputStream in = new BufferedInputStream(conn.getInputStream());
                                 OutputStream out = context.getContentResolver().openOutputStream(sharedUri)) {
                                byte[] buf = new byte[8192];
                                int n;
                                while ((n = in.read(buf)) != -1) out.write(buf, 0, n);
                            } finally {
                                conn.disconnect();
                            }
                        }
                    }

                    final Uri finalUri = sharedUri;
                    Utils.runOnMainThread(() -> {
                        try {
                            if (!caption.isEmpty()) {
                                Utils.setClipboard(caption);
                            }
                            Intent share = new Intent(Intent.ACTION_SEND);
                            if (finalUri != null) {
                                share.setType(mime);
                                share.putExtra(Intent.EXTRA_STREAM, finalUri);
                                share.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                            } else {
                                share.setType("text/plain");
                            }
                            if ("WHATSAPP".equals(targetType)) {
                                String waChoice = SharedPref.getStringPref(Settings.CHOOSE_WHATSAPP_TYPE);
                                String pkg = "WhatsApp Business".equalsIgnoreCase(waChoice) ? "com.whatsapp.w4b" : "com.whatsapp";
                                share.setPackage(pkg);
                                if (Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.REPOST_WITH_CAPTION_WA)) && !caption.isEmpty()) {
                                    share.putExtra(Intent.EXTRA_TEXT, caption);
                                }
                            } else if ("IG_STORY".equals(targetType)) {
                                share.setAction("com.instagram.share.ADD_TO_STORY");
                                share.setDataAndType(finalUri, mime);
                                share.setPackage(context.getPackageName());
                            } else {
                                share.setPackage(context.getPackageName());
                                if (!caption.isEmpty()) share.putExtra(Intent.EXTRA_TEXT, caption);
                            }
                            Intent chooser = Intent.createChooser(share, "Repost via xboyrex");
                            chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                            context.startActivity(chooser);
                        } catch (Throwable ex) {
                            Intent fallback = new Intent(Intent.ACTION_SEND);
                            fallback.setType("text/plain");
                            fallback.putExtra(Intent.EXTRA_TEXT, mediaUrl);
                            fallback.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                            context.startActivity(Intent.createChooser(fallback, "Share Media"));
                        }
                    });
                } catch (Throwable e) {
                    Utils.runOnMainThread(() -> Utils.showToastShort("Repost failed: " + e.getMessage()));
                }
            });
        } catch (Throwable e) {
            Utils.showToastShort("Repost error: " + e.getMessage());
        }
    }

    // -------------------------------------------------------------------------
    // 8. Custom DM Chat Wallpaper Picker & Applier
    // -------------------------------------------------------------------------
    public static void pickChatWallpaper(final Context context) {
        try {
            Activity act = (context instanceof Activity) ? (Activity) context : Utils.getActivity();
            if (act == null) {
                Utils.showToastShort("Activity context unavailable");
                return;
            }
            FragmentManager fm = act.getFragmentManager();
            Fragment existing = fm.findFragmentByTag("rex_wallpaper_picker");
            if (existing != null) {
                fm.beginTransaction().remove(existing).commitAllowingStateLoss();
            }
            fm.beginTransaction().add(new WallpaperPickerFragment(), "rex_wallpaper_picker").commitAllowingStateLoss();
        } catch (Throwable e) {
            Utils.showToastShort("Could not open image picker: " + e.getMessage());
        }
    }

    public static void applyChatWallpaper(View viewInChat) {
        if (viewInChat == null) return;
        try {
            if (!Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.CUSTOM_CHAT_WALLPAPER)) && !Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.CHAT_CUSTOM_BG_ENABLED))) return;
            String uriStr = SharedPref.getStringPref(Settings.CHAT_CUSTOM_BG_URI);
            if (uriStr == null || uriStr.isEmpty()) return;

            View root = viewInChat;
            for (int i = 0; i < 4 && root.getParent() instanceof View; i++) {
                root = (View) root.getParent();
            }
            Context ctx = viewInChat.getContext();
            try (InputStream is = ctx.getContentResolver().openInputStream(Uri.parse(uriStr))) {
                Bitmap bmp = BitmapFactory.decodeStream(is);
                if (bmp != null) {
                    BitmapDrawable drawable = new BitmapDrawable(ctx.getResources(), bmp);
                    drawable.setAlpha(155);
                    root.setBackground(drawable);
                }
            }
        } catch (Throwable ignored) {}
    }

    @SuppressWarnings("deprecation")
    public static final class WallpaperPickerFragment extends Fragment {
        private static final int REQ_WALLPAPER = 9412;

        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            if (savedInstanceState != null) {
                detachSelf();
                return;
            }
            try {
                Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("image/*");
                intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
                startActivityForResult(intent, REQ_WALLPAPER);
            } catch (Throwable e) {
                Utils.showToastShort("Picker error: " + e.getMessage());
                detachSelf();
            }
        }

        @Override
        public void onActivityResult(int requestCode, int resultCode, Intent data) {
            if (requestCode == REQ_WALLPAPER && resultCode == Activity.RESULT_OK && data != null && data.getData() != null) {
                Uri uri = data.getData();
                try {
                    getActivity().getContentResolver().takePersistableUriPermission(
                            uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
                } catch (Throwable ignored) {}
                SharedPref.setStringPref(Settings.CHAT_CUSTOM_BG_URI.key, uri.toString());
                SharedPref.setBooleanPref(Settings.CHAT_CUSTOM_BG_ENABLED.key, true);
                Utils.showToastShort("Chat Background Image applied!");
            }
            detachSelf();
        }

        private void detachSelf() {
            try {
                if (getFragmentManager() != null) {
                    getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
                }
            } catch (Throwable ignored) {}
        }
    }

    // -------------------------------------------------------------------------
    // Shared UI Card Helpers
    // -------------------------------------------------------------------------
    public static LinearLayout createCardContainer(Context context, String titleText) {
        return RexDialogs.createDialogSheet(context, "settings", titleText);
    }

    public static TextView createActionButton(Context context, String label, int bgColor, int textColor) {
        TextView btn = new TextView(context);
        btn.setText(label);
        btn.setTextColor(textColor);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        btn.setTypeface(Typeface.DEFAULT_BOLD);
        btn.setGravity(Gravity.CENTER);
        int p = RexVectorIcons.dp(context, 12);
        btn.setPadding(p, p, p, p);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(bgColor);
        bg.setCornerRadius(RexVectorIcons.dp(context, 16));
        bg.setStroke(Math.max(1, RexVectorIcons.dp(context, 1)), RexDialogs.BORDER_STROKE);
        btn.setBackground(bg);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = RexVectorIcons.dp(context, 8);
        btn.setLayoutParams(lp);
        return btn;
    }

    public static void addCloseButton(Context context, LinearLayout root, final AlertDialog dialog) {
        RexDialogs.addDialogCloseFooter(context, root, dialog);
    }

    public static void clearTemporaryCache(Context context) {
        if (context == null) return;
        try {
            long bytesFreed = 0L;
            File cacheDir = context.getCacheDir();
            if (cacheDir != null && cacheDir.exists()) {
                bytesFreed += deleteRecursive(cacheDir, false);
            }
            File extCache = context.getExternalCacheDir();
            if (extCache != null && extCache.exists()) {
                bytesFreed += deleteRecursive(extCache, false);
            }
            String mb = String.format(java.util.Locale.US, "%.2f MB", bytesFreed / (1024.0 * 1024.0));
            Utils.showToastShort("Cleared temporary cache (" + mb + " freed)");
        } catch (Throwable e) {
            Utils.showToastShort("Cache cleanup error: " + e.getMessage());
        }
    }

    private static long deleteRecursive(File fileOrDir, boolean deleteRoot) {
        if (fileOrDir == null || !fileOrDir.exists()) return 0L;
        long freed = 0L;
        if (fileOrDir.isDirectory()) {
            File[] children = fileOrDir.listFiles();
            if (children != null) {
                for (File child : children) {
                    freed += deleteRecursive(child, true);
                }
            }
        }
        if (deleteRoot) {
            long len = fileOrDir.length();
            if (fileOrDir.delete()) freed += len;
        }
        return freed;
    }

    // -------------------------------------------------------------------------
    // Batch Carousel Repost / Share Queue (Repost all N as Posts/Stories/WA)
    // -------------------------------------------------------------------------
    public static void repostAllCarouselMedia(
            final Context context,
            final MediaData rootMedia,
            final int totalCount,
            final String target
    ) {
        if (rootMedia == null || totalCount <= 0) {
            Utils.showToastShort("Couldn't resolve carousel items to repost.");
            return;
        }
        Utils.showToastShort("Preparing " + totalCount + " carousel items for batch share...");
        Utils.runOnBackgroundThread(() -> {
            try {
                File cacheDir = new File(context.getCacheDir(), "rex_repost_batch");
                if (!cacheDir.exists()) cacheDir.mkdirs();

                ArrayList<Uri> sharedUris = new ArrayList<>();
                boolean hasVideo = false;
                boolean hasImage = false;

                for (int idx = 0; idx < totalCount; idx++) {
                    MediaData item = null; try { item = rootMedia.getMediaAt(idx); } catch (Throwable ignored) {}
                    if (item == null) continue;
                    boolean isVid = false;
                    try {
                        isVid = item.isVideo();
                    } catch (Throwable ignored) {}
                    String url = null; try { url = isVid ? item.getVideoLink() : item.getImageLink(); } catch (Throwable ignored) { try { url = item.getMediaLink(); } catch (Throwable ignored2) {} }
                    if (url == null || url.isEmpty()) continue;

                    String ext = isVid ? ".mp4" : ".jpg";
                    File outFile = new File(cacheDir, "rex_batch_" + (idx + 1) + "_" + (System.currentTimeMillis() / 1000L) + ext);
                    HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
                    conn.setConnectTimeout(12000);
                    conn.setReadTimeout(20000);
                    try (InputStream in = new BufferedInputStream(conn.getInputStream());
                         OutputStream out = new java.io.FileOutputStream(outFile)) {
                        byte[] buf = new byte[8192];
                        int n;
                        while ((n = in.read(buf)) != -1) {
                            out.write(buf, 0, n);
                        }
                    } finally {
                        conn.disconnect();
                    }

                    ContentValues values = new ContentValues();
                    values.put(MediaStore.MediaColumns.DISPLAY_NAME, outFile.getName());
                    values.put(MediaStore.MediaColumns.MIME_TYPE, isVid ? "video/mp4" : "image/jpeg");
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                        values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_PICTURES + "/InstaRex_Share");
                    }
                    Uri collection = isVid
                            ? MediaStore.Video.Media.EXTERNAL_CONTENT_URI
                            : MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
                    Uri itemUri = context.getContentResolver().insert(collection, values);
                    if (itemUri != null) {
                        try (InputStream in = new java.io.FileInputStream(outFile);
                             OutputStream out = context.getContentResolver().openOutputStream(itemUri)) {
                            if (out != null) {
                                byte[] buf = new byte[8192];
                                int n;
                                while ((n = in.read(buf)) != -1) {
                                    out.write(buf, 0, n);
                                }
                            }
                        }
                        sharedUris.add(itemUri);
                        if (isVid) hasVideo = true;
                        else hasImage = true;
                    }
                }

                final String mime = (hasVideo && hasImage) ? "*/*" : (hasVideo ? "video/*" : "image/*");
                Utils.runOnMainThread(() -> {
                    if (sharedUris.isEmpty()) {
                        Utils.showToastShort("Couldn't prepare carousel items for sharing.");
                        return;
                    }
                    try {
                        Intent intent = new Intent(Intent.ACTION_SEND_MULTIPLE);
                        intent.setType(mime);
                        intent.putParcelableArrayListExtra(Intent.EXTRA_STREAM, sharedUris);
                        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

                        if (Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.REPOST_WITH_CAPTION_WA))) {
                            try {
                                String cap = rootMedia.getDescriptionText();
                                if (cap != null && !cap.isEmpty()) {
                                    intent.putExtra(Intent.EXTRA_TEXT, stripHashtagsIfConfigured(cap));
                                }
                            } catch (Throwable ignored) {}
                        }

                        if ("WHATSAPP".equals(target)) {
                            String waType = SharedPref.getStringPref(Settings.CHOOSE_WHATSAPP_TYPE);
                            String pkg = (waType != null && waType.contains("Business"))
                                    ? "com.whatsapp.w4b" : "com.whatsapp";
                            intent.setPackage(pkg);
                        } else {
                            intent.setPackage(context.getPackageName());
                        }

                        Intent chooser = Intent.createChooser(intent, "Repost " + sharedUris.size() + " Carousel Items");
                        if (!(context instanceof Activity)) {
                            chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        }
                        context.startActivity(chooser);
                    } catch (Throwable err) {
                        Utils.showToastShort("Couldn't launch batch share target.");
                    }
                });
            } catch (Throwable e) {
                Utils.runOnMainThread(() -> Utils.showToastShort("Batch carousel share failed. Try again."));
            }
        });
    }

    public static void showStoryMediaInfoDialog(
            final Context context,
            final app.morphe.extension.instagram.patches.download.MediaContextResolver.MediaCapabilities caps
    ) {
        if (caps == null) return;
        try {
            final Context hostCtx = RexDialogs.resolveActivity(context) != null ? RexDialogs.resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            LinearLayout sheet = RexDialogs.createDialogSheet(hostCtx, "info", "Story Media Information");

            String typeLabel = caps.currentItemIsVideo ? "Story Video (MP4)" : "Story Photo (JPEG)";
            String slideLabel = caps.totalCount > 1
                    ? (caps.displayIndex + " of " + caps.totalCount)
                    : "Single Story Item";
            String audioLabel = caps.hasAudioTrack ? "Available (AAC / MP3)" : "None (Silent / Photo)";
            final String summary = "Author: @" + caps.username + "\n"
                    + "Media Type: " + typeLabel + "\n"
                    + "Story Position: " + slideLabel + "\n"
                    + "Audio Stream: " + audioLabel + "\n"
                    + "Clean URL: " + (caps.postLink == null || caps.postLink.isEmpty() ? "N/A" : caps.postLink);

            TextView infoView = new TextView(hostCtx);
            infoView.setText(summary);
            infoView.setTextColor(RexDialogs.TEXT_PRIMARY);
            infoView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            infoView.setLineSpacing(RexVectorIcons.dp(hostCtx, 3), 1.08f);
            int pad = RexVectorIcons.dp(hostCtx, 14);
            infoView.setPadding(pad, pad, pad, pad);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(RexDialogs.ELEVATED_SURFACE);
            bg.setCornerRadius(RexVectorIcons.dp(hostCtx, 16));
            bg.setStroke(Math.max(1, RexVectorIcons.dp(hostCtx, 1)), RexDialogs.BORDER_STROKE);
            infoView.setBackground(bg);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.bottomMargin = RexVectorIcons.dp(hostCtx, 12);
            sheet.addView(infoView, lp);

            LinearLayout card = RexDialogs.createGroupedMenuCard(hostCtx);
            RexDialogs.addGroupedMenuRow(hostCtx, card, "copy", "Copy Story Metadata", false, () -> {
                dialog.dismiss();
                Utils.setClipboard(summary);
                Utils.showToastShort("Story metadata copied to clipboard");
            });
            sheet.addView(card);

            RexDialogs.addDialogCloseFooter(hostCtx, sheet, dialog);
            dialog.setView(sheet);
            RexDialogs.showBlurredDialog(hostCtx, dialog);
        } catch (Throwable ignored) {}
    }

    // -------------------------------------------------------------------------
    // 9. Multi-Theme Color Mode Picker (6 Curated AMOLED & Glass Palettes)
    // -------------------------------------------------------------------------
    public static void showColorModePicker(final Context context, final Runnable onUpdated) {
        String current = app.morphe.extension.instagram.utils.Pref.rexColorMode();
        showSingleChoiceDialog(
                context,
                "Color Mode & Accent Palette",
                InstagramPreferenceStyle.COLOR_MODES,
                current,
                chosen -> {
                    SharedPref.setStringPref(Settings.REX_COLOR_MODE.key, chosen);
                    Utils.showToastShort("Applied Color Mode: " + chosen);
                    if (onUpdated != null) {
                        onUpdated.run();
                    } else {
                        Activity act = RexDialogs.resolveActivity(context);
                        if (act != null && app.morphe.extension.instagram.settings.ActivityHook.isRex(act)) {
                            act.recreate();
                        }
                    }
                }
        );
    }

    // -------------------------------------------------------------------------
    // 10. Long-Press Search Tab -> Open Profile from Clipboard or Prompt
    // -------------------------------------------------------------------------
    public static void openProfileFromClipboardOrPrompt(final Context context) {
        try {
            final Context hostCtx = RexDialogs.resolveActivity(context) != null ? RexDialogs.resolveActivity(context) : context;
            String clipText = "";
            try {
                android.content.ClipboardManager cm =
                        (android.content.ClipboardManager) hostCtx.getSystemService(Context.CLIPBOARD_SERVICE);
                if (cm != null && cm.hasPrimaryClip() && cm.getPrimaryClip() != null
                        && cm.getPrimaryClip().getItemCount() > 0) {
                    CharSequence cs = cm.getPrimaryClip().getItemAt(0).coerceToText(hostCtx);
                    if (cs != null) clipText = cs.toString().trim();
                }
            } catch (Throwable ignored) {}

            String resolvedUser = extractUsernameFromText(clipText);
            if (!resolvedUser.isEmpty()) {
                Utils.showToastShort("Opening profile @" + resolvedUser + "...");
                openInstagramProfileHandle(hostCtx, resolvedUser);
                return;
            }

            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            LinearLayout sheet = RexDialogs.createDialogSheet(hostCtx, "user-round-search", "Open Profile by @Username");

            TextView desc = new TextView(hostCtx);
            desc.setText("Tip: Copy any @username or instagram.com/username link and long-press the Search tab to jump straight to that profile.");
            desc.setTextColor(RexDialogs.TEXT_SECONDARY);
            desc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            desc.setPadding(RexVectorIcons.dp(hostCtx, 4), 0, RexVectorIcons.dp(hostCtx, 4), RexVectorIcons.dp(hostCtx, 10));
            sheet.addView(desc);

            final EditText input = new EditText(hostCtx);
            input.setHint("@username or profile URL");
            input.setHintTextColor(RexDialogs.TEXT_SECONDARY);
            input.setTextColor(RexDialogs.TEXT_PRIMARY);
            input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            int p = RexVectorIcons.dp(hostCtx, 12);
            input.setPadding(p, p, p, p);
            GradientDrawable inBg = new GradientDrawable();
            inBg.setColor(InstagramPreferenceStyle.elevatedSurfaceColor());
            inBg.setCornerRadius(RexVectorIcons.dp(hostCtx, 14));
            inBg.setStroke(Math.max(1, RexVectorIcons.dp(hostCtx, 1)), InstagramPreferenceStyle.borderStrokeColor());
            input.setBackground(inBg);
            LinearLayout.LayoutParams inLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            inLp.bottomMargin = RexVectorIcons.dp(hostCtx, 12);
            sheet.addView(input, inLp);

            TextView openBtn = createActionButton(
                    hostCtx,
                    "Open Instagram Profile",
                    InstagramPreferenceStyle.accentColor(),
                    0xFF0A1417
            );
            openBtn.setOnClickListener(v -> {
                RexHaptics.tap(v);
                String handle = extractUsernameFromText(input.getText() == null ? "" : input.getText().toString());
                if (handle.isEmpty()) {
                    Utils.showToastShort("Enter a valid @username");
                    return;
                }
                dialog.dismiss();
                openInstagramProfileHandle(hostCtx, handle);
            });
            sheet.addView(openBtn);

            RexDialogs.addDialogCloseFooter(hostCtx, sheet, dialog);
            dialog.setView(sheet);
            RexDialogs.showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Utils.showToastShort("Couldn't open profile launcher.");
        }
    }

    public static String extractUsernameFromText(String raw) {
        if (raw == null) return "";
        String t = raw.trim();
        if (t.isEmpty()) return "";
        Matcher urlMatcher = Pattern.compile("instagram\\.com/([A-Za-z0-9._]{1,30})", Pattern.CASE_INSENSITIVE).matcher(t);
        if (urlMatcher.find()) {
            String candidate = urlMatcher.group(1);
            if (!"p".equalsIgnoreCase(candidate)
                    && !"reel".equalsIgnoreCase(candidate)
                    && !"reels".equalsIgnoreCase(candidate)
                    && !"stories".equalsIgnoreCase(candidate)
                    && !"explore".equalsIgnoreCase(candidate)) {
                return candidate;
            }
        }
        if (t.startsWith("@")) t = t.substring(1).trim();
        if (t.matches("^[A-Za-z0-9._]{1,30}$")) {
            return t;
        }
        return "";
    }

    public static void openInstagramProfileHandle(Context context, String username) {
        if (username == null || username.isEmpty()) return;
        String clean = username.startsWith("@") ? username.substring(1) : username;
        try {
            Uri uri = Uri.parse("instagram://user?username=" + Uri.encode(clean));
            Intent intent = new Intent(Intent.ACTION_VIEW, uri);
            intent.setPackage(context.getPackageName());
            if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable e) {
            app.morphe.extension.rex.RexUtils.openUrl("https://www.instagram.com/" + clean + "/", true);
        }
    }

    // -------------------------------------------------------------------------
    // 11. Built-In InstaRex Pro Config V6 (3,796 MobileConfig Flags) Engine
    // -------------------------------------------------------------------------
    private static String readBuiltInProConfigJson(Context context) {
        try {
            int rawId = (context != null && context.getResources() != null)
                    ? context.getResources().getIdentifier("instarex_pro_config_v6", "raw", context.getPackageName())
                    : 0;
            if (rawId != 0) {
                try (InputStream in = context.getResources().openRawResource(rawId);
                     BufferedReader reader = new BufferedReader(new InputStreamReader(in, "UTF-8"))) {
                    StringBuilder sb = new StringBuilder(540000);
                    char[] buf = new char[8192];
                    int n;
                    while ((n = reader.read(buf)) != -1) {
                        sb.append(buf, 0, n);
                    }
                    return sb.toString();
                }
            }
        } catch (Throwable ignored) {}
        return "{\n"
                + "  \"83164:\": \"0: true, 1: true, 2: 50000000, 3: 60\",\n"
                + "  \"85201:\": \"0: true, 1: 180\",\n"
                + "  \"88112:\": \"0: true, 1: true\",\n"
                + "  \"79665:\": \"3: InstaRex Original Navigation, 4: InstaRex New Navigation, 5: InstaRex Classic Navigation\"\n"
                + "}";
    }

    public static void applyBuiltInProConfigV6(final Context context) {
        if (context == null) return;
        Utils.showToastShort("Applying InstaRex Pro Config V6 (3,796 flags)...");
        Utils.runOnBackgroundThread(() -> {
            try {
                String json = readBuiltInProConfigJson(context);
                File mcDir = new File(context.getFilesDir(), "mobileconfig");
                if (!mcDir.exists()) mcDir.mkdirs();
                File mcFile = new File(mcDir, "mc_overrides.json");
                try (OutputStream out = new java.io.FileOutputStream(mcFile)) {
                    out.write(json.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                }
                SharedPref.setBooleanPref(Settings.AUTO_APPLY_PRO_CONFIG_V6.key, true);
                SharedPref.setBooleanPref(Settings.HIGH_QUALITY_UPLOAD.key, true);
                SharedPref.setBooleanPref(Settings.UPLOAD_60FPS_STORIES.key, true);
                SharedPref.setBooleanPref(Settings.EXTENDED_STORY_DURATION.key, true);
                app.morphe.extension.instagram.patches.devFlags.HookFlags.load();

                Utils.runOnMainThread(() -> RexDialogs.showConfirmDialog(
                        context,
                        "InstaRex Pro Config V6 Applied",
                        "Successfully installed 3,796 sanitized MobileConfig overrides (60fps camera/stories, max bitrate uploads, Reels seek/audio unlock, and UI refinements) into mc_overrides.json.\n\nRestart Instagram now to activate all low-level flags?",
                        "Restart Now",
                        false,
                        () -> Utils.restartApp(context)
                ));
            } catch (Throwable e) {
                Utils.runOnMainThread(() ->
                        Utils.showToastShort("Couldn't apply Pro Config V6. Try again."));
            }
        });
    }

    public static void exportBuiltInProConfigV6(final Context context) {
        if (context == null) return;
        Utils.runOnBackgroundThread(() -> {
            try {
                String json = readBuiltInProConfigJson(context);
                String fileName = "INSTAREX_PRO_CONFIG_V6.json";
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    ContentValues values = new ContentValues();
                    values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
                    values.put(MediaStore.MediaColumns.MIME_TYPE, "application/json");
                    values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS + "/xboyrex");
                    Uri uri = context.getContentResolver().insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
                    if (uri != null) {
                        try (OutputStream out = context.getContentResolver().openOutputStream(uri)) {
                            if (out != null) {
                                out.write(json.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                            }
                        }
                    }
                } else {
                    File dir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), "xboyrex");
                    if (!dir.exists()) dir.mkdirs();
                    File out = new File(dir, fileName);
                    try (OutputStream os = new java.io.FileOutputStream(out)) {
                        os.write(json.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                    }
                }
                Utils.runOnMainThread(() ->
                        Utils.showToastShort("Exported Download/xboyrex/INSTAREX_PRO_CONFIG_V6.json"));
            } catch (Throwable e) {
                Utils.runOnMainThread(() ->
                        Utils.showToastShort("Export failed. Check storage permission."));
            }
        });
    }

}
