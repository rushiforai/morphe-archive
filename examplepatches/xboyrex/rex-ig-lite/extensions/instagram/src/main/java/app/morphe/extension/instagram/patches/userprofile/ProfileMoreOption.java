/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.userprofile;

import android.content.Context;
import android.view.ViewGroup;

import java.util.concurrent.Callable;

import com.instagram.igds.components.button.IgdsButton;

import app.morphe.extension.instagram.entity.InstagramButton;
import app.morphe.extension.instagram.entity.InstagramButtonStyleEnum;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.entity.ProfileInfo;
import com.instagram.common.session.UserSession;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
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
        } catch (Exception e) {
            Logger.printException(() -> "profileOptionButton failure", e);
        }
    }
}
