/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import app.morphe.extension.instagram.patches.story.StoryLikeHistoryActivity;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Utils;

public final class RexVault {

    private static final String PREF_NAME = "rex_vault_storage";
    private static final String KEY_BIOS = "saved_bios_json";
    private static final String KEY_CAPTIONS = "saved_captions_json";
    private static final String KEY_PROFILES = "saved_profiles_json";
    private static final String KEY_WATCH_HISTORY = "watch_history_json";

    private RexVault() {}

    private static SharedPreferences prefs(Context context) {
        Context ctx = context != null ? context.getApplicationContext() : Utils.getContext();
        return ctx.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
    }

    public static void saveBio(Context context, String username, String bio) {
        if (bio == null || bio.trim().isEmpty()) {
            Utils.showToastShort("Bio is empty");
            return;
        }
        appendEntry(context, KEY_BIOS, username, bio.trim(), "");
        Utils.showToastShort("Saved bio for @" + (username == null ? "user" : username));
    }

    public static void saveCaption(Context context, String username, String caption, String link) {
        if (caption == null || caption.trim().isEmpty()) {
            Utils.showToastShort("Caption is empty");
            return;
        }
        appendEntry(context, KEY_CAPTIONS, username, caption.trim(), link == null ? "" : link);
        Utils.showToastShort("Caption saved to xboyrex Vault");
    }

    public static void saveProfile(Context context, String username, String fullName, String userId) {
        if (username == null || username.trim().isEmpty()) {
            Utils.showToastShort("Username unavailable");
            return;
        }
        String label = (fullName != null && !fullName.isEmpty() ? fullName + " " : "") + "(ID: " + (userId != null ? userId : "N/A") + ")";
        appendEntry(context, KEY_PROFILES, username.trim(), label, "https://www.instagram.com/" + username.trim() + "/");
        Utils.showToastShort("Added @" + username.trim() + " to Saved Profiles");
    }

    public static void recordWatchedMedia(Context context, String username, String summary, String link) {
        if (Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.DISABLE_WATCH_HISTORY))) {
            return;
        }
        if (username == null && (summary == null || summary.isEmpty())) return;
        appendEntry(context, KEY_WATCH_HISTORY, username == null ? "instagram" : username,
                summary == null ? "Viewed media" : summary, link == null ? "" : link);
    }

    private static void appendEntry(Context context, String key, String username, String text, String url) {
        try {
            SharedPreferences sp = prefs(context);
            String raw = sp.getString(key, "[]");
            JSONArray arr = new JSONArray(raw);
            JSONArray updated = new JSONArray();

            JSONObject item = new JSONObject();
            item.put("u", username == null ? "" : username);
            item.put("t", text == null ? "" : text);
            item.put("l", url == null ? "" : url);
            item.put("d", new SimpleDateFormat("dd MMM, hh:mm a", Locale.US).format(new Date()));
            updated.put(item);

            for (int i = 0; i < Math.min(arr.length(), 150); i++) {
                JSONObject existing = arr.optJSONObject(i);
                if (existing != null) {
                    if (KEY_PROFILES.equals(key) && username != null && username.equalsIgnoreCase(existing.optString("u"))) {
                        continue;
                    }
                    updated.put(existing);
                }
            }
            sp.edit().putString(key, updated.toString()).apply();
        } catch (Throwable ignored) {}
    }

    public static void showSavedBiosDialog(Context context) {
        showVaultDialog(context, "Saved Bios", KEY_BIOS, false);
    }

    public static void showSavedCaptionsDialog(Context context) {
        showVaultDialog(context, "Saved Captions", KEY_CAPTIONS, false);
    }

    public static void showSavedProfilesDialog(Context context) {
        showVaultDialog(context, "Saved Profiles", KEY_PROFILES, true);
    }

    public static void showWatchHistoryDialog(Context context) {
        showVaultDialog(context, "Watch & Story Likes History", KEY_WATCH_HISTORY, true);
    }

    private static void showVaultDialog(final Context context, final String title, final String prefKey, final boolean openProfileOnTap) {
        try {
            SharedPreferences sp = prefs(context);
            JSONArray arr = new JSONArray(sp.getString(prefKey, "[]"));

            LinearLayout root = new LinearLayout(context);
            root.setOrientation(LinearLayout.VERTICAL);
            int pad = RexVectorIcons.dp(context, 18);
            root.setPadding(pad, pad, pad, pad);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(0xFF121518);
            bg.setCornerRadius(RexVectorIcons.dp(context, 24));
            bg.setStroke(RexVectorIcons.dp(context, 1), 0x3388C2CE);
            root.setBackground(bg);

            TextView header = new TextView(context);
            header.setText(title);
            header.setTextColor(Color.WHITE);
            header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19);
            header.setTypeface(Typeface.DEFAULT_BOLD);
            header.setPadding(0, 0, 0, RexVectorIcons.dp(context, 12));
            root.addView(header);

            if (KEY_WATCH_HISTORY.equals(prefKey)) {
                TextView storyLikesBtn = new TextView(context);
                storyLikesBtn.setText("♥ Open 24h Story Likes Grid");
                storyLikesBtn.setTextColor(0xFF0A1417);
                storyLikesBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                storyLikesBtn.setTypeface(Typeface.DEFAULT_BOLD);
                storyLikesBtn.setGravity(Gravity.CENTER);
                int vPad = RexVectorIcons.dp(context, 12);
                storyLikesBtn.setPadding(vPad, vPad, vPad, vPad);
                GradientDrawable btnBg = new GradientDrawable();
                btnBg.setColor(0xFF9AD0DC);
                btnBg.setCornerRadius(RexVectorIcons.dp(context, 18));
                storyLikesBtn.setBackground(btnBg);
                LinearLayout.LayoutParams btnLp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                btnLp.bottomMargin = RexVectorIcons.dp(context, 14);
                storyLikesBtn.setOnClickListener(v -> StoryLikeHistoryActivity.open(context));
                root.addView(storyLikesBtn, btnLp);
            }

            ScrollView scroll = new ScrollView(context);
            LinearLayout list = new LinearLayout(context);
            list.setOrientation(LinearLayout.VERTICAL);

            if (arr.length() == 0) {
                TextView empty = new TextView(context);
                empty.setText("No saved items yet. Use the xboyrex Options menu on any profile, post, or reel to save items here.");
                empty.setTextColor(0xFF9AA3AE);
                empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                empty.setPadding(0, RexVectorIcons.dp(context, 16), 0, RexVectorIcons.dp(context, 16));
                list.addView(empty);
            } else {
                for (int i = 0; i < arr.length(); i++) {
                    final JSONObject obj = arr.optJSONObject(i);
                    if (obj == null) continue;
                    final String u = obj.optString("u", "");
                    final String t = obj.optString("t", "");
                    final String l = obj.optString("l", "");
                    final String d = obj.optString("d", "");

                    LinearLayout card = new LinearLayout(context);
                    card.setOrientation(LinearLayout.VERTICAL);
                    int cPad = RexVectorIcons.dp(context, 12);
                    card.setPadding(cPad, cPad, cPad, cPad);
                    GradientDrawable cardBg = new GradientDrawable();
                    cardBg.setColor(0xFF1C2226);
                    cardBg.setCornerRadius(RexVectorIcons.dp(context, 14));
                    card.setBackground(cardBg);

                    TextView topRow = new TextView(context);
                    topRow.setText((u.isEmpty() ? "Saved Item" : "@" + u) + (d.isEmpty() ? "" : "  •  " + d));
                    topRow.setTextColor(0xFF88C2CE);
                    topRow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                    topRow.setTypeface(Typeface.DEFAULT_BOLD);
                    card.addView(topRow);

                    TextView bodyRow = new TextView(context);
                    bodyRow.setText(t);
                    bodyRow.setTextColor(Color.WHITE);
                    bodyRow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                    bodyRow.setPadding(0, RexVectorIcons.dp(context, 4), 0, 0);
                    card.addView(bodyRow);

                    card.setOnClickListener(v -> {
                        if (openProfileOnTap && !u.isEmpty()) {
                            Utils.setClipboard("@" + u);
                            try {
                                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.instagram.com/" + u + "/"));
                                intent.setPackage(context.getPackageName());
                                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                context.startActivity(intent);
                            } catch (Throwable ignored) {
                                RexUtils.openUrl("https://www.instagram.com/" + u + "/", true);
                            }
                        } else {
                            Utils.setClipboard(t);
                            Utils.showToastShort("Copied to clipboard");
                        }
                    });

                    LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    lp.bottomMargin = RexVectorIcons.dp(context, 8);
                    list.addView(card, lp);
                }
            }

            scroll.addView(list);
            LinearLayout.LayoutParams scrollLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
            root.addView(scroll, scrollLp);

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.END);
            footer.setPadding(0, RexVectorIcons.dp(context, 12), 0, 0);

            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            if (arr.length() > 0) {
                TextView clearBtn = new TextView(context);
                clearBtn.setText("Clear All");
                clearBtn.setTextColor(0xFFFF6B6B);
                clearBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                clearBtn.setTypeface(Typeface.DEFAULT_BOLD);
                clearBtn.setPadding(RexVectorIcons.dp(context, 14), RexVectorIcons.dp(context, 8),
                        RexVectorIcons.dp(context, 14), RexVectorIcons.dp(context, 8));
                clearBtn.setOnClickListener(v -> {
                    sp.edit().putString(prefKey, "[]").apply();
                    Utils.showToastShort("Cleared " + title);
                    dialog.dismiss();
                });
                footer.addView(clearBtn);
            }

            TextView closeBtn = new TextView(context);
            closeBtn.setText("Close");
            closeBtn.setTextColor(0xFF88C2CE);
            closeBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            closeBtn.setTypeface(Typeface.DEFAULT_BOLD);
            closeBtn.setPadding(RexVectorIcons.dp(context, 14), RexVectorIcons.dp(context, 8),
                    RexVectorIcons.dp(context, 14), RexVectorIcons.dp(context, 8));
            closeBtn.setOnClickListener(v -> dialog.dismiss());
            footer.addView(closeBtn);

            root.addView(footer);
            dialog.setView(root);
            RexDialogs.showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            Utils.showToastShort("Error opening vault: " + e.getMessage());
        }
    }
}
