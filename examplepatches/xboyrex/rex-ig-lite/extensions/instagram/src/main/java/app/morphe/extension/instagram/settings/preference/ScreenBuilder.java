/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.content.Context;
import android.os.Bundle;
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
import app.morphe.extension.instagram.settings.preference.widgets.InstagramPreferenceStyle;
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
        } else if (Constants.REX_FRAGMENT_INITIAL_FEATURES.equals(fragmentName)) {
            buildInitialFeaturesSection();
        } else if (Constants.REX_FRAGMENT_CACHE_CLEANER.equals(fragmentName)) {
            buildCacheCleanerSection();
        }
        assignCardGroupPositions(screen, fragmentName);
    }

    public static void assignCardGroupPositions(PreferenceScreen screen, String fragmentName) {
        if (screen == null) return;
        boolean standaloneAll = fragmentName == null || Constants.REX_FRAGMENT_SETTINGS.equals(fragmentName);
        int topCount = screen.getPreferenceCount();
        for (int i = 0; i < topCount; i++) {
            Preference item = screen.getPreference(i);
            if (item instanceof PreferenceCategory) {
                PreferenceCategory cat = (PreferenceCategory) item;
                int childCount = cat.getPreferenceCount();
                for (int j = 0; j < childCount; j++) {
                    Preference child = cat.getPreference(j);
                    Bundle extras = child.getExtras();
                    extras.putBoolean(InstagramPreferenceStyle.EXTRA_CARD_FIRST, standaloneAll || j == 0);
                    extras.putBoolean(InstagramPreferenceStyle.EXTRA_CARD_LAST, standaloneAll || j == childCount - 1);
                }
            } else if (item != null) {
                boolean isFirst = standaloneAll || i == 0 || (screen.getPreference(i - 1) instanceof PreferenceCategory);
                boolean isLast = standaloneAll || i == topCount - 1 || (screen.getPreference(i + 1) instanceof PreferenceCategory);
                Bundle extras = item.getExtras();
                extras.putBoolean(InstagramPreferenceStyle.EXTRA_CARD_FIRST, isFirst);
                extras.putBoolean(InstagramPreferenceStyle.EXTRA_CARD_LAST, isLast);
            }
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
                "Initial Features",
                "72 verified Instagram experimental flags across 10 categories (Media, Reels, Stories, DM, Profiles, UI & Notes)",
                Constants.REX_FRAGMENT_INITIAL_FEATURES
        ));
        addPreference(helper.categoryPreference(
                "App Cache Cleaner",
                "Inspect cache size (" + app.morphe.extension.instagram.settings.feature.AppCacheCleaner.getStatusSummary(context) + ") & configure auto-clean limits",
                Constants.REX_FRAGMENT_CACHE_CLEANER
        ));
        addPreference(helper.categoryPreference(
                "Developer Options",
                "MetaConfig Overrides, Recommended Flags, Experiment Mappings & Signature Spoof",
                Constants.REX_FRAGMENT_DEV_OPTIONS
        ));
        addPreference(helper.switchPreference(
                "View Blocked Profiles Secretly",
                "Inspect profiles and bios of blocked or restricted accounts without unblocking",
                Settings.VIEW_BLOCKED_PROFILES_SECRETLY
        ));
        PreferenceCategory infoCat = addCategory("Info");
        addPreference(infoCat, helper.categoryPreference(
                "About InstaRex",
                "by xboyrex • About, Updates (.mpp / OTA), Changelogs & Backup/Restore",
                Constants.REX_FRAGMENT_ABOUT
        ));
    }

    public void ghostSection() {
        PreferenceCategory catChat = addCategory("Ghost Mode Controls");
        addPreference(catChat, helper.switchPreference(
                "Hide Typing in DM",
                "Hide typing indicator while chatting",
                Settings.DISABLE_TYPING_STATUS
        ));
        addPreference(catChat, helper.switchPreference(
                "Hide View Stories",
                "Hide your name from story viewers",
                Settings.VIEW_STORIES_ANONYMOUSLY
        ));
        addPreference(catChat, helper.switchPreference(
                "Hide Live Viewing",
                "Hide your name when watching live videos",
                Settings.VIEW_LIVE_ANONYMOUSLY
        ));
        addPreference(catChat, helper.switchPreference(
                "Hide View Once Seen",
                "Open ephemeral photos and videos without marking them as viewed",
                Settings.HIDE_VIEW_ONCE_SEEN
        ));
        addPreference(catChat, helper.switchPreference(
                "Hide Screenshot",
                "Prevent others from detecting screenshots",
                Settings.DISABLE_SCREENSHOT_DETECTION
        ));
        addPreference(catChat, helper.switchPreference(
                "Unlimited Replays on View Once Media",
                "Hide replay status when viewing one-time media again",
                Settings.UNLIMITED_REPLAYS
        ));
        addPreference(catChat, helper.switchPreference(
                "Hide Message Seen in DM",
                "Hide read receipts in direct messages",
                Settings.VIEW_DM_ANONYMOUSLY
        ));
        addPreference(catChat, helper.availableWhen(
                helper.switchPreference(
                        "Mark As Read After Reply",
                        "Automatically send seen after you reply while Hide Message Seen is enabled",
                        Settings.MARK_AS_READ_AFTER_REPLY
                ),
                () -> SharedPref.getBooleanPref(Settings.VIEW_DM_ANONYMOUSLY)
                        || SharedPref.getBooleanPref(Settings.TURN_ON_ALL_GHOST_MODES)
        ));
        addPreference(catChat, helper.availableWhen(
                helper.switchPreference(
                        "Mark As Seen (On Reaction)",
                        "Send read receipt when you react to a message while Ghost DM is enabled",
                        Settings.MARK_AS_SEEN_ON_REACTION
                ),
                () -> SharedPref.getBooleanPref(Settings.VIEW_DM_ANONYMOUSLY)
                        || SharedPref.getBooleanPref(Settings.TURN_ON_ALL_GHOST_MODES)
        ));
        addPreference(catChat, helper.switchPreference(
                "View Blocked Profiles Secretly",
                "Inspect profiles and bios of blocked or restricted accounts without unblocking",
                Settings.VIEW_BLOCKED_PROFILES_SECRETLY
        ));
        addPreference(catChat, helper.switchPreference(
                "Ghost Instants (Quicksnap)",
                "View Quicksnap / Instants media without marking them as opened",
                Settings.GHOST_INSTANTS
        ));
        addPreference(catChat, helper.switchPreference(
                "Hide Voice Message Listen Status",
                "Listen to voice notes in Direct Messages without sending a played receipt",
                Settings.HIDE_AUDIO_SEEN
        ));
        addPreference(catChat, helper.switchPreference(
                "Turn On All Ghost Modes",
                "Master stealth override for all Ghost Mode hooks",
                Settings.TURN_ON_ALL_GHOST_MODES
        ));
        addPreference(catChat, helper.buttonPreference(
                "Last Active Timestamp Format",
                SharedPref.getStringPref(Settings.LAST_ACTIVE_FORMAT),
                "rex_last_active_format_btn"
        ));

        PreferenceCategory catMaster = addCategory("Bulk Actions");
        addPreference(catMaster, helper.buttonPreference(
                "Enable All Ghost Features",
                "Turn on all ghost mode features at once",
                "rex_enable_all_ghost"
        ));
        addPreference(catMaster, helper.buttonPreference(
                "Disable All Ghost Features",
                "Turn off all ghost mode features at once",
                "rex_disable_all_ghost"
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
                "Strip multi-ad pod chains and sponsored commercial reels",
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
        addPreference(catLock, helper.buttonPreference(
                "Set Passcode Lock to Hide Chat",
                "Configure 4-digit PIN passcode for Hidden Chats and Inbox Lock",
                "rex_passcode_lock_btn"
        ));
        addPreference(catLock, helper.buttonPreference(
                "Show All Hidden Chats",
                "View and unhide conversations currently stored in your Hidden Chats Vault",
                "rex_hidden_chats_list_btn"
        ));
        addPreference(catLock, helper.switchPreference(
                "Private Screen Dimmer Mode",
                "Apply a privacy screen dimmer overlay to prevent shoulder-surfing",
                Settings.PRIVATE_SCREEN_MODE
        ));
        addPreference(catLock, helper.availableWhen(
                helper.buttonPreference(
                        "Private Screen Opacity",
                        "Adjust privacy screen dimmer opacity (" + SharedPref.getStringPref(Settings.PRIVATE_SCREEN_OPACITY) + "%)",
                        "rex_private_screen_opacity_btn"
                ),
                () -> SharedPref.getBooleanPref(Settings.PRIVATE_SCREEN_MODE)
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
                "Hold anywhere on a feed post or header to open the capability-aware InstaRex Options sheet",
                Settings.LONG_PRESS_POST_OPTIONS
        ));
        addPreference(catSwipe, helper.switchPreference(
                "Long-Press Search Tab to Open Profile",
                "Copy any @username or profile URL and hold the Search tab to open that profile directly",
                Settings.LONG_PRESS_SEARCH_OPEN_PROFILE
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
        PreferenceCategory catFeed = addCategory("Feed");
        addPreference(catFeed, helper.multiSelectListPref(
                "Filter Story Types",
                "Hide specific story categories from your story tray",
                Settings.FILTER_STORY_BY_TYPE
        ));
        addPreference(catFeed, helper.listPreference(
                "Change Like Animation Style",
                "Customize the floating heart animation when liking posts",
                Settings.CHANGE_LIKE_ANIMATION
        ));
        addPreference(catFeed, helper.switchPreference(
                "Disable 'InstaRex Options' Icon",
                "Hide the hexagon InstaRex Options icon on Home feed posts",
                Settings.DISABLE_FEED_OPTIONS_ICON
        ));
        addPreference(catFeed, helper.switchPreference(
                "Disable 'Download' Icon",
                "Hide the direct Download icon on Home feed posts",
                Settings.DISABLE_FEED_DOWNLOAD_ICON
        ));
        addPreference(catFeed, helper.switchPreference(
                "Long Press for InstaRex Options",
                "Hold anywhere on a feed post to open the capability-aware InstaRex Options sheet",
                Settings.LONG_PRESS_POST_OPTIONS
        ));
        addPreference(catFeed, helper.switchPreference(
                "Filter Feed by Following",
                "Show posts only from accounts you follow in the Home feed",
                Settings.LIMIT_FOLLOWING_FEED
        ));
        addPreference(catFeed, helper.switchPreference(
                "Remove Bottom Space",
                "Reclaim empty bottom gesture bar padding under the navigation bar",
                Settings.REMOVE_EMPTY_BOTTOM_SPACE
        ));
        addPreference(catFeed, helper.switchPreference(
                "Disable Suggested Reels",
                "Remove suggested reels and account carousels from Feed",
                Settings.HIDE_SUGGESTED_CONTENT
        ));
        addPreference(catFeed, helper.switchPreference(
                "Copy Caption Without Hashtags",
                "Automatically strip #hashtags when copying post or reel captions",
                Settings.COPY_CAPTION_WITHOUT_HASHTAGS
        ));
        addPreference(catFeed, helper.switchPreference(
                "Repost With Caption in WhatsApp",
                "Attach post caption automatically when reposting media to WhatsApp",
                Settings.REPOST_WITH_CAPTION_WA
        ));
        addPreference(catFeed, helper.switchPreference(
                "Disable Comments Options",
                "Hide comment action buttons under posts and reels",
                Settings.DISABLE_COMMENTS
        ));
        addPreference(catFeed, helper.switchPreference(
                "Disable Auto Play Video",
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
        addPreference(catFeed, helper.switchPreference(
                "Show Reels Settings Button on Action Bar",
                "Display the InstaRex Reels Options & Quick Settings button in the Reels vertical action bar",
                Settings.REEL_OPTIONS_BUTTON
        ));
        addPreference(catFeed, helper.switchPreference(
                "Enhance Photo Quality",
                "Force full-resolution image rendering and pinch-to-zoom across feed & profile photos",
                Settings.IMPROVE_IMAGE_VIEWING
        ));

        PreferenceCategory catStory = addCategory("Story");
        addPreference(catStory, helper.switchPreference(
                "Hide 'Mark as Seen' Icon",
                "View stories anonymously without sending seen receipts",
                Settings.VIEW_STORIES_ANONYMOUSLY
        ));
        addPreference(catStory, helper.switchPreference(
                "Show Story Settings Button on Toolbar",
                "Display the InstaRex Story Options & Quick Settings button on the Story bottom toolbar",
                Settings.STORY_OPTIONS_BUTTON
        ));
        addPreference(catStory, helper.editTextNumPreference(
                "Set Story Ring Size",
                "Customize the size of the story tray rings on the Home feed",
                Settings.CUSTOMISE_STORY_RING_SIZE
        ));
        addPreference(catStory, helper.listPreference(
                "Set Story Upload Time Format",
                "Show exact upload time or full date on stories instead of '3h'",
                Settings.CUSTOMISE_STORY_TIMESTAMP
        ));
        addPreference(catStory, helper.buttonPreference(
                "Change Mention Indicator Style",
                "Customize @ mention pill position, color, and tap behavior",
                "rex_story_mention_settings_btn"
        ));
        addPreference(catStory, helper.switchPreference(
                "Show Story Mention Indicator Pill",
                "Display an @ badge on stories that contain hidden or visible user mentions",
                Settings.STORY_MENTION_ICON
        ));
        addPreference(catStory, helper.switchPreference(
                "View Hidden Story Mentions (@ Button)",
                "Show the @ Hidden Mentions button on the Story bottom toolbar and inspect mentioned accounts",
                Settings.VIEW_STORY_MENTIONS
        ));
        addPreference(catStory, helper.switchPreference(
                "Disable Follow Indicator in Mentions",
                "Remove the inline Follow button from story headers and mentions",
                Settings.HIDE_STORY_FOLLOW_BUTTON
        ));
        addPreference(catStory, helper.switchPreference(
                "Disable Auto Play Next Story",
                "Prevent stories from advancing to the next user automatically",
                Settings.DISABLE_STORY_FLIPPING
        ));
        addPreference(catStory, helper.switchPreference(
                "Enable Replay Story",
                "Keep looping the active story slide until you tap next",
                Settings.LOOP_STORY
        ));
        addPreference(catStory, helper.switchPreference(
                "Force to Play Sound in Stories",
                "Start stories with sound enabled even before pressing volume keys",
                Settings.PLAY_STORY_SOUND_AUTOMATICALLY
        ));
        addPreference(catStory, helper.buttonPreference(
                "Story Likes History Vault",
                "Browse all stories you have liked with user avatars and timestamps",
                "rex_story_like_history_btn"
        ));

        PreferenceCategory catQuality = addCategory("Media Upload Quality (Max 60FPS)");
        addPreference(catQuality, helper.switchPreference(
                "Enhance Story Upload Quality",
                "Force maximum bitrate and resolution for Photos, Stories, Reels & Voice Notes",
                Settings.HIGH_QUALITY_UPLOAD
        ));
        addPreference(catQuality, helper.switchPreference(
                "60 FPS Video & Story Recording",
                "Unlock 60fps high-framerate encoding for camera and gallery video uploads",
                Settings.UPLOAD_60FPS_STORIES
        ));
        addPreference(catQuality, helper.switchPreference(
                "Extend Story Duration to 3 Minutes (180s)",
                "Allow uploading up to 180s (3-minute) story segments instead of 60s clipping",
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
                "Color Mode & Accent Palette",
                "Active Theme: " + Pref.rexColorMode() + " (6 Curated AMOLED & Glass Modes)",
                "rex_color_mode_btn"
        ));
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
                "Choose Background Image",
                "You can choose background image to set Chat Background",
                "rex_chat_wallpaper_picker"
        ));

        PreferenceCategory catEmojiFonts = addCategory("Typography & Emojis (3-System Engine)");
        addPreference(catEmojiFonts, helper.buttonPreference(
                "Typography & Emojis Manager",
                "Configure App Font, Story Fonts (XBOYREX Story Font Pack), and Emoji Replacement",
                Constants.REX_FRAGMENT_FONT
        ));
        addPreference(catEmojiFonts, helper.buttonPreference(
                "System 1 — App Font (" + SharedPref.getStringPref(Settings.CHOOSE_FONT_TYPE) + ")",
                "Choose Default, System Default, iOS San Francisco, or Custom .ttf/.otf font",
                "rex_font_type_btn"
        ));
        addPreference(catEmojiFonts, helper.buttonPreference(
                "System 2 — Story Fonts (" + SharedPref.getStringPref(Settings.STORY_FONT_SOURCE) + ")",
                "Browse XBOYREX Story Font Pack or import custom Story Fonts",
                "rex_browse_xboyrex_story_fonts_btn"
        ));
        addPreference(catEmojiFonts, helper.buttonPreference(
                "System 3 — Emoji Pack (" + SharedPref.getStringPref(Settings.CHOOSE_EMOJI_TYPE) + ")",
                "Apply iOS 17.4 / 18.4 / 26.4, JoyPixels, Twemoji, Samsung, or custom Emoji font",
                "rex_emoji_type_btn"
        ));
        addPreference(catEmojiFonts, helper.buttonPreference(
                "Creative Fonts for DMs",
                "Send stylish Unicode font styles inside Direct Messages",
                "rex_creative_fonts_btn"
        ));

        PreferenceCategory catBars = addCategory("Customize Navigation UI");
        if (SettingsStatus.hideNavigationButtons) {
            addPreference(catBars, helper.buttonPreference(
                    "Bottom Navigation Tabs & Startup Tab",
                    "Choose which tab should open automatically when you start the app and customize navigation tabs according to your needs.",
                    Constants.REX_FRAGMENT_NAV_BTNS
            ));
        }
        addPreference(catBars, helper.switchPreference(
                "Frosted Glass Bottom Navigation",
                "Adds a Frosted Glass look to the bottom navigation bar.",
                Settings.LIQUID_GLASS_NAV
        ));
        addPreference(catBars, helper.switchPreference(
                "Custom InstaRex Home Wordmark",
                "Display calligraphic two-tone InstaRex script logo in the Home top action bar (tap for Quick Access)",
                Settings.CUSTOM_HOME_WORDMARK
        ));
        addPreference(catBars, helper.buttonPreference(
                "Quick Access Sheet",
                "Open the Rex IG Lite Quick Access sheet (also accessible by holding the Home button)",
                "rex_quick_access_sheet"
        ));
        addPreference(catBars, helper.buttonPreference(
                "Top Action Bar Icons",
                "Configure which xboyrex icons appear on Home, Profile, Inbox & Chat",
                Constants.REX_FRAGMENT_ACTION_BAR
        ));
        addPreference(catBars, helper.switchPreference(
                "Reels Floating Top-Right Toolbar",
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
        addPreference(catBars, helper.availableWhen(
                helper.buttonPreference(
                        "Configure Story Filters",
                        "Set story type filters and min/max story count rules",
                        Constants.REX_FRAGMENT_FILTER_CONTENT
                ),
                Pref::storyFiltersMaster
        ));
    }

    public void distractionFreeSection() {
        if (!SettingsStatus.distractionFreeSection()) return;

        if (SettingsStatus.focusLock) {
            PreferenceCategory focusCat = addCategory("Timed Focus Lock");
            addPreference(focusCat, helper.buttonPreference(
                    str("rex_focus_lock"),
                    FocusLock.statusSummary(),
                    Constants.REX_FRAGMENT_FOCUS_LOCK
            ));
        }
        PreferenceCategory surfaceCat = addCategory("Surface & Feed Filters");
        if (SettingsStatus.disableStories) {
            addLockableSwitch(surfaceCat, str("rex_disable_stories"), "", Settings.DISABLE_STORIES);
        }
        if (SettingsStatus.hideStoriesTray) {
            addLockableSwitch(surfaceCat, str("rex_hide_stories_tray"), str("rex_hide_stories_tray_desc"), Settings.HIDE_STORIES_TRAY);
        }
        if (SettingsStatus.hideHiddenRequests) {
            addLockableSwitch(surfaceCat, str("rex_hide_hidden_requests"), str("rex_hide_hidden_requests_desc"), Settings.HIDE_HIDDEN_REQUESTS);
        }
        if (SettingsStatus.disableHighlights) {
            addLockableSwitch(surfaceCat, str("rex_disable_highlights"), "", Settings.DISABLE_HIGHLIGHTS);
        }
        if (SettingsStatus.hideNotesTray) {
            addLockableSwitch(surfaceCat, str("rex_hide_notes_tray"), str("rex_hide_notes_tray_desc"), Settings.HIDE_NOTES_TRAY);
        }
        if (SettingsStatus.disableExplore) {
            addLockableSwitch(surfaceCat, str("rex_disable_explore"), "", Settings.DISABLE_EXPLORE);
        }
        if (SettingsStatus.disableComments) {
            addLockableSwitch(surfaceCat, str("rex_disable_comments"), "", Settings.DISABLE_COMMENTS);
        }
        if (SettingsStatus.hideFeedPosts) {
            addPreference(surfaceCat, helper.switchPreference(str("rex_hide_feed_posts"), str("rex_hide_feed_posts_desc"), Settings.HIDE_FEED_POSTS));
        }
        if (SettingsStatus.limitFollowingFeed) {
            addLockableSwitch(surfaceCat, str("rex_limit_following_feed"), str("rex_limit_following_feed_desc"), Settings.LIMIT_FOLLOWING_FEED);
        }
        if (SettingsStatus.disableDiscoverPeople) {
            addPreference(surfaceCat, helper.switchPreference(str("rex_disable_discover_people"), "", Settings.DISABLE_DISCOVER_PEOPLE));
        }
        if (SettingsStatus.disableReelsScrolling) {
            addLockableSwitch(surfaceCat, str("rex_disable_reels_scrolling"), str("rex_disable_reels_scrolling_desc"), Settings.DISABLE_REELS_SCROLLING);
        }
        if (SettingsStatus.disableSwipeToCreate) {
            addLockableSwitch(surfaceCat, str("rex_disable_swipe_to_create"), str("rex_disable_swipe_to_create_desc"), Settings.DISABLE_SWIPE_TO_CREATE);
        }
        if (SettingsStatus.hideGroupCreationOnSharesheet) {
            addLockableSwitch(surfaceCat, str("rex_hide_group_creation_button_on_sharesheet"), "", Settings.HIDE_GROUP_CREATION_BUTTON_ON_SHARESHEET);
        }
        if (SettingsStatus.hideReelsFollowButton) {
            addLockableSwitch(surfaceCat, str("rex_hide_reels_follow_button"), str("rex_hide_reels_follow_button_desc"), Settings.HIDE_REELS_FOLLOW_BUTTON);
        }
        if (SettingsStatus.hideLikes) {
            addPreference(surfaceCat, helper.switchPreference(str("rex_hide_likes"), "", Settings.HIDE_LIKES));
        }
        if (SettingsStatus.hideShareButton) {
            addPreference(surfaceCat, helper.switchPreference(str("rex_hide_share_button"), "", Settings.HIDE_SHARE_BUTTON));
        }
        if (SettingsStatus.hideSaveButtons) {
            addPreference(surfaceCat, helper.multiSelectListPref(str("rex_hide_save_buttons"), "", Settings.HIDE_SAVE_BUTTON_SURFACES));
        }
        if (SettingsStatus.hideReshareButton) {
            addPreference(surfaceCat, helper.switchPreference(str("rex_hide_reshare_button"), "", Settings.HIDE_RESHARE_BUTTON));
        }

        PreferenceCategory bulkCat = addCategory("Bulk Actions");
        addPreference(bulkCat, helper.buttonPreference(
                "Block All Distractions",
                "Block all distracting content at once",
                "rex_enable_all_distractions"
        ));
        addPreference(bulkCat, helper.buttonPreference(
                "Unblock All Content",
                "Show all content again",
                "rex_disable_all_distractions"
        ));
    }

    private void addLockableSwitch(String title, String summary, BooleanSetting setting) {
        addLockableSwitch(null, title, summary, setting);
    }

    private void addLockableSwitch(PreferenceCategory category, String title, String summary, BooleanSetting setting) {
        addPreference(category, helper.forcedSwitchPreference(
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
                "Enable InstaRex Options on Posts",
                "Add InstaRex Options to post menus and UFI bar beside Save",
                Settings.ENABLE_MORE_OPTIONS_ON_POST
        ));
        addPreference(catPost, helper.switchPreference(
                "Disable Feed 'Download' Icon",
                "Hide the direct Download icon on Home feed posts while keeping InstaRex Options active",
                Settings.DISABLE_FEED_DOWNLOAD_ICON
        ));
        addPreference(catPost, helper.switchPreference(
                "Disable Feed 'InstaRex Options' Icon",
                "Hide the hexagon Options icon on Home feed posts while keeping the Download icon active",
                Settings.DISABLE_FEED_OPTIONS_ICON
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
        addPreference(catPost, helper.switchPreference(
                "Copy Captions Without Hashtags",
                "Automatically strip #hashtags when copying post or reel captions",
                Settings.COPY_CAPTION_WITHOUT_HASHTAGS
        ));
        addPreference(catPost, helper.switchPreference(
                "Include Caption When Reposting to WhatsApp",
                "Attach post caption text automatically when sharing media to WhatsApp",
                Settings.REPOST_WITH_CAPTION_WA
        ));
        addPreference(catPost, helper.buttonPreference(
                "Choose WhatsApp Target App",
                SharedPref.getStringPref(Settings.CHOOSE_WHATSAPP_TYPE),
                "rex_whatsapp_type_btn"
        ));
        addPreference(catPost, helper.switchPreference(
                "Disable Local Watch History Recording",
                "Pause recording viewed posts and reels in the local Watch History Vault",
                Settings.DISABLE_WATCH_HISTORY
        ));
        addPreference(catVaults, helper.buttonPreference(
                "Long Video Splitter (Stories & Reels)",
                "Split long MP4 videos into lossless segments (" + SharedPref.getStringPref(Settings.SPLIT_VIDEO_DURATION) + ")",
                "rex_video_splitter_btn"
        ));
        addPreference(catVaults, helper.buttonPreference(
                "App Cache Cleaner & Auto-Limit",
                app.morphe.extension.instagram.settings.feature.AppCacheCleaner.getStatusSummary(context),
                Constants.REX_FRAGMENT_CACHE_CLEANER
        ));
        addPreference(catVaults, helper.buttonPreference(
                "Clear Temporary Media & Cache Now",
                "Delete cached repost/download temp files and free storage space immediately",
                "rex_clear_cache_btn"
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
        addPreference(helper.buttonPreference(
                "Reset Download Path to Default",
                "Restore default folder (/storage/emulated/0/Download/xboyrex)",
                "rex_reset_download_path"
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

        addPreference(helper.buttonPreference(
                "Initial Features (72 Experimental Flags)",
                "Browse all 72 verified Instagram experimental flags across 10 categories with safe presets",
                Constants.REX_FRAGMENT_INITIAL_FEATURES
        ));

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
            addPreference(helper.switchPreference(
                    "Auto-Apply InstaRex Pro Config V6",
                    "Automatically enforce core 60fps, high-bitrate, and 180s story MobileConfig flags",
                    Settings.AUTO_APPLY_PRO_CONFIG_V6
            ));
            addPreference(helper.buttonPreference(
                    "Apply InstaRex Pro Config V6 (Built-In Preset)",
                    "Install all 3,796 sanitized MobileConfig overrides into mc_overrides.json in 1 tap",
                    "rex_apply_pro_config_v6"
            ));
            addPreference(helper.buttonPreference(
                    "Export InstaRex Pro Config V6 (.json)",
                    "Save the clean 3,796-flag INSTAREX_PRO_CONFIG_V6.json preset to Download/xboyrex",
                    "rex_export_pro_config_v6"
            ));
            addPreference(helper.buttonPreference(
                    str("rex_export_dev_overrides"),
                    "Export active MetaConfig overrides to JSON",
                    "rex_export_dev_overrides"
            ));
            addPreference(helper.buttonPreference(
                    "Import MetaConfig Overrides (.json / .zip)",
                    "Import overrides or backup packages from .json or .zip files",
                    "rex_import_dev_overrides"
            ));
            addPreference(helper.buttonPreference(
                    "Import ID Mapping (.json / .zip)",
                    "Import mobileconfig ID_Mapping from .json or .zip files",
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

        PreferenceCategory appFontCat = addCategory("SYSTEM 1 — APP FONT (UI TYPOGRAPHY)");
        addPreference(appFontCat, helper.switchPreference(
                "Enable Custom App Font",
                "Apply selected App Font across Instagram UI without breaking icon glyphs",
                Settings.ENABLE_APP_FONT
        ));
        addPreference(appFontCat, helper.buttonPreference(
                "App Font Source",
                "Active: " + SharedPref.getStringPref(Settings.CHOOSE_FONT_TYPE) + " (Default, System Default, iOS San Francisco, Custom .ttf/.otf)",
                "rex_font_type_btn"
        ));
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
        addPreference(appFontCat, useSystemFont);
        addPreference(appFontCat, helper.buttonPreference(
                "Import Custom App Font (.ttf / .otf)",
                str("rex_pref_add_font_desc"),
                "rex_pref_add_font"
        ));
        addPreference(appFontCat, helper.buttonPreference(
                "Reset / Delete Custom App Font",
                "Remove imported custom_font.ttf and revert to default typography",
                "rex_pref_delete_font"
        ));

        PreferenceCategory storyFontCat = addCategory("SYSTEM 2 — STORY FONTS (STORY & REEL TEXT)");
        addPreference(storyFontCat, helper.switchPreference(
                "Enable Custom Story Fonts",
                "Register custom fonts into Instagram Story & Reel text editor",
                Settings.ENABLE_STORY_FONTS
        ));
        addPreference(storyFontCat, helper.buttonPreference(
                "Story Font Source",
                "Active Source: " + SharedPref.getStringPref(Settings.STORY_FONT_SOURCE),
                "rex_story_font_source_btn"
        ));
        addPreference(storyFontCat, helper.buttonPreference(
                "Browse XBOYREX Story Font Pack",
                "Preview individual Story Fonts, toggle specific fonts, or Select All / Deselect All",
                "rex_browse_xboyrex_story_fonts_btn"
        ));
        addPreference(storyFontCat, helper.buttonPreference(
                "Install Curated Story Font Packs / Import .ttf/.otf/.zip",
                "Install Official, AnshulDixit, Askxtylishh, Affan, Valentines, or local Story Fonts",
                "rex_add_story_fonts_btn"
        ));
        addPreference(storyFontCat, helper.buttonPreference(
                "Creative Fonts for DMs",
                "Send stylish Unicode font styles inside Direct Messages",
                "rex_creative_fonts_btn"
        ));

        PreferenceCategory emojiCat = addCategory("SYSTEM 3 — EMOJI REPLACEMENT");
        addPreference(emojiCat, helper.switchPreference(
                "Enable Custom Emoji Pack",
                "Render selected Emoji font across Feed, Reels, Stories, Comments & DMs",
                Settings.ENABLE_EMOJI_FONT
        ));
        addPreference(emojiCat, helper.buttonPreference(
                "Choose Emoji Pack",
                "Active: " + SharedPref.getStringPref(Settings.CHOOSE_EMOJI_TYPE) + " (System, iOS 17.4/18.4/26.4, JoyPixels, Twemoji, Custom)",
                "rex_emoji_type_btn"
        ));
        addPreference(emojiCat, helper.buttonPreference(
                "Import Custom Emoji Font (.ttf / .otf)",
                "Import a local AppleColorEmoji / NotoColorEmoji .ttf file with glyph validation",
                "rex_pref_add_emoji_font"
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
        PreferenceCategory controlsCat = addCategory("FLAG CONTROLS & PRESETS");
        addPreference(controlsCat, helper.buttonPreference(
                str("rex_rec_flags_refresh_file"),
                lastModifiedAtString,
                "rex_rec_flags_refresh_file"
        ));
        addPreference(controlsCat, helper.buttonPreference(
                "Enable All Recommended Flags",
                "Turn on all curated Boolean experiment flags in one tap",
                "rex_rec_flags_enable_all"
        ));
        addPreference(controlsCat, helper.buttonPreference(
                "Reset All Flags to Default",
                "Clear all Boolean and Numeric flag overrides back to Default",
                "rex_rec_flags_reset_all"
        ));
        addPreference(controlsCat, helper.buttonPreference(
                "Restart InstaRex Now",
                "Apply all pending Recommended Flag changes immediately",
                "rex_rec_flags_restart_now"
        ));

        List<Flag> recFlags = RecommendedFlags.getFlags(notifyErrors);
        PreferenceCategory boolCat = addCategory("BOOLEAN EXPERIMENT FLAGS");
        for (Flag flag : recFlags) {
            if (!flag.isLongType()) {
                addPreference(boolCat, new app.morphe.extension.instagram.settings.preference.widgets.RecommendedFlagPreference(
                        context,
                        flag.getName(),
                        flag.getDesc(),
                        flag.getCode()
                ));
            }
        }

        PreferenceCategory longCat = addCategory("NUMERIC & QUALITY OVERRIDES");
        for (Flag flag : recFlags) {
            if (flag.isLongType()) {
                addPreference(longCat, helper.editTextNumPreference(
                        flag.getName(),
                        flag.getDesc(),
                        flag.getCode()
                ));
            }
        }
    }

    public void buildInitialFeaturesSection() {
        List<app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.FeatureEntry> allEntries =
                app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.getAllEntries(context);
        List<app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.FeatureEntry> filtered =
                app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.getFilteredEntries(context);

        PreferenceCategory filterCat = addCategory("SEARCH, FILTER & PRESETS (" + filtered.size() + " / " + allEntries.size() + " FLAGS)");
        String q = app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.getSearchQuery();
        addPreference(filterCat, helper.buttonPreference(
                "Search Initial Features",
                (q == null || q.isEmpty()) ? "Search by flag name, category, parameter, or description" : ("Filter: \"" + q + "\""),
                "rex_initial_features_search_btn"
        ));
        addPreference(filterCat, helper.buttonPreference(
                "Filter by Category",
                "Active Category: " + app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.getActiveCategoryFilter(),
                "rex_initial_features_category_btn"
        ));
        addPreference(filterCat, helper.buttonPreference(
                "Filter by Status / Risk",
                "Active Status: " + app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.getActiveStatusFilter(),
                "rex_initial_features_status_btn"
        ));
        addPreference(filterCat, helper.buttonPreference(
                "Apply Curated Preset",
                "10 Safe & Category Presets (Recommended Safe, Media Quality, Reels, Stories, DM, Notes, UI)",
                "rex_initial_features_presets_btn"
        ));
        addPreference(filterCat, helper.buttonPreference(
                "Enable All Recommended Safe Flags",
                "Enable all LOW-risk verified Initial Features and resolve mutually exclusive conflicts",
                "rex_initial_features_enable_safe_btn"
        ));
        addPreference(filterCat, helper.buttonPreference(
                "Reset All Initial Features to Default",
                "Clear all Initial Feature overrides back to clean defaults",
                "rex_initial_features_reset_all_btn"
        ));
        addPreference(filterCat, helper.buttonPreference(
                "Export Initial Features (.json)",
                "Save active Initial Features configuration to Download/xboyrex",
                "rex_initial_features_export_btn"
        ));
        addPreference(filterCat, helper.buttonPreference(
                "Import Initial Features (.json)",
                "Restore Initial Features overrides from a JSON file",
                "rex_import_initial_features"
        ));
        addPreference(filterCat, helper.buttonPreference(
                "Restart InstaRex Now",
                "Relaunch app cleanly to activate cold-boot MobileConfig & Initial Features",
                "rex_initial_features_restart_now"
        ));

        java.util.LinkedHashMap<String, List<app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.FeatureEntry>> byCat =
                new java.util.LinkedHashMap<>();
        for (app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.FeatureEntry e : filtered) {
            List<app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.FeatureEntry> list = byCat.get(e.category);
            if (list == null) {
                list = new java.util.ArrayList<>();
                byCat.put(e.category, list);
            }
            list.add(e);
        }

        for (Map.Entry<String, List<app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.FeatureEntry>> group : byCat.entrySet()) {
            PreferenceCategory cat = addCategory(group.getKey().toUpperCase(Locale.ROOT) + " (" + group.getValue().size() + ")");
            for (app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.FeatureEntry entry : group.getValue()) {
                addPreference(cat, new app.morphe.extension.instagram.settings.preference.widgets.InitialFeaturePreference(context, entry));
            }
        }
    }

    public void buildCacheCleanerSection() {
        PreferenceCategory statusCat = addCategory("CACHE STATUS & MANUAL CLEANUP");
        addPreference(statusCat, helper.buttonPreference(
                "Current Cache Status",
                app.morphe.extension.instagram.settings.feature.AppCacheCleaner.getStatusSummary(context),
                "rex_cache_cleaner_status_btn"
        ));
        addPreference(statusCat, helper.buttonPreference(
                "Clean Cache Now",
                "Safely purge image/video/reel/temp cache while preserving login session, downloads & preferences",
                "rex_cache_cleaner_clean_now_btn"
        ));

        PreferenceCategory autoCat = addCategory("AUTOMATIC CACHE LIMIT");
        addPreference(autoCat, helper.switchPreference(
                "Enable Automatic Cache Cleaning",
                "Automatically clean temporary media cache on app startup when cache exceeds the configured limit",
                Settings.AUTO_CACHE_CLEAN_ENABLED
        ));
        addPreference(autoCat, helper.buttonPreference(
                "Cache Size Limit Preset",
                "Current Limit: " + app.morphe.extension.instagram.settings.feature.AppCacheCleaner.formatLimitLabel(
                        app.morphe.extension.instagram.settings.feature.AppCacheCleaner.getLimitMb()
                ) + " (250 MB, 500 MB, 1 GB, 2 GB, 3 GB, 5 GB, Custom)",
                "rex_cache_cleaner_limit_btn"
        ));
        addPreference(autoCat, helper.buttonPreference(
                "Set Custom Cache Limit (50 MB – 20 GB)",
                "Enter an exact MB or GB cache ceiling",
                "rex_cache_cleaner_custom_limit_btn"
        ));
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
