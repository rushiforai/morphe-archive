/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.userprofile;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.TextView;

import java.util.concurrent.Callable;

import com.instagram.igds.components.button.IgdsButton;

import app.morphe.extension.instagram.entity.InstagramButton;
import app.morphe.extension.instagram.entity.InstagramButtonStyleEnum;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.entity.ProfileInfo;
import com.instagram.common.session.UserSession;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexHaptics;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ui.Dim;

public class ProfileMoreOption {

    public static void addProfileMoreOptionsButton(ViewGroup viewGroup, ProfileInfo profileInfo) {
        if (viewGroup == null || profileInfo == null) return;
        try {
            Context context = viewGroup.getContext();
            UserData userData = profileInfo.getUserData();
            UserSession session = profileInfo.getUserSession();
            profileOptionButton(context, viewGroup, userData.getObject(),
                    () -> userData.refreshProfilePictureUrl(session));
        } catch (Exception e) {
            Logger.printException(() -> "addProfileMoreOptionsButton failure", e);
        }
    }

    public static void moreOptionsDailogueBox(Context context, UserData userData, Callable<String> refreshUrl) {
        try {
            RexHaptics.tap(context);
            RexDialogs.showProfilePopup(context, userData, refreshUrl);
        } catch (Exception e) {
            Logger.printException(() -> "moreOptionsDailogueBox failure", e);
        }
    }

    public static void profileOptionButton(Context context, ViewGroup viewGroup, Object userInfo, Callable<String> refreshUrl) {
        try {
            UserData userData = new UserData(userInfo);
            InstagramButton profileMoreOptionBtn = new InstagramButton(context);
            profileMoreOptionBtn.setStyle(InstagramButtonStyleEnum.SECONDARY);
            profileMoreOptionBtn.setText("xboyrex Options");
            int marginPx = Dim.dp12;
            profileMoreOptionBtn.setMargins(marginPx, 0, marginPx, Dim.dp6);
            profileMoreOptionBtn.setOnClickListener(() -> moreOptionsDailogueBox(context, userData, refreshUrl));
            IgdsButton btn = profileMoreOptionBtn.getIgdsButton();
            viewGroup.addView(btn);

            attachBioHoldListener(context, viewGroup, userData);
        } catch (Exception e) {
            Logger.printException(() -> "profileOptionButton failure", e);
        }
    }

    /**
     * Attaches a long-press listener to the user's profile Bio / Header text views so holding
     * the bio opens the interactive Bio Studio (view, edit, copy, translate, save).
     */
    private static void attachBioHoldListener(final Context context, ViewGroup buttonContainer, final UserData userData) {
        try {
            final String username = userData.getUsername() != null ? userData.getUsername() : "";
            final String bio = userData.getBio() != null ? userData.getBio() : "";
            final String profileLink = "https://www.instagram.com/" + username + "/";

            View rootHeader = buttonContainer;
            for (int i = 0; i < 3 && rootHeader.getParent() instanceof ViewGroup; i++) {
                rootHeader = (ViewGroup) rootHeader.getParent();
            }
            bindLongPressToBioTextViews(rootHeader, context, username, bio, profileLink);
        } catch (Throwable ignored) {}
    }

    private static void bindLongPressToBioTextViews(
            View view,
            final Context context,
            final String username,
            final String bio,
            final String profileLink
    ) {
        if (view == null) return;
        if (view instanceof TextView && !(view instanceof android.widget.Button)) {
            final TextView tv = (TextView) view;
            CharSequence cs = tv.getText();
            String textStr = cs == null ? "" : cs.toString().trim();
            boolean matchesBio = (!bio.isEmpty() && (textStr.equals(bio.trim()) || bio.contains(textStr) && textStr.length() > 8))
                    || textStr.length() > 24;
            if (matchesBio) {
                tv.setLongClickable(true);
                tv.setOnLongClickListener(v -> {
                    RexHaptics.longPress(v);
                    String currentText = tv.getText() != null ? tv.getText().toString() : bio;
                    RexDialogs.showTextStudioDialog(
                            context,
                            "Profile Bio Studio",
                            username,
                            currentText.isEmpty() ? bio : currentText,
                            profileLink
                    );
                    return true;
                });
            }
        } else if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                bindLongPressToBioTextViews(vg.getChildAt(i), context, username, bio, profileLink);
            }
        }
    }
}
