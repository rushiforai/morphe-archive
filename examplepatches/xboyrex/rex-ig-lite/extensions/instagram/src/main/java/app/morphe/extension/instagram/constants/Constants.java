/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.constants;

import static app.morphe.extension.instagram.utils.IgStr.str;

import app.morphe.extension.rex.constants.ExtensionStrings;

public class Constants {
    public static final String REX = "rex";
    public static final String REX_SETTINGS = REX + "_settings";
    public static final String SHARED_PREF_NAME = REX_SETTINGS;
    public static final String DEFAULT_REX_FOLDER = "xboyrex";
    public static final String DEFAULT_AUDIO_FOLDER = "Audio";
    public static final String DEFAULT_DM_FOLDER = "DM";
    public static final String DEFAULT_GIF_FOLDER = "Gif";
    public static final String INSTAGRAM_SHARE_LINK = "https://www.instagram.com/%s/%s/";
    public static final String REC_FLAGS = REX + "_recommended_flags_v3";
    public static final String REX_MAPPINGS_PATH = "https://github.com/xboyrex/rex-ig-lite/raw/refs/heads/main/docs/mappings/";

    public static final String AB_SETTINGS_ICON = "SETTINGS_ICON";
    public static final String AB_CREATE = "CREATE";
    public static final String AB_NOTIFICATIONS = "NOTIFICATIONS";
    public static final String AB_GHOST_MODE_ICON = "GHOST_MODE_ICON";
    public static final String AB_PROFILE_INFO_ICON = "PROFILE_INFO_ICON";

    public static final String REX_FRAGMENT_TITLE = "rex_frag_title";
    public static final String REX_FRAGMENT_NAME = "rex_frag_name";

    public static final String REX_FRAGMENT_SETTINGS = "rex_frag_settings";
    public static final String REX_FRAGMENT_PREMIUM = "rex_frag_premium";
    public static final String REX_FRAGMENT_ADS = "rex_frag_ads";
    public static final String REX_FRAGMENT_GHOST = "rex_frag_ghost";
    public static final String REX_FRAGMENT_NOTIFICATION = "rex_frag_notification";
    public static final String REX_FRAGMENT_PRIVACY = "rex_frag_privacy";
    public static final String REX_FRAGMENT_GESTURES = "rex_frag_gestures";
    public static final String REX_FRAGMENT_FEED_STORIES = "rex_frag_feed_stories";
    public static final String REX_FRAGMENT_UI_TWEAKS = "rex_frag_ui_tweaks";
    public static final String REX_FRAGMENT_FOCUS_MODE = "rex_frag_focus_mode";
    public static final String REX_FRAGMENT_STORY = "rex_frag_story";
    public static final String REX_FRAGMENT_LINKS = "rex_frag_links";
    public static final String REX_FRAGMENT_DISTRACTION_FREE = "rex_frag_distraction_free";
    public static final String REX_FRAGMENT_FOCUS_LOCK = "rex_frag_focus_lock";
    public static final String REX_FRAGMENT_MISC = "rex_frag_misc";
    public static final String REX_FRAGMENT_DOWNLOAD_MEDIA = "rex_frag_download_media";
    public static final String REX_FRAGMENT_NAV_BTNS = "rex_frag_nav_btns";
    public static final String REX_FRAGMENT_DEV_OPTIONS = "rex_frag_dev_options";
    public static final String REX_FRAGMENT_ABOUT = "rex_frag_about";
    public static final String REX_FRAGMENT_BACKUP = "rex_frag_backup";
    public static final String REX_FRAGMENT_ACTION_BAR = "rex_frag_action_bar";
    public static final String REX_FRAGMENT_DM = "rex_frag_dm";
    public static final String REX_FRAGMENT_FILTER_CONTENT = "rex_frag_filter_content";
    public static final String REX_FRAGMENT_REC_FLAGS = "rex_frag_rec_flags";
    public static final String REX_FRAGMENT_INSTANTS = "rex_frag_instants";
    public static final String REX_FRAGMENT_FONT = "rex_frag_font";

    public static final String AUTHOR_URL = "https://github.com/xboyrex";
    public static final String REPO_URL = "https://github.com/xboyrex/rex-ig-lite";
    public static final String TELEGRAM_URL = "https://t.me/MayankDroid7";
    public static final String TELEGRAM_GROUP_URL = "https://t.me/OnyxHub7";
    public static final String YOUTUBE_URL = "https://youtube.com/@mayankdroid?si=slX8DDU0dpLSIYyY";
    public static final String YOUTUBE_SECONDARY_URL = "https://youtube.com/@onyxdroid89?si=9gxpZfa3bpI9PKku";
    public static final String INSTAGRAM_URL = "https://www.instagram.com/mayank.zx7";

    public static void load() {
        ExtensionStrings.setDefaultRexFolder(Constants.DEFAULT_REX_FOLDER);
        ExtensionStrings.setDownloadOngoing(str("rex_downloading_media"));
        ExtensionStrings.setDownloadCompleted(str("rex_downloaded_media"));
        ExtensionStrings.setDownloadError(str("rex_download_failed_media"));
        ExtensionStrings.setDownloadSetPathFailed(str("rex_download_set_path_failed"));
        ExtensionStrings.setDownloadSetPathSuccess(str("rex_download_set_path_success"));
        ExtensionStrings.setDownloadGrantPermission(str("rex_download_choose_folder"));
        ExtensionStrings.setDownloadGrantPermissionFailed(str("rex_download_choose_folder_failed"));
    }
}
