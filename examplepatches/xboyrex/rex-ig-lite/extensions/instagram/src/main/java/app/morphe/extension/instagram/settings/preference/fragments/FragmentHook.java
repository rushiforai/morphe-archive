/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 */
package app.morphe.extension.instagram.settings.preference.fragments;

import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.constants.Constants;

@SuppressWarnings("deprecation")
public class FragmentHook {

    public static void startFragment(String key) {
        String actionBarTitle = null;

        if (key.equals(Constants.REX_FRAGMENT_GHOST)) {
            actionBarTitle = "Ghost Mode";
        } else if (key.equals(Constants.REX_FRAGMENT_NOTIFICATION) || key.equals(Constants.REX_FRAGMENT_DM)) {
            actionBarTitle = "Notification";
        } else if (key.equals(Constants.REX_FRAGMENT_PRIVACY) || key.equals(Constants.REX_FRAGMENT_ADS) || key.equals(Constants.REX_FRAGMENT_LINKS)) {
            actionBarTitle = "Privacy";
        } else if (key.equals(Constants.REX_FRAGMENT_GESTURES)) {
            actionBarTitle = "Gestures";
        } else if (key.equals(Constants.REX_FRAGMENT_FEED_STORIES) || key.equals(Constants.REX_FRAGMENT_STORY)) {
            actionBarTitle = "Feed and Stories";
        } else if (key.equals(Constants.REX_FRAGMENT_UI_TWEAKS)) {
            actionBarTitle = "UI Tweaks";
        } else if (key.equals(Constants.REX_FRAGMENT_FOCUS_MODE) || key.equals(Constants.REX_FRAGMENT_DISTRACTION_FREE)) {
            actionBarTitle = "Focus Mode";
        } else if (key.equals(Constants.REX_FRAGMENT_FOCUS_LOCK)) {
            actionBarTitle = "rex_focus_lock";
        } else if (key.equals(Constants.REX_FRAGMENT_MISC)) {
            actionBarTitle = "Miscellaneous";
        } else if (key.equals(Constants.REX_FRAGMENT_DOWNLOAD_MEDIA)) {
            actionBarTitle = "Downloads";
        } else if (key.equals(Constants.REX_FRAGMENT_NAV_BTNS)) {
            actionBarTitle = "rex_category_navigation_tabs";
        } else if (key.equals(Constants.REX_FRAGMENT_DEV_OPTIONS)) {
            actionBarTitle = "Developer Options";
        } else if (key.equals(Constants.REX_FRAGMENT_ABOUT)) {
            actionBarTitle = "About";
        } else if (key.equals(Constants.REX_FRAGMENT_BACKUP)) {
            actionBarTitle = "Backup & Patch Status";
        } else if (key.equals(Constants.REX_FRAGMENT_ACTION_BAR)) {
            actionBarTitle = "rex_category_action_bar";
        } else if (key.equals(Constants.REX_FRAGMENT_FILTER_CONTENT)) {
            actionBarTitle = "rex_category_filter_content";
        } else if (key.equals(Constants.REX_FRAGMENT_REC_FLAGS)) {
            actionBarTitle = "rex_category_rec_flags";
        } else if (key.equals(Constants.REX_FRAGMENT_INSTANTS)) {
            actionBarTitle = "rex_instants_title";
        } else if (key.equals(Constants.REX_FRAGMENT_FONT)) {
            actionBarTitle = "rex_category_font";
        }

        if (actionBarTitle != null) {
            ActivityHook.startRexActivity(key, actionBarTitle);
        }
    }

    public static void startSettings() {
        ActivityHook.startRexActivity(Constants.REX_FRAGMENT_SETTINGS, "xboyrex Settings");
    }
}
