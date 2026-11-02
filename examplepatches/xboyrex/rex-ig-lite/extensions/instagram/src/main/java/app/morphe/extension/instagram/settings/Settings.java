/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings;

import app.morphe.extension.rex.settings.BooleanSetting;
import app.morphe.extension.rex.settings.StringSetting;
import app.morphe.extension.instagram.patches.download.DownloadFileNameFormatter;

public class Settings {
    public static final BooleanSetting REX_DEBUG = new BooleanSetting("rex_debug", false);
    public static final BooleanSetting MATERIAL_YOU_THEME = new BooleanSetting("material_you_theme", false);
    public static final BooleanSetting AMOLED_THEME = new BooleanSetting("amoled_theme", false);
    public static final StringSetting INSTAGRAM_THEME_MODE =
            new StringSetting("instagram_theme_mode", "-1");
    public static final BooleanSetting INSTAGRAM_THEME_MODE_SYNCHRONIZED =
            new BooleanSetting("instagram_theme_mode_synchronized", false);
    public static final BooleanSetting FIRST_TIME_REX = new BooleanSetting("first_time_rex", true);

    public static final BooleanSetting DISABLE_ADS = new BooleanSetting("disable_ads", true);
    public static final BooleanSetting OPEN_LINKS_EXTERNALLY = new BooleanSetting("open_links_externally", true);
    public static final BooleanSetting SANITIZE_SHARE_LINKS = new BooleanSetting("sanitize_share_links", true);
    public static final StringSetting CUSTOM_SHARING_DOMAIN = new StringSetting("custom_sharing_domain", "");
    public static final BooleanSetting HIDE_SUGGESTED_CONTENT = new BooleanSetting("hide_suggested_content", true);
    public static final BooleanSetting DEVELOPER_OPTIONS = new BooleanSetting("enable_developer_options", true);
    public static final BooleanSetting DIRECTLY_OPEN_METACONFIG = new BooleanSetting("directly_open_metaconfig", true);
    public static final BooleanSetting ENABLE_EMP_OPTIONS = new BooleanSetting("enable_employee_options", false);
    public static final BooleanSetting ALLOW_USER_NETWORK_CERTIFICATE = new BooleanSetting("allow_user_network_certificate", false);
    public static final BooleanSetting DISABLE_DISCOVER_PEOPLE = new BooleanSetting("disable_discover_people", true);
    public static final BooleanSetting LIMIT_FOLLOWING_FEED = new BooleanSetting("limit_following_feed", false);
    public static final BooleanSetting DISABLE_ANALYTICS = new BooleanSetting("disable_analytics", false);
    public static final BooleanSetting TURN_ON_ALL_GHOST_MODES = new BooleanSetting("turn_on_all_ghost_modes", false);
    public static final BooleanSetting VIEW_STORIES_ANONYMOUSLY = new BooleanSetting("view_stories_anonymously", false);
    public static final BooleanSetting VIEW_LIVE_ANONYMOUSLY = new BooleanSetting("view_live_anonymously", false);
    public static final BooleanSetting DISABLE_SCREENSHOT_DETECTION = new BooleanSetting("disable_screenshot_detection", false);
    public static final BooleanSetting VIEW_DM_ANONYMOUSLY = new BooleanSetting("view_dm_anonymously", false);
    public static final BooleanSetting INSTANTS_DOWNLOAD = new BooleanSetting("instants_download", false);
    public static final BooleanSetting SAVE_DELETED_MESSAGES = new BooleanSetting("save_deleted_messages", true);
    public static final BooleanSetting DISABLE_STORIES = new BooleanSetting("disable_stories", false);
    public static final BooleanSetting DISABLE_HIGHLIGHTS = new BooleanSetting("disable_highlights", false);
    public static final BooleanSetting HIDE_STORIES_TRAY = new BooleanSetting("hide_stories_tray", false);
    public static final BooleanSetting DISABLE_EXPLORE = new BooleanSetting("disable_explore", false);
    public static final BooleanSetting DISABLE_COMMENTS = new BooleanSetting("disable_comments", false);
    public static final BooleanSetting FOLLOW_BACK_INDICATOR = new BooleanSetting("follow_back_indicator", true);
    public static final BooleanSetting FOLLOW_BACK_COLOR_INDICATOR = new BooleanSetting("follow_back_color_indicator", true);
    public static final BooleanSetting FOLLOW_LIST_NON_FOLLOWER_BADGE = new BooleanSetting("follow_list_non_follower_badge", true);
    public static final BooleanSetting VIEW_STORY_MENTIONS = new BooleanSetting("view_story_mentions", true);
    public static final BooleanSetting DISABLE_STORY_FLIPPING = new BooleanSetting("disable_story_flipping", false);
    public static final BooleanSetting LOOP_STORY = new BooleanSetting("loop_story", false);
    public static final StringSetting CUSTOMISE_STORY_TIMESTAMP = new StringSetting("customise_story_timestamp", "default");
    public static final BooleanSetting UNLIMITED_REPLAYS = new BooleanSetting("unlimited_replays", false);
    public static final BooleanSetting HIDE_SHARE_BUTTON = new BooleanSetting("hide_share_button", false);
    public static final BooleanSetting HIDE_SAVE_BUTTONS = new BooleanSetting("hide_save_buttons", false);
    public static final BooleanSetting HIDE_RESHARE_BUTTON = new BooleanSetting("hide_reshare_button", false);
    public static final BooleanSetting INBOX_LOCK = new BooleanSetting("inbox_lock", false);
    public static final BooleanSetting INBOX_LOCK_NOTIFICATIONS = new BooleanSetting("inbox_lock_notifications", false);
    public static final BooleanSetting HIDE_REELS_FOLLOW_BUTTON = new BooleanSetting("hide_reels_follow_button", false);
    public static final BooleanSetting IMPROVE_IMAGE_VIEWING = new BooleanSetting("improve_image_viewing", false);
    public static final BooleanSetting COMMENT_COPY_BUTTON = new BooleanSetting("comment_copy_button", true);
    public static final BooleanSetting COMMENT_SAVE_MEDIA_BUTTON = new BooleanSetting("comment_save_media_button", true);
    public static final BooleanSetting HIDE_GROUP_CREATION_BUTTON_ON_SHARESHEET = new BooleanSetting("hide_group_creation_button_on_sharesheet", true);
    public static final BooleanSetting DISABLE_REELS_SCROLLING = new BooleanSetting("disable_reels_scrolling", false);
    public static final BooleanSetting DISABLE_SWIPE_TO_CREATE = new BooleanSetting("disable_swipe_to_create", false);
    public static final StringSetting FOCUS_LOCK_DURATION_MINUTES = new StringSetting("focus_lock_duration_minutes", "10080");
    public static final StringSetting FOCUS_LOCK_UNTIL = new StringSetting("focus_lock_until", "0");
    public static final StringSetting FOCUS_LOCK_FORMAT = new StringSetting("focus_lock_format", "");
    public static final StringSetting FOCUS_LOCK_UNLOCK_REQUESTED_AT = new StringSetting("focus_lock_unlock_requested_at", "0");
    public static final BooleanSetting REMOVE_EMPTY_BOTTOM_SPACE = new BooleanSetting("remove_empty_bottom_space", true);
    public static final BooleanSetting DISABLE_TYPING_STATUS = new BooleanSetting("disable_typing_status", false);
    public static final BooleanSetting HIDE_NOTES_TRAY = new BooleanSetting("hide_notes_tray", false);
    public static final BooleanSetting DISABLE_VIDEO_AUTOPLAY = new BooleanSetting("disable_video_autoplay", false);
    public static final BooleanSetting UNLOCK_PLUS_BENEFITS = new BooleanSetting("unlock_plus_benefits", true);
    public static final StringSetting CHANGE_LIKE_ANIMATION = new StringSetting("change_like_animation", "ARES_LIKE_ACTIVATION");
    public static final StringSetting CUSTOMISE_STORY_RING_SIZE = new StringSetting("customise_story_ring_size", "100");
    public static final BooleanSetting ENABLE_MORE_OPTIONS_ON_POST = new BooleanSetting("enable_more_option_on_post", true);
    public static final BooleanSetting USE_SYSTEM_FONT = new BooleanSetting("use_system_font", false);

    public static final BooleanSetting DISABLE_DOUBLE_TAP_LIKE_POST = new BooleanSetting("disable_double_tap_like_post", false);
    public static final BooleanSetting DISABLE_DOUBLE_TAP_LIKE_REEL = new BooleanSetting("disable_double_tap_like_reel", false);
    public static final BooleanSetting DISABLE_DOUBLE_TAP_LIKE_COMMENT = new BooleanSetting("disable_double_tap_like_comment", false);
    public static final BooleanSetting DISABLE_DOUBLE_TAP_LIKE_MESSAGE = new BooleanSetting("disable_double_tap_like_message", false);

    public static final BooleanSetting ENABLE_DOWNLOAD = new BooleanSetting("enable_download", true);
    public static final BooleanSetting FEED_DOWNLOAD_BUTTON = new BooleanSetting("feed_download_button", true);
    public static final BooleanSetting ENABLE_DIRECT_DOWNLOAD = new BooleanSetting("enable_direct_download", false);
    public static final BooleanSetting DOWNLOAD_USERNAME_FOLDER = new BooleanSetting("download_username_folder", false);
    public static final BooleanSetting EMBED_DOWNLOAD_METADATA = new BooleanSetting("embed_download_metadata", false);
    public static final StringSetting DOWNLOAD_FILE_NAME_TEMPLATE =
            new StringSetting("download_file_name_template", DownloadFileNameFormatter.DEFAULT_TEMPLATE);
    public static final StringSetting CUSTOM_DOWNLOAD_PATH = new StringSetting("custom_download_path", "");
    public static final StringSetting EXTERNAL_DOWNLOADER_PACKAGE_NAME = new StringSetting("external_downloader_package_name", "");
    public static final BooleanSetting DOWNLOAD_WITH_EXTERNAL_DOWNLOADER = new BooleanSetting("download_with_external_downloader", true);

    public static final BooleanSetting HIDE_NAVIGATION_FEED = new BooleanSetting("hide_navigation_feed", false);
    public static final BooleanSetting HIDE_NAVIGATION_REELS = new BooleanSetting("hide_navigation_reels", false);
    public static final BooleanSetting HIDE_NAVIGATION_DIRECT = new BooleanSetting("hide_navigation_direct", false);
    public static final BooleanSetting HIDE_NAVIGATION_SEARCH = new BooleanSetting("hide_navigation_search", false);
    public static final BooleanSetting HIDE_NAVIGATION_CREATE = new BooleanSetting("hide_navigation_create", false);
    public static final StringSetting NAVIGATION_TABS = new StringSetting("navigation_tabs", "");
    public static final BooleanSetting HIDE_HOME_CREATE_BUTTON = new BooleanSetting("hide_home_create_button", false);
    public static final BooleanSetting HIDE_HOME_NOTIFICATIONS_BUTTON = new BooleanSetting("hide_home_notifications_button", false);

    public static final StringSetting ACTION_BAR_MAIN_FEED = new StringSetting("action_bar_main_feed", "");
    public static final StringSetting ACTION_BAR_USER_PROFILE = new StringSetting("action_bar_user_profile", "");
    public static final StringSetting ACTION_BAR_CHAT = new StringSetting("action_bar_chat_buttons", "");
    public static final StringSetting ACTION_BAR_INBOX = new StringSetting("action_bar_inbox", "");

    public static final BooleanSetting ENABLE_MARK_CHAT_AS_READ = new BooleanSetting("enable_mark_chat_as_read", true);

    public static final StringSetting FILTER_STORY_BY_TYPE = new StringSetting("filter_story_by_type", "");
    public static final StringSetting FILTER_STORY_BY_USER_TYPE = new StringSetting("filter_story_by_user_type", "");

    public static final StringSetting FILTER_STORY_MIN_STORY_ITEMS = new StringSetting("filter_story_min_story_items", "1");
    public static final StringSetting FILTER_STORY_MAX_STORY_ITEMS = new StringSetting("filter_story_max_story_items", "9999");

    // Additional xboyrex UI/UX & merged rex settings
    public static final BooleanSetting SWIPE_CAMERA_GESTURE = new BooleanSetting("swipe_camera_gesture", true);
    public static final BooleanSetting GHOST_INSTANTS = new BooleanSetting("ghost_instants", true);
    public static final BooleanSetting HIDE_STORY_REPLIES = new BooleanSetting("hide_story_replies", false);
    public static final BooleanSetting HIDE_CALL_BUTTONS = new BooleanSetting("hide_call_buttons", false);
    public static final BooleanSetting REELS_SHARE_NOTIFICATION = new BooleanSetting("reels_share_notification", false);
    public static final BooleanSetting STORY_SHARE_NOTIFICATION = new BooleanSetting("story_share_notification", false);
    public static final BooleanSetting POST_SHARE_NOTIFICATION = new BooleanSetting("post_share_notification", false);
    public static final BooleanSetting SCREENSHOT_NOTIFICATION = new BooleanSetting("screenshot_notification", false);
    public static final BooleanSetting STORY_DOWNLOAD_NOTIFICATION = new BooleanSetting("story_download_notification", false);
    public static final BooleanSetting STORY_FORCE_HD = new BooleanSetting("story_force_hd", false);
    public static final BooleanSetting UPLOAD_MAX_QUALITY = new BooleanSetting("upload_max_quality", false);
    public static final BooleanSetting REEL_RING_CAPTIONS = new BooleanSetting("reel_ring_captions", false);
    public static final BooleanSetting SOUND_BUTTON_OVERLAY = new BooleanSetting("sound_button_overlay", false);
    public static final BooleanSetting SHOW_FOLLOWER_COUNT = new BooleanSetting("show_follower_count", false);
    public static final BooleanSetting HIDE_DM_TRANSLATION = new BooleanSetting("hide_dm_translation", false);
    public static final BooleanSetting REELS_DIRECT_RESTYLE = new BooleanSetting("reels_direct_restyle", false);
    public static final BooleanSetting REELS_TAP_HOLD_SPEED = new BooleanSetting("reels_tap_hold_speed", false);
    public static final BooleanSetting REELS_LOCK_CONTROLS = new BooleanSetting("reels_lock_controls", false);
    public static final BooleanSetting STORY_AUTO_PAUSE = new BooleanSetting("story_auto_pause", false);
    public static final BooleanSetting LONG_PRESS_FAST_FORWARD = new BooleanSetting("long_press_fast_forward", false);
    public static final BooleanSetting SWIPE_NAVIGATION = new BooleanSetting("swipe_navigation", false);
    public static final BooleanSetting VOLUME_KEY_SCROLL = new BooleanSetting("volume_key_scroll", false);
    public static final BooleanSetting TRIPLE_TAP_DOWNLOAD = new BooleanSetting("triple_tap_download", false);
    public static final BooleanSetting SHAKE_TO_CLEAR_CACHE = new BooleanSetting("shake_to_clear_cache", false);
    public static final BooleanSetting DOUBLE_TAP_PROFILE_COPY_BIO = new BooleanSetting("double_tap_profile_copy_bio", false);
    public static final BooleanSetting MESSAGE_TRANSLATOR = new BooleanSetting("message_translator", false);
    public static final StringSetting TRANSLATOR_LANGUAGE = new StringSetting("translator_language", "English (en)");
    public static final BooleanSetting VOICE_MESSAGE_SPEED_CONTROL = new BooleanSetting("voice_message_speed_control", false);
    public static final StringSetting SPLIT_VIDEO_DURATION = new StringSetting("split_video_duration", "30s");
    public static final StringSetting WHATSAPP_TYPE = new StringSetting("whatsapp_type", "WhatsApp");
    public static final BooleanSetting SCREENSHOT_BLOCKER = new BooleanSetting("screenshot_blocker", false);
    public static final BooleanSetting COPY_CAPTION_WITHOUT_HASHTAGS = new BooleanSetting("copy_caption_without_hashtags", false);
    public static final BooleanSetting DISABLE_FILTER_NOTIFICATIONS = new BooleanSetting("disable_filter_notifications", false);
    public static final StringSetting WHATSAPP_PACKAGE_TYPE = WHATSAPP_TYPE;

    // Toolbar, Feed, Reels & Story Icon visibility toggles matching Screenshots 063202 & 063214
    public static final BooleanSetting DISABLE_FEED_OPTIONS_ICON = new BooleanSetting("disable_feed_options_icon", false);
    public static final BooleanSetting DISABLE_FEED_DOWNLOAD_ICON = new BooleanSetting("disable_feed_download_icon", false);
    public static final BooleanSetting LONG_PRESS_FEED_OPTIONS = new BooleanSetting("long_press_feed_options", true);
    public static final BooleanSetting HIDE_STORY_MARK_SEEN_ICON = new BooleanSetting("hide_story_mark_seen_icon", false);
    public static final BooleanSetting HIDE_STORY_OPTIONS_ICON = new BooleanSetting("hide_story_options_icon", false);
    public static final BooleanSetting HIDE_PROFILE_OPTIONS_ICON = new BooleanSetting("hide_profile_options_icon", false);
    public static final BooleanSetting HIDE_REEL_DOWNLOAD_ICON = new BooleanSetting("hide_reel_download_icon", false);
    public static final BooleanSetting HIDE_REEL_OPTIONS_ICON = new BooleanSetting("hide_reel_options_icon", false);
    public static final BooleanSetting HIDE_HOME_OPTIONS_ICON = new BooleanSetting("hide_home_options_icon", false);
    public static final BooleanSetting DISABLE_WATCH_HISTORY = new BooleanSetting("disable_watch_history", false);
    public static final BooleanSetting LIQUID_GLASS_NAV = new BooleanSetting("liquid_glass_bottom_nav", true);
    public static final BooleanSetting MARK_SEEN_ON_REACTION = new BooleanSetting("mark_seen_on_reaction", false);
    public static final BooleanSetting PRIVATE_SCREEN_MODE = new BooleanSetting("private_screen_mode", false);
    public static final BooleanSetting REMOVE_BIO_MORE = new BooleanSetting("remove_bio_more", true);
    public static final BooleanSetting REPOST_WA_CAPTION = new BooleanSetting("repost_wa_caption", true);
    public static final BooleanSetting DISABLE_SPLIT_WA = new BooleanSetting("disable_split_wa", false);
    public static final BooleanSetting FORCE_STORY_SOUND = new BooleanSetting("force_story_sound", false);
    public static final BooleanSetting DISABLE_STORAGE_PERM_POPUP = new BooleanSetting("disable_storage_perm_popup", true);
    public static final BooleanSetting DISABLE_SUBFOLDERS = new BooleanSetting("disable_subfolders", false);
    public static final BooleanSetting SKIP_DOWNLOADED_MEDIA = new BooleanSetting("skip_downloaded_media", true);
}
