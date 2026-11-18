/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.devFlags;

import java.util.Map;
import java.util.HashMap;
import java.util.Set;

import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.instagram.entity.DeveloperOptions;
import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.entity.DeveloperOptionsItem;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.instagram.settings.SettingsStatus;

public class HookFlags {
    private static Map<String, Boolean> BOOL_FLAGS = new HashMap<>();
    private static Map<String, Long> LONG_FLAGS = new HashMap<>();
    private static DeveloperOptions developerOptions = new DeveloperOptions();

    private static void simpleOverflowMenuFlags() {
        BOOL_FLAGS.put("104772", false); //ig_ini
        BOOL_FLAGS.put("117613::0", true); //ig_overflow_menu_icon::use_more_lines_icon
        BOOL_FLAGS.put("100002", true); //ig_igds_android_prism_overflow_sheet
    }

    private static void adsFlags() {
        if (Pref.disableAds() || Pref.hideReelsAndStoriesAdPods()) {
            BOOL_FLAGS.put("110800::0", false);
            BOOL_FLAGS.put("114983", false); //ig_stories_restyle_midcard
            BOOL_FLAGS.put("95150", false); //ig_stories_music_midcard
            BOOL_FLAGS.put("84366::12", false); //ig_stories_ayt_midcard::enable_add_yours
            BOOL_FLAGS.put("120110", false); //ig_android_scroll_break
            BOOL_FLAGS.put("105778", false); //ig_android_restyle_post_cap_promo_dialog
        }
    }

    private static void suggestedContentFlags() {
        if (Pref.hideSuggestedContent()) {
            BOOL_FLAGS.put("111509::3", false); //ig_search_ta_nullstate_suggestions::is_android_enabled
            BOOL_FLAGS.put("82771::0", false); //igx_foundation_litho_stories_tray::is_litho_stories_tray_enabled
        }
    }

    private static void videoAndUploadFlags() {
        boolean fastForward = Pref.holdVideoFastForward();
        boolean startMuted = Pref.startFeedVideosMuted();
        boolean hqUpload = Pref.highQualityUpload();
        boolean fps60 = Pref.upload60FpsStories();
        boolean extStory = Pref.extendedStoryDuration();
        if (fastForward || startMuted || hqUpload || fps60 || extStory) {
            // Handled via dedicated runtime hooks; read here to keep flag state synchronized
        }
    }

    private static void profileActionBarFlags() {
        Set<String> pref = Pref.userProfileActionBarButtons();
        if (!pref.equals(Set.of(Constants.AB_CREATE))) {
            BOOL_FLAGS.put("81826::0", true); //igx_action_bar_service_replacement::is_profile_replaced
            BOOL_FLAGS.put("89230::0", true); //ig_android_profile_overflow_menu_redesign_launcher:enabled
        }
    }

    private static void mainFeedActionBarFlags() {
        Set<String> pref = Pref.mainFeedActionBarButtons();
        if (!pref.equals(Set.of(Constants.AB_CREATE, Constants.AB_NOTIFICATIONS))) {
            BOOL_FLAGS.put("81826::1", true); //igx_action_bar_service_replacement::is_main_feed_replaced
            BOOL_FLAGS.put("81826::4", true); //igx_action_bar_service_replacement::is_main_feed_large_screen_replaced
        }
    }

    private static void addRecommendedFlags() {
        if (SettingsStatus.recommendedFlags) {
            Map<String, Boolean> recFlags = FlagsSharedPref.getAll();
            BOOL_FLAGS.putAll(recFlags);
            Map<String, Long> recLongFlags = FlagsSharedPref.getAllLong();
            LONG_FLAGS.putAll(recLongFlags);
        }
    }

    public static void load() {
        videoAndUploadFlags();
        addRecommendedFlags();
    }

    public static Boolean handleBoolFlags(long mobileConfigSpecifier) {
        try {
            DeveloperOptionsItem developerOptionsItem = new DeveloperOptionsItem(mobileConfigSpecifier);
            String universalId = developerOptionsItem.getUniversalId();
            Boolean universalFlag = BOOL_FLAGS.getOrDefault(universalId, null);
            if (universalFlag != null) return universalFlag;

            String configId = developerOptionsItem.getConfigId();
            return BOOL_FLAGS.getOrDefault(configId, null);
        } catch (Exception e) {
            RexUtils.logger(e);
        }
        return null;
    }

    public static Long handleLongFlags(long mobileConfigSpecifier) {
        try {
            DeveloperOptionsItem developerOptionsItem = new DeveloperOptionsItem(mobileConfigSpecifier);
            String universalId = developerOptionsItem.getUniversalId();
            Long universalFlag = LONG_FLAGS.getOrDefault(universalId, null);
            if (universalFlag != null) return universalFlag;

            String configId = developerOptionsItem.getConfigId();
            return LONG_FLAGS.getOrDefault(configId, null);
        } catch (Exception e) {
            RexUtils.logger(e);
        }
        return null;
    }
}
