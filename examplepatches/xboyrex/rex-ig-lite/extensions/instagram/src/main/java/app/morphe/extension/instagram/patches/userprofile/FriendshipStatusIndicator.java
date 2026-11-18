/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.userprofile;

import static app.morphe.extension.instagram.utils.IgStr.str;

import java.util.Map;
import android.widget.TextView;
import android.view.View;
import android.content.Context;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Typeface;
import android.util.TypedValue;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.ViewGroup;
import android.view.ViewParent;

import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexHaptics;
import app.morphe.extension.instagram.settings.preference.widgets.RexIcon;
import app.morphe.extension.instagram.entity.UserFriendshipStatus;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.entity.Entity;
import app.morphe.extension.instagram.entity.ProfileInfo;
import app.morphe.extension.instagram.constants.UI;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.ui.Dim;

public class FriendshipStatusIndicator {

    private static final String STATUS_TAG = "rex_friendship_status_textview";

    private static void friendshipStatusDialogBox(Context context, UserFriendshipStatus userFriendshipStatus) {
        RexDialogs.showFriendshipStatusSheet(
                context,
                userFriendshipStatus == null ? null : userFriendshipStatus.getMappings()
        );
    }

    public static TextView createStatusTextView(
            Context context,
            UserFriendshipStatus userFriendshipStatus,
            String text,
            String indicatorColorHex,
            String indicatorIconDrawable
    ) {
        TextView friendshipStatusTextView = new TextView(context);
        bindStatusTextView(friendshipStatusTextView, userFriendshipStatus, text,
                indicatorColorHex, indicatorIconDrawable);
        return friendshipStatusTextView;
    }

    private static void bindStatusTextView(
            TextView friendshipStatusTextView,
            UserFriendshipStatus userFriendshipStatus,
            String text,
            String indicatorColorHex,
            String indicatorIconDrawable
    ) {
        Context context = friendshipStatusTextView.getContext();
        friendshipStatusTextView.setText(text);

        float indicatorTextSizeSp = 12f;
        int indicatorTextSizePx = Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_SP,
                14f,
                context.getResources().getDisplayMetrics()
        ));
        int primaryTextColor = UI.getThemedColour("igds_color_primary_text");
        int indicatorColor = indicatorColorHex == null
                ? primaryTextColor
                : Color.parseColor(indicatorColorHex);
        friendshipStatusTextView.setTextColor(primaryTextColor);

        String tablerKey = mapTablerIconKey(indicatorIconDrawable);
        Drawable statusIcon = RexIcon.getDrawable(context, tablerKey, indicatorColor, 15);
        if (statusIcon == null) {
            try {
                statusIcon = ResourceUtils.getDrawable(indicatorIconDrawable).mutate();
                statusIcon.setColorFilter(new PorterDuffColorFilter(indicatorColor, PorterDuff.Mode.SRC_ATOP));
            } catch (Throwable ignored) {}
        }
        if (statusIcon != null) {
            statusIcon.setBounds(0, 0, indicatorTextSizePx, indicatorTextSizePx);
            friendshipStatusTextView.setCompoundDrawablePadding(Dim.dp6);
            friendshipStatusTextView.setCompoundDrawablesRelative(statusIcon, null, null, null);
        }

        GradientDrawable background = new GradientDrawable();
        background.setColor(Color.argb(32, Color.red(indicatorColor), Color.green(indicatorColor), Color.blue(indicatorColor)));
        background.setStroke(
                Math.max(1, Dim.dp2 / 2),
                Color.argb(96, Color.red(indicatorColor), Color.green(indicatorColor), Color.blue(indicatorColor))
        );
        background.setCornerRadius(Dim.dp20);
        friendshipStatusTextView.setBackground(background);
        friendshipStatusTextView.setGravity(Gravity.CENTER_VERTICAL);
        friendshipStatusTextView.setIncludeFontPadding(false);
        friendshipStatusTextView.setSingleLine(true);
        friendshipStatusTextView.setPadding(Dim.dp10, Dim.dp6, Dim.dp10, Dim.dp6);
        friendshipStatusTextView.setTextSize(TypedValue.COMPLEX_UNIT_SP, indicatorTextSizeSp);
        friendshipStatusTextView.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));

        setStatusClickListener(friendshipStatusTextView, userFriendshipStatus);
        friendshipStatusTextView.setVisibility(View.VISIBLE);
    }

    private static String mapTablerIconKey(String rawName) {
        if (rawName == null) return "users";
        if (rawName.contains("confirm") || rawName.equals("users")) return "users";
        if (rawName.contains("add") || rawName.equals("user-check")) return "user-check";
        if (rawName.equals("user-plus")) return "user-plus";
        if (rawName.contains("remove") || rawName.equals("user-x")) return "user-x";
        return rawName;
    }

    public static void setStatusClickListener(View statusView, UserFriendshipStatus userFriendshipStatus) {
        statusView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RexHaptics.tap(v);
                friendshipStatusDialogBox(v.getContext(), userFriendshipStatus);
            }
        });
    }

    private static void addFriendshipTextView(
            View internalBadgeTextView,
            UserFriendshipStatus userFriendshipStatus,
            String text,
            String indicatorColorHex,
            String indicatorIconDrawable
    ) throws Exception {
        if (internalBadgeTextView == null) return;

        ViewParent parent = internalBadgeTextView.getParent();
        if (parent instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) parent;

            TextView existingStatus = viewGroup.findViewWithTag(STATUS_TAG);
            if (existingStatus != null) {
                bindStatusTextView(existingStatus, userFriendshipStatus, text,
                        indicatorColorHex, indicatorIconDrawable);
                return;
            }

            TextView friendshipStatusTextView = createStatusTextView(
                    internalBadgeTextView.getContext(), userFriendshipStatus, text,
                    indicatorColorHex, indicatorIconDrawable);
            friendshipStatusTextView.setTag(STATUS_TAG);

            int targetIndex = viewGroup.indexOfChild(internalBadgeTextView);
            ViewGroup.MarginLayoutParams layoutParams = new ViewGroup.MarginLayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            layoutParams.setMargins(0, Dim.dp4, 0, Dim.dp6);
            viewGroup.addView(friendshipStatusTextView, targetIndex + 1, layoutParams);
        }
    }

    public static void addFriendshipIndicator(Object profileInfoObject, Object badgeObject) {
        try {
            Entity entity = new Entity(badgeObject);
            TextView badgeView = (TextView) entity.getMethod("getView");
            if (badgeView == null) return;

            ViewParent parent = badgeView.getParent();
            if (parent instanceof ViewGroup) {
                View existingStatus = ((ViewGroup) parent).findViewWithTag(STATUS_TAG);
                if (existingStatus != null) existingStatus.setVisibility(View.GONE);
            }

            if (Pref.followBackIndicator() && SettingsStatus.followBackIndicator) {
                ProfileInfo profileInfo = new ProfileInfo(profileInfoObject);
                Boolean isSelfProfile = profileInfo.isSelfProfile();
                if (Boolean.TRUE.equals(isSelfProfile)) return;

                UserData viewingUserData = profileInfo.getUserData();
                UserFriendshipStatus userFriendshipStatus = viewingUserData.getUserFriendshipStatus();
                Map<String, Boolean> friendshipMap = userFriendshipStatus.getMappings();
                Boolean followedBy = friendshipMap.get("followed_by");
                Boolean following = friendshipMap.get("following");

                String indicatorText;
                String indicatorIconDrawable;
                String indicatorColorHex;
                boolean useStatusColor = Pref.followBackColorIndicator();
                if (followedBy == null && following == null) {
                    indicatorText = "Status unavailable";
                    indicatorIconDrawable = "info";
                    indicatorColorHex = useStatusColor ? "#9AA3AE" : null;
                } else if (Boolean.TRUE.equals(followedBy) && Boolean.TRUE.equals(following)) {
                    indicatorText = str("rex_fbi_following_each_other");
                    indicatorIconDrawable = "users";
                    indicatorColorHex = useStatusColor ? "#23C6D8" : null;
                } else if (Boolean.TRUE.equals(followedBy)) {
                    indicatorText = str("rex_fbi_follows_you");
                    indicatorIconDrawable = "user-check";
                    indicatorColorHex = useStatusColor ? "#35CDBB" : null;
                } else if (Boolean.TRUE.equals(following)) {
                    indicatorText = "You follow (Doesn't follow back)";
                    indicatorIconDrawable = "user-plus";
                    indicatorColorHex = useStatusColor ? "#F5A623" : null;
                } else {
                    indicatorText = str("rex_fbi_doesnt_follows_you");
                    indicatorIconDrawable = "user-x";
                    indicatorColorHex = useStatusColor ? "#F06470" : null;
                }

                addFriendshipTextView(
                        badgeView,
                        userFriendshipStatus,
                        indicatorText,
                        indicatorColorHex,
                        indicatorIconDrawable
                );
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Failed follow back indicator", ex);
        }
    }
}
