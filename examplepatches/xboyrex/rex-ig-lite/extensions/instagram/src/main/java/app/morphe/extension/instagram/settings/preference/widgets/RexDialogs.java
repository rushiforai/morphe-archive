/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.net.Uri;
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
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.instagram.common.session.UserSession;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.db.RexMessageDb;
import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.patches.dm.SavedMessagesHook;
import app.morphe.extension.instagram.patches.download.DownloadUtils;
import app.morphe.extension.instagram.patches.userprofile.ProfilePictureViewer;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.instagram.theme.MaterialYouTheme;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.rex.downloader.MediaType;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public final class RexDialogs {

    private RexDialogs() {}

    public static void showNotificationCenterDialog(final Context context) {
        final String[] options = {"Filter by Notification Type", "Filter by Keywords"};
        new AlertDialog.Builder(context)
                .setTitle("Notification Center")
                .setItems(options, (dialog, which) -> {
                    if (which == 0) RexRuntimeFeatures.showNotificationTypeFilterDialog(context);
                    else if (which == 1) RexRuntimeFeatures.showNotificationKeywordFilterDialog(context);
                })
                .show();
    }

    public static void showAppLanguagePicker(final Context context) {
        final String[] options = {"Instagram App Language", "Translator Target Language"};
        new AlertDialog.Builder(context)
                .setTitle("App Language & Translator")
                .setItems(options, (dialog, which) -> {
                    if (which == 1) {
                        RexRuntimeFeatures.showTranslatorLanguagePicker(context, null);
                        return;
                    }
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                        try {
                            Intent intent = new Intent(android.provider.Settings.ACTION_APP_LOCALE_SETTINGS);
                            intent.setData(Uri.fromParts("package", context.getPackageName(), null));
                            if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                            context.startActivity(intent);
                        } catch (Throwable error) {
                            Utils.showToastShort("Unable to open Android app language settings: " + error.getMessage());
                        }
                    } else {
                        new AlertDialog.Builder(context)
                                .setTitle("Android Version Required")
                                .setMessage("Per-app language settings are available on Android 13 and newer. You can still change the in-app translator language from this menu.")
                                .setPositiveButton(android.R.string.ok, null)
                                .show();
                    }
                })
                .show();
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
     * WindowManager FLAG_BLUR_BEHIND) and cleans it up automatically when the dialog dismisses.
     */
    public static void attachBlurBehind(final Dialog dialog, Context context) {
        if (dialog == null) return;
        final Activity host = resolveActivity(context);
        try {
            Window w = dialog.getWindow();
            if (w != null) {
                w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                w.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
                WindowManager.LayoutParams lp = w.getAttributes();
                lp.dimAmount = 0.52f;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    w.addFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
                    lp.setBlurBehindRadius(42);
                }
                w.setAttributes(lp);
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && host != null && host.getWindow() != null) {
                final View decor = host.getWindow().getDecorView();
                if (decor != null) {
                    decor.setRenderEffect(RenderEffect.createBlurEffect(26f, 26f, Shader.TileMode.CLAMP));
                    dialog.setOnDismissListener(d -> {
                        try {
                            decor.setRenderEffect(null);
                        } catch (Throwable ignored) {}
                    });
                }
            }
        } catch (Throwable ignored) {}
    }

    public static void showBlurredDialog(Context context, Dialog dialog) {
        if (dialog == null) return;
        attachBlurBehind(dialog, context);
        dialog.show();
    }

    // -------------------------------------------------------------------------
    // 1. Home 10-Item Quick Action Menu (Image 4)
    // -------------------------------------------------------------------------
    public static void showHomeQuickMenu(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout card = new LinearLayout(context);
            card.setOrientation(LinearLayout.VERTICAL);
            int pad = RexVectorIcons.dp(context, 10);
            card.setPadding(pad, pad, pad, pad);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(0xF2121518);
            bg.setCornerRadius(RexVectorIcons.dp(context, 22));
            bg.setStroke(RexVectorIcons.dp(context, 1), 0x3388C2CE);
            card.setBackground(bg);

            boolean ghostOn = Pref.getTurnOnAllGhostModes();
            boolean darkOn = Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.AMOLED_THEME)) || MaterialYouTheme.isAmoledEnabled();
            boolean dndOn = Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.DND_MODE_ENABLED));
            int deletedCount = getDeletedMessagesCount(context);

            addIconMenuRow(context, card, "hexagon", "xboyrex Settings", () -> {
                dialog.dismiss();
                FragmentHook.startSettings();
            });
            addIconMenuRow(context, card, "ghost", "Ghost Mode: (" + (ghostOn ? "Enabled" : "Disabled") + ")", () -> {
                boolean next = !Pref.getTurnOnAllGhostModes();
                Pref.setTurnOnAllGhostModes(next);
                Utils.showToastShort("Ghost Mode: " + (next ? "Enabled" : "Disabled"));
                dialog.dismiss();
            });
            addIconMenuRow(context, card, "scissors", "Long Video Splitter", () -> {
                dialog.dismiss();
                RexRuntimeFeatures.showVideoSplitterDialog(context);
            });
            addIconMenuRow(context, card, "sun", "Dark Mode: (" + (darkOn ? "Enabled" : "Disabled") + ")", () -> {
                boolean next = !Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.AMOLED_THEME));
                SharedPref.setBooleanPref(Settings.AMOLED_THEME.key, next);
                Utils.showToastShort("AMOLED Dark Mode: " + (next ? "Enabled" : "Disabled"));
                dialog.dismiss();
            });
            addIconMenuRow(context, card, "code", "Developer Options", () -> {
                dialog.dismiss();
                showDevWarningDialog(context, () -> FragmentHook.startFragment(Constants.REX_FRAGMENT_DEV_OPTIONS));
            });
            addIconMenuRow(context, card, "refresh", "Restart App", () -> {
                dialog.dismiss();
                Utils.restartApp(context);
            });
            addIconMenuRow(context, card, "bell_off", "DND Mode: (" + (dndOn ? "Enabled" : "Disabled") + ")", () -> {
                boolean next = !Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.DND_MODE_ENABLED));
                SharedPref.setBooleanPref(Settings.DND_MODE_ENABLED.key, next);
                Utils.showToastShort("DND Mode: " + (next ? "Enabled" : "Disabled"));
                dialog.dismiss();
            });
            addIconMenuRow(context, card, "history", "Watch History", () -> {
                dialog.dismiss();
                RexVault.showWatchHistoryDialog(context);
            });
            addIconMenuRow(context, card, "people", "Saved Profiles", () -> {
                dialog.dismiss();
                RexVault.showSavedProfilesDialog(context);
            });
            addIconMenuRow(context, card, "chat_x", "Deleted Messages (" + deletedCount + ")", () -> {
                dialog.dismiss();
                SavedMessagesHook.openDeletedMessages(context);
            });

            ScrollView scroll = new ScrollView(context);
            scroll.addView(card);
            dialog.setView(scroll);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showHomeQuickMenu failure", e);
            FragmentHook.startSettings();
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
    // 2. Profile 10-Item Options Popup (Image 3)
    // -------------------------------------------------------------------------
    public static void showProfilePopup(final Context context, final UserData userData, final Callable<String> refreshUrl) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout card = new LinearLayout(context);
            card.setOrientation(LinearLayout.VERTICAL);
            int pad = RexVectorIcons.dp(context, 10);
            card.setPadding(pad, pad, pad, pad);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(0xF2121518);
            bg.setCornerRadius(RexVectorIcons.dp(context, 22));
            bg.setStroke(RexVectorIcons.dp(context, 1), 0x3388C2CE);
            card.setBackground(bg);

            final String username = safeCall(() -> userData.getUsername(), "");
            final String fullName = safeCall(() -> userData.getFullName(), "");
            final String userId = safeCall(() -> userData.getUserId(), "");
            final String bio = safeCall(() -> userData.getBio(), "");
            final boolean isPrivate = safeBool(() -> userData.isPrivate(), false);
            String[] counts = extractFollowerFollowingCounts(context, userData);
            final String followersStr = counts[0];
            final String followingStr = counts[1];

            addIconMenuRow(context, card, "doc", "Copy Bio", () -> {
                dialog.dismiss();
                if (bio != null && !bio.isEmpty()) {
                    Utils.setClipboard(bio);
                    Utils.showToastShort("Bio copied to clipboard");
                } else {
                    Utils.showToastShort("Bio is empty");
                }
            });
            addIconMenuRow(context, card, "user", "View Profile Picture", () -> {
                dialog.dismiss();
                ProfilePictureViewer.show(context, userData, refreshUrl);
            });
            addIconMenuRow(context, card, "bookmark", "Save Bio", () -> {
                dialog.dismiss();
                RexVault.saveBio(context, username, bio);
            });
            addIconMenuRow(context, card, "translate", "Translate Bio", () -> {
                dialog.dismiss();
                RexRuntimeFeatures.translateText(context, bio, "Bio");
            });
            addIconMenuRow(context, card, "at", "Copy Username", () -> {
                dialog.dismiss();
                if (username != null && !username.isEmpty()) {
                    Utils.setClipboard(username);
                    Utils.showToastShort("Copied @" + username);
                }
            });
            addIconMenuRow(context, card, "id_card", "Copy User ID", () -> {
                dialog.dismiss();
                if (userId != null && !userId.isEmpty()) {
                    Utils.setClipboard(userId);
                    Utils.showToastShort("Copied User ID: " + userId);
                }
            });
            addIconMenuRow(context, card, "lock", isPrivate ? "Private Profile" : "Public Profile", () -> {
                dialog.dismiss();
                String profileLink = "https://www.instagram.com/" + username + "/";
                Utils.setClipboard(profileLink);
                Utils.showToastShort((isPrivate ? "Private Profile" : "Public Profile") + " • Link copied");
            });
            addIconMenuRow(context, card, "people", "Followers: " + followersStr, () -> {
                dialog.dismiss();
                Utils.setClipboard(followersStr);
                Utils.showToastShort("Followers: " + followersStr + " (Copied)");
            });
            addIconMenuRow(context, card, "people", "Following: " + followingStr, () -> {
                dialog.dismiss();
                Utils.setClipboard(followingStr);
                Utils.showToastShort("Following: " + followingStr + " (Copied)");
            });
            addIconMenuRow(context, card, "user_plus", "Add to Saved Profiles", () -> {
                dialog.dismiss();
                RexVault.saveProfile(context, username, fullName, userId);
            });

            ScrollView scroll = new ScrollView(context);
            scroll.addView(card);
            dialog.setView(scroll);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showProfilePopup failure", e);
            Utils.showToastShort(e.getMessage());
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
    // 3. Post / Reel 12-Item Options Sheet (Images 2 & 19)
    // -------------------------------------------------------------------------
    public static void showPostOptionsSheet(
            final Context context,
            final UserSession userSession,
            final Object mediaObject,
            final int currentMediaIndex
    ) {
        try {
            final int pos = Math.max(0, currentMediaIndex);
            final MediaData mediaData = new MediaData(mediaObject, userSession);
            final String username = safeCall(() -> mediaData.getUserData().getUsername(), "instagram");
            final String rawCaption = safeCall(() -> mediaData.getDescriptionText(), "");
            final String shortcode = safeCall(() -> mediaData.getShortcode(), "");
            final String postLink = shortcode.isEmpty() ? "" : ("https://www.instagram.com/p/" + shortcode + "/");

            RexVault.recordWatchedMedia(context, username, rawCaption.isEmpty() ? ("Post " + shortcode) : rawCaption, postLink);

            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout card = new LinearLayout(context);
            card.setOrientation(LinearLayout.VERTICAL);
            int pad = RexVectorIcons.dp(context, 12);
            card.setPadding(pad, pad, pad, pad);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(0xF4101316);
            bg.setCornerRadius(RexVectorIcons.dp(context, 24));
            bg.setStroke(RexVectorIcons.dp(context, 1), 0x3388C2CE);
            card.setBackground(bg);

            String[] items = {
                    "Cover Image to Text (OCR)",
                    "Download",
                    "Download Cover Photo",
                    "Download Audio (.mp3)",
                    "Open by Phone Apps",
                    "Repost as IG Post",
                    "Repost as IG Story",
                    "Repost as WhatsApp Story",
                    "Copy Caption",
                    "Save Caption",
                    "Translate Caption",
                    "Copy Hashtags"
            };

            for (final String option : items) {
                TextView row = new TextView(context);
                row.setText(option);
                row.setTextColor(Color.WHITE);
                row.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
                int hPad = RexVectorIcons.dp(context, 16);
                int vPad = RexVectorIcons.dp(context, 13);
                row.setPadding(hPad, vPad, hPad, vPad);
                row.setOnClickListener(v -> {
                    dialog.dismiss();
                    handlePostOptionClick(context, userSession, mediaObject, mediaData, pos, username, rawCaption, postLink, option);
                });
                card.addView(row);
            }

            ScrollView scroll = new ScrollView(context);
            scroll.addView(card);
            dialog.setView(scroll);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showPostOptionsSheet failure", e);
            Utils.showToastShort("Options error: " + e.getMessage());
        }
    }

    private static void handlePostOptionClick(
            Context context,
            UserSession userSession,
            Object mediaObject,
            MediaData mediaData,
            int pos,
            String username,
            String rawCaption,
            String postLink,
            String option
    ) {
        try {
            switch (option) {
                case "Cover Image to Text (OCR)":
                    RexRuntimeFeatures.extractOcrFromMedia(context, mediaData, pos);
                    break;
                case "Download":
                    DownloadUtils.showDownloadOptions(context, userSession, mediaObject, pos);
                    break;
                case "Download Cover Photo":
                    DownloadUtils.downloadMedia(context, mediaData, pos, MediaType.IMAGE);
                    break;
                case "Download Audio (.mp3)":
                    DownloadUtils.downloadMedia(context, mediaData, pos, MediaType.AUDIO);
                    break;
                case "Open by Phone Apps": {
                    MediaData current = mediaData.getMediaAt(pos);
                    ActivityHook.handleUrlIntent(current.isVideo(), current.getMediaLink());
                    break;
                }
                case "Repost as IG Post":
                    RexRuntimeFeatures.repostMedia(context, mediaData, pos, "IG_POST");
                    break;
                case "Repost as IG Story":
                    RexRuntimeFeatures.repostMedia(context, mediaData, pos, "IG_STORY");
                    break;
                case "Repost as WhatsApp Story":
                    RexRuntimeFeatures.repostMedia(context, mediaData, pos, "WHATSAPP");
                    break;
                case "Copy Caption": {
                    String cleaned = RexRuntimeFeatures.stripHashtagsIfConfigured(rawCaption);
                    if (cleaned == null || cleaned.isEmpty()) {
                        Utils.showToastShort("Caption is empty");
                    } else {
                        Utils.setClipboard(cleaned);
                        Utils.showToastShort("Caption copied to clipboard");
                    }
                    break;
                }
                case "Save Caption":
                    RexVault.saveCaption(context, username, rawCaption, postLink);
                    break;
                case "Translate Caption":
                    RexRuntimeFeatures.translateText(context, rawCaption, "Caption");
                    break;
                case "Copy Hashtags": {
                    String tags = RexRuntimeFeatures.extractHashtags(rawCaption);
                    if (tags.isEmpty()) {
                        Utils.showToastShort("No hashtags found in caption");
                    } else {
                        Utils.setClipboard(tags);
                        Utils.showToastShort("Copied hashtags: " + tags);
                    }
                    break;
                }
            }
        } catch (Throwable e) {
            Logger.printException(() -> "handlePostOptionClick error", e);
            Utils.showToastShort(e.getMessage());
        }
    }

    // -------------------------------------------------------------------------
    // 4. Changelogs Dialog (Image 1)
    // -------------------------------------------------------------------------
    public static void showChangelogDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout root = new LinearLayout(context);
            root.setOrientation(LinearLayout.VERTICAL);
            int pad = RexVectorIcons.dp(context, 22);
            root.setPadding(pad, pad, pad, pad);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(0xF4121518);
            bg.setCornerRadius(RexVectorIcons.dp(context, 26));
            bg.setStroke(RexVectorIcons.dp(context, 1), 0x3388C2CE);
            root.setBackground(bg);

            TextView title = new TextView(context);
            title.setText("Changelogs");
            title.setTextColor(Color.WHITE);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
            title.setTypeface(Typeface.DEFAULT_BOLD);
            root.addView(title);

            TextView meta = new TextView(context);
            meta.setText("Release Date: 14/11/2026\n" +
                    "Base: 452.1.0.53.64 / Universal\n" +
                    "Version: 3.13.0 (Liquid Glass Release)");
            meta.setTextColor(0xFFD5DEE5);
            meta.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            meta.setPadding(0, RexVectorIcons.dp(context, 10), 0, RexVectorIcons.dp(context, 14));
            root.addView(meta);

            ScrollView scroll = new ScrollView(context);
            TextView body = new TextView(context);
            body.setText(
                    "Added: Auto Mark as Seen after Reply in DMs — No need to manually mark DMs as seen.\n" +
                    "Added: Ability to view Last Seen status with exact date and time in DMs.\n" +
                    "Added: Anti-Delete Messages (Realtime local message vault).\n" +
                    "Added: Mark as Seen on Reaction & Secret Voice Note listener.\n" +
                    "Added: Quick Settings Shortcut — Top bar Hexagon (⬡) opens 10-item Quick Action Menu.\n" +
                    "Added: Reel Download & xboyrex Options icons directly in Reels and Feed UFI rows.\n" +
                    "Added: Story 24h Like History Grid & Interactive '@N mentions' Story Header Pill.\n" +
                    "Added: Zero-prompt MediaStore Direct Downloader (works out of the box on Redmi/HyperOS).\n" +
                    "Added: Real-time Gaussian Background Blur across all popups, sheets, and dialogs.\n" +
                    "Added: SakuraTunes-style Liquid Glass About screen with dual Music & Black Instagram badges.\n" +
                    "Added: Private Screen Mode dimmer with live opacity slider & Notification Keyword filter.\n" +
                    "Fixed: Meta re-signed APK certificate trust checks & deep link routing."
            );
            body.setTextColor(0xFFCFD8DF);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            body.setLineSpacing(RexVectorIcons.dp(context, 3), 1.0f);
            scroll.addView(body);
            root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.END);
            footer.setPadding(0, RexVectorIcons.dp(context, 14), 0, 0);

            TextView close = new TextView(context);
            close.setText("Close");
            close.setTextColor(Color.WHITE);
            close.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            close.setTypeface(Typeface.DEFAULT_BOLD);
            int p = RexVectorIcons.dp(context, 10);
            close.setPadding(p, p, p, p);
            close.setOnClickListener(v -> dialog.dismiss());
            footer.addView(close);
            root.addView(footer);

            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable ignored) {}
    }

    // -------------------------------------------------------------------------
    // 5. Support Developer Dialog (Image 18)
    // -------------------------------------------------------------------------
    public static void showSupportDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout root = new LinearLayout(context);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setGravity(Gravity.CENTER_HORIZONTAL);
            int pad = RexVectorIcons.dp(context, 22);
            root.setPadding(pad, pad, pad, pad);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(0xF4121518);
            bg.setCornerRadius(RexVectorIcons.dp(context, 26));
            bg.setStroke(RexVectorIcons.dp(context, 1), 0x3388C2CE);
            root.setBackground(bg);

            TextView title = new TextView(context);
            title.setText("Support Developer");
            title.setTextColor(Color.WHITE);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19);
            title.setTypeface(Typeface.DEFAULT_BOLD);
            title.setGravity(Gravity.CENTER);
            root.addView(title);

            TextView body = new TextView(context);
            body.setText(
                    "We're dedicated to providing a high-quality, reliable, and continuously improving Liquid Glass experience through xboyrex.\n\n" +
                    "Your support helps us maintain updates, implement new features, fix bugs, and ensure long-term development.\n\n" +
                    "If you've found value in xboyrex, please consider starring our repositories on GitHub or joining our community channels.\n\n" +
                    "Thank you for being part of our journey."
            );
            body.setTextColor(0xFFD5DEE5);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            body.setGravity(Gravity.CENTER);
            body.setPadding(0, RexVectorIcons.dp(context, 14), 0, RexVectorIcons.dp(context, 18));
            root.addView(body);

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.END);
            footer.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            int p = RexVectorIcons.dp(context, 12);
            TextView close = new TextView(context);
            close.setText("Close");
            close.setTextColor(0xFF9AA3AE);
            close.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            close.setTypeface(Typeface.DEFAULT_BOLD);
            close.setPadding(p, p, p, p);
            close.setOnClickListener(v -> dialog.dismiss());
            footer.addView(close);

            TextView star = new TextView(context);
            star.setText("Star on GitHub");
            star.setTextColor(0xFF88C2CE);
            star.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            star.setTypeface(Typeface.DEFAULT_BOLD);
            star.setPadding(p, p, p, p);
            star.setOnClickListener(v -> {
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
    // 6. Developer Options Warning Dialog (Image 9)
    // -------------------------------------------------------------------------
    public static void showDevWarningDialog(final Context context, final Runnable onProceed) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout root = new LinearLayout(context);
            root.setOrientation(LinearLayout.VERTICAL);
            int pad = RexVectorIcons.dp(context, 22);
            root.setPadding(pad, pad, pad, pad);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(0xF4121518);
            bg.setCornerRadius(RexVectorIcons.dp(context, 26));
            bg.setStroke(RexVectorIcons.dp(context, 1), 0x3388C2CE);
            root.setBackground(bg);

            TextView title = new TextView(context);
            title.setText("⚠️ Warning!");
            title.setTextColor(Color.WHITE);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19);
            title.setTypeface(Typeface.DEFAULT_BOLD);
            root.addView(title);

            TextView body = new TextView(context);
            body.setText(
                    "You're about to enter Developer Options — This is only for advanced users. Changing settings here without proper knowledge may cause the app to misbehave or crash.\n\n" +
                    "🛠️ Proceed only if you're sure. The developer is not responsible for any issues caused.\n\n" +
                    "❌ Don't blame the developer if something goes wrong.\n\n" +
                    "✅ Use with caution and at your own risk."
            );
            body.setTextColor(0xFFD5DEE5);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            body.setPadding(0, RexVectorIcons.dp(context, 12), 0, RexVectorIcons.dp(context, 16));
            root.addView(body);

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.END);

            int p = RexVectorIcons.dp(context, 12);
            TextView cancel = new TextView(context);
            cancel.setText("Cancel");
            cancel.setTextColor(0xFF9AA3AE);
            cancel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            cancel.setTypeface(Typeface.DEFAULT_BOLD);
            cancel.setPadding(p, p, p, p);
            cancel.setOnClickListener(v -> dialog.dismiss());
            footer.addView(cancel);

            TextView proceed = new TextView(context);
            proceed.setText("Proceed");
            proceed.setTextColor(0xFF88C2CE);
            proceed.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            proceed.setTypeface(Typeface.DEFAULT_BOLD);
            proceed.setPadding(p, p, p, p);
            proceed.setOnClickListener(v -> {
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

    private static void addIconMenuRow(Context context, LinearLayout parent, String iconType, String label, Runnable onClick) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int hPad = RexVectorIcons.dp(context, 14);
        int vPad = RexVectorIcons.dp(context, 11);
        row.setPadding(hPad, vPad, hPad, vPad);

        ImageView icon = new ImageView(context);
        int iconPx = RexVectorIcons.dp(context, 22);
        icon.setImageDrawable(RexVectorIcons.createMenuIcon(context, iconType, 22, Color.WHITE));
        LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(iconPx, iconPx);
        iLp.setMarginEnd(RexVectorIcons.dp(context, 14));
        row.addView(icon, iLp);

        TextView text = new TextView(context);
        text.setText(label);
        text.setTextColor(Color.WHITE);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        row.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        row.setOnClickListener(v -> {
            if (onClick != null) onClick.run();
        });
        parent.addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
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
}
