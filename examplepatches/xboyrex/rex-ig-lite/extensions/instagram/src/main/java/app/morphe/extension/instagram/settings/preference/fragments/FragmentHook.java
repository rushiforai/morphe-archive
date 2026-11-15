/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.fragments;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.settings.ActivityHook;

@SuppressWarnings("deprecation")
public class FragmentHook {

    public static void startFragment(String key) {
        String actionBarTitleKey = null;

        if (Constants.REX_FRAGMENT_GHOST.equals(key)) {
            actionBarTitleKey = "Ghost Mode";
        } else if (Constants.REX_FRAGMENT_NOTIFICATION.equals(key)) {
            actionBarTitleKey = "Notification";
        } else if (Constants.REX_FRAGMENT_PRIVACY.equals(key)) {
            actionBarTitleKey = "Privacy";
        } else if (Constants.REX_FRAGMENT_GESTURES.equals(key)) {
            actionBarTitleKey = "Gestures";
        } else if (Constants.REX_FRAGMENT_FEED_AND_STORIES.equals(key)) {
            actionBarTitleKey = "Feed and Stories";
        } else if (Constants.REX_FRAGMENT_UI_TWEAKS.equals(key)) {
            actionBarTitleKey = "UI Tweaks";
        } else if (Constants.REX_FRAGMENT_DISTRACTION_FREE.equals(key)) {
            actionBarTitleKey = "Focus Mode";
        } else if (Constants.REX_FRAGMENT_FOCUS_LOCK.equals(key)) {
            actionBarTitleKey = "rex_focus_lock";
        } else if (Constants.REX_FRAGMENT_MISC.equals(key)) {
            actionBarTitleKey = "Miscellaneous";
        } else if (Constants.REX_FRAGMENT_DOWNLOAD_MEDIA.equals(key)) {
            actionBarTitleKey = "Downloads";
        } else if (Constants.REX_FRAGMENT_DEV_OPTIONS.equals(key)) {
            actionBarTitleKey = "Developer Options";
        } else if (Constants.REX_FRAGMENT_ABOUT.equals(key)) {
            actionBarTitleKey = "About";
        } else if (Constants.REX_FRAGMENT_ADS.equals(key)) {
            actionBarTitleKey = "rex_category_ads";
        } else if (Constants.REX_FRAGMENT_STORY.equals(key)) {
            actionBarTitleKey = "rex_category_story";
        } else if (Constants.REX_FRAGMENT_LINKS.equals(key)) {
            actionBarTitleKey = "rex_category_links";
        } else if (Constants.REX_FRAGMENT_NAV_BTNS.equals(key)) {
            actionBarTitleKey = "rex_category_navigation_tabs";
        } else if (Constants.REX_FRAGMENT_ACTION_BAR.equals(key)) {
            actionBarTitleKey = "rex_category_action_bar";
        } else if (Constants.REX_FRAGMENT_DM.equals(key)) {
            actionBarTitleKey = "rex_category_dm";
        } else if (Constants.REX_FRAGMENT_FILTER_CONTENT.equals(key)) {
            actionBarTitleKey = "rex_category_filter_content";
        } else if (Constants.REX_FRAGMENT_REC_FLAGS.equals(key)) {
            actionBarTitleKey = "rex_category_rec_flags";
        } else if (Constants.REX_FRAGMENT_INSTANTS.equals(key)) {
            actionBarTitleKey = "rex_instants_title";
        } else if (Constants.REX_FRAGMENT_FONT.equals(key)) {
            actionBarTitleKey = "rex_category_font";
        }

        if (actionBarTitleKey != null) {
            ActivityHook.startRexActivity(key, actionBarTitleKey);
        }
    }

    public static void startSettings() {
        ActivityHook.startRexActivity(Constants.REX_FRAGMENT_SETTINGS, "rex_title_settings");
    }
}
