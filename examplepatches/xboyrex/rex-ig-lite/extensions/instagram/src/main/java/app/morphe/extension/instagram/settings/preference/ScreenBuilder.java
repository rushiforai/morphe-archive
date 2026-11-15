/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.text.format.DateFormat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.patches.Links;
import app.morphe.extension.instagram.patches.customise.font.FontStorage;
import app.morphe.extension.instagram.patches.devFlags.Flag;
import app.morphe.extension.instagram.patches.devFlags.RecommendedFlags;
import app.morphe.extension.instagram.patches.focusLock.FocusLock;
import app.morphe.extension.instagram.patches.focusLock.FocusLockTargets;
import app.morphe.extension.instagram.settings.BooleanSetting;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.settings.preference.widgets.ButtonPref;
import app.morphe.extension.instagram.settings.preference.widgets.CategoryPref;
import app.morphe.extension.instagram.settings.preference.widgets.DownloadButtonPreference;
import app.morphe.extension.instagram.settings.preference.widgets.FocusLockDurationPreference;
import app.morphe.extension.instagram.settings.preference.widgets.SwitchPref;
import app.morphe.extension.instagram.theme.MaterialYouTheme;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.downloader.StorageUtils;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Utils;

public class ScreenBuilder {
    private final Context context;
    private final PreferenceScreen screen;
    private final Helper helper;

    public ScreenBuilder(Context context, PreferenceScreen screen, Helper helper) {
        this.context = context;
        this.screen = screen;
        this.helper = helper;
    }

    public void buildFragment(String fragmentName) {
        if (Constants.REX_FRAGMENT_SETTINGS.equals(fragmentName)) {
            buildSettingsPage();
        } else if (Constants.REX_FRAGMENT_GHOST.equals(fragmentName)) {
            ghostSection();
        } else if (Constants.REX_FRAGMENT_NOTIFICATION.equals(fragmentName)) {
            buildNotificationSection();
        } else if (Constants.REX_FRAGMENT_PRIVACY.equals(fragmentName)) {
            buildPrivacySection();
        } else if (Constants.REX_FRAGMENT_GESTURES.equals(fragmentName)) {
            buildGesturesSection();
        } else if (Constants.REX_FRAGMENT_FEED_AND_STORIES.equals(fragmentName)) {
            buildFeedAndStoriesSection();
        } else if (Constants.REX_FRAGMENT_UI_TWEAKS.equals(fragmentName)) {
            buildUiTweaksSection();
        } else if (Constants.REX_FRAGMENT_DISTRACTION_FREE.equals(fragmentName)) {
            distractionFreeSection();
        } else if (Constants.REX_FRAGMENT_MISC.equals(fragmentName)) {
            buildMiscSection();
        } else if (Constants.REX_FRAGMENT_DOWNLOAD_MEDIA.equals(fragmentName)) {
            buildDownloadSection();
        } else if (Constants.REX_FRAGMENT_DEV_OPTIONS.equals(fragmentName)) {
            buildDeveloperSection();
        } else if (Constants.REX_FRAGMENT_ABOUT.equals(fragmentName)) {
            aboutSection(SettingsStatus.FLAGS);
        } else if (Constants.REX_FRAGMENT_ADS.equals(fragmentName)) {
            buildAdsSection();
        } else if (Constants.REX_FRAGMENT_STORY.equals(fragmentName)) {
            storySection();
        } else if (Constants.REX_FRAGMENT_LINKS.equals(fragmentName)) {
            linksSection();
        } else if (Constants.REX_FRAGMENT_NAV_BTNS.equals(fragmentName)) {
            buildNavigationSection();
        } else if (Constants.REX_FRAGMENT_ACTION_BAR.equals(fragmentName)) {
            buildActionBarSection();
        } else if (Constants.REX_FRAGMENT_DM.equals(fragmentName)) {
            dmSection();
        } else if (Constants.REX_FRAGMENT_FILTER_CONTENT.equals(fragmentName)) {
            filterContentSection();
        } else if (Constants.REX_FRAGMENT_REC_FLAGS.equals(fragmentName)) {
            buildRecommendedFlagsSection();
        } else if (Constants.REX_FRAGMENT_FOCUS_LOCK.equals(fragmentName)) {
            buildFocusLockSection();
        } else if (Constants.REX_FRAGMENT_INSTANTS.equals(fragmentName)) {
            buildInstantsSection();
        } else if (Constants.REX_FRAGMENT_FONT.equals(fragmentName)) {
            buildFontSection();
        }
    }

    public void buildFragmentForSearch(String fragmentName) {
        if (Constants.REX_FRAGMENT_REC_FLAGS.equals(fragmentName)) {
            buildRecommendedFlagsSection(false);
        } else {
            buildFragment(fragmentName);
        }
    }

    private void addPreference(Preference pref) {
        addPreference(null, pref);
    }

    private void addPreference(PreferenceCategory category, Preference pref) {
        if (category != null) {
            category.addPreference(pref);
        } else {
            screen.addPreference(pref);
        }
    }

    private PreferenceCategory addCategory(String title) {
        CategoryPref preferenceCategory = new CategoryPref(context);
        preferenceCategory.setFirstCategory(screen.getPreferenceCount() == 0);
        preferenceCategory.setTitle(title);
        screen.addPreference(preferenceCategory);
        return preferenceCategory;
    }

    public void buildSettingsPage() {
        addPreference(helper.categoryPreference(
                "Ghost Mode",
                "Hide seen, typing, story views, screenshots & live presence",
                Constants.REX_FRAGMENT_GHOST
        ));
        addPreference(helper.categoryPreference(
                "Notification",
                "DND Mode, Push Notification Center & hidden chat mute",
                Constants.REX_FRAGMENT_NOTIFICATION
        ));
        addPreference(helper.categoryPreference(
                "Privacy",
                "Disable Ads, Hide Suggested Content, Link Sanitizer & App Lock",
                Constants.REX_FRAGMENT_PRIVACY
        ));
        addPreference(helper.categoryPreference(
                "Gestures",
                "Double-tap like controls, swipe navigation, long-press options & zoom",
                Constants.REX_FRAGMENT_GESTURES
        ));
        addPreference(helper.categoryPreference(
                "Feed and Stories",
                "Video & Story playback, 60fps high quality upload, Story Likes History & Mentions",
                Constants.REX_FRAGMENT_FEED_AND_STORIES
        ));
        addPreference(helper.categoryPreference(
                "UI Tweaks",
                "AMOLED Theme, Custom Fonts, Chat Background, Navigation & Action Bar",
                Constants.REX_FRAGMENT_UI_TWEAKS
        ));
        addPreference(helper.categoryPreference(
                "Focus Mode",
                "Timed Focus Lock & Distraction-Free Controls (Stories, Reels, Explore, Comments)",
                Constants.REX_FRAGMENT_DISTRACTION_FREE
        ));
        addPreference(helper.categoryPreference(
                "Miscellaneous",
                "Deleted Messages Vault, Saved Profiles/Captions/Bios, Follow-Back Badge & Video Splitter",
                Constants.REX_FRAGMENT_MISC
        ));
        addPreference(helper.categoryPreference(
                "Downloads",
                "Zero-Prompt Direct Download, DASH 4K/1080p Muxer, Audio MP3 & Folder by Username",
                Constants.REX_FRAGMENT_DOWNLOAD_MEDIA
        ));
        addPreference(helper.categoryPreference(
                "Developer Options",
                "MetaConfig Overrides, Recommended Flags, Experiment Mappings & Signature Spoof",
                Constants.REX_FRAGMENT_DEV_OPTIONS
        ));
        addPreference(helper.categoryPreference(
                "About xboyrex",
                "SakuraTunes Liquid Glass About, Developer Links, Changelogs & Backup/Restore",
                Constants.REX_FRAGMENT_ABOUT
        ));
    }

    public void ghostSection() {
        PreferenceCategory catMaster = addCategory("Master Switch");
        addPreference(catMaster, helper.switchPreference(
                "Turn On All Ghost Modes",
                "Enable all stealth privacy switches with a single tap",
                Settings.TURN_ON_ALL_GHOST_MODES
        ));

        PreferenceCategory catChat = addCategory("Direct Messages & Chat");
        addPreference(catChat, helper.switchPreference(
                "Hide Message Seen",
                "Read Direct Messages without sending read receipts",
                Settings.VIEW_DM_ANONYMOUSLY
        ));
        addPreference(catChat, helper.availableWhen(
                helper.switchPreference(
                        "Mark as Read Only After Reply",
                        "Automatically mark chat as read when you send a reply",
                        Settings.MARK_AS_READ_AFTER_REPLY
                ),
                () -> SharedPref.getBooleanPref(Settings.VIEW_DM_ANONYMOUSLY)
                        || SharedPref.getBooleanPref(Settings.TURN_ON_ALL_GHOST_MODES)
        ));
        addPreference(catChat, helper.switchPreference(
                "Hide Typing Status",
                "Prevent others from seeing 'Typing...' in Direct Messages",
                Settings.DISABLE_TYPING_STATUS
        ));
        addPreference(catChat, helper.switchPreference(
                "Hide Screenshot Detection",
                "Take screenshots in DM threads and vanish mode without notifying the sender",
                Settings.DISABLE_SCREENSHOT_DETECTION
        ));
        addPreference(catChat, helper.switchPreference(
                "Hide View Once Seen",
                "Open ephemeral photos and videos without marking them as viewed",
                Settings.HIDE_VIEW_ONCE_SEEN
        ));
        addPreference(catChat, helper.switchPreference(
                "Unlimited Replays on View Once Media",
                "Keep ephemeral photos and videos replayable forever",
                Settings.UNLIMITED_REPLAYS
        ));
        addPreference(catChat, helper.switchPreference(
                "Ghost Instants (Quicksnap)",
                "View Quicksnap / Instants media without marking them as opened",
                Settings.GHOST_INSTANTS
        ));

        PreferenceCategory catFeed = addCategory("Stories, Live & Audio");
        addPreference(catFeed, helper.switchPreference(
                "Hide Story Seen",
                "Watch stories anonymously without appearing in the viewer list",
                Settings.VIEW_STORIES_ANONYMOUSLY
        ));
        addPreference(catFeed, helper.switchPreference(
                "Hide Live Seen",
                "Join live broadcasts anonymously without showing in the viewer list",
                Settings.VIEW_LIVE_ANONYMOUSLY
        ));
        addPreference(catFeed, helper.switchPreference(
                "Hide Voice Message Listen Status",
                "Listen to voice notes in Direct Messages without sending a played receipt",
                Settings.HIDE_AUDIO_SEEN
        ));
    }

    public void buildNotificationSection() {
        PreferenceCategory catDnd = addCategory("Push Notification Controls");
        addPreference(catDnd, helper.switchPreference(
                "Do Not Disturb (DND Mode)",
                "Silence all incoming Instagram push notifications globally",
                Settings.DND_MODE
        ));
        addPreference(catDnd, helper.buttonPreference(
                "Notification Center",
                "Choose which notification types (DM, Story, Reels, Likes, Live) are allowed",
                "rex_notification_center_btn"
        ));

        PreferenceCategory catHidden = addCategory("Hidden Chats & Inbox");
        addPreference(catHidden, helper.switchPreference(
                "Mute Notifications for Hidden Chats",
                "Suppress push notifications and unread badges for hidden DM threads",
                Settings.HIDDEN_CHATS_MUTE
        ));
        addPreference(catHidden, helper.switchPreference(
                "Protect Notifications with Inbox Lock",
                "Require biometric / device authentication when opening locked DM notifications",
                Settings.INBOX_LOCK_NOTIFICATIONS
        ));
    }

    public void buildPrivacySection() {
        PreferenceCategory catAds = addCategory("Ad Blocker & Sponsored Content");
        addPreference(catAds, helper.switchPreference(
                "Disable All Ads",
                "Block sponsored posts, story ads, and promotional injections across Instagram",
                Settings.DISABLE_ADS
        ));
        addPreference(catAds, helper.switchPreference(
                "Hide Reels & Stories Ad Pods",
                "Strip multi-ad pod chains and netego commercial reels",
                Settings.HIDE_REELS_AND_STORIES_AD_PODS
        ));
        addPreference(catAds, helper.switchPreference(
                "Hide Suggested Content",
                "Remove 'Suggested for you' posts, reels, and account carousels from Feed",
                Settings.HIDE_SUGGESTED_CONTENT
        ));
        addPreference(catAds, helper.switchPreference(
                "Disable Analytics & Telemetry",
                "Block background analytics logging and crash telemetry uploads",
                Settings.DISABLE_ANALYTICS
        ));

        PreferenceCategory catLinks = addCategory("Link Privacy & External Browser");
        addPreference(catLinks, helper.switchPreference(
                "Remove Tracking from Shared Links",
                "Strip igshid, utm, and tracking parameters when copying or sharing URLs",
                Settings.SANITIZE_SHARE_LINKS
        ));
        addPreference(catLinks, helper.switchPreference(
                "Open Links in External Browser",
                "Bypass Instagram's in-app browser and open URLs in your default browser",
                Settings.OPEN_LINKS_EXTERNALLY
        ));
        addPreference(catLinks, helper.editTextPreference(
                "Custom Share Domain",
                Links.customSharingDomainSummary(Pref.customSharingDomain()),
                Settings.CUSTOM_SHARING_DOMAIN
        ));

        PreferenceCategory catLock = addCategory("Inbox Lock & Hidden Chats");
        addPreference(catLock, helper.switchPreference(
                "Enable Inbox Lock",
                "Require device lock / biometrics before opening Direct Messages",
                Settings.INBOX_LOCK
        ));
        addPreference(catLock, helper.switchPreference(
                "Enable Hidden Chats Vault",
                "Long-press any chat to hide it; multi-tap the DM icon to reveal hidden threads",
                Settings.HIDDEN_CHATS
        ));
        addPreference(catLock, helper.availableWhen(
                helper.listPreference(
                        "Taps to Open Hidden Chats",
                        "Number of quick taps on the DM tab icon to toggle Hidden Chats mode",
                        Settings.HIDDEN_CHATS_TAPS
                ),
                () -> SharedPref.getBooleanPref(Settings.HIDDEN_CHATS)
        ));
        addPreference(catLock, helper.switchPreference(
                "Restore APK Trust & Signature Spoof",
                "Spoof official Instagram signature to fix Facebook login & integrity checks",
                Settings.RESTORE_TRUST_SPOOF
        ));
    }

    public void buildGesturesSection() {
        PreferenceCategory catTap = addCategory("Double-Tap Like Controls");
        addPreference(catTap, helper.switchPreference(
                "Disable Double-Tap Like on Posts",
                "Prevent accidental likes when double-tapping feed photos or carousels",
                Settings.DISABLE_DOUBLE_TAP_LIKE_POST
        ));
        addPreference(catTap, helper.switchPreference(
                "Disable Double-Tap Like on Reels",
                "Prevent accidental likes when double-tapping Reels videos",
                Settings.DISABLE_DOUBLE_TAP_LIKE_REEL
        ));
        addPreference(catTap, helper.switchPreference(
                "Disable Double-Tap Like on Comments",
                "Prevent accidental likes when double-tapping comments",
                Settings.DISABLE_DOUBLE_TAP_LIKE_COMMENT
        ));
        addPreference(catTap, helper.switchPreference(
                "Disable Double-Tap Like on Messages",
                "Prevent accidental heart reactions when double-tapping DM messages",
                Settings.DISABLE_DOUBLE_TAP_LIKE_MESSAGE
        ));

        PreferenceCategory catSwipe = addCategory("Swipe & Hold Gestures");
        addPreference(catSwipe, helper.switchPreference(
                "Disable Swipe Left/Right on Feed",
                "Disable horizontal swipe to camera / Direct Messages from the Home feed",
                Settings.DISABLE_SWIPE_TO_CREATE
        ));
        addPreference(catSwipe, helper.switchPreference(
                "Disable Disappearing Mode Swipe in DM",
                "Prevent swiping up in Direct Messages from activating Vanish Mode",
                Settings.DISABLE_DISAPPEARING_MESSAGES_GESTURE
        ));
        addPreference(catSwipe, helper.switchPreference(
                "Long-Press Post for xboyrex Options",
                "Hold anywhere on a feed post or header to open the 12-item xboyrex Options sheet",
                Settings.LONG_PRESS_POST_OPTIONS
        ));
        addPreference(catSwipe, helper.switchPreference(
                "Triple-Tap or Hold Photo to Zoom",
                "Enable full pinch and tap-hold zoom on images and profile pictures",
                Settings.IMPROVE_IMAGE_VIEWING
        ));
        addPreference(catSwipe, helper.switchPreference(
                "Hold Video for 2x Fast-Forward",
                "Long-press on video edges to speed up playback to 2x",
                Settings.HOLD_VIDEO_FAST_FORWARD
        ));
    }

    public void buildFeedAndStoriesSection() {
        PreferenceCategory catFeed = addCategory("Feed & Reels Playback");
        addPreference(catFeed, helper.switchPreference(
                "Disable Video Autoplay",
                "Require manual tap before playing videos in the Home feed",
                Settings.DISABLE_VIDEO_AUTOPLAY
        ));
        addPreference(catFeed, helper.switchPreference(
                "Start Videos Perfectly Muted",
                "Always start feed videos muted until you tap the audio toggle",
                Settings.START_FEED_VIDEOS_MUTED
        ));
        addPreference(catFeed, helper.switchPreference(
                "Resume Reels After Scrolling",
                "Remember playback position when scrolling back to a Reel",
                Settings.RESUME_REELS_AFTER_SCROLLING
        ));
        addPreference(catFeed, helper.switchPreference(
                "Disable Automatic Reels Looping",
                "Pause Reel at the end instead of replaying infinitely",
                Settings.DISABLE_REELS_LOOPING
        ));

        PreferenceCategory catStory = addCategory("Stories & Mentions");
        addPreference(catStory, helper.switchPreference(
                "Disable Story Auto-Flipping",
                "Prevent stories from advancing to the next user automatically",
                Settings.DISABLE_STORY_FLIPPING
        ));
        addPreference(catStory, helper.switchPreference(
                "Loop Current Story",
                "Keep looping the active story slide until you tap next",
                Settings.LOOP_STORY
        ));
        addPreference(catStory, helper.switchPreference(
                "Play Story Sound Automatically",
                "Start stories with sound enabled even before pressing volume keys",
                Settings.PLAY_STORY_SOUND_AUTOMATICALLY
        ));
        addPreference(catStory, helper.switchPreference(
                "View Hidden Story Mentions",
                "Inspect all mentioned accounts in a story via the Story menu",
                Settings.VIEW_STORY_MENTIONS
        ));
        addPreference(catStory, helper.switchPreference(
                "Show Story Mention Indicator Pill",
                "Display an @ badge on stories that contain hidden or visible user mentions",
                Settings.STORY_MENTION_ICON
        ));
        addPreference(catStory, helper.buttonPreference(
                "Configure Story Mention Pill Style",
                "Customize pill position, color, and tap behavior",
                "rex_story_mention_settings_btn"
        ));
        addPreference(catStory, helper.buttonPreference(
                "Story Likes History Vault",
                "Browse all stories you have liked with user avatars and timestamps",
                "rex_story_like_history_btn"
        ));
        addPreference(catStory, helper.switchPreference(
                "Hide Story Follow Button",
                "Remove the inline Follow button from story headers",
                Settings.HIDE_STORY_FOLLOW_BUTTON
        ));
        addPreference(catStory, helper.listPreference(
                "Custom Story Timestamp Format",
                "Show exact upload time or full date on stories instead of '3h'",
                Settings.CUSTOMISE_STORY_TIMESTAMP
        ));
        addPreference(catStory, helper.editTextNumPreference(
                "Story Ring Size Scale",
                "Customize the size of the story tray rings on the Home feed",
                Settings.CUSTOMISE_STORY_RING_SIZE
        ));

        PreferenceCategory catQuality = addCategory("Media Upload Quality (Max 60FPS)");
        addPreference(catQuality, helper.switchPreference(
                "Upload Media in Highest Quality",
                "Force maximum bitrate and resolution for Photos, Stories, Reels & Voice Notes",
                Settings.HIGH_QUALITY_UPLOAD
        ));
        addPreference(catQuality, helper.switchPreference(
                "60 FPS Video & Story Recording",
                "Unlock 60fps high-framerate encoding for camera and gallery video uploads",
                Settings.UPLOAD_60FPS_STORIES
        ));
        addPreference(catQuality, helper.switchPreference(
                "Remove 60s Story Duration Limit",
                "Allow uploading longer story segments without forced 15s/60s clipping",
                Settings.EXTENDED_STORY_DURATION
        ));
    }

    public void buildUiTweaksSection() {
        PreferenceCategory catTheme = addCategory("Theme & Visual Appearance");
        if (MaterialYouTheme.isAmoledAvailable()) {
            addPreference(catTheme, helper.availableWhen(
                    helper.switchPreference(
                            "Pure AMOLED Black Theme",
                            "Use #000000 pitch-black surfaces across Dark Mode",
                            Settings.AMOLED_THEME
                    ),
                    () -> MaterialYouTheme.canEnableAmoled(context)
            ));
        }
        if (MaterialYouTheme.isMaterialYouAvailable()) {
            addPreference(catTheme, helper.switchPreference(
                    "Material You Dynamic Accent",
                    "Adapt accents to your Android 12+ wallpaper palette",
                    Settings.MATERIAL_YOU_THEME
            ));
        }
        addPreference(catTheme, helper.buttonPreference(
                "App Language & Translator",
                "Change Instagram UI language and in-app translation target language",
                "rex_app_language_btn"
        ));
        addPreference(catTheme, helper.buttonPreference(
                "Custom Typography & Fonts",
                "Use system font or import a custom .ttf / .otf font file",
                Constants.REX_FRAGMENT_FONT
        ));
        addPreference(catTheme, helper.listPreference(
                "Custom Double-Tap Like Animation",
                "Customize the floating heart animation when liking posts",
                Settings.CHANGE_LIKE_ANIMATION
        ));

        PreferenceCategory catChat = addCategory("Direct Message Chat Background");
        addPreference(catChat, helper.switchPreference(
                "Enable Custom Chat Background",
                "Apply a custom AMOLED tint or solid color wallpaper inside DM threads",
                Settings.CUSTOM_CHAT_WALLPAPER
        ));
        addPreference(catChat, helper.buttonPreference(
                "Choose Chat Background Color",
                "Pick from 7 curated AMOLED & Liquid Glass presets",
                "rex_chat_wallpaper_picker"
        ));

        PreferenceCategory catBars = addCategory("Top Action Bar, Bottom Nav & Floating Toolbar");
        addPreference(catBars, helper.buttonPreference(
                "Top Action Bar Icons (⬡ & Eye)",
                "Configure which xboyrex icons appear on Home, Profile, Inbox & Chat",
                Constants.REX_FRAGMENT_ACTION_BAR
        ));
        if (SettingsStatus.hideNavigationButtons) {
            addPreference(catBars, helper.buttonPreference(
                    "Bottom Navigation Tabs & Startup Tab",
                    "Reorder or hide bottom tabs and choose your startup screen",
                    Constants.REX_FRAGMENT_NAV_BTNS
            ));
        }
        addPreference(catBars, helper.switchPreference(
                "Reels Floating Top-Right Toolbar (⬡ + ⬇)",
                "Show quick xboyrex Options and Download buttons at top-right of Reels",
                Settings.REELS_FLOATING_TOOLBAR
        ));
        addPreference(catBars, helper.switchPreference(
                "Remove Empty Bottom Gesture Bar Space",
                "Reclaim bottom padding under the navigation bar on gesture nav devices",
                Settings.REMOVE_EMPTY_BOTTOM_SPACE
        ));
        addPreference(catBars, helper.switchPreference(
                "Story Filters (Hide by Type / Count)",
                "Filter out specific story types or accounts with too many story slides",
                Settings.STORY_FILTERS_MASTER
        ));
        addPreference(catBars, helper.buttonPreference(
                "Configure Story Filters",
                "Set story type filters and min/max story count rules",
                Constants.REX_FRAGMENT_FILTER_CONTENT
        ));
    }

    public void distractionFreeSection() {
        if (!SettingsStatus.distractionFreeSection()) return;

        if (SettingsStatus.focusLock) {
            addPreference(helper.buttonPreference(
                    str("rex_focus_lock"),
                    FocusLock.statusSummary(),
                    Constants.REX_FRAGMENT_FOCUS_LOCK
            ));
        }
        if (SettingsStatus.disableStories) {
            addLockableSwitch(str("rex_disable_stories"), "", Settings.DISABLE_STORIES);
        }
        if (SettingsStatus.hideStoriesTray) {
            addLockableSwitch(str("rex_hide_stories_tray"), str("rex_hide_stories_tray_desc"), Settings.HIDE_STORIES_TRAY);
        }
        if (SettingsStatus.hideHiddenRequests) {
            addLockableSwitch(str("rex_hide_hidden_requests"), str("rex_hide_hidden_requests_desc"), Settings.HIDE_HIDDEN_REQUESTS);
        }
        if (SettingsStatus.disableHighlights) {
            addLockableSwitch(str("rex_disable_highlights"), "", Settings.DISABLE_HIGHLIGHTS);
        }
        if (SettingsStatus.hideNotesTray) {
            addLockableSwitch(str("rex_hide_notes_tray"), str("rex_hide_notes_tray_desc"), Settings.HIDE_NOTES_TRAY);
        }
        if (SettingsStatus.disableExplore) {
            addLockableSwitch(str("rex_disable_explore"), "", Settings.DISABLE_EXPLORE);
        }
        if (SettingsStatus.disableComments) {
            addLockableSwitch(str("rex_disable_comments"), "", Settings.DISABLE_COMMENTS);
        }
        if (SettingsStatus.hideFeedPosts) {
            addPreference(helper.switchPreference(str("rex_hide_feed_posts"), str("rex_hide_feed_posts_desc"), Settings.HIDE_FEED_POSTS));
        }
        if (SettingsStatus.limitFollowingFeed) {
            addLockableSwitch(str("rex_limit_following_feed"), str("rex_limit_following_feed_desc"), Settings.LIMIT_FOLLOWING_FEED);
        }
        if (SettingsStatus.disableDiscoverPeople) {
            addPreference(helper.switchPreference(str("rex_disable_discover_people"), "", Settings.DISABLE_DISCOVER_PEOPLE));
        }
        if (SettingsStatus.disableReelsScrolling) {
            addLockableSwitch(str("rex_disable_reels_scrolling"), str("rex_disable_reels_scrolling_desc"), Settings.DISABLE_REELS_SCROLLING);
        }
        if (SettingsStatus.disableSwipeToCreate) {
            addLockableSwitch(str("rex_disable_swipe_to_create"), str("rex_disable_swipe_to_create_desc"), Settings.DISABLE_SWIPE_TO_CREATE);
        }
        if (SettingsStatus.hideGroupCreationOnSharesheet) {
            addLockableSwitch(str("rex_hide_group_creation_button_on_sharesheet"), "", Settings.HIDE_GROUP_CREATION_BUTTON_ON_SHARESHEET);
        }
        if (SettingsStatus.hideReelsFollowButton) {
            addLockableSwitch(str("rex_hide_reels_follow_button"), str("rex_hide_reels_follow_button_desc"), Settings.HIDE_REELS_FOLLOW_BUTTON);
        }
        if (SettingsStatus.hideLikes) {
            addPreference(helper.switchPreference(str("rex_hide_likes"), "", Settings.HIDE_LIKES));
        }
        if (SettingsStatus.hideShareButton) {
            addPreference(helper.switchPreference(str("rex_hide_share_button"), "", Settings.HIDE_SHARE_BUTTON));
        }
        if (SettingsStatus.hideSaveButtons) {
            addPreference(helper.multiSelectListPref(str("rex_hide_save_buttons"), "", Settings.HIDE_SAVE_BUTTON_SURFACES));
        }
        if (SettingsStatus.hideReshareButton) {
            addPreference(helper.switchPreference(str("rex_hide_reshare_button"), "", Settings.HIDE_RESHARE_BUTTON));
        }
    }

    private void addLockableSwitch(String title, String summary, BooleanSetting setting) {
        addPreference(helper.forcedSwitchPreference(
                title,
                summary,
                setting,
                FocusLock.isForced(setting),
                str("rex_focus_lock_enforced")
        ));
    }

    public void buildFocusLockSection() {
        if (!SettingsStatus.focusLock) return;
        boolean locked = FocusLock.isActive();

        addPreference(helper.buttonPreference(
                FocusLock.buttonTitle(),
                FocusLock.statusSummary(),
                "rex_focus_lock_action"
        ));

        FocusLockDurationPreference duration = new FocusLockDurationPreference(context);
        duration.setTitle(str("rex_focus_lock_duration"));
        duration.setEnabled(!locked);
        addPreference(duration);

        PreferenceCategory targets = addCategory(str("rex_focus_lock_targets"));
        for (FocusLockTargets.Target target : FocusLockTargets.available()) {
            Preference pref = helper.switchPreference(
                    str(target.titleKey),
                    target.summaryKey == null ? "" : str(target.summaryKey),
                    Pref.focusLockSelection(target.key)
            );
            if (locked && pref instanceof SwitchPref) {
                ((SwitchPref) pref).setSwitchInteractionEnabled(false);
            }
            addPreference(targets, pref);
        }
    }

    public void buildMiscSection() {
        PreferenceCategory catFollow = addCategory("Profile & Follow Indicators");
        addPreference(catFollow, helper.switchPreference(
                "Follow-Back Indicator on Profiles",
                "Show 'Follows You' / 'Doesn't Follow You' badge on user profiles",
                Settings.FOLLOW_BACK_INDICATOR
        ));
        addPreference(catFollow, helper.switchPreference(
                "Non-Follower Badge in Following List",
                "Highlight users in your Following list who do not follow you back",
                Settings.FOLLOW_LIST_NON_FOLLOWER_BADGE
        ));
        addPreference(catFollow, helper.availableWhen(
                helper.switchPreference(
                        "Colored Follow-Back Indicator",
                        "Use green/red status pill colors for follow indicators",
                        Settings.FOLLOW_BACK_COLOR_INDICATOR
                ),
                () -> SharedPref.getBooleanPref(Settings.FOLLOW_BACK_INDICATOR)
                        || SharedPref.getBooleanPref(Settings.FOLLOW_LIST_NON_FOLLOWER_BADGE)
        ));

        PreferenceCategory catPost = addCategory("Post, Comment & DM Enhancements");
        addPreference(catPost, helper.switchPreference(
                "Enable xboyrex Options on Posts",
                "Add ⬡ xboyrex Options to post menus and UFI bar beside Save",
                Settings.ENABLE_MORE_OPTIONS_ON_POST
        ));
        addPreference(catPost, helper.switchPreference(
                "Copy Comment Button",
                "Add a 1-tap Copy button under every comment in the comment sheet",
                Settings.COMMENT_COPY_BUTTON
        ));
        addPreference(catPost, helper.switchPreference(
                "Enable Mark Chat as Read in Inbox",
                "Allow marking DM threads as read from the long-press menu",
                Settings.ENABLE_MARK_CHAT_AS_READ
        ));
        addPreference(catPost, helper.switchPreference(
                "Save Deleted Direct Messages",
                "Keep revoked/unsent DM messages in your local Deleted Messages Vault",
                Settings.SAVE_DELETED_MESSAGES
        ));
        addPreference(catPost, helper.switchPreference(
                "Save Ephemeral Media Captions",
                "Preserve captions on View-Once media in Direct Messages",
                Settings.EPHEMERAL_MEDIA_CAPTION
        ));

        PreferenceCategory catVaults = addCategory("xboyrex Vaults & Built-in Utilities");
        addPreference(catVaults, helper.buttonPreference(
                "Deleted Messages Vault",
                "View unsent and deleted DM messages with copy & clear options",
                "view_deleted_messages"
        ));
        addPreference(catVaults, helper.buttonPreference(
                "Saved Captions Vault",
                "View, copy, or delete post captions you saved via xboyrex Options",
                "rex_saved_captions_btn"
        ));
        addPreference(catVaults, helper.buttonPreference(
                "Saved Bios Vault",
                "View, copy, or delete profile bios you saved via Profile Options",
                "rex_saved_bios_btn"
        ));
        addPreference(catVaults, helper.buttonPreference(
                "Saved Profiles Bookmark List",
                "Quickly open or manage bookmarked Instagram profiles",
                "rex_saved_profiles_btn"
        ));
        addPreference(catVaults, helper.buttonPreference(
                "Watch History Vault",
                "Browse recently viewed posts, reels, and profiles",
                "rex_watch_history_btn"
        ));
        addPreference(catVaults, helper.buttonPreference(
                "Long Video Splitter (Stories & Reels)",
                "Split long MP4 videos into lossless 60-second segments without re-encoding",
                "rex_video_splitter_btn"
        ));
        if (SettingsStatus.instantsDownload) {
            addPreference(catVaults, helper.switchPreference(
                    str("rex_instants_download"),
                    str("rex_instants_download_desc"),
                    Settings.INSTANTS_DOWNLOAD
            ));
            addPreference(catVaults, helper.buttonPreference(
                    str("rex_view_saved_instants"),
                    "Open saved Quicksnap / Instants media vault",
                    "rex_view_saved_instants"
            ));
        }
    }

    public void buildInstantsSection() {
        if (SettingsStatus.instantsDownload) {
            addPreference(helper.switchPreference(
                    str("rex_instants_download"),
                    str("rex_instants_download_desc"),
                    Settings.INSTANTS_DOWNLOAD
            ));
            addPreference(helper.buttonPreference(
                    str("rex_view_saved_instants"),
                    "",
                    "rex_view_saved_instants"
            ));
        }
    }

    public void buildDownloadSection() {
        if (!SettingsStatus.downloadSection()) return;

        addPreference(helper.switchPreference(
                str("rex_enable_download"),
                "Enable built-in media downloader for Posts, Reels, Stories & Audio",
                Settings.ENABLE_DOWNLOAD
        ));

        if (SettingsStatus.feedDownloadButton || SettingsStatus.reelDownloadButton
                || SettingsStatus.storyDownloadButton) {
            addPreference(helper.availableWhen(
                    new DownloadButtonPreference(context),
                    () -> SharedPref.getBooleanPref(Settings.ENABLE_DOWNLOAD)
            ));
        }
        if (SettingsStatus.saveMediaCommentButton) {
            addPreference(helper.switchPreference(
                    str("rex_save_media_comment"),
                    str("rex_save_media_comment_desc"),
                    Settings.COMMENT_SAVE_MEDIA_BUTTON
            ));
        }

        addPreference(helper.switchPreference(
                str("rex_enable_direct_download"),
                "Save media immediately on first tap (Zero-Prompt MediaStore Download/xboyrex on Redmi/HyperOS)",
                Settings.ENABLE_DIRECT_DOWNLOAD
        ));

        addPreference(helper.switchPreference(
                str("rex_download_username_folder"),
                str("rex_download_username_folder_desc"),
                Settings.DOWNLOAD_USERNAME_FOLDER
        ));

        addPreference(helper.switchPreference(
                str("rex_prefer_dash_format"),
                str("rex_prefer_dash_format_desc"),
                Settings.PREFER_DASH_FORMAT
        ));

        addPreference(helper.availableWhen(
                helper.switchPreference(
                        str("rex_dash_audio_aac_lc"),
                        str("rex_dash_audio_aac_lc_desc"),
                        Settings.DASH_AUDIO_AAC_LC
                ),
                () -> SharedPref.getBooleanPref(Settings.PREFER_DASH_FORMAT)
        ));

        addPreference(helper.switchPreference(
                str("rex_embed_download_metadata"),
                str("rex_embed_download_metadata_desc"),
                Settings.EMBED_DOWNLOAD_METADATA
        ));

        addPreference(helper.downloadFileNameTemplatePreference(
                str("rex_download_file_name_template"),
                Pref.downloadFileNameTemplate(),
                Settings.DOWNLOAD_FILE_NAME_TEMPLATE
        ));

        addPreference(helper.buttonPreference(
                str("rex_download_set_path"),
                StorageUtils.getCustomPathForDisplay(),
                "rex_download_set_path"
        ));

        if (SettingsStatus.downloadWithExternalDownloader) {
            addPreference(helper.switchPreference(
                    str("rex_download_with_external_downloader"),
                    "",
                    Settings.DOWNLOAD_WITH_EXTERNAL_DOWNLOADER
            ));
            addPreference(helper.availableWhen(
                    helper.editTextPreference(
                            str("rex_external_downloader_package_name"),
                            Pref.externalDownloaderPackageName(),
                            Settings.EXTERNAL_DOWNLOADER_PACKAGE_NAME
                    ),
                    () -> SharedPref.getBooleanPref(Settings.DOWNLOAD_WITH_EXTERNAL_DOWNLOADER)
            ));
        }
    }

    public void buildDeveloperSection() {
        if (!SettingsStatus.developerOptionsSection()) return;

        if (SettingsStatus.recommendedFlags) {
            addPreference(helper.buttonPreference(
                    str("rex_category_rec_flags"),
                    str("rex_category_rec_flags_desc"),
                    Constants.REX_FRAGMENT_REC_FLAGS
            ));
        }

        if (SettingsStatus.enableDeveloperOptions) {
            addPreference(helper.switchPreference(
                    str("rex_enable_dev_options"),
                    str("rex_enable_dev_options_desc"),
                    Settings.DEVELOPER_OPTIONS
            ));
            addPreference(helper.availableWhen(
                    helper.switchPreference(
                            str("rex_directly_open_metaconfig"),
                            str("rex_directly_open_metaconfig_desc"),
                            Settings.DIRECTLY_OPEN_METACONFIG
                    ),
                    () -> SharedPref.getBooleanPref(Settings.DEVELOPER_OPTIONS)
            ));
            addPreference(helper.buttonPreference(
                    str("rex_export_dev_overrides"),
                    "Export active MetaConfig overrides to JSON",
                    "rex_export_dev_overrides"
            ));
            addPreference(helper.buttonPreference(
                    str("rex_import_dev_overrides"),
                    "Import MetaConfig overrides from JSON",
                    "rex_import_dev_overrides"
            ));
            addPreference(helper.buttonPreference(
                    str("rex_import_id_mapping"),
                    "Import mobileconfig ID_Mapping.json from storage",
                    "rex_import_id_mapping"
            ));
            addPreference(helper.buttonPreference(
                    str("rex_download_id_mapping"),
                    "Download matching mobileconfig ID_Mapping.json for this Instagram build",
                    "rex_download_id_mapping"
            ));
            addPreference(helper.switchPreference(
                    str("rex_debug"),
                    str("rex_debug_desc"),
                    Settings.REX_DEBUG
            ));
            addPreference(helper.buttonPreference(
                    str("rex_export_experiment_list"),
                    "Export decoded experiment list",
                    "rex_export_experiment_list"
            ));
            addPreference(helper.buttonPreference(
                    str("rex_export_experiment_mappings"),
                    "Export full experiment parameter mappings",
                    "rex_export_experiment_mappings"
            ));
        }
    }

    public void buildAdsSection() {
        buildPrivacySection();
    }

    public void dmSection() {
        ghostSection();
    }

    public void linksSection() {
        buildPrivacySection();
    }

    public void storySection() {
        buildFeedAndStoriesSection();
    }

    public void buildFontSection() {
        if (!SettingsStatus.fontSection()) return;

        SwitchPref useSystemFont = new SwitchPref(context);
        useSystemFont.setTitle(str("rex_use_system_font"));
        useSystemFont.setSummary(str("rex_use_system_font_desc"));
        useSystemFont.setKey(Settings.USE_SYSTEM_FONT.key);
        useSystemFont.setPersistent(false);
        useSystemFont.setChecked(FontStorage.useSystemFont());
        useSystemFont.setOnPreferenceChangeListener((preference, newValue) -> {
            FontStorage.setUseSystemFont(Boolean.TRUE.equals(newValue));
            return true;
        });
        addPreference(useSystemFont);

        addPreference(helper.buttonPreference(
                str("rex_pref_add_font"),
                str("rex_pref_add_font_desc"),
                "rex_pref_add_font"
        ));

        addPreference(helper.buttonPreference(
                str("rex_pref_delete_font"),
                "",
                "rex_pref_delete_font"
        ));
    }

    public void buildActionBarSection() {
        addPreference(helper.multiSelectListPref(
                str("rex_action_bar_main_feed"),
                "",
                Settings.ACTION_BAR_MAIN_FEED
        ));
        addPreference(helper.multiSelectListPref(
                str("rex_action_bar_user_profile"),
                "",
                Settings.ACTION_BAR_USER_PROFILE
        ));
        addPreference(helper.multiSelectListPref(
                str("rex_action_bar_inbox"),
                "",
                Settings.ACTION_BAR_INBOX
        ));
        addPreference(helper.multiSelectListPref(
                str("rex_action_bar_chat"),
                str("rex_action_bar_chat_desc"),
                Settings.ACTION_BAR_CHAT
        ));
    }

    public void filterContentSection() {
        if (!SettingsStatus.filterContentSection()) return;

        if (SettingsStatus.storyFilters) {
            PreferenceCategory category = addCategory(str("rex_filter_story"));
            addPreference(category, helper.multiSelectListPref(
                    str("rex_filter_story_types_to_hide"),
                    "",
                    Settings.FILTER_STORY_BY_TYPE
            ));
            addPreference(category, helper.multiSelectListPref(
                    str("rex_filter_story_user_types_to_hide"),
                    "",
                    Settings.FILTER_STORY_BY_USER_TYPE
            ));
            addPreference(category, helper.editTextNumPreference(
                    str("rex_filter_story_minimum_item_count"),
                    str("rex_filter_story_minimum_item_count_desc"),
                    Settings.FILTER_STORY_MIN_STORY_ITEMS
            ));
            addPreference(category, helper.editTextNumPreference(
                    str("rex_filter_story_maximum_item_count"),
                    str("rex_filter_story_maximum_item_count_desc"),
                    Settings.FILTER_STORY_MAX_STORY_ITEMS
            ));
        }
    }

    public void buildNavigationSection() {
        if (!SettingsStatus.hideNavigationButtons) return;

        addPreference(helper.navigationBarPreference(
                str("rex_navigation_tabs_title"),
                str("rex_navigation_tabs_summary")
        ));
        addPreference(helper.navigationStartupPreference(
                str("rex_navigation_startup_tab"),
                str("rex_navigation_startup_tab_summary")
        ));
    }

    public void buildRecommendedFlagsSection() {
        buildRecommendedFlagsSection(true);
    }

    private void buildRecommendedFlagsSection(boolean notifyErrors) {
        long lastModified = RecommendedFlags.getLastModified();
        String lastModifiedAtString = "";
        if (lastModified > 0L) {
            Locale locale = context.getResources().getConfiguration().getLocales().get(0);
            String skeleton = DateFormat.is24HourFormat(context) ? "yMMMEdHm" : "yMMMEdhm";
            String pattern = DateFormat.getBestDateTimePattern(locale, skeleton);
            String formattedDate = new SimpleDateFormat(pattern, locale).format(new Date(lastModified));
            lastModifiedAtString = String.format(str("rex_rec_flags_last_modified_at"), formattedDate);
        }
        addPreference(helper.buttonPreference(
                str("rex_rec_flags_refresh_file"),
                lastModifiedAtString,
                "rex_rec_flags_refresh_file"
        ));
        List<Flag> recFlags = RecommendedFlags.getFlags(notifyErrors);
        for (Flag flag : recFlags) {
            if (flag.isLongType()) {
                addPreference(helper.editTextNumPreference(
                        flag.getName(),
                        flag.getDesc(),
                        flag.getCode()
                ));
            } else {
                addPreference(helper.listPreference(
                        flag.getName(),
                        flag.getDesc(),
                        flag.getCode()
                ));
            }
        }
    }

    public void aboutSection(TreeMap<String, Boolean> flags) {
        String appVersionText = String.format(str("rex_app_version"), Utils.getAppVersionName());
        String patchVersionText = String.format(str("rex_patch_version"), Utils.getPatchesReleaseVersion());

        addPreference(helper.buttonPreference(appVersionText, "", Constants.REX_APP_VERSION_PREFERENCE));
        addPreference(helper.buttonPreference(patchVersionText, "", Constants.REX_PATCH_VERSION_PREFERENCE));
        addPreference(helper.buttonPreference(str("rex_export_pref"), "", "rex_export_pref"));
        addPreference(helper.buttonPreference(str("rex_import_pref"), "", "rex_import_pref"));
        addPreference(helper.buttonPreference(str("rex_reset_pref"), "", "rex_reset_pref"));
        addPreference(helper.switchPreference(str("rex_debug"), str("rex_debug_desc"), Settings.REX_DEBUG));

        PreferenceCategory category = addCategory(str("rex_patch_info_title"));
        category.setKey(Constants.REX_PATCH_INFO_PREFERENCE_CATEGORY);
        String enabledStr = str("rex_patch_enabled");
        String disabledStr = str("rex_patch_disabled");

        for (Map.Entry<String, Boolean> entry : flags.entrySet()) {
            String resName = entry.getKey();
            boolean sts = Boolean.TRUE.equals(entry.getValue());
            String status = sts ? enabledStr : disabledStr;
            addPreference(category, helper.buttonPreference(resName, status, resName));
        }
    }
}
