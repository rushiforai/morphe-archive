/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 */
package app.morphe.extension.instagram.patches.userprofile;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.rex.ObjectBrowser;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.instagram.entity.InstagramButton;
import app.morphe.extension.instagram.entity.InstagramButtonStyleEnum;
import app.morphe.extension.instagram.entity.ProfileInfo;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.ui.RexDialogs;
import app.morphe.extension.instagram.ui.RexVectorIcons;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.ui.Dim;

import com.instagram.igds.components.button.IgdsButton;

public class ProfileMoreOption {

    private static final Pattern BIO_LINK = Pattern.compile(
            "(?:https?://)?(?:[\\w-]+\\.)+[a-z]{2,}(?:/[^\\s]*)?",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern COUNT_PREFIX = Pattern.compile("^([0-9][0-9.,KMBkmb]*)\\s+(followers|following)\\b", Pattern.CASE_INSENSITIVE);

    public static void moreOptionsDailogueBox(Context context, UserData userData) {
        try {
            Activity activity = RexDialogs.resolveActivity(context);
            Context ctx = activity != null ? activity : context;

            LinearLayout card = new LinearLayout(ctx);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setBackground(RexDialogs.roundedCardBackground(ctx, 0xFF0E1114, 0xFF232C31, 22f));
            card.setPadding(0, RexDialogs.dp(ctx, 10), 0, RexDialogs.dp(ctx, 10));

            Dialog dialog = new Dialog(ctx);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            dialog.setContentView(card);
            dialog.setCancelable(true);
            dialog.setCanceledOnTouchOutside(true);

            Window window = dialog.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                WindowManager.LayoutParams lp = window.getAttributes();
                lp.gravity = Gravity.END | Gravity.TOP;
                lp.y = RexDialogs.dp(ctx, 56);
                lp.x = RexDialogs.dp(ctx, 10);
                lp.width = RexDialogs.dp(ctx, 258);
                lp.height = WindowManager.LayoutParams.WRAP_CONTENT;
                window.setAttributes(lp);
            }
            RexDialogs.attachBlurBehind(dialog, ctx);

            String username = safe(() -> userData.getUsername(), "user");
            String fullName = safe(() -> userData.getFullName(), "");
            String userId = safe(() -> userData.getUserId(), "");
            String bio = safe(() -> userData.getBio(), "");

            String[] scraped = scrapeProfileStatsFromViewTree(activity);
            String followersDisplay = scraped[0];
            String followingDisplay = scraped[1];
            boolean isPrivateAccount = "true".equals(scraped[2]);

            card.addView(RexDialogs.createPopupMenuItem(ctx, RexVectorIcons.IC_DOC_BIO, "Copy Bio", () -> {
                dialog.dismiss();
                copyOrToast(bio);
            }));

            card.addView(RexDialogs.createPopupMenuItem(ctx, RexVectorIcons.IC_USER_CIRCLE, "View Profile Picture", () -> {
                dialog.dismiss();
                try {
                    ProfilePictureViewer.show(ctx, userData);
                } catch (Exception e) {
                    Utils.showToastShort(e.getMessage());
                }
            }));

            card.addView(RexDialogs.createPopupMenuItem(ctx, RexVectorIcons.IC_BOOKMARK_EDIT, "Save Bio", () -> {
                dialog.dismiss();
                if (bio != null && !bio.isEmpty()) {
                    RexDialogs.addSavedItem(RexDialogs.KEY_SAVED_BIOS, "@" + username + ": " + bio);
                    Utils.showToastShort("Bio saved!");
                } else {
                    Utils.showToastShort("Bio is empty");
                }
            }));

            card.addView(RexDialogs.createPopupMenuItem(ctx, RexVectorIcons.IC_TRANSLATE, "Translate Bio", () -> {
                dialog.dismiss();
                if (bio != null && !bio.isEmpty()) {
                    RexUtils.openUrl("https://translate.google.com/?sl=auto&tl=en&text=" + android.net.Uri.encode(bio), false);
                } else {
                    Utils.showToastShort("Bio is empty");
                }
            }));

            card.addView(RexDialogs.createPopupMenuItem(ctx, RexVectorIcons.IC_AT_SIGN, "Copy Username", () -> {
                dialog.dismiss();
                copyOrToast(username);
            }));

            card.addView(RexDialogs.createPopupMenuItem(ctx, RexVectorIcons.IC_ID_CARD, "Copy User ID", () -> {
                dialog.dismiss();
                copyOrToast(userId);
            }));

            final boolean finalIsPrivate = isPrivateAccount;
            card.addView(RexDialogs.createPopupMenuItem(ctx,
                    finalIsPrivate ? RexVectorIcons.IC_LOCK : RexVectorIcons.IC_LOCK_OPEN,
                    finalIsPrivate ? "Private Profile" : "Public Profile", () -> {
                        dialog.dismiss();
                        Utils.showToastShort(finalIsPrivate ? "This profile is Private" : "This profile is Public");
                    }));

            final String fCountFinal = followersDisplay;
            card.addView(RexDialogs.createPopupMenuItem(ctx, RexVectorIcons.IC_PEOPLE,
                    "Followers: " + fCountFinal, () -> {
                        dialog.dismiss();
                        copyOrToast(fCountFinal);
                    }));

            final String fgCountFinal = followingDisplay;
            card.addView(RexDialogs.createPopupMenuItem(ctx, RexVectorIcons.IC_PEOPLE,
                    "Following: " + fgCountFinal, () -> {
                        dialog.dismiss();
                        copyOrToast(fgCountFinal);
                    }));

            card.addView(RexDialogs.createPopupMenuItem(ctx, RexVectorIcons.IC_USER_PLUS, "Add to Saved Profiles", () -> {
                dialog.dismiss();
                RexDialogs.addSavedItem(RexDialogs.KEY_SAVED_PROFILES,
                        "@" + username + (fullName.isEmpty() ? "" : " (" + fullName + ")"));
                Utils.showToastShort("Added @" + username + " to Saved Profiles");
            }));

            if (Pref.rexDebug()) {
                card.addView(RexDialogs.createPopupMenuItem(ctx, RexVectorIcons.IC_DEV_BRACES, str("rex_debug"), () -> {
                    dialog.dismiss();
                    ObjectBrowser.browseObject(ctx, userData);
                }));
            }

            RexDialogs.applySmoothEntrance(card);
            dialog.show();
        } catch (Exception e) {
            Logger.printException(() -> "Error at moreOptionsDailogueBox", e);
            Utils.showToastShort(e.getMessage());
        }
    }

    /**
     * Scans the active Profile Activity's view tree to extract the exact displayed
     * Followers count, Following count, and Private/Public state (matching Screenshot 062943).
     */
    private static String[] scrapeProfileStatsFromViewTree(Activity activity) {
        String followers = "—";
        String following = "—";
        boolean isPrivate = false;
        if (activity == null || activity.getWindow() == null) {
            return new String[]{followers, following, "false"};
        }
        try {
            View root = activity.getWindow().getDecorView();
            List<String> texts = new ArrayList<>();
            collectViewTexts(root, texts);
            for (int i = 0; i < texts.size(); i++) {
                String t = texts.get(i).trim();
                String lower = t.toLowerCase();
                if (lower.contains("this account is private")) {
                    isPrivate = true;
                }
                Matcher m = COUNT_PREFIX.matcher(t);
                if (m.find()) {
                    String num = m.group(1);
                    String kind = m.group(2).toLowerCase();
                    if ("followers".equals(kind) && "—".equals(followers)) followers = num;
                    if ("following".equals(kind) && "—".equals(following)) following = num;
                }
                if (("followers".equals(lower) || "follower".equals(lower)) && i > 0 && "—".equals(followers)) {
                    String prev = texts.get(i - 1).trim();
                    if (prev.matches("^[0-9][0-9.,KMBkmb]*$")) followers = prev;
                }
                if ("following".equals(lower) && i > 0 && "—".equals(following)) {
                    String prev = texts.get(i - 1).trim();
                    if (prev.matches("^[0-9][0-9.,KMBkmb]*$")) following = prev;
                }
            }
        } catch (Throwable ignored) {}
        return new String[]{followers, following, isPrivate ? "true" : "false"};
    }

    private static void collectViewTexts(View view, List<String> out) {
        if (view == null || view.getVisibility() != View.VISIBLE) return;
        CharSequence cd = view.getContentDescription();
        if (cd != null && cd.length() > 0) {
            out.add(cd.toString());
        }
        if (view instanceof TextView) {
            CharSequence txt = ((TextView) view).getText();
            if (txt != null && txt.length() > 0) {
                out.add(txt.toString());
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                collectViewTexts(vg.getChildAt(i), out);
            }
        }
    }

    private interface SafeSupplier {
        String get() throws Exception;
    }

    private static String safe(SafeSupplier s, String fallback) {
        try {
            String v = s.get();
            return v != null ? v : fallback;
        } catch (Throwable t) {
            return fallback;
        }
    }

    private static void copyOrToast(String text) {
        if (text != null && !text.isEmpty()) {
            Utils.setClipboard(text);
            Utils.showToastShort(str("rex_copied"));
        } else {
            Utils.showToastShort("Nothing to copy");
        }
    }

    public static void addProfileMoreOptionsButton(ViewGroup viewGroup, ProfileInfo profileInfo) {
        try {
            UserData userData = profileInfo.getUserData();
            Context context = viewGroup.getContext();
            InstagramButton button = new InstagramButton(context);
            button.setText(str("rex_more_profile_options"));
            button.setStyle(InstagramButtonStyleEnum.SECONDARY);
            button.setOnClickListener(() -> moreOptionsDailogueBox(context, userData));

            int marginPx = Dim.dp12;
            button.setMargins(marginPx, Dim.dp6, marginPx, Dim.dp8);

            IgdsButton igdsButton = button.getIgdsButton();
            viewGroup.addView(igdsButton);
            igdsButton.bringToFront();
            viewGroup.requestLayout();
            viewGroup.invalidate();
        } catch (Exception e) {
            Logger.printException(() -> "Failed to add profile more button: ", e);
        }
    }
}
