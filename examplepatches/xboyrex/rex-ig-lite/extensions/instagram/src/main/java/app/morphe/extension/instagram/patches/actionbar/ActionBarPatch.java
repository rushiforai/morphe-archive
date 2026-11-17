/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.actionbar;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.constants.UI;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.patches.navigation.NavigationBarPatch;
import app.morphe.extension.instagram.patches.userprofile.ProfileMoreOption;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.instagram.settings.preference.widgets.InstagramPreferenceStyle;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexHaptics;
import app.morphe.extension.instagram.settings.preference.widgets.RexIcon;
import app.morphe.extension.instagram.settings.preference.widgets.RexRuntimeFeatures;
import app.morphe.extension.instagram.settings.preference.widgets.RexVault;
import app.morphe.extension.instagram.settings.preference.widgets.RexVectorIcons;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.suite.shared.ui.Dim;

import com.instagram.common.session.UserSession;

public class ActionBarPatch {

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final Set<ImageView> GHOST_MODE_ICONS =
            Collections.newSetFromMap(new WeakHashMap<>());
    private static final Set<Activity> WATCHED_ACTIVITIES =
            Collections.newSetFromMap(new WeakHashMap<>());
    private static final Set<View> ARMED_HOME_TABS =
            Collections.newSetFromMap(new WeakHashMap<>());
    private static final SharedPreferences.OnSharedPreferenceChangeListener GHOST_MODE_LISTENER =
            (sharedPreferences, key) -> {
                if (!Settings.TURN_ON_ALL_GHOST_MODES.key.equals(key)) {
                    return;
                }
                try {
                    updateGhostModeIcons(Pref.getTurnOnAllGhostModes());
                } catch (RuntimeException exception) {
                    Logger.printException(() -> "Failed reading ghost mode preference: ", exception);
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

    /**
     * Attaches a layout watcher on the Activity window so long-pressing the bottom navigation bar's
     * Home button ("feed_tab") triggers haptic feedback and opens the Rex IG Lite Quick Access menu.
     * Note: Never call setTag(...) on feed_tab because Instagram stores its own tab metadata in view.getTag().
     */
    public static void attachHomeTabLongPress(final Activity activity) {
        try {
            if (activity == null || ActivityHook.isRex(activity)) return;
            synchronized (WATCHED_ACTIVITIES) {
                if (WATCHED_ACTIVITIES.contains(activity)) {
                    bindHomeTabIfPresent(activity);
                    return;
                }
                WATCHED_ACTIVITIES.add(activity);
            }
            if (activity.getWindow() == null) return;
            final View decor = activity.getWindow().getDecorView();
            if (decor == null) return;
            bindHomeTabIfPresent(activity);
            decor.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override
                public void onGlobalLayout() {
                    if (activity.isFinishing() || activity.isDestroyed()) {
                        try {
                            if (decor.getViewTreeObserver().isAlive()) {
                                decor.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                            }
                        } catch (Throwable ignored) {}
                        return;
                    }
                    bindHomeTabIfPresent(activity);
                }
            });
        } catch (Throwable e) {
            Logger.printException(() -> "attachHomeTabLongPress failed", e);
        }
    }

    private static void bindHomeTabIfPresent(final Activity activity) {
        try {
            if (activity == null || activity.getWindow() == null) return;
            View decor = activity.getWindow().getDecorView();
            if (decor == null) return;
            int feedTabId = ResourceUtils.getIdentifier(activity, ResourceType.ID, "feed_tab");
            if (feedTabId == 0) {
                feedTabId = activity.getResources().getIdentifier("feed_tab", "id", activity.getPackageName());
            }
            View homeTab = feedTabId != 0 ? decor.findViewById(feedTabId) : null;
            if (homeTab == null) {
                int tabBarId = ResourceUtils.getIdentifier(activity, ResourceType.ID, "tab_bar");
                if (tabBarId == 0) {
                    tabBarId = activity.getResources().getIdentifier("tab_bar", "id", activity.getPackageName());
                }
                View tabBar = tabBarId != 0 ? decor.findViewById(tabBarId) : null;
                if (tabBar instanceof ViewGroup && ((ViewGroup) tabBar).getChildCount() > 0) {
                    homeTab = ((ViewGroup) tabBar).getChildAt(0);
                }
            }
            if (homeTab == null) return;

            synchronized (ARMED_HOME_TABS) {
                if (ARMED_HOME_TABS.contains(homeTab)) return;
                ARMED_HOME_TABS.add(homeTab);
            }

            final View targetTab = homeTab;
            targetTab.setLongClickable(true);
            targetTab.setOnLongClickListener(v -> {
                RexHaptics.longPress(v);
                RexDialogs.showHomeQuickMenu(activity);
                return true;
            });

            final int touchSlop = ViewConfiguration.get(activity).getScaledTouchSlop();
            targetTab.setOnTouchListener(new View.OnTouchListener() {
                private float downX;
                private float downY;
                private boolean longPressTriggered;
                private final Runnable longPressRunnable = () -> {
                    longPressTriggered = true;
                    RexHaptics.longPress(targetTab);
                    RexDialogs.showHomeQuickMenu(activity);
                };

                @Override
                public boolean onTouch(View v, MotionEvent event) {
                    int action = event.getActionMasked();
                    if (action == MotionEvent.ACTION_DOWN) {
                        downX = event.getX();
                        downY = event.getY();
                        longPressTriggered = false;
                        MAIN_HANDLER.removeCallbacks(longPressRunnable);
                        MAIN_HANDLER.postDelayed(longPressRunnable, 420L);
                    } else if (action == MotionEvent.ACTION_MOVE) {
                        if (Math.abs(event.getX() - downX) > touchSlop
                                || Math.abs(event.getY() - downY) > touchSlop) {
                            MAIN_HANDLER.removeCallbacks(longPressRunnable);
                        }
                    } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                        MAIN_HANDLER.removeCallbacks(longPressRunnable);
                        if (longPressTriggered) {
                            longPressTriggered = false;
                            return true;
                        }
                    }
                    return false;
                }
            });
        } catch (Throwable ignored) {}
    }

    private static synchronized void registerGhostModeListener() {
        if (ghostModeListenerRegistered) return;
        try {
            ghostModeListenerRegistered =
                    SharedPref.registerOnSharedPreferenceChangeListener(GHOST_MODE_LISTENER);
        } catch (RuntimeException exception) {
            Logger.printException(() -> "Failed registering ghost mode preference listener: ", exception);
        }
    }

    private static void updateGhostModeIcons(boolean enabled) {
        runOnMainThread(() -> {
            List<ImageView> currentIcons;
            synchronized (GHOST_MODE_ICONS) {
                currentIcons = new ArrayList<>(GHOST_MODE_ICONS);
            }
            int iconColor = UI.getThemedColour("igds_color_primary_icon");
            for (ImageView imageView : currentIcons) {
                try {
                    RexIcon.bindOrAnimateState(
                            imageView,
                            "ghost",
                            enabled,
                            iconColor,
                            InstagramPreferenceStyle.ACTIVE_SWITCH_TEAL,
                            24,
                            true
                    );
                } catch (RuntimeException exception) {
                    Logger.printException(() -> "Failed updating ghost mode icon: ", exception);
                }
            }
        });
    }

    private static void ghostModeToggle(ViewGroup viewGroup) throws Exception {
        if (SettingsStatus.ghostSection()) {
            Object tag = "rex_ghost_ab_btn";
            View existing = viewGroup.findViewWithTag(tag);
            if (existing instanceof ImageView) return;

            boolean ghostModeToggle = Pref.getTurnOnAllGhostModes();
            Context context = viewGroup.getContext();
            ImageView imageView = new ImageView(context);
            imageView.setTag(tag);
            int iconColor = UI.getThemedColour("igds_color_primary_icon");
            RexIcon.bindOrAnimateState(
                    imageView,
                    "ghost",
                    ghostModeToggle,
                    iconColor,
                    InstagramPreferenceStyle.ACTIVE_SWITCH_TEAL,
                    24,
                    false
            );
            ViewGroup.LayoutParams params = new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            imageView.setLayoutParams(params);
            int padding = Dim.dp14;
            imageView.setPadding(padding, padding, padding, padding);
            imageView.setContentDescription("Ghost Mode");
            int insertIndex = Math.max(0, viewGroup.getChildCount() - 1);
            viewGroup.addView(imageView, insertIndex);

            synchronized (GHOST_MODE_ICONS) {
                GHOST_MODE_ICONS.add(imageView);
            }
            registerGhostModeListener();
            imageView.setOnClickListener(v -> {
                try {
                    RexHaptics.toggle(v);
                    boolean next = !Pref.getTurnOnAllGhostModes();
                    if (!Pref.setTurnOnAllGhostModes(next)) {
                        throw new IllegalStateException("Failed saving ghost mode preference");
                    }
                    updateGhostModeIcons(next);
                    String toastStr = next ? str("rex_ghost_modes_on") : str("rex_ghost_modes_default");
                    Utils.showToastShort(toastStr);
                } catch (Exception ex) {
                    Logger.printException(() -> "ghost icon click failed: ", ex);
                }
            });
        }
    }

    private static ImageView addHexagonButton(ViewGroup viewGroup, Runnable onTap, Runnable onLongPress) {
        if (viewGroup == null) return null;
        Object tag = "rex_hexagon_ab_btn";
        View existing = viewGroup.findViewWithTag(tag);
        if (existing instanceof ImageView) return (ImageView) existing;

        Context context = viewGroup.getContext();
        ImageView imageView = new ImageView(context);
        imageView.setTag(tag);
        int iconColor = UI.getThemedColour("igds_color_primary_icon");
        imageView.setImageDrawable(RexVectorIcons.create(context, "rex_vec_hexagon", iconColor, 24));
        ViewGroup.LayoutParams params = new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        imageView.setLayoutParams(params);
        int padding = Dim.dp14;
        imageView.setPadding(padding, padding, padding, padding);
        if (onTap != null) {
            imageView.setOnClickListener(v -> {
                try {
                    RexHaptics.tap(v);
                    RexIcon.pulseIcon(imageView);
                    onTap.run();
                } catch (Exception e) {
                    Logger.printException(() -> "hexagon tap failed", e);
                }
            });
        }
        if (onLongPress != null) {
            imageView.setOnLongClickListener(v -> {
                try {
                    RexHaptics.longPress(v);
                    RexIcon.pulseIcon(imageView);
                    onLongPress.run();
                } catch (Exception e) {
                    Logger.printException(() -> "hexagon long press failed", e);
                }
                return true;
            });
        }
        int insertIndex = Math.max(0, viewGroup.getChildCount() - 1);
        viewGroup.addView(imageView, insertIndex);
        return imageView;
    }

    public static void mainFeedActionBarButton(ViewGroup viewGroup) {
        try {
            if (viewGroup == null) return;
            Context context = viewGroup.getContext();
            attachHomeTabLongPress(RexDialogs.resolveActivity(context));

            Set<String> pref = Pref.mainFeedActionBarButtons();

            if (pref.contains(Constants.AB_GHOST_MODE_ICON)) {
                ghostModeToggle(viewGroup);
            }

            if (pref.contains(Constants.AB_SETTINGS_ICON)) {
                addHexagonButton(
                        viewGroup,
                        () -> RexDialogs.showHomeQuickMenu(context),
                        FragmentHook::startSettings
                );
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

    public static void hookLogoView(View view) {
        try {
            if (view == null) return;
            attachHomeTabLongPress(RexDialogs.resolveActivity(view.getContext()));
            view.setLongClickable(true);
            view.setOnLongClickListener(v -> {
                try {
                    RexHaptics.longPress(v);
                    RexDialogs.showHomeQuickMenu(v.getContext());
                } catch (Exception e) {
                    Logger.printException(() -> "hookLogoView long press failed", e);
                }
                return true;
            });
        } catch (Exception e) {
            Logger.printException(() -> "hookLogoView failed", e);
        }
    }

    public static void userProfileActionBarButton(Activity activity, ViewGroup viewGroup, UserSession userSession, Object userObject) {
        try {
            if (activity == null || viewGroup == null) return;
            attachHomeTabLongPress(activity);
            Set<String> pref = Pref.userProfileActionBarButtons();

            UserData resolvedUser = null;
            boolean isSelfProfile = true;
            try {
                if (userObject instanceof String) {
                    String profileUserId = (String) userObject;
                    if (userSession != null && userSession.getUserId() != null) {
                        isSelfProfile = profileUserId.equals(userSession.getUserId());
                    }
                    try {
                        Object fetched = new UserData(null).fetchProfileUser(userSession, profileUserId);
                        if (fetched != null) {
                            resolvedUser = new UserData(fetched);
                        }
                    } catch (Throwable ignored) {}
                } else if (userObject != null) {
                    resolvedUser = new UserData(userObject);
                    String uid = resolvedUser.getUserId();
                    if (uid != null && userSession != null && userSession.getUserId() != null) {
                        isSelfProfile = uid.equals(userSession.getUserId());
                    }
                }
            } catch (Throwable ignored) {}

            final UserData finalUserData = resolvedUser;
            if (finalUserData != null) {
                try {
                    RexVault.recordWatchedMedia(activity, finalUserData.getUsername(),
                            "Profile (" + finalUserData.getFullName() + ")", finalUserData.getProfileLink());
                } catch (Throwable ignored) {}
            }

            if (pref.contains(Constants.AB_GHOST_MODE_ICON) && isSelfProfile) {
                try {
                    ghostModeToggle(viewGroup);
                } catch (Throwable ignored) {}
            }

            if (pref.contains(Constants.AB_PROFILE_INFO_ICON) || pref.contains(Constants.AB_SETTINGS_ICON)) {
                addHexagonButton(
                        viewGroup,
                        () -> {
                            if (finalUserData != null) {
                                ProfileMoreOption.moreOptionsDailogueBox(
                                        activity,
                                        finalUserData,
                                        () -> finalUserData.refreshProfilePictureUrl(userSession)
                                );
                            } else {
                                RexDialogs.showHomeQuickMenu(activity);
                            }
                        },
                        FragmentHook::startSettings
                );
            }
        } catch (Exception e) {
            Logger.printException(() -> "userProfileActionBarButton: ", e);
            RexUtils.logger(e);
        }
    }

    public static void chatActionBarButton(ViewGroup viewGroup) {
        try {
            if (viewGroup == null) return;
            Set<String> pref = Pref.chatActionBarButtons();

            if (pref.contains(Constants.AB_SETTINGS_ICON)) {
                Context context = viewGroup.getContext();
                addHexagonButton(
                        viewGroup,
                        () -> RexDialogs.showHomeQuickMenu(context),
                        FragmentHook::startSettings
                );
            }

            if (pref.contains(Constants.AB_GHOST_MODE_ICON)) {
                ghostModeToggle(viewGroup);
            }

            if (pref.contains(Constants.AB_JUMP_OLDEST_ICON)) {
                Object jumpTag = "rex_jump_oldest_ab_btn";
                if (viewGroup.findViewWithTag(jumpTag) == null) {
                    Context context = viewGroup.getContext();
                    ImageView jumpBtn = new ImageView(context);
                    jumpBtn.setTag(jumpTag);
                    int iconColor = UI.getThemedColour("igds_color_primary_icon");
                    jumpBtn.setImageDrawable(RexVectorIcons.create(context, "arrow-up-bar", iconColor, 24));
                    int padding = Dim.dp14;
                    jumpBtn.setPadding(padding, padding, padding, padding);
                    jumpBtn.setOnClickListener(v -> {
                        RexHaptics.tap(v);
                        RexIcon.pulseIcon(jumpBtn);
                        app.morphe.extension.instagram.patches.dm.JumpToOldestMessage.toggle(viewGroup);
                    });
                    int insertIndex = Math.max(0, viewGroup.getChildCount() - 1);
                    viewGroup.addView(jumpBtn, insertIndex);
                }
            }

            RexRuntimeFeatures.applyChatWallpaper(viewGroup);
        } catch (Exception e) {
            Logger.printException(() -> "chatActionBarButton:", e);
        }
    }

    public static void inboxActionBarButton(ViewGroup viewGroup) {
        try {
            if (viewGroup == null) return;
            Set<String> pref = Pref.inboxActionBarButtons();

            if (pref.contains(Constants.AB_SETTINGS_ICON)) {
                Context context = viewGroup.getContext();
                addHexagonButton(
                        viewGroup,
                        () -> RexDialogs.showHomeQuickMenu(context),
                        FragmentHook::startSettings
                );
            }

            if (pref.contains(Constants.AB_GHOST_MODE_ICON)) {
                ghostModeToggle(viewGroup);
            }
        } catch (Exception e) {
            Logger.printException(() -> "inboxActionBarButton:", e);
        }
    }
}
