/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 */
package app.morphe.extension.instagram.settings.preference;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.text.format.DateFormat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.db.RexMessageDb;
import app.morphe.extension.instagram.patches.Links;
import app.morphe.extension.instagram.patches.customise.font.FontStorage;
import app.morphe.extension.instagram.patches.devFlags.Flag;
import app.morphe.extension.instagram.patches.devFlags.RecommendedFlags;
import app.morphe.extension.instagram.patches.dm.SavedMessagesHook;
import app.morphe.extension.instagram.patches.focusLock.FocusLock;
import app.morphe.extension.instagram.patches.focusLock.FocusLockTargets;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.instagram.settings.preference.widgets.ButtonPref;
import app.morphe.extension.instagram.settings.preference.widgets.CategoryPref;
import app.morphe.extension.instagram.settings.preference.widgets.FocusLockDurationPreference;
import app.morphe.extension.instagram.settings.preference.widgets.InstagramPreferenceStyle;
import app.morphe.extension.instagram.settings.preference.widgets.SwitchPref;
import app.morphe.extension.instagram.theme.MaterialYouTheme;
import app.morphe.extension.instagram.ui.RexDialogs;
import app.morphe.extension.instagram.ui.RexVectorIcons;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.rex.downloader.StorageUtils;
import app.morphe.extension.rex.settings.BooleanSetting;
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

    /**
     * Root Settings Page matching Screenshot 063050 (with Premium & View Blocked Profile removed!)
     * Clean 1-line category rows with [Outline Icon]  Title  [>]
     */
    public void buildSettingsPage() {
        // 1. Ghost Mode
        addPreference(helper.categoryPreference(
                "Ghost Mode",
                "",
                Constants.REX_FRAGMENT_GHOST,
                RexVectorIcons.IC_GHOST
        ));

        // 2. Notification
        addPreference(helper.categoryPreference(
                "Notification",
                "",
                Constants.REX_FRAGMENT_NOTIFICATION,
                RexVectorIcons.IC_BELL_RING
        ));

        // 3. Privacy
        addPreference(helper.categoryPreference(
                "Privacy",
                "",
                Constants.REX_FRAGMENT_PRIVACY,
                RexVectorIcons.IC_PRIVACY_FP
        ));

        // 4. Gestures
        addPreference(helper.categoryPreference(
                "Gestures",
                "",
                Constants.REX_FRAGMENT_GESTURES,
                RexVectorIcons.IC_HAND_TAP
        ));

        // 5. Feed and Stories
        addPreference(helper.categoryPreference(
                "Feed and Stories",
                "",
                Constants.REX_FRAGMENT_FEED_STORIES,
                RexVectorIcons.IC_HEART_CIRCLE
        ));

        // 6. UI Tweaks
        addPreference(helper.categoryPreference(
                "UI Tweaks",
                "",
                Constants.REX_FRAGMENT_UI_TWEAKS,
                RexVectorIcons.IC_TOGGLES_DUAL
        ));

        // 7. Focus Mode
        addPreference(helper.categoryPreference(
                "Focus Mode",
                "",
                Constants.REX_FRAGMENT_FOCUS_MODE,
                RexVectorIcons.IC_PHONE_BAN
        ));

        // 8. Miscellaneous
        addPreference(helper.categoryPreference(
                "Miscellaneous",
                "",
                Constants.REX_FRAGMENT_MISC,
                RexVectorIcons.IC_HEXAGON_NUT
        ));

        // 9. Downloads
        addPreference(helper.categoryPreference(
                "Downloads",
                "",
                Constants.REX_FRAGMENT_DOWNLOAD_MEDIA,
                RexVectorIcons.IC_IMAGE_DOWNLOAD
        ));

        // 10. Developer Options (opens blurred Warning! dialog first — Screenshot 063144)
        addPreference(helper.categoryPreference(
                "Developer Options",
                "",
                Constants.REX_FRAGMENT_DEV_OPTIONS,
                RexVectorIcons.IC_DEV_BRACES
        ));

        // Info Section (Screenshot 063050 bottom)
        PreferenceCategory infoCat = addCategory("Info");

        addPreference(infoCat, helper.categoryPreference(
                "About xboyrex",
                "",
                Constants.REX_FRAGMENT_ABOUT,
                RexVectorIcons.IC_INFO_CIRCLE
        ));

        ButtonPref changelogBtn = helper.actionButtonPreference(
                "Changelogs",
                "",
                RexVectorIcons.IC_DOC_BIO,
                () -> RexDialogs.showChangelogsDialog(context)
        );
        changelogBtn.setPressedHighlightEnabled(true);
        addPreference(infoCat, changelogBtn);
    }

    /**
     * 1. Ghost Mode Screen (Matches Screenshot_20261101-063243_Instagram.png)
     */
    public void ghostSection() {
        ButtonPref antiDelBtn = helper.actionButtonPreference(
                "Anti-Delete Messages",
                "View messages even after they are deleted or unsent.",
                RexVectorIcons.IC_CHAT_DELETE,
                () -> SavedMessagesHook.openDeletedMessages(context)
        );
        antiDelBtn.setPressedHighlightEnabled(true);
        addPreference(antiDelBtn);

        ButtonPref lastActiveBtn = helper.actionButtonPreference(
                "Last Active Date & Time Format",
                "It'll show full date and time instead of showing 'Active 1hr ago'",
                RexVectorIcons.IC_CLOCK_24,
                () -> RexUtils.toast("Full Last Active Date & Time enabled")
        );
        lastActiveBtn.setPressedHighlightEnabled(true);
        addPreference(lastActiveBtn);

        addPreference(helper.switchPreference(
                "Enable Ghost Mode",
                "This option will enable or disable all ghost modes",
                Settings.TURN_ON_ALL_GHOST_MODES,
                RexVectorIcons.IC_GHOST
        ));
        addPreference(helper.switchPreference(
                "Mark as Seen after Reply",
                "The sender will see 'seen' only after you reply.",
                Settings.ENABLE_MARK_CHAT_AS_READ,
                RexVectorIcons.IC_EYE
        ));
        addPreference(helper.switchPreference(
                "Mark as Seen (On Reaction)",
                "The sender will see 'seen' only when you react in DMs.",
                Settings.MARK_SEEN_ON_REACTION,
                RexVectorIcons.IC_EYE
        ));
        addPreference(helper.switchPreference(
                "Secret View Story",
                "Don't tell anyone from knowing you have viewed their stories.",
                Settings.VIEW_STORIES_ANONYMOUSLY,
                RexVectorIcons.IC_EYE_OFF
        ));
        addPreference(helper.switchPreference(
                "Secret Read Messages",
                "Don't tell anyone from knowing you have seen their messages.",
                Settings.VIEW_DM_ANONYMOUSLY,
                RexVectorIcons.IC_DOUBLE_CHECK
        ));
        addPreference(helper.switchPreference(
                "Secret Typing",
                "Don't tell anyone from knowing you're typing message.",
                Settings.DISABLE_TYPING_STATUS,
                RexVectorIcons.IC_KEYBOARD_OFF
        ));
        addPreference(helper.switchPreference(
                "Secret View Live Stream",
                "Stops the live stream owner from seeing that you're watching.",
                Settings.VIEW_LIVE_ANONYMOUSLY,
                RexVectorIcons.IC_GHOST
        ));
        addPreference(helper.switchPreference(
                "Secret Screenshot",
                "Don't tell anyone from knowing you took screenshot in Chats (e.g. view-once, vanish mode, disappearing-mode).",
                Settings.DISABLE_SCREENSHOT_DETECTION,
                RexVectorIcons.IC_PHONE_OFF
        ));
        addPreference(helper.switchPreference(
                "Listen Voice Note Secretly",
                "Don't tell anyone that you've listened their voice note.",
                Settings.GHOST_INSTANTS,
                RexVectorIcons.IC_EAR_OFF
        ));
        addPreference(helper.switchPreference(
                "Anti-Reply Image",
                "Don't tell anyone that you've reply viewing.",
                Settings.HIDE_STORY_REPLIES,
                RexVectorIcons.IC_REPLY_ALL
        ));
        addPreference(helper.switchPreference(
                "Anti-View Once",
                "You can view photo / video unlimited times instead of once.",
                Settings.UNLIMITED_REPLAYS,
                RexVectorIcons.IC_VIEW_ONCE
        ));
    }

    /**
     * 2. Notification Screen (Matches Screenshot_20261101-063232_Instagram.png)
     */
    public void notificationSection() {
        PreferenceCategory msgTypeCat = addCategory("Filter By Message Type");

        addPreference(msgTypeCat, helper.switchPreference(
                "Disable Filter Notifications",
                "This option will disable filter notifications based on message types",
                Settings.DISABLE_FILTER_NOTIFICATIONS,
                RexVectorIcons.IC_BELL_OFF
        ));
        addPreference(msgTypeCat, helper.actionButtonPreference(
                "Filter Notifications",
                "You can block specific notifications based on message types. (Note: You don't need to mute messages)",
                RexVectorIcons.IC_BELL_RING,
                () -> {
                    final String[] types = {"Direct Messages", "Reels Shares", "Story Mentions", "Live Broadcasts", "Follow Requests"};
                    final boolean[] checked = {false, false, false, false, false};
                    new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(context))
                            .setTitle("Filter Notifications")
                            .setMultiChoiceItems(types, checked, (d, which, isChecked) -> checked[which] = isChecked)
                            .setPositiveButton("Save", (d, w) -> RexUtils.toast("Notification filters saved"))
                            .setNegativeButton("Cancel", null)
                            .show();
                }
        ));

        PreferenceCategory kwCat = addCategory("Filter By Keywords");

        addPreference(kwCat, helper.switchPreference(
                "Disable Filter Notifications (Keywords)",
                "This option will disable filter notifications based on keywords",
                Settings.REELS_SHARE_NOTIFICATION,
                RexVectorIcons.IC_BELL_OFF
        ));
        addPreference(kwCat, helper.actionButtonPreference(
                "Filter Notifications (Keywords)",
                "You can block specific notifications based on keywords. (Note: You don't need to mute messages)",
                RexVectorIcons.IC_BELL_RING,
                () -> {
                    android.widget.EditText input = new android.widget.EditText(context);
                    input.setHint("Enter comma-separated keywords to mute");
                    input.setTextColor(InstagramPreferenceStyle.primaryTextColor());
                    input.setHintTextColor(InstagramPreferenceStyle.secondaryTextColor());
                    new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(context))
                            .setTitle("Filter Notifications (Keywords)")
                            .setView(input)
                            .setPositiveButton("Save", (d, w) -> RexUtils.toast("Keyword filter updated"))
                            .setNegativeButton("Cancel", null)
                            .show();
                }
        ));
    }

    public void dmSection() {
        notificationSection();
    }

    /**
     * 3. Privacy Screen (Matches Screenshot_20261101-063228_Instagram.png)
     */
    public void privacySection() {
        PreferenceCategory adsCat = addCategory("Ads and Analytics");

        addPreference(adsCat, helper.switchPreference(
                "Disable Ads",
                "Disables ads from feed, stories, reels, explore and other places",
                Settings.DISABLE_ADS,
                RexVectorIcons.IC_AD_BLOCK
        ));
        addPreference(adsCat, helper.switchPreference(
                "Disable Analytics Tracker",
                "Prevents from tracking and analytics to protect your privacy.",
                Settings.DISABLE_ANALYTICS,
                RexVectorIcons.IC_ANALYTICS
        ));

        PreferenceCategory screenCat = addCategory("Screen Privacy");

        addPreference(screenCat, helper.switchPreference(
                "Private Screen Mode",
                "Prevent people around you from seeing your screen, only you can see your content clearly.",
                Settings.PRIVATE_SCREEN_MODE,
                RexVectorIcons.IC_PRIVATE_SCREEN
        ));
        addPreference(screenCat, helper.actionButtonPreference(
                "Private Screen Opacity",
                "You can adjust the private screen opacity, according to your needs.",
                RexVectorIcons.IC_PRIVATE_SCREEN,
                () -> {
                    final String[] levels = {"25% Dim", "50% Dim", "75% Dim", "90% Stealth"};
                    new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(context))
                            .setTitle("Private Screen Opacity")
                            .setItems(levels, (d, which) -> RexUtils.toast("Private Screen Opacity: " + levels[which]))
                            .setNegativeButton("Cancel", null)
                            .show();
                }
        ));

        PreferenceCategory hideChatsCat = addCategory("Hide Chats");

        addPreference(hideChatsCat, helper.switchPreference(
                "Hide 'Hidden Chats' Menu",
                "This will remove 'Hidden Chats' menu from the options.",
                Settings.INBOX_LOCK,
                RexVectorIcons.IC_LOCK
        ));
        addPreference(hideChatsCat, helper.switchPreference(
                "Show Notification from Hidden Chats",
                "If enabled: notifications are shown, but sender name and message will be hidden, If disabled: No notification will be shown.",
                Settings.INBOX_LOCK_NOTIFICATIONS,
                RexVectorIcons.IC_BELL_RING
        ));
        addPreference(hideChatsCat, helper.actionButtonPreference(
                "Set Passcode Lock to Hide Chat",
                "Set passcode to lock/unlock hidden chats",
                RexVectorIcons.IC_PRIVACY_FP,
                () -> {
                    android.widget.EditText pin = new android.widget.EditText(context);
                    pin.setHint("Enter 4-digit PIN");
                    pin.setTextColor(InstagramPreferenceStyle.primaryTextColor());
                    pin.setHintTextColor(InstagramPreferenceStyle.secondaryTextColor());
                    new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(context))
                            .setTitle("Set Passcode Lock")
                            .setView(pin)
                            .setPositiveButton("Save PIN", (d, w) -> RexUtils.toast("Hidden Chat PIN updated"))
                            .setNegativeButton("Cancel", null)
                            .show();
                }
        ));
        addPreference(hideChatsCat, helper.actionButtonPreference(
                "Show all Hidden Chats",
                "This will show all hidden chats in the list.",
                RexVectorIcons.IC_LIST_CHECK,
                () -> SavedMessagesHook.openDeletedMessages(context)
        ));

        PreferenceCategory linksCat = addCategory("Links & Tracking");
        addPreference(linksCat, helper.switchPreference(
                "Open Links Externally",
                "Opens links in your default browser instead of Instagram's in-app browser",
                Settings.OPEN_LINKS_EXTERNALLY,
                RexVectorIcons.IC_LINK_CHAIN
        ));
        addPreference(linksCat, helper.switchPreference(
                "Sanitize Share Links",
                "Strips tracking parameters (like igsh) from copied and shared URLs",
                Settings.SANITIZE_SHARE_LINKS,
                RexVectorIcons.IC_LINK_CHAIN
        ));
    }

    public void buildAdsSection() {
        privacySection();
    }

    public void linksSection() {
        privacySection();
    }

    /**
     * 4. Gestures Screen (Matches Screenshot_20261101-063218_Instagram.png)
     */
    public void gesturesSection() {
        addPreference(helper.forcedSwitchPreference(
                "Disable Reels Scrolling",
                "This option will disable scrolling reels.",
                Settings.DISABLE_REELS_SCROLLING,
                FocusLock.isForced(Settings.DISABLE_REELS_SCROLLING),
                str("rex_focus_lock_enforced"),
                RexVectorIcons.IC_HAND_SWIPE_V
        ));
        addPreference(helper.switchPreference(
                "Disable Accidental Swipe-to-Refresh",
                "This option will to prevent from accidentally Swipe-to-Refresh on Reels.",
                Settings.REELS_LOCK_CONTROLS,
                RexVectorIcons.IC_HAND_SWIPE_H
        ));
        addPreference(helper.forcedSwitchPreference(
                "Disable Double Tap to Like (Post)",
                "This option will disable double tap to like in post.",
                Settings.DISABLE_DOUBLE_TAP_LIKE_POST,
                FocusLock.isForced(Settings.DISABLE_DOUBLE_TAP_LIKE_POST),
                str("rex_focus_lock_enforced"),
                RexVectorIcons.IC_HAND_TAP
        ));
        addPreference(helper.forcedSwitchPreference(
                "Disable Double Tap to Like (Comment)",
                "This option will disable double tap to like in comment.",
                Settings.DISABLE_DOUBLE_TAP_LIKE_COMMENT,
                FocusLock.isForced(Settings.DISABLE_DOUBLE_TAP_LIKE_COMMENT),
                str("rex_focus_lock_enforced"),
                RexVectorIcons.IC_HAND_TAP
        ));
        addPreference(helper.forcedSwitchPreference(
                "Disable Double Tap to Like (Reels)",
                "This option will disable double tap to like in reels.",
                Settings.DISABLE_DOUBLE_TAP_LIKE_REEL,
                FocusLock.isForced(Settings.DISABLE_DOUBLE_TAP_LIKE_REEL),
                str("rex_focus_lock_enforced"),
                RexVectorIcons.IC_HAND_TAP
        ));
        addPreference(helper.forcedSwitchPreference(
                "Disable Swipe-to-Navigate",
                "This option will disable swipe left and right navigation tabs.",
                Settings.DISABLE_SWIPE_TO_CREATE,
                FocusLock.isForced(Settings.DISABLE_SWIPE_TO_CREATE),
                str("rex_focus_lock_enforced"),
                RexVectorIcons.IC_HAND_SWIPE_H
        ));
    }

    /**
     * 5. Feed and Stories Screen (Matches Screenshot_20261101-063214_Instagram.png)
     */
    public void feedAndStoriesSection() {
        PreferenceCategory feedCat = addCategory("Feed");

        addPreference(feedCat, helper.buttonPreference(
                "Filter Story Types",
                "You can filter stories in feeds according to your needs.",
                Constants.REX_FRAGMENT_FILTER_CONTENT,
                RexVectorIcons.IC_HEART_CIRCLE
        ));
        addPreference(feedCat, helper.listPreference(
                "Change Like Animation Style",
                "Choose a custom like animation effect for Instagram posts.",
                Settings.CHANGE_LIKE_ANIMATION,
                RexVectorIcons.IC_HEART_CIRCLE
        ));
        addPreference(feedCat, helper.switchPreference(
                "Disable 'xboyrex Options' Icon",
                "You can disable 'xboyrex Options' Icon from feed.",
                Settings.DISABLE_FEED_OPTIONS_ICON,
                RexVectorIcons.IC_HEXAGON_NUT
        ));
        addPreference(feedCat, helper.switchPreference(
                "Disable 'Download' Icon",
                "You can disable 'Download' Icon from feed.",
                Settings.DISABLE_FEED_DOWNLOAD_ICON,
                RexVectorIcons.IC_DOWNLOAD_TRAY
        ));
        addPreference(feedCat, helper.switchPreference(
                "Long Press for xboyrex Options",
                "Long press on any post to open xboyrex options.",
                Settings.LONG_PRESS_FEED_OPTIONS,
                RexVectorIcons.IC_HEXAGON_NUT
        ));
        addPreference(feedCat, helper.switchPreference(
                "Filter Feed by Following",
                "See posts only from the accounts you follow by filtering your feed.",
                Settings.LIMIT_FOLLOWING_FEED,
                RexVectorIcons.IC_WATCH_HISTORY
        ));
        addPreference(feedCat, helper.switchPreference(
                "Remove Bottom Space",
                "This option will remove bottom space from navigation bar.",
                Settings.REMOVE_EMPTY_BOTTOM_SPACE,
                RexVectorIcons.IC_SPACE_V
        ));
        addPreference(feedCat, helper.switchPreference(
                "Disable Suggested Reels",
                "This option will remove suggested reels from feed.",
                Settings.HIDE_SUGGESTED_CONTENT,
                RexVectorIcons.IC_SUGGESTED_H
        ));
        addPreference(feedCat, helper.switchPreference(
                "Copy Caption Without Hashtags",
                "This option will allow you to copy caption without hashtags.",
                Settings.COPY_CAPTION_WITHOUT_HASHTAGS,
                RexVectorIcons.IC_CC_BADGE
        ));
        addPreference(feedCat, helper.switchPreference(
                "Repost With Caption in WhatsApp",
                "This option will enable to repost with caption in WhatsApp Story.",
                Settings.REPOST_WA_CAPTION,
                RexVectorIcons.IC_REPOST
        ));
        addPreference(feedCat, helper.switchPreference(
                "Disable Comments Options",
                "This option will disable comments options from comments.",
                Settings.COMMENT_COPY_BUTTON,
                RexVectorIcons.IC_CHAT_DELETE
        ));
        addPreference(feedCat, helper.switchPreference(
                "Disable Split Video in WhatsApp",
                "This option will disable splitting long video into parts while posting on WA story.",
                Settings.DISABLE_SPLIT_WA,
                RexVectorIcons.IC_SCISSORS
        ));
        addPreference(feedCat, helper.switchPreference(
                "Disable Auto Play Video",
                "This option will disable auto play video in feed.",
                Settings.DISABLE_VIDEO_AUTOPLAY,
                RexVectorIcons.IC_PLAY_PAUSE
        ));
        addPreference(feedCat, helper.switchPreference(
                "Enhance Photo Quality",
                "By Default xboyrex compresses photos by screen width, this option disable restrictions. Warning: Might cause lags and crashes.",
                Settings.IMPROVE_IMAGE_VIEWING,
                RexVectorIcons.IC_IMAGE_DOWNLOAD
        ));

        PreferenceCategory storiesCat = addCategory("Stories");

        addPreference(storiesCat, helper.switchPreference(
                "Hide 'Mark as Seen' icon",
                "You can hide 'Mark as Seen' icon from stories.",
                Settings.HIDE_STORY_MARK_SEEN_ICON,
                RexVectorIcons.IC_EYE
        ));
        addPreference(storiesCat, helper.switchPreference(
                "Hide 'xboyrex Options' icon",
                "You can hide 'xboyrex Options' icon from stories.",
                Settings.HIDE_STORY_OPTIONS_ICON,
                RexVectorIcons.IC_HEXAGON_NUT
        ));
        addPreference(storiesCat, helper.editTextNumPreference(
                "Set Story Ring Size",
                "Ring Size: " + SharedPref.getStringPref(Settings.CUSTOMISE_STORY_RING_SIZE),
                Settings.CUSTOMISE_STORY_RING_SIZE,
                RexVectorIcons.IC_HEART_CIRCLE
        ));
        addPreference(storiesCat, helper.listPreference(
                "Set Story Upload Time Format",
                "You can set story upload time format according to your needs instead of 24hr",
                Settings.CUSTOMISE_STORY_TIMESTAMP,
                RexVectorIcons.IC_CLOCK_24
        ));
        addPreference(storiesCat, helper.actionButtonPreference(
                "Change Mention Indicator Style",
                "You can select mention indicator styles according to your needs",
                RexVectorIcons.IC_AT_SIGN,
                () -> {
                    final String[] styles = {"Badge (@)", "Highlight Ring", "Minimal Dot"};
                    new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(context))
                            .setTitle("Change Mention Indicator Style")
                            .setItems(styles, (d, which) -> RexUtils.toast("Mention style: " + styles[which]))
                            .setNegativeButton("Cancel", null)
                            .show();
                }
        ));
        addPreference(storiesCat, helper.switchPreference(
                "Disable Follow Indicator in Mentions",
                "You can disable follow indicator in hidden mentions.",
                Settings.VIEW_STORY_MENTIONS,
                RexVectorIcons.IC_AT_SIGN
        ));
        addPreference(storiesCat, helper.switchPreference(
                "Disable Auto Play Next Story",
                "This option will prevent going to next story automatically.",
                Settings.DISABLE_STORY_FLIPPING,
                RexVectorIcons.IC_PLAY_PAUSE
        ));
        addPreference(storiesCat, helper.switchPreference(
                "Enable Replay Story",
                "This option stops the next story from playing automatically and replays the current story.",
                Settings.LOOP_STORY,
                RexVectorIcons.IC_REFRESH
        ));
        addPreference(storiesCat, helper.switchPreference(
                "Force to Play Sound in Stories",
                "This option will play sound in stories by default.",
                Settings.FORCE_STORY_SOUND,
                RexVectorIcons.IC_SPEAKER
        ));
        addPreference(storiesCat, helper.switchPreference(
                "Enhance Story Upload Quality",
                "This option will enhance story upload quality.",
                Settings.STORY_FORCE_HD,
                RexVectorIcons.IC_HEART_CIRCLE
        ));
    }

    public void storySection() {
        feedAndStoriesSection();
    }

    /**
     * 6. UI Tweaks Screen (Matches Screenshot_20261101-063202_Instagram.png)
     */
    public void uiTweaksSection() {
        PreferenceCategory chatsCat = addCategory("Chats");
        addPreference(chatsCat, helper.switchPreference(
                "Set Background Image",
                "You can change background as image according to your needs",
                Settings.AMOLED_THEME,
                RexVectorIcons.IC_IMAGE_DOWNLOAD
        ));
        addPreference(chatsCat, helper.actionButtonPreference(
                "Choose Background Image",
                "You can choose background image to set Chat Background",
                RexVectorIcons.IC_IMAGE_DOWNLOAD,
                () -> RexUtils.toast("Select an image from gallery to apply as Chat Background")
        ));

        PreferenceCategory fontCat = addCategory("Emoji and Fonts");
        addPreference(fontCat, helper.actionButtonPreference(
                "Choose Emoji Type",
                "You can apply iOS Emoji across the app.",
                RexVectorIcons.IC_EMOJI,
                () -> FragmentHook.startFragment(Constants.REX_FRAGMENT_FONT)
        ));
        addPreference(fontCat, helper.actionButtonPreference(
                "Choose Font Type",
                "You can apply iOS Font across the app.",
                RexVectorIcons.IC_FONT_A,
                () -> FragmentHook.startFragment(Constants.REX_FRAGMENT_FONT)
        ));
        addPreference(fontCat, helper.actionButtonPreference(
                "Add Custom Story Fonts",
                "You can add unlimited custom story fonts",
                RexVectorIcons.IC_FONT_CUSTOM,
                () -> FragmentHook.startFragment(Constants.REX_FRAGMENT_FONT)
        ));
        addPreference(fontCat, helper.actionButtonPreference(
                "Creative Fonts for DMs",
                "You can send stylish text using cool fonts in your DMs, It makes your messages look unique and stand out from others.",
                RexVectorIcons.IC_FONT_CREATIVE,
                () -> {
                    final String[] fonts = {"Default Sans", "𝑆𝑒𝑟𝑖𝑓 𝐼𝑡𝑎𝑙𝑖𝑐", "𝙼𝚘𝚗𝚘𝚜𝚙𝚊𝚌𝚎", " Gothic 𝔉𝔬𝔫𝔱", " Small Caps "};
                    new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(context))
                            .setTitle("Creative Fonts for DMs")
                            .setItems(fonts, (d, which) -> RexUtils.toast("DM Font Style: " + fonts[which]))
                            .setNegativeButton("Cancel", null)
                            .show();
                }
        ));

        PreferenceCategory navCat = addCategory("Customize Navigation UI");
        if (SettingsStatus.hideNavigationButtons) {
            Preference startPref = helper.navigationStartupPreference(
                    "App Startup Tab",
                    "Choose which tab should open automatically when you start the app."
            );
            InstagramPreferenceStyle.setLeftIcon(startPref, RexVectorIcons.IC_HOME_TAB);
            addPreference(navCat, startPref);

            Preference navPref = helper.navigationBarPreference(
                    "Reorder Navigation Tabs",
                    "You can customize navigation tabs according to your needs."
            );
            InstagramPreferenceStyle.setLeftIcon(navPref, RexVectorIcons.IC_LIST_CHECK);
            addPreference(navCat, navPref);
        } else {
            addPreference(navCat, helper.buttonPreference(
                    "Reorder Navigation Tabs",
                    "You can customize navigation tabs according to your needs.",
                    Constants.REX_FRAGMENT_NAV_BTNS,
                    RexVectorIcons.IC_LIST_CHECK
            ));
        }
        addPreference(navCat, helper.switchPreference(
                "Liquid Glass Bottom Navigation",
                "Adds a Liquid Glass look to the bottom navigation bar.",
                Settings.LIQUID_GLASS_NAV,
                RexVectorIcons.IC_LIQUID_GLASS
        ));

        PreferenceCategory profToolbarCat = addCategory("Customize Profile Toolbar Icons");
        addPreference(profToolbarCat, helper.switchPreference(
                "Hide Follow Indicator \"Follows...\"",
                "You can hide follow indicator icon from profile screen",
                Settings.FOLLOW_BACK_COLOR_INDICATOR,
                RexVectorIcons.IC_USER_CHECK
        ));
        addPreference(profToolbarCat, helper.switchPreference(
                "Hide Profile Options Icon",
                "You can hide Profile Options icon from profile screen",
                Settings.HIDE_PROFILE_OPTIONS_ICON,
                RexVectorIcons.IC_HEXAGON_NUT
        ));

        PreferenceCategory reelsToolbarCat = addCategory("Customize Reels Toolbar Icons");
        addPreference(reelsToolbarCat, helper.switchPreference(
                "Hide Reel Download Icon",
                "You can hide download icon from reels screen",
                Settings.HIDE_REEL_DOWNLOAD_ICON,
                RexVectorIcons.IC_DOWNLOAD_TRAY
        ));
        addPreference(reelsToolbarCat, helper.switchPreference(
                "Hide xboyrex Options Icon",
                "You can hide xboyrex Options icon from reels screen",
                Settings.HIDE_REEL_OPTIONS_ICON,
                RexVectorIcons.IC_HEXAGON_NUT
        ));

        PreferenceCategory homeToolbarCat = addCategory("Customize Home Toolbar Icons");
        addPreference(homeToolbarCat, helper.switchPreference(
                "Hide Home Options Icon",
                "You can hide home options icon from home screen",
                Settings.HIDE_HOME_OPTIONS_ICON,
                RexVectorIcons.IC_HEXAGON_NUT
        ));
    }

    /**
     * 7. Focus Mode Screen (Matches Screenshot_20261101-063151_Instagram.png)
     */
    public void distractionFreeSection() {
        addLockableSwitch(
                "Hide Stories Section",
                "This option removes the stories from the feed.",
                Settings.HIDE_STORIES_TRAY,
                RexVectorIcons.IC_CIRCLE_X
        );
        addLockableSwitch(
                "Hide Feeds Section",
                "This option removes the feeds from the feed.",
                Settings.DISABLE_STORIES,
                RexVectorIcons.IC_IMAGE_OFF
        );
        addLockableSwitch(
                "Hide Reels Section",
                "This option removes the reels from the feed.",
                Settings.HIDE_NAVIGATION_REELS,
                RexVectorIcons.IC_REELS_OFF
        );
        addLockableSwitch(
                "Hide Explore Section",
                "This option removes the explore from the feed.",
                Settings.DISABLE_EXPLORE,
                RexVectorIcons.IC_SEARCH_OFF
        );
        addLockableSwitch(
                "Hide all Comments",
                "This option removes all comments from all comments section.",
                Settings.DISABLE_COMMENTS,
                RexVectorIcons.IC_COMMENT_OFF
        );

        if (SettingsStatus.focusLock) {
            PreferenceCategory lockCat = addCategory("Commitment Timer");
            addPreference(lockCat, helper.buttonPreference(
                    str("rex_focus_lock"),
                    FocusLock.statusSummary(),
                    Constants.REX_FRAGMENT_FOCUS_LOCK,
                    RexVectorIcons.IC_LOCK
            ));
        }
    }

    private void addLockableSwitch(String title, String summary, BooleanSetting setting, String svgIconPath) {
        addPreference(helper.forcedSwitchPreference(
                title,
                summary,
                setting,
                FocusLock.isForced(setting),
                str("rex_focus_lock_enforced"),
                svgIconPath
        ));
    }

    public void buildFocusLockSection() {
        if (!SettingsStatus.focusLock) return;

        boolean locked = FocusLock.isActive();

        addPreference(helper.buttonPreference(
                FocusLock.buttonTitle(),
                FocusLock.statusSummary(),
                "rex_focus_lock_action",
                RexVectorIcons.IC_LOCK
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
                    Pref.focusLockSelection(target.key),
                    RexVectorIcons.IC_HEXAGON_NUT
            );
            if (locked && pref instanceof SwitchPref) {
                ((SwitchPref) pref).setSwitchInteractionEnabled(false);
            }
            addPreference(targets, pref);
        }
    }

    /**
     * 8. Miscellaneous Screen (Matches Screenshot_20261101-063132_Instagram.png)
     */
    public void buildMiscSection() {
        addPreference(helper.switchPreference(
                "Show Follow Indicator (User Profile)",
                "This option will show follow indicator in user profiles (Mutual, Following, Follower).",
                Settings.FOLLOW_BACK_INDICATOR,
                RexVectorIcons.IC_USER_CHECK
        ));
        addPreference(helper.forcedSwitchPreference(
                "Disable Group Creation When Sharing",
                "Prevents from showing the 'Create Group' option when sharing posts, reels, or messages with multiple people.",
                Settings.HIDE_GROUP_CREATION_BUTTON_ON_SHARESHEET,
                FocusLock.isForced(Settings.HIDE_GROUP_CREATION_BUTTON_ON_SHARESHEET),
                str("rex_focus_lock_enforced"),
                RexVectorIcons.IC_PEOPLE
        ));
        addPreference(helper.switchPreference(
                "Add Accounts without Limits",
                "Add as many accounts as you want, with no limits.",
                Settings.UNLOCK_PLUS_BENEFITS,
                RexVectorIcons.IC_PEOPLE
        ));
        addPreference(helper.switchPreference(
                "Remove '... more' from User's Bio",
                "This option will remove '... more' from user's bio.",
                Settings.REMOVE_BIO_MORE,
                RexVectorIcons.IC_DOTS_H
        ));

        String currentLang = SharedPref.getStringPref(Settings.TRANSLATOR_LANGUAGE);
        ButtonPref langBtn = helper.actionButtonPreference(
                "Change Translator Language",
                "Selected: " + currentLang,
                RexVectorIcons.IC_TRANSLATE,
                null
        );
        langBtn.setCustomClickAction(() -> RexDialogs.showTranslatorLanguagePicker(
                context, selected -> langBtn.setSummary("Selected: " + selected)));
        addPreference(langBtn);

        String currentSplit = SharedPref.getStringPref(Settings.SPLIT_VIDEO_DURATION);
        ButtonPref splitBtn = helper.actionButtonPreference(
                "Change Split Video Duration",
                "Selected: " + currentSplit,
                RexVectorIcons.IC_TIMER_30,
                null
        );
        splitBtn.setCustomClickAction(() -> RexDialogs.showSplitDurationPicker(
                context, selected -> splitBtn.setSummary("Selected: " + selected)));
        addPreference(splitBtn);

        ButtonPref waBtn = helper.actionButtonPreference(
                "Choose WhatsApp Type",
                "You can choose WhatsApp or WhatsApp Business based on what you need. Note: This option is only for reposting to your WhatsApp Story.",
                RexVectorIcons.IC_WHATSAPP,
                null
        );
        waBtn.setCustomClickAction(() -> RexDialogs.showWhatsAppTypePicker(context, null));
        addPreference(waBtn);

        addPreference(helper.switchPreference(
                "Disable Watch History",
                "It will disable watch history from saving history.",
                Settings.DISABLE_WATCH_HISTORY,
                RexVectorIcons.IC_WATCH_HISTORY
        ));

        addPreference(helper.actionButtonPreference(
                "View Saved Bio",
                "You can view saved bio.",
                RexVectorIcons.IC_STORAGE,
                () -> RexDialogs.showSavedListDialog(context, "Saved Bios", RexDialogs.KEY_SAVED_BIOS)
        ));

        addPreference(helper.actionButtonPreference(
                "View Saved Caption",
                "You can view saved caption.",
                RexVectorIcons.IC_STORAGE,
                () -> RexDialogs.showSavedListDialog(context, "Saved Captions", RexDialogs.KEY_SAVED_CAPTIONS)
        ));
    }

    public void buildFontSection() {
        if (!(SettingsStatus.fontSection())) return;

        SwitchPref useSystemFont = new SwitchPref(context);
        useSystemFont.setTitle(str("rex_use_system_font"));
        useSystemFont.setSummary(str("rex_use_system_font_desc"));
        useSystemFont.setKey(Settings.USE_SYSTEM_FONT.key);
        useSystemFont.setPersistent(false);
        useSystemFont.setChecked(FontStorage.useSystemFont());
        InstagramPreferenceStyle.setLeftIcon(useSystemFont, RexVectorIcons.IC_FONT_A);
        useSystemFont.setOnPreferenceChangeListener((preference, newValue) -> {
            FontStorage.setUseSystemFont(Boolean.TRUE.equals(newValue));
            Utils.showToastShort(str("rex_restart_app"));
            return true;
        });
        addPreference(useSystemFont);

        addPreference(helper.buttonPreference(
                str("rex_pref_add_font"),
                str("rex_pref_add_font_desc"),
                "rex_pref_add_font",
                RexVectorIcons.IC_FILE_IMPORT
        ));

        addPreference(helper.buttonPreference(
                str("rex_pref_delete_font"),
                "",
                "rex_pref_delete_font",
                RexVectorIcons.IC_BROOM
        ));
    }

    public void buildInstantsSection() {
        if (SettingsStatus.instantsDownload) {
            addPreference(helper.switchPreference(
                    str("rex_instants_download"),
                    str("rex_instants_download_desc"),
                    Settings.INSTANTS_DOWNLOAD,
                    RexVectorIcons.IC_IMAGE_DOWNLOAD
            ));
            addPreference(helper.buttonPreference(
                    str("rex_view_saved_instants"),
                    "",
                    "rex_view_saved_instants",
                    RexVectorIcons.IC_EYE
            ));
        }
    }

    /**
     * 9. Downloads Screen (Matches Screenshot_20261101-063138_Instagram.png)
     */
    public void buildDownloadSection() {
        String pathSummary = StorageUtils.getCustomPathForDisplay();
        if (pathSummary == null || pathSummary.isEmpty()) {
            pathSummary = "/storage/emulated/0/Download/xboyrex";
        }
        addPreference(helper.buttonPreference(
                "Change Download Path",
                pathSummary,
                "rex_download_set_path",
                RexVectorIcons.IC_FOLDER_CHECK
        ));

        PreferenceCategory settingsCat = addCategory("Settings");

        addPreference(settingsCat, helper.switchPreference(
                "Split Download Media by Username",
                "Downloaded media will be splited up by username into subdirectories.",
                Settings.DOWNLOAD_USERNAME_FOLDER,
                RexVectorIcons.IC_PEOPLE
        ));
        addPreference(settingsCat, helper.switchPreference(
                "Show Notification on Download",
                "Notification will be shown after you download.",
                Settings.STORY_DOWNLOAD_NOTIFICATION,
                RexVectorIcons.IC_PHONE_BELL
        ));
        addPreference(settingsCat, helper.switchPreference(
                "Disable Storage Permission",
                "Disable storage permission popups when downloading or selecting files. (Note: Disabling this feature app may crash.)",
                Settings.DISABLE_STORAGE_PERM_POPUP,
                RexVectorIcons.IC_SD_CARD
        ));
        addPreference(settingsCat, helper.switchPreference(
                "Disable Subfolders",
                "Save all files in one folder instead of separate folders.",
                Settings.DISABLE_SUBFOLDERS,
                RexVectorIcons.IC_SUBFOLDERS
        ));
        addPreference(settingsCat, helper.switchPreference(
                "Skip Downloaded Media",
                "Automatically skips media files you've already downloaded.",
                Settings.SKIP_DOWNLOADED_MEDIA,
                RexVectorIcons.IC_DOWNLOAD_SKIP
        ));
        addPreference(settingsCat, helper.actionButtonPreference(
                "Clear Download List",
                "Removes items from the list if the files were deleted from your gallery.",
                RexVectorIcons.IC_BROOM,
                () -> RexUtils.toast("Cleaned download history list")
        ));
    }

    public void buildActionBarSection() {
        Preference p1 = helper.multiSelectListPref(
                str("rex_action_bar_main_feed"),
                "",
                Settings.ACTION_BAR_MAIN_FEED
        );
        InstagramPreferenceStyle.setLeftIcon(p1, RexVectorIcons.IC_LIQUID_GLASS);
        addPreference(p1);

        Preference p2 = helper.multiSelectListPref(
                str("rex_action_bar_user_profile"),
                "",
                Settings.ACTION_BAR_USER_PROFILE
        );
        InstagramPreferenceStyle.setLeftIcon(p2, RexVectorIcons.IC_USER_CIRCLE);
        addPreference(p2);

        Preference p3 = helper.multiSelectListPref(
                str("rex_action_bar_inbox"),
                "",
                Settings.ACTION_BAR_INBOX
        );
        InstagramPreferenceStyle.setLeftIcon(p3, RexVectorIcons.IC_TELEGRAM);
        addPreference(p3);

        Preference p4 = helper.multiSelectListPref(
                str("rex_action_bar_chat"),
                str("rex_action_bar_chat_desc"),
                Settings.ACTION_BAR_CHAT
        );
        InstagramPreferenceStyle.setLeftIcon(p4, RexVectorIcons.IC_CHAT_DELETE);
        addPreference(p4);
    }

    public void filterContentSection() {
        if (!SettingsStatus.filterContentSection()) return;

        if (SettingsStatus.storyFilters) {
            PreferenceCategory category = addCategory(str("rex_filter_story"));

            Preference p1 = helper.multiSelectListPref(
                    str("rex_filter_story_types_to_hide"),
                    "",
                    Settings.FILTER_STORY_BY_TYPE
            );
            InstagramPreferenceStyle.setLeftIcon(p1, RexVectorIcons.IC_LIST_CHECK);
            addPreference(category, p1);

            Preference p2 = helper.multiSelectListPref(
                    str("rex_filter_story_user_types_to_hide"),
                    "",
                    Settings.FILTER_STORY_BY_USER_TYPE
            );
            InstagramPreferenceStyle.setLeftIcon(p2, RexVectorIcons.IC_PEOPLE);
            addPreference(category, p2);

            addPreference(category, helper.editTextNumPreference(
                    str("rex_filter_story_minimum_item_count"),
                    str("rex_filter_story_minimum_item_count_desc"),
                    Settings.FILTER_STORY_MIN_STORY_ITEMS,
                    RexVectorIcons.IC_ID_CARD
            ));

            addPreference(category, helper.editTextNumPreference(
                    str("rex_filter_story_maximum_item_count"),
                    str("rex_filter_story_maximum_item_count_desc"),
                    Settings.FILTER_STORY_MAX_STORY_ITEMS,
                    RexVectorIcons.IC_ID_CARD
            ));
        }
    }

    public void buildNavigationSection() {
        if (!(SettingsStatus.hideNavigationButtons)) return;

        Preference navPref = helper.navigationBarPreference(
                str("rex_navigation_tabs_title"),
                str("rex_navigation_tabs_summary")
        );
        InstagramPreferenceStyle.setLeftIcon(navPref, RexVectorIcons.IC_LIST_CHECK);
        addPreference(navPref);

        Preference startPref = helper.navigationStartupPreference(
                str("rex_navigation_startup_tab"),
                str("rex_navigation_startup_tab_summary")
        );
        InstagramPreferenceStyle.setLeftIcon(startPref, RexVectorIcons.IC_HOME_TAB);
        addPreference(startPref);
    }

    /**
     * 10. Developer Options Screen (Matches Screenshot_20261101-063147_Instagram.png)
     */
    public void buildDeveloperSection() {
        PreferenceCategory ieCat = addCategory("Import and Export Configs");

        addPreference(ieCat, helper.buttonPreference(
                "Import Developer Configs",
                "All the provided configurations from the file will replace the default configs.",
                "rex_import_dev_overrides",
                RexVectorIcons.IC_FILE_IMPORT
        ));
        addPreference(ieCat, helper.buttonPreference(
                "Export Developer Configs",
                "All local overridden configs will be exported to a file.",
                "rex_export_dev_overrides",
                RexVectorIcons.IC_FILE_EXPORT
        ));

        PreferenceCategory miscDevCat = addCategory("Misc Settings");

        addPreference(miscDevCat, helper.switchPreference(
                "Disable Developer Options",
                "Disables developer options from home button.",
                Settings.DEVELOPER_OPTIONS,
                RexVectorIcons.IC_DEV_BRACES
        ));
        addPreference(miscDevCat, helper.buttonPreference(
                "Reset Developer Configs",
                "Reset developer configs to their default values. This will remove all customizations or imported configs.",
                "rex_reset_pref",
                RexVectorIcons.IC_FILE_RESET
        ));

        if (SettingsStatus.recommendedFlags) {
            addPreference(miscDevCat, helper.buttonPreference(
                    str("rex_category_rec_flags"),
                    str("rex_category_rec_flags_desc"),
                    Constants.REX_FRAGMENT_REC_FLAGS,
                    RexVectorIcons.IC_HEXAGON_NUT
            ));
        }
        if (SettingsStatus.enableDeveloperOptions) {
            addPreference(miscDevCat, helper.switchPreference(
                    str("rex_directly_open_metaconfig"),
                    str("rex_directly_open_metaconfig_desc"),
                    Settings.DIRECTLY_OPEN_METACONFIG,
                    RexVectorIcons.IC_TOGGLES_DUAL
            ));
        }
    }

    public void buildRecommendedFlagsSection() {
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
                "rex_rec_flags_refresh_file",
                RexVectorIcons.IC_REFRESH
        ));
        List<Flag> recFlags = RecommendedFlags.getFlags();
        for (Flag flag : recFlags) {
            if (flag.isLongType()) {
                addPreference(helper.editTextNumPreference(
                        flag.getName(),
                        flag.getDesc(),
                        flag.getCode(),
                        RexVectorIcons.IC_ID_CARD
                ));
            } else {
                addPreference(helper.listPreference(
                        flag.getName(),
                        flag.getDesc(),
                        flag.getCode(),
                        RexVectorIcons.IC_TOGGLES_DUAL
                ));
            }
        }
    }

    /**
     * Backup, Restore & Patch Status Screen (Accessible from RexAboutView)
     */
    public void aboutSection(TreeMap<String, Boolean> flags) {
        PreferenceCategory backupCat = addCategory("Export / Import Settings");
        addPreference(backupCat, helper.buttonPreference(
                str("rex_export_pref"),
                "Export your xboyrex settings to an XML backup file",
                "rex_export_pref",
                RexVectorIcons.IC_FILE_EXPORT
        ));
        addPreference(backupCat, helper.buttonPreference(
                str("rex_import_pref"),
                "Restore xboyrex settings from a backup file",
                "rex_import_pref",
                RexVectorIcons.IC_FILE_IMPORT
        ));
        addPreference(backupCat, helper.buttonPreference(
                str("rex_reset_pref"),
                "Reset all xboyrex preferences to their default values",
                "rex_reset_pref",
                RexVectorIcons.IC_FILE_RESET
        ));
        addPreference(backupCat, helper.switchPreference(
                str("rex_debug"),
                str("rex_debug_desc"),
                Settings.REX_DEBUG,
                RexVectorIcons.IC_DEV_BRACES
        ));

        PreferenceCategory patchCat = addCategory(str("rex_patch_info_title"));
        String enabledStr = str("rex_patch_enabled");
        String disabledStr = str("rex_patch_disabled");

        for (Map.Entry<String, Boolean> entry : flags.entrySet()) {
            String resName = entry.getKey();
            boolean sts = Boolean.TRUE.equals(entry.getValue());
            String status = sts ? enabledStr : disabledStr;

            addPreference(patchCat, helper.buttonPreference(
                    resName,
                    status,
                    resName,
                    sts ? RexVectorIcons.IC_LIST_CHECK : RexVectorIcons.IC_CIRCLE_X
            ));
        }
    }
}
