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
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.rex.sharedPreference.SharedPref;
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
        String[] langs = {"English", "Hindi", "Spanish", "Russian", "Portuguese", "Arabic", "Indonesian", "Turkish", "Japanese", "Korean", "French", "German"};
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

    public static void showEmojiTypePicker(final Context context, final Runnable onUpdated) {
        String[] emojis = {"iOS 17.4 Emoji", "System Default", "Twemoji", "OpenMoji", "Blobmoji"};
        showSingleChoiceDialog(context, "Choose Emoji Type", emojis,
                SharedPref.getStringPref(Settings.CHOOSE_EMOJI_TYPE), chosen -> {
                    SharedPref.setStringPref(Settings.CHOOSE_EMOJI_TYPE.key, chosen);
                    Utils.showToastShort("Emoji Type: " + chosen);
                    if (onUpdated != null) onUpdated.run();
                });
    }

    public static void showFontTypePicker(final Context context, final Runnable onUpdated) {
        String[] fonts = {"System Default", "iOS San Francisco", "Instagram Sans", "Google Sans", "Custom .TTF / .OTF Font"};
        showSingleChoiceDialog(context, "Choose Font Type", fonts,
                SharedPref.getStringPref(Settings.CHOOSE_FONT_TYPE), chosen -> {
                    SharedPref.setStringPref(Settings.CHOOSE_FONT_TYPE.key, chosen);
                    boolean sys = !"Instagram Sans".equals(chosen);
                    app.morphe.extension.instagram.patches.customise.font.FontStorage.setUseSystemFont(sys);
                    Utils.showToastShort("Font Type: " + chosen);
                    if (onUpdated != null) onUpdated.run();
                });
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
    // 6. Real-Time Translator (Bio & Caption)
    // -------------------------------------------------------------------------
    private static String languageCodeFor(String languageName) {
        if (languageName == null) return "en";
        switch (languageName.toLowerCase()) {
            case "hindi": return "hi";
            case "spanish": return "es";
            case "russian": return "ru";
            case "portuguese": return "pt";
            case "arabic": return "ar";
            case "indonesian": return "id";
            case "turkish": return "tr";
            case "japanese": return "ja";
            case "korean": return "ko";
            case "french": return "fr";
            case "german": return "de";
            default: return "en";
        }
    }

    public static void translateText(final Context context, final String text, final String label) {
        if (text == null || text.trim().isEmpty()) {
            Utils.showToastShort(label + " is empty");
            return;
        }
        final String targetLangName = SharedPref.getStringPref(Settings.TRANSLATOR_LANGUAGE);
        final String tl = languageCodeFor(targetLangName);
        Utils.showToastShort("Translating to " + targetLangName + "...");

        Utils.runOnBackgroundThread(() -> {
            String translated = null;
            try {
                String urlStr = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl="
                        + URLEncoder.encode(tl, "UTF-8") + "&dt=t&q=" + URLEncoder.encode(text.trim(), "UTF-8");
                HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
                conn.setConnectTimeout(10000);
                conn.setReadTimeout(10000);
                conn.setRequestProperty("User-Agent", "Mozilla/5.0");
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
                    StringBuilder sb = new StringBuilder();
                    String line;
                    while ((line = reader.readLine()) != null) sb.append(line);
                    JSONArray outer = new JSONArray(sb.toString());
                    JSONArray sentences = outer.optJSONArray(0);
                    if (sentences != null) {
                        StringBuilder out = new StringBuilder();
                        for (int i = 0; i < sentences.length(); i++) {
                            JSONArray seg = sentences.optJSONArray(i);
                            if (seg != null && seg.length() > 0) {
                                out.append(seg.optString(0, ""));
                            }
                        }
                        translated = out.toString().trim();
                    }
                }
            } catch (Throwable ignored) {}

            final String resultText = (translated != null && !translated.isEmpty()) ? translated : text;
            Utils.runOnMainThread(() -> {
                RexDialogs.showTextStudioDialog(
                        context,
                        "Translated " + label + " (" + targetLangName + ")",
                        "",
                        resultText,
                        ""
                );
            });
        });
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
}
