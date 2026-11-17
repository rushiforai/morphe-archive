/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;
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
        showVaultDialog(context, "file-text", "Saved Bios", KEY_BIOS, false);
    }

    public static void showSavedCaptionsDialog(Context context) {
        showVaultDialog(context, "scroll-text", "Saved Captions", KEY_CAPTIONS, false);
    }

    public static void showSavedProfilesDialog(Context context) {
        showVaultDialog(context, "bookmarks", "Saved Profiles", KEY_PROFILES, true);
    }

    public static void showWatchHistoryDialog(Context context) {
        showVaultDialog(context, "history", "Activity & Watch History", KEY_WATCH_HISTORY, true);
    }

    private static void showVaultDialog(
            final Context context,
            final String headerIconId,
            final String title,
            final String prefKey,
            final boolean openProfileOnTap
    ) {
        try {
            SharedPreferences sp = prefs(context);
            JSONArray arr = new JSONArray(sp.getString(prefKey, "[]"));

            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout root = RexDialogs.createDialogSheet(context, headerIconId, title);

            if (KEY_WATCH_HISTORY.equals(prefKey)) {
                LinearLayout storyLikesBtn = new LinearLayout(context);
                storyLikesBtn.setOrientation(LinearLayout.HORIZONTAL);
                storyLikesBtn.setGravity(Gravity.CENTER);
                int vPad = RexVectorIcons.dp(context, 12);
                storyLikesBtn.setPadding(vPad, vPad, vPad, vPad);
                GradientDrawable btnBg = new GradientDrawable();
                btnBg.setColor(RexDialogs.BRAND_CYAN);
                btnBg.setCornerRadius(RexVectorIcons.dp(context, 18));
                storyLikesBtn.setBackground(btnBg);

                final ImageView heartIcon = new ImageView(context);
                heartIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                heartIcon.setImageDrawable(RexIcon.getDrawable(context, "heart", 0xFF0A1417, 18, true));
                LinearLayout.LayoutParams hLp = new LinearLayout.LayoutParams(
                        RexVectorIcons.dp(context, 18), RexVectorIcons.dp(context, 18));
                hLp.setMarginEnd(RexVectorIcons.dp(context, 8));
                storyLikesBtn.addView(heartIcon, hLp);

                TextView btnLabel = new TextView(context);
                btnLabel.setText("Open 24h Story Likes Grid");
                btnLabel.setTextColor(0xFF0A1417);
                btnLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
                btnLabel.setTypeface(Typeface.DEFAULT_BOLD);
                storyLikesBtn.addView(btnLabel);

                LinearLayout.LayoutParams btnLp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                btnLp.bottomMargin = RexVectorIcons.dp(context, 14);
                storyLikesBtn.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    RexIcon.pulseIcon(heartIcon);
                    dialog.dismiss();
                    StoryLikeHistoryActivity.open(context);
                });
                root.addView(storyLikesBtn, btnLp);
            }

            ScrollView scroll = new ScrollView(context);
            LinearLayout list = new LinearLayout(context);
            list.setOrientation(LinearLayout.VERTICAL);

            if (arr.length() == 0) {
                TextView empty = new TextView(context);
                empty.setText("No saved items yet. Use the xboyrex Options menu on any profile, post, or reel to save items here.");
                empty.setTextColor(RexDialogs.TEXT_SECONDARY);
                empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
                empty.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 14), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 14));
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
                    card.setOrientation(LinearLayout.HORIZONTAL);
                    card.setGravity(Gravity.CENTER_VERTICAL);
                    int cPad = RexVectorIcons.dp(context, 14);
                    card.setPadding(cPad, cPad, cPad, cPad);
                    GradientDrawable cardBg = new GradientDrawable();
                    cardBg.setColor(RexDialogs.ELEVATED_SURFACE);
                    cardBg.setCornerRadius(RexVectorIcons.dp(context, 18));
                    cardBg.setStroke(Math.max(1, RexVectorIcons.dp(context, 1)), RexDialogs.BORDER_STROKE);
                    card.setBackground(cardBg);

                    final ImageView itemIcon = new ImageView(context);
                    itemIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                    String rowIconId = openProfileOnTap ? "user-round" : "edit";
                    itemIcon.setImageDrawable(RexIcon.getDrawable(context, rowIconId, RexDialogs.BRAND_CYAN, 20));
                    LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(
                            RexVectorIcons.dp(context, 20), RexVectorIcons.dp(context, 20));
                    iLp.setMarginEnd(RexVectorIcons.dp(context, 12));
                    card.addView(itemIcon, iLp);

                    LinearLayout textCol = new LinearLayout(context);
                    textCol.setOrientation(LinearLayout.VERTICAL);

                    TextView topRow = new TextView(context);
                    topRow.setText((u.isEmpty() ? "Saved Item" : "@" + u) + (d.isEmpty() ? "" : "  •  " + d));
                    topRow.setTextColor(RexDialogs.BRAND_CYAN);
                    topRow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
                    topRow.setTypeface(Typeface.DEFAULT_BOLD);
                    textCol.addView(topRow);

                    TextView bodyRow = new TextView(context);
                    bodyRow.setText(t);
                    bodyRow.setTextColor(RexDialogs.TEXT_PRIMARY);
                    bodyRow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
                    bodyRow.setPadding(0, RexVectorIcons.dp(context, 4), 0, 0);
                    textCol.addView(bodyRow);

                    card.addView(textCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

                    card.setOnClickListener(v -> {
                        RexHaptics.tap(v);
                        RexIcon.pulseIcon(itemIcon);
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
                            dialog.dismiss();
                            RexDialogs.showTextStudioDialog(context, title, u, t, l);
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

            if (arr.length() > 0) {
                TextView clearBtn = new TextView(context);
                clearBtn.setText("Clear All");
                clearBtn.setTextColor(RexDialogs.DESTRUCTIVE_RED);
                clearBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
                clearBtn.setTypeface(Typeface.DEFAULT_BOLD);
                clearBtn.setPadding(RexVectorIcons.dp(context, 14), RexVectorIcons.dp(context, 8),
                        RexVectorIcons.dp(context, 14), RexVectorIcons.dp(context, 8));
                clearBtn.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    sp.edit().putString(prefKey, "[]").apply();
                    Utils.showToastShort("Cleared " + title);
                    dialog.dismiss();
                });
                footer.addView(clearBtn);
            }

            TextView closeBtn = new TextView(context);
            closeBtn.setText("Close");
            closeBtn.setTextColor(RexDialogs.BRAND_CYAN);
            closeBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            closeBtn.setTypeface(Typeface.DEFAULT_BOLD);
            closeBtn.setPadding(RexVectorIcons.dp(context, 14), RexVectorIcons.dp(context, 8),
                    RexVectorIcons.dp(context, 14), RexVectorIcons.dp(context, 8));
            closeBtn.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
            });
            footer.addView(closeBtn);

            root.addView(footer);
            dialog.setView(root);
            RexDialogs.showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            Utils.showToastShort("Error opening vault: " + e.getMessage());
        }
    }
}
