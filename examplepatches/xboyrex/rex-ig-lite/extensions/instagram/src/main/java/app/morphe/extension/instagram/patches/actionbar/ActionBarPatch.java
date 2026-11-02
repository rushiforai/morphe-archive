/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 */
package app.morphe.extension.instagram.patches.actionbar;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.instagram.patches.navigation.NavigationBarPatch;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.instagram.constants.UI;
import app.morphe.extension.instagram.patches.userprofile.ProfileMoreOption;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.ui.RexDialogs;
import app.morphe.extension.instagram.ui.RexVectorIcons;

import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.ui.Dim;

import com.instagram.common.session.UserSession;

public class ActionBarPatch {

    private static final String TAG_HOME_HEXAGON = "rex_ab_home_hexagon";
    private static final String TAG_PROFILE_HEXAGON = "rex_ab_profile_hexagon";

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final Set<ImageView> GHOST_MODE_ICONS =
            Collections.newSetFromMap(new WeakHashMap<>());
    private static final SharedPreferences.OnSharedPreferenceChangeListener GHOST_MODE_LISTENER =
            (sharedPreferences, key) -> {
                if (!Settings.TURN_ON_ALL_GHOST_MODES.key.equals(key)) {
                    return;
                }
                try {
                    updateGhostModeIcons(Pref.getTurnOnAllGhostModes());
                } catch (RuntimeException exception) {
                    Logger.printException(
                            () -> "Failed reading ghost mode preference: ",
                            exception
                    );
                }
            };
    private static boolean ghostModeListenerRegistered;

    private static void runOnMainThread(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            action.run();
        } else {
            MAIN_HANDLER.post(action);
        }
    }

    private static synchronized void registerGhostModeListener() {
        if (ghostModeListenerRegistered) {
            return;
        }
        try {
            ghostModeListenerRegistered =
                    SharedPref.registerOnSharedPreferenceChangeListener(GHOST_MODE_LISTENER);
        } catch (RuntimeException exception) {
            Logger.printException(
                    () -> "Failed registering ghost mode preference listener: ",
                    exception
            );
        }
    }

    private static void updateGhostModeIcons(boolean enabled) {
        runOnMainThread(() -> {
            List<ImageView> currentIcons;
            synchronized (GHOST_MODE_ICONS) {
                currentIcons = new ArrayList<>(GHOST_MODE_ICONS);
            }

            String icon = enabled ? UI.DRAWABLE_EYE_STROKE_ICON : UI.DRAWABLE_EYE_ICON;
            for (ImageView imageView : currentIcons) {
                try {
                    UI.setThemedIcon(imageView, icon);
                } catch (RuntimeException exception) {
                    Logger.printException(
                            () -> "Failed updating ghost mode icon: ",
                            exception
                    );
                }
            }
        });
    }

    private static void ghostModeToggle(ViewGroup viewGroup) throws Exception {
        if (SettingsStatus.ghostSection()) {
            boolean ghostModeToggle = Pref.getTurnOnAllGhostModes();

            String iconStr = ghostModeToggle ? UI.DRAWABLE_EYE_STROKE_ICON : UI.DRAWABLE_EYE_ICON;
            ImageView imageView = UI.addImageViewToViewGroup(viewGroup, iconStr, null);
            if (imageView == null) {
                return;
            }
            synchronized (GHOST_MODE_ICONS) {
                GHOST_MODE_ICONS.add(imageView);
            }
            registerGhostModeListener();
            imageView.setOnClickListener(v -> {
                try {
                    boolean next = !Pref.getTurnOnAllGhostModes();
                    if (!Pref.setTurnOnAllGhostModes(next)) {
                        throw new IllegalStateException("Failed saving ghost mode preference");
                    }
                    if (!ghostModeListenerRegistered) {
                        updateGhostModeIcons(next);
                    }

                    String toastStr = next ? str("rex_ghost_modes_on") : str("rex_ghost_modes_default");
                    Utils.showToastShort(toastStr);
                } catch (Exception ex) {
                    Logger.printException(() -> "ghost icon click failed: ", ex);
                }
            });
        }
    }

    private static ImageView addHexagonButtonToActionBar(
            ViewGroup viewGroup,
            String tag,
            Runnable onClick,
            Runnable onLongClick
    ) {
        if (viewGroup == null) return null;
        View existing = viewGroup.findViewWithTag(tag);
        if (existing instanceof ImageView) {
            existing.setOnClickListener(v -> {
                if (onClick != null) onClick.run();
            });
            if (onLongClick != null) {
                existing.setOnLongClickListener(v -> {
                    onLongClick.run();
                    return true;
                });
            }
            return (ImageView) existing;
        }

        Context context = viewGroup.getContext();
        ImageView imageView = new ImageView(context);
        imageView.setTag(tag);
        int iconColor = UI.getThemedColour("igds_color_primary_icon");
        imageView.setImageDrawable(RexVectorIcons.create(context, RexVectorIcons.IC_HEXAGON_NUT, iconColor, 24));
        imageView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        int pad = Dim.dp12;
        imageView.setPadding(pad, pad, pad, pad);
        ViewGroup.LayoutParams params = new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        imageView.setLayoutParams(params);
        imageView.setOnClickListener(v -> {
            if (onClick != null) onClick.run();
        });
        if (onLongClick != null) {
            imageView.setOnLongClickListener(v -> {
                onLongClick.run();
                return true;
            });
        }

        int count = viewGroup.getChildCount();
        int insertIndex = Math.max(0, count - 1);
        viewGroup.addView(imageView, insertIndex);
        return imageView;
    }

    public static void mainFeedActionBarButton(ViewGroup viewGroup) {
        try {
            if (viewGroup == null) {
                return;
            }

            Set<String> pref = Pref.mainFeedActionBarButtons();

            if (pref.contains(Constants.AB_GHOST_MODE_ICON)) {
                ghostModeToggle(viewGroup);
            }

            // Show the Hexagon Options Icon by default unless 'Hide Home Options Icon' is turned on
            if (!Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.HIDE_HOME_OPTIONS_ICON))) {
                addHexagonButtonToActionBar(
                        viewGroup,
                        TAG_HOME_HEXAGON,
                        () -> RexDialogs.showQuickActionMenu(viewGroup.getContext()),
                        FragmentHook::startSettings
                );
            } else {
                View existing = viewGroup.findViewWithTag(TAG_HOME_HEXAGON);
                if (existing != null) viewGroup.removeView(existing);
            }

            HomeActionBarLayout.observe(
                    viewGroup,
                    NavigationBarPatch::effectiveNotificationsVisibility
            );

        } catch (Exception e) {
            Logger.printException(() -> "mainFeedActionBarButton failure", e);
            RexUtils.logger(e);
        }
    }

    public static String filterHomeAction(String action) {
        if ("share".equals(action) && Pref.getHideHomeCreateButton()) return null;
        if ("news".equals(action) && Pref.getHideHomeNotificationsButton()) return null;
        return action;
    }

    public static void hideProfileCreateButton(View view, int drawableId) {
        if (drawableId != 0 && !Pref.userProfileActionBarButtons().contains(Constants.AB_CREATE)
                && drawableId == ResourceUtils.getIdentifier(ResourceType.DRAWABLE, "instagram_add_outline_24")) {
            view.setVisibility(View.GONE);
        }
    }

    public static void userProfileActionBarButton(Activity activity, ViewGroup viewGroup, UserSession userSession, Object userObject) {
        try {
            if (activity == null || viewGroup == null) {
                return;
            }

            Set<String> pref = Pref.userProfileActionBarButtons();
            UserData userData = new UserData(userObject);
            boolean isSelfProfile = false;
            try {
                isSelfProfile = userData.getUserId().equals(userSession.getUserId());
            } catch (Throwable ignored) {}

            if (pref.contains(Constants.AB_GHOST_MODE_ICON) && isSelfProfile) {
                ghostModeToggle(viewGroup);
            }

            // Always show the Hexagon Options Icon on Profile toolbar (unless 'Hide Profile Options Icon' is enabled)
            // Tap -> Profile More Options Popup (Screenshot 062943)
            // Long-Press -> Floating Quick Action Menu (Screenshot 062952)
            if (!Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.HIDE_PROFILE_OPTIONS_ICON))) {
                addHexagonButtonToActionBar(
                        viewGroup,
                        TAG_PROFILE_HEXAGON,
                        () -> ProfileMoreOption.moreOptionsDailogueBox(activity, userData),
                        () -> RexDialogs.showQuickActionMenu(activity)
                );
            }

        } catch (Exception e) {
            Logger.printException(() -> "userProfileActionBarButton: ", e);
            RexUtils.logger(e);
        }
    }

    public static void chatActionBarButton(ViewGroup viewGroup) {
        try {
            if (viewGroup == null) {
                return;
            }

            Set<String> pref = Pref.chatActionBarButtons();

            if (pref.contains(Constants.AB_SETTINGS_ICON)) {
                UI.rexSettingsGear(viewGroup);
            }

            if (pref.contains(Constants.AB_GHOST_MODE_ICON)) {
                ghostModeToggle(viewGroup);
            }

        } catch (Exception e) {
            Logger.printException(() -> "chatActionBarButton:", e);
        }
    }

    public static void inboxActionBarButton(ViewGroup viewGroup) {
        try {
            if (viewGroup == null) {
                return;
            }

            Set<String> pref = Pref.inboxActionBarButtons();

            if (pref.contains(Constants.AB_SETTINGS_ICON)) {
                UI.rexSettingsGear(viewGroup);
            }

            if (pref.contains(Constants.AB_GHOST_MODE_ICON)) {
                ghostModeToggle(viewGroup);
            }

        } catch (Exception e) {
            Logger.printException(() -> "inboxActionBarButton:", e);
        }
    }
}
