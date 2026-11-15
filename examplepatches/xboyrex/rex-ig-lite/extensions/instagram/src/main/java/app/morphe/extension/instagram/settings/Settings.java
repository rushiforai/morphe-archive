/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */
package app.morphe.extension.instagram.settings;

import static app.morphe.extension.instagram.settings.RestartPolicy.REQUIRED;
import static app.morphe.extension.instagram.settings.RestartPolicy.NOT_REQUIRED;
import app.morphe.extension.instagram.patches.download.DownloadFileNameFormatter;

public class Settings {
    public static final BooleanSetting REX_DEBUG = new BooleanSetting("rex_debug", false, REQUIRED);
    public static final BooleanSetting MATERIAL_YOU_THEME = new BooleanSetting("material_you_theme", false, NOT_REQUIRED);
    public static final BooleanSetting AMOLED_THEME = new BooleanSetting("amoled_theme", false, NOT_REQUIRED);
    public static final StringSetting INSTAGRAM_THEME_MODE =
            new StringSetting("instagram_theme_mode", "-1", NOT_REQUIRED);
    public static final BooleanSetting INSTAGRAM_THEME_MODE_SYNCHRONIZED =
            new BooleanSetting("instagram_theme_mode_synchronized", false, NOT_REQUIRED);
    public static final BooleanSetting FIRST_TIME_REX = new BooleanSetting("first_time_rex", true, NOT_REQUIRED);

    public static final BooleanSetting DISABLE_ADS = new BooleanSetting("disable_ads", true, REQUIRED);
    public static final BooleanSetting OPEN_LINKS_EXTERNALLY = new BooleanSetting("open_links_externally", true, NOT_REQUIRED);
    public static final BooleanSetting SANITIZE_SHARE_LINKS = new BooleanSetting("sanitize_share_links", true, NOT_REQUIRED);
    public static final StringSetting CUSTOM_SHARING_DOMAIN = new StringSetting("custom_sharing_domain", "", NOT_REQUIRED);
    public static final BooleanSetting HIDE_SUGGESTED_CONTENT = new BooleanSetting("hide_suggested_content", true, REQUIRED);
    public static final BooleanSetting DEVELOPER_OPTIONS = new BooleanSetting("enable_developer_options", true, NOT_REQUIRED);
    public static final BooleanSetting DIRECTLY_OPEN_METACONFIG = new BooleanSetting("directly_open_metaconfig", true, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_DISCOVER_PEOPLE = new BooleanSetting("disable_discover_people", true, REQUIRED);
    public static final BooleanSetting LIMIT_FOLLOWING_FEED = new BooleanSetting("limit_following_feed", false, REQUIRED);
    public static final BooleanSetting HIDE_FEED_POSTS = new BooleanSetting("hide_feed_posts", false, REQUIRED);
    public static final BooleanSetting TURN_ON_ALL_GHOST_MODES = new BooleanSetting("turn_on_all_ghost_modes", false, NOT_REQUIRED);
    public static final BooleanSetting VIEW_STORIES_ANONYMOUSLY = new BooleanSetting("view_stories_anonymously", false, NOT_REQUIRED);
    public static final BooleanSetting VIEW_LIVE_ANONYMOUSLY = new BooleanSetting("view_live_anonymously", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_SCREENSHOT_DETECTION = new BooleanSetting("disable_screenshot_detection", false, NOT_REQUIRED);
    public static final BooleanSetting VIEW_DM_ANONYMOUSLY = new BooleanSetting("view_dm_anonymously", false, NOT_REQUIRED);
    public static final BooleanSetting MARK_AS_READ_AFTER_REPLY = new BooleanSetting("mark_as_read_after_reply", false, NOT_REQUIRED);
    public static final BooleanSetting MARK_AS_SEEN_ON_REACTION = new BooleanSetting("mark_as_seen_on_reaction", false, NOT_REQUIRED);
    public static final BooleanSetting LISTEN_VOICE_NOTE_SECRETLY = new BooleanSetting("listen_voice_note_secretly", false, NOT_REQUIRED);
    public static final BooleanSetting GHOST_INSTANTS = new BooleanSetting("ghost_instants", false, NOT_REQUIRED);
    public static final StringSetting LAST_ACTIVE_FORMAT = new StringSetting("last_active_format", "Full Date & Time (dd MMM, hh:mm a)", NOT_REQUIRED);

    public static final BooleanSetting INSTANTS_DOWNLOAD = new BooleanSetting("instants_download", false, NOT_REQUIRED);
    public static final BooleanSetting SAVE_DELETED_MESSAGES = new BooleanSetting("save_deleted_messages", true, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_STORIES = new BooleanSetting("disable_stories", false, REQUIRED);
    public static final BooleanSetting DISABLE_HIGHLIGHTS = new BooleanSetting("disable_highlights", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_STORIES_TRAY = new BooleanSetting("hide_stories_tray", false, REQUIRED);
    public static final BooleanSetting HIDE_HIDDEN_REQUESTS = new BooleanSetting("hide_hidden_requests", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_EXPLORE = new BooleanSetting("disable_explore", false, REQUIRED);
    public static final BooleanSetting DISABLE_COMMENTS = new BooleanSetting("disable_comments", false, REQUIRED);
    public static final BooleanSetting FOLLOW_BACK_INDICATOR = new BooleanSetting("follow_back_indicator", true, NOT_REQUIRED);
    public static final BooleanSetting FOLLOW_BACK_COLOR_INDICATOR = new BooleanSetting("follow_back_color_indicator", true, NOT_REQUIRED);
    public static final BooleanSetting FOLLOW_LIST_NON_FOLLOWER_BADGE = new BooleanSetting("follow_list_non_follower_badge", true, NOT_REQUIRED);
    public static final BooleanSetting VIEW_STORY_MENTIONS = new BooleanSetting("view_story_mentions", true, REQUIRED);
    public static final BooleanSetting DISABLE_STORY_FLIPPING = new BooleanSetting("disable_story_flipping", false, NOT_REQUIRED);
    public static final BooleanSetting LOOP_STORY = new BooleanSetting("loop_story", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_STORY_FOLLOW_BUTTON = new BooleanSetting("hide_story_follow_button", false, NOT_REQUIRED);
    public static final StringSetting CUSTOMISE_STORY_TIMESTAMP = new StringSetting("customise_story_timestamp", "default", REQUIRED);
    public static final BooleanSetting UNLIMITED_REPLAYS = new BooleanSetting("unlimited_replays", false, REQUIRED);
    public static final BooleanSetting DISABLE_DISAPPEARING_MESSAGES_GESTURE = new BooleanSetting("disable_disappearing_messages_gesture", false, REQUIRED);
    public static final BooleanSetting EPHEMERAL_MEDIA_CAPTION = new BooleanSetting("ephemeral_media_caption", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_LIKES = new BooleanSetting("hide_likes", false, REQUIRED);
    public static final BooleanSetting HIDE_SHARE_BUTTON = new BooleanSetting("hide_share_button", false, NOT_REQUIRED);
    public static final StringSetting HIDE_SAVE_BUTTON_SURFACES = new StringSetting("hide_save_button_surfaces", "", NOT_REQUIRED);
    public static final BooleanSetting HIDE_SAVE_BUTTONS_LEGACY = new BooleanSetting("hide_save_buttons", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_RESHARE_BUTTON = new BooleanSetting("hide_reshare_button", false, NOT_REQUIRED);
    public static final BooleanSetting INBOX_LOCK = new BooleanSetting("inbox_lock", false, REQUIRED);
    public static final BooleanSetting INBOX_LOCK_NOTIFICATIONS = new BooleanSetting("inbox_lock_notifications", false, NOT_REQUIRED);
    public static final BooleanSetting HIDDEN_CHATS = new BooleanSetting("hidden_chats", true, REQUIRED);
    public static final StringSetting HIDDEN_CHATS_TAPS = new StringSetting("hidden_chats_taps", "3", NOT_REQUIRED);
    public static final BooleanSetting HIDDEN_CHATS_MUTE = new BooleanSetting("hidden_chats_mute", true, NOT_REQUIRED);
    public static final BooleanSetting HIDE_HIDDEN_CHATS_MENU = new BooleanSetting("hide_hidden_chats_menu", false, NOT_REQUIRED);
    public static final BooleanSetting SHOW_HIDDEN_CHAT_NOTIFICATIONS = new BooleanSetting("show_hidden_chat_notifications", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_REELS_FOLLOW_BUTTON = new BooleanSetting("hide_reels_follow_button", false, NOT_REQUIRED);
    public static final BooleanSetting IMPROVE_IMAGE_VIEWING = new BooleanSetting("improve_image_viewing", false, REQUIRED);
    public static final BooleanSetting RESUME_REELS_AFTER_SCROLLING = new BooleanSetting("resume_reels_after_scrolling", false, NOT_REQUIRED);
    public static final BooleanSetting COMMENT_COPY_BUTTON = new BooleanSetting("comment_copy_button", true, NOT_REQUIRED);
    public static final BooleanSetting COMMENT_SAVE_MEDIA_BUTTON = new BooleanSetting("comment_save_media_button", true, NOT_REQUIRED);
    public static final BooleanSetting HIDE_GROUP_CREATION_BUTTON_ON_SHARESHEET = new BooleanSetting("hide_group_creation_button_on_sharesheet", true, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_REELS_SCROLLING = new BooleanSetting("disable_reels_scrolling", false, REQUIRED);
    public static final BooleanSetting DISABLE_REELS_SWIPE_REFRESH = new BooleanSetting("disable_reels_swipe_refresh", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_SWIPE_TO_CREATE = new BooleanSetting("disable_swipe_to_create", false, NOT_REQUIRED);
    public static final StringSetting FOCUS_LOCK_DURATION_MINUTES = new StringSetting("focus_lock_duration_minutes", "10080", NOT_REQUIRED);
    public static final StringSetting FOCUS_LOCK_UNTIL = new StringSetting("focus_lock_until", "0", NOT_REQUIRED);
    public static final StringSetting FOCUS_LOCK_FORMAT = new StringSetting("focus_lock_format", "", NOT_REQUIRED);
    public static final StringSetting FOCUS_LOCK_UNLOCK_REQUESTED_AT = new StringSetting("focus_lock_unlock_requested_at", "0", NOT_REQUIRED);
    public static final BooleanSetting REMOVE_EMPTY_BOTTOM_SPACE = new BooleanSetting("remove_empty_bottom_space", true, REQUIRED);
    public static final BooleanSetting DISABLE_TYPING_STATUS = new BooleanSetting("disable_typing_status", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_NOTES_TRAY = new BooleanSetting("hide_notes_tray", false, REQUIRED);
    public static final BooleanSetting DISABLE_VIDEO_AUTOPLAY = new BooleanSetting("disable_video_autoplay", false, NOT_REQUIRED);
    public static final StringSetting CHANGE_LIKE_ANIMATION = new StringSetting("change_like_animation", "ARES_LIKE_ACTIVATION", REQUIRED);
    public static final StringSetting CUSTOMISE_STORY_RING_SIZE = new StringSetting("customise_story_ring_size", "100", REQUIRED);
    public static final BooleanSetting ENABLE_MORE_OPTIONS_ON_POST = new BooleanSetting("enable_more_option_on_post", true, NOT_REQUIRED);
    public static final BooleanSetting USE_SYSTEM_FONT = new BooleanSetting("use_system_font", false, REQUIRED);

    public static final BooleanSetting DISABLE_DOUBLE_TAP_LIKE_POST = new BooleanSetting("disable_double_tap_like_post", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_DOUBLE_TAP_LIKE_REEL = new BooleanSetting("disable_double_tap_like_reel", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_DOUBLE_TAP_LIKE_COMMENT = new BooleanSetting("disable_double_tap_like_comment", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_DOUBLE_TAP_LIKE_MESSAGE = new BooleanSetting("disable_double_tap_like_message", false, NOT_REQUIRED);

    public static final BooleanSetting ENABLE_DOWNLOAD = new BooleanSetting("enable_download", true, REQUIRED);
    public static final BooleanSetting FEED_DOWNLOAD_BUTTON = new BooleanSetting("feed_download_button", true, NOT_REQUIRED);
    public static final BooleanSetting REEL_DOWNLOAD_BUTTON = new BooleanSetting("reel_download_button", true, NOT_REQUIRED);
    public static final BooleanSetting STORY_DOWNLOAD_BUTTON = new BooleanSetting("story_download_button", true, NOT_REQUIRED);
    public static final BooleanSetting ENABLE_DIRECT_DOWNLOAD = new BooleanSetting("enable_direct_download", false, REQUIRED);
    public static final BooleanSetting DOWNLOAD_USERNAME_FOLDER = new BooleanSetting("download_username_folder", false, NOT_REQUIRED);
    public static final BooleanSetting SHOW_DOWNLOAD_NOTIFICATION = new BooleanSetting("show_download_notification", true, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_STORAGE_PERMISSION = new BooleanSetting("disable_storage_permission", true, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_SUBFOLDERS = new BooleanSetting("disable_subfolders", false, NOT_REQUIRED);
    public static final BooleanSetting SKIP_DOWNLOADED_MEDIA = new BooleanSetting("skip_downloaded_media", false, NOT_REQUIRED);
    public static final BooleanSetting EMBED_DOWNLOAD_METADATA = new BooleanSetting("embed_download_metadata", false, NOT_REQUIRED);
    public static final BooleanSetting PREFER_DASH_FORMAT = new BooleanSetting("prefer_dash_format", true, NOT_REQUIRED);
    public static final BooleanSetting DASH_AUDIO_AAC_LC = new BooleanSetting("dash_audio_aac_lc", false, NOT_REQUIRED);
    public static final StringSetting DOWNLOAD_FILE_NAME_TEMPLATE =
            new StringSetting("download_file_name_template", DownloadFileNameFormatter.DEFAULT_TEMPLATE, NOT_REQUIRED);
    public static final StringSetting CUSTOM_DOWNLOAD_PATH = new StringSetting("custom_download_path", "", NOT_REQUIRED);
    public static final StringSetting EXTERNAL_DOWNLOADER_PACKAGE_NAME = new StringSetting("external_downloader_package_name", "", NOT_REQUIRED);
    public static final BooleanSetting DOWNLOAD_WITH_EXTERNAL_DOWNLOADER = new BooleanSetting("download_with_external_downloader", true, NOT_REQUIRED);

    public static final BooleanSetting HIDE_NAVIGATION_FEED = new BooleanSetting("hide_navigation_feed", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_NAVIGATION_REELS = new BooleanSetting("hide_navigation_reels", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_NAVIGATION_DIRECT = new BooleanSetting("hide_navigation_direct", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_NAVIGATION_SEARCH = new BooleanSetting("hide_navigation_search", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_NAVIGATION_CREATE = new BooleanSetting("hide_navigation_create", false, NOT_REQUIRED);
    public static final StringSetting NAVIGATION_TABS = new StringSetting("navigation_tabs", "", REQUIRED);
    public static final BooleanSetting HIDE_HOME_CREATE_BUTTON = new BooleanSetting("hide_home_create_button", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_HOME_NOTIFICATIONS_BUTTON = new BooleanSetting("hide_home_notifications_button", false, NOT_REQUIRED);

    public static final StringSetting ACTION_BAR_MAIN_FEED = new StringSetting("action_bar_main_feed", "", REQUIRED);
    public static final StringSetting ACTION_BAR_USER_PROFILE = new StringSetting("action_bar_user_profile", "", REQUIRED);
    public static final StringSetting ACTION_BAR_CHAT = new StringSetting("action_bar_chat_buttons", "", REQUIRED);
    public static final StringSetting ACTION_BAR_INBOX = new StringSetting("action_bar_inbox", "", REQUIRED);

    public static final BooleanSetting ENABLE_MARK_CHAT_AS_READ = new BooleanSetting("enable_mark_chat_as_read", true, NOT_REQUIRED);

    public static final StringSetting FILTER_STORY_BY_TYPE = new StringSetting("filter_story_by_type", "", NOT_REQUIRED);
    public static final StringSetting FILTER_STORY_BY_USER_TYPE = new StringSetting("filter_story_by_user_type", "", NOT_REQUIRED);
    public static final StringSetting FILTER_STORY_MIN_STORY_ITEMS = new StringSetting("filter_story_min_story_items", "1", NOT_REQUIRED);
    public static final StringSetting FILTER_STORY_MAX_STORY_ITEMS = new StringSetting("filter_story_max_story_items", "9999", NOT_REQUIRED);

    // Additional xboyrex UI, Privacy, Notification, Feed, Story, and Misc settings
    public static final BooleanSetting DISABLE_ANALYTICS_TRACKER = new BooleanSetting("disable_analytics_tracker", true, NOT_REQUIRED);
    public static final BooleanSetting PRIVATE_SCREEN_MODE = new BooleanSetting("private_screen_mode", false, NOT_REQUIRED);
    public static final StringSetting PRIVATE_SCREEN_OPACITY = new StringSetting("private_screen_opacity", "65", NOT_REQUIRED);
    public static final BooleanSetting DND_MODE_ENABLED = new BooleanSetting("dnd_mode_enabled", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_FILTER_NOTIFICATIONS = new BooleanSetting("disable_filter_notifications", false, NOT_REQUIRED);
    public static final StringSetting FILTER_NOTIFICATION_TYPES = new StringSetting("filter_notification_types", "", NOT_REQUIRED);
    public static final BooleanSetting DISABLE_FILTER_KEYWORDS = new BooleanSetting("disable_filter_keywords", false, NOT_REQUIRED);
    public static final StringSetting NOTIFICATION_KEYWORDS = new StringSetting("notification_keywords", "", NOT_REQUIRED);

    public static final BooleanSetting CHAT_CUSTOM_BG_ENABLED = new BooleanSetting("chat_custom_bg_enabled", false, NOT_REQUIRED);
    public static final StringSetting CHAT_CUSTOM_BG_URI = new StringSetting("chat_custom_bg_uri", "", NOT_REQUIRED);
    public static final StringSetting CHOOSE_EMOJI_TYPE = new StringSetting("choose_emoji_type", "iOS 17.4 Emoji", NOT_REQUIRED);
    public static final StringSetting CHOOSE_FONT_TYPE = new StringSetting("choose_font_type", "System Default", NOT_REQUIRED);
    public static final StringSetting DM_CREATIVE_FONT_STYLE = new StringSetting("dm_creative_font_style", "Normal", NOT_REQUIRED);
    public static final BooleanSetting LIQUID_GLASS_NAV_BAR = new BooleanSetting("liquid_glass_nav_bar", true, NOT_REQUIRED);

    public static final BooleanSetting HIDE_PROFILE_FOLLOW_INDICATOR = new BooleanSetting("hide_profile_follow_indicator", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_PROFILE_OPTIONS_ICON = new BooleanSetting("hide_profile_options_icon", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_REEL_DOWNLOAD_ICON = new BooleanSetting("hide_reel_download_icon", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_REEL_OPTIONS_ICON = new BooleanSetting("hide_reel_options_icon", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_HOME_OPTIONS_ICON = new BooleanSetting("hide_home_options_icon", false, NOT_REQUIRED);

    public static final BooleanSetting DISABLE_FEED_OPTIONS_ICON = new BooleanSetting("disable_feed_options_icon", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_FEED_DOWNLOAD_ICON = new BooleanSetting("disable_feed_download_icon", false, NOT_REQUIRED);
    public static final BooleanSetting LONG_PRESS_POST_OPTIONS = new BooleanSetting("long_press_post_options", true, NOT_REQUIRED);
    public static final BooleanSetting COPY_CAPTION_WITHOUT_HASHTAGS = new BooleanSetting("copy_caption_without_hashtags", false, NOT_REQUIRED);
    public static final BooleanSetting REPOST_WITH_CAPTION_WA = new BooleanSetting("repost_with_caption_wa", true, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_COMMENTS_OPTIONS = new BooleanSetting("disable_comments_options", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_SPLIT_VIDEO_WA = new BooleanSetting("disable_split_video_wa", false, NOT_REQUIRED);

    public static final BooleanSetting HIDE_STORY_MARK_SEEN_ICON = new BooleanSetting("hide_story_mark_seen_icon", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_STORY_OPTIONS_ICON = new BooleanSetting("hide_story_options_icon", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_MENTION_FOLLOW_INDICATOR = new BooleanSetting("disable_mention_follow_indicator", false, NOT_REQUIRED);
    public static final BooleanSetting FORCE_STORY_SOUND = new BooleanSetting("force_story_sound", false, NOT_REQUIRED);
    public static final BooleanSetting ENHANCE_STORY_UPLOAD_QUALITY = new BooleanSetting("enhance_story_upload_quality", true, NOT_REQUIRED);

    public static final BooleanSetting ADD_ACCOUNTS_WITHOUT_LIMITS = new BooleanSetting("add_accounts_without_limits", true, NOT_REQUIRED);
    public static final BooleanSetting REMOVE_BIO_MORE = new BooleanSetting("remove_bio_more", true, NOT_REQUIRED);
    public static final StringSetting TRANSLATOR_LANGUAGE = new StringSetting("translator_language", "English", NOT_REQUIRED);
    public static final StringSetting SPLIT_VIDEO_DURATION = new StringSetting("split_video_duration", "30 Seconds", NOT_REQUIRED);
    public static final StringSetting CHOOSE_WHATSAPP_TYPE = new StringSetting("choose_whatsapp_type", "WhatsApp", NOT_REQUIRED);
    public static final BooleanSetting DISABLE_WATCH_HISTORY = new BooleanSetting("disable_watch_history", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_META_AI = new BooleanSetting("hide_meta_ai", true, NOT_REQUIRED);
    public static final BooleanSetting FORCE_SDR_DISPLAY = new BooleanSetting("force_sdr_display", true, NOT_REQUIRED);

    // Settings referenced by the current preference screens. Aliases share existing persisted keys
    // where the feature semantics are identical; newly introduced controls get independent keys.
    public static final BooleanSetting HIDE_VIEW_ONCE_SEEN = new BooleanSetting("hide_view_once_seen", false, NOT_REQUIRED);
    public static final BooleanSetting HIDE_AUDIO_SEEN = LISTEN_VOICE_NOTE_SECRETLY;
    public static final BooleanSetting DND_MODE = DND_MODE_ENABLED;
    public static final BooleanSetting HIDE_REELS_AND_STORIES_AD_PODS = new BooleanSetting("hide_reels_and_stories_ad_pods", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_ANALYTICS = DISABLE_ANALYTICS_TRACKER;
    public static final BooleanSetting RESTORE_TRUST_SPOOF = new BooleanSetting("restore_trust_spoof", false, NOT_REQUIRED);
    public static final BooleanSetting HOLD_VIDEO_FAST_FORWARD = new BooleanSetting("hold_video_fast_forward", false, NOT_REQUIRED);
    public static final BooleanSetting START_FEED_VIDEOS_MUTED = new BooleanSetting("start_feed_videos_muted", false, NOT_REQUIRED);
    public static final BooleanSetting DISABLE_REELS_LOOPING = new BooleanSetting("disable_reels_looping", false, NOT_REQUIRED);
    public static final BooleanSetting PLAY_STORY_SOUND_AUTOMATICALLY = FORCE_STORY_SOUND;
    public static final BooleanSetting STORY_MENTION_ICON = new BooleanSetting("story_mention_icon", true, NOT_REQUIRED);
    public static final BooleanSetting HIGH_QUALITY_UPLOAD = ENHANCE_STORY_UPLOAD_QUALITY;
    public static final BooleanSetting UPLOAD_60FPS_STORIES = new BooleanSetting("upload_60fps_stories", false, NOT_REQUIRED);
    public static final BooleanSetting EXTENDED_STORY_DURATION = new BooleanSetting("extended_story_duration", false, NOT_REQUIRED);
    public static final BooleanSetting CUSTOM_CHAT_WALLPAPER = CHAT_CUSTOM_BG_ENABLED;
    public static final BooleanSetting REELS_FLOATING_TOOLBAR = new BooleanSetting("reels_floating_toolbar", false, NOT_REQUIRED);
    public static final BooleanSetting STORY_FILTERS_MASTER = new BooleanSetting("story_filters_master", false, NOT_REQUIRED);
}
