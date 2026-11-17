/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.settings.SettingsStatus;

public class Block {
    private static final Set<String> SUGGESTED_CONTENT_KEY = new HashSet<>(Arrays.asList(
            "clips_netego", "stories_netego", "in_feed_survey", "bloks_netego",
            "suggested_igd_channels", "suggested_top_accounts", "suggested_users"
    ));

    private static final Set<String> AD_POD_KEYS = new HashSet<>(Arrays.asList(
            "ad_pod", "clips_ad_pod", "stories_ad_pod", "intent_aware_ad_pivot",
            "stand_alone_multi_ad_pivot", "multi_ads_info", "reels_multi_ads", "netego_ad4ad"
    ));

    private static final Set<String> ANALYTICS_KEYS = new HashSet<>(Arrays.asList(
            "pigeon_reserved_keyword_module", "client_event", "marauder_tier",
            "falco_data_quality_stream", "igs_analytics", "logging_info_token", "ad_tracking_token"
    ));

    private static final Set<String> VOICE_SEEN_KEYS = new HashSet<>(Arrays.asList(
            "voice_media_seen", "audio_seen", "voice_note_seen_state"
    ));

    // Returns an invalid string, such that json parsing fails for the blocked key.
    public static String replaceJsonParserKey(String key) {
        if (key == null) return null;

        if (Pref.hideSuggestedContent() && SettingsStatus.hideSuggestedContent && SUGGESTED_CONTENT_KEY.contains(key)) {
            return Constants.REX;
        }
        if (Pref.hideReelsAndStoriesAdPods() && AD_POD_KEYS.contains(key)) {
            return Constants.REX;
        }
        if (Pref.disableAnalytics() && ANALYTICS_KEYS.contains(key)) {
            return Constants.REX;
        }
        if (Pref.hideAudioSeen() && VOICE_SEEN_KEYS.contains(key)) {
            return Constants.REX;
        }

        return key;
    }
}
