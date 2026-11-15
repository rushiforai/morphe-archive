/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
*/

package app.morphe.extension.instagram.settings;

import java.util.TreeMap;
import static app.morphe.extension.instagram.utils.IgStr.str;

public class SettingsStatus {
    public static TreeMap<String,Boolean> FLAGS = new TreeMap();

    public static boolean theme = true;
    public static void theme() { theme = true; }
    public static boolean addSettings = true;
    public static void addSettings() { addSettings = true; }

    //Ads section.
    public static boolean disableAds = true;
    public static void disableAds() {
        disableAds = true;
    }

    public static boolean hideSuggestedContent = true;
    public static void hideSuggestedContent() {
        hideSuggestedContent = true;
    }
    public static boolean adsSection() {
        return (disableAds || hideSuggestedContent);
    }

    //Filter content
    public static boolean storyFilters = true;
    public static void storyFilters(){storyFilters = true;}
    public static boolean filterContentSection(){return storyFilters; }
    
    //Ghost section.
    public static boolean viewStoriesAnonymously = true;
    public static void viewStoriesAnonymously() {
        viewStoriesAnonymously = true;
    }
    public static boolean viewLiveAnonymously = true;
    public static void viewLiveAnonymously() {
        viewLiveAnonymously = true;
    }
    public static boolean disableScreenshotDetection = true;
    public static void disableScreenshotDetection() {
        disableScreenshotDetection = true;
    }
    public static boolean disableTypingStatus = true;
    public static void disableTypingStatus() {
        disableTypingStatus = true;
    }
    public static boolean viewDmAnonymously = true;
    public static void viewDmAnonymously() {
        viewDmAnonymously = true;
    }
    public static boolean markAsReadAfterReply = true;
    public static void markAsReadAfterReply() {
        markAsReadAfterReply = true;
    }
    public static boolean saveDeletedMessages = true;
    public static void saveDeletedMessages() {
        saveDeletedMessages = true;
    }
    public static boolean ghostSection() {
        return (viewStoriesAnonymously || viewLiveAnonymously || disableScreenshotDetection || disableTypingStatus || viewDmAnonymously || markAsReadAfterReply);
    }

    //DM section
    public static boolean disableDisappearingMessagesGesture = true;
    public static void disableDisappearingMessagesGesture() { disableDisappearingMessagesGesture = true; }
    public static boolean unlimitedReplaysOnEphemeralMedia = true;
    public static void unlimitedReplaysOnEphemeralMedia() {unlimitedReplaysOnEphemeralMedia = true;}
    public static boolean markChatAsRead = true;
    public static void markChatAsRead() { markChatAsRead = true; }
    public static boolean inboxLock = true;
    public static void inboxLock() { inboxLock = true; }
    public static boolean hiddenChats = true;
    public static void hiddenChats() { hiddenChats = true; }
    public static boolean dmSection(){ return markChatAsRead || unlimitedReplaysOnEphemeralMedia || saveDeletedMessages || inboxLock || hiddenChats || disableDisappearingMessagesGesture ;}

    //Story section
    public static boolean customiseStoryTimestamp = true;
    public static void customiseStoryTimestamp() {
        customiseStoryTimestamp = true;
    }
    public static boolean viewStoryMentions = true;
    public static void viewStoryMentions() {
        viewStoryMentions = true;
    }
    public static boolean disableStoryFlipping = true;
    public static void disableStoryFlipping() {
        disableStoryFlipping = true;
    }
    public static boolean loopStory = true;
    public static void loopStory() {
        loopStory = true;
    }
    public static boolean customiseStoryRingSize = true;
    public static void customiseStoryRingSize() { customiseStoryRingSize = true; }
    public static boolean hideStoryFollowButton = true;
    public static void hideStoryFollowButton() {
        hideStoryFollowButton = true;
    }
    public static boolean storySection() {
        return (customiseStoryTimestamp || viewStoryMentions || disableStoryFlipping || loopStory || customiseStoryRingSize || hideStoryFollowButton);
    }

    //Links section.
    public static boolean openLinksExternally = true;
    public static void openLinksExternally() {
        openLinksExternally = true;
    }
    public static boolean sanitizeShareLinks = true;
    public static void sanitizeShareLinks() {sanitizeShareLinks = true;}
    public static boolean customSharingDomain = true;
    public static void customSharingDomain() {customSharingDomain = true;}
    public static boolean linksSection() {
        return (openLinksExternally || sanitizeShareLinks || customSharingDomain);
    }

    //Distraction-Free section.
    public static boolean disableStories = true;
    public static void disableStories() {
        disableStories = true;
    }
    public static boolean disableHighlights = true;
    public static void disableHighlights() {
        disableHighlights = true;
    }
    public static boolean disableExplore = true;
    public static void disableExplore() {
        disableExplore = true;
    }
    public static boolean disableComments = true;
    public static void disableComments() {
        disableComments = true;
    }
    public static boolean hideStoriesTray = true;
    public static void hideStoriesTray() {
        hideStoriesTray = true;
    }
    public static boolean hideHiddenRequests = true;
    public static void hideHiddenRequests() {
        hideHiddenRequests = true;
    }
    public static boolean hideNotesTray = true;
    public static void hideNotesTray() {
        hideNotesTray = true;
    }
    public static boolean limitFollowingFeed = true;
    public static void limitFollowingFeed() {
        limitFollowingFeed = true;
    }
    public static boolean hideFeedPosts = true;
    public static void hideFeedPosts() {
        hideFeedPosts = true;
    }
    public static boolean hideGroupCreationOnSharesheet = true;
    public static void hideGroupCreationOnSharesheet() {
        hideGroupCreationOnSharesheet = true;
    }
    public static boolean disableReelsScrolling = true;
    public static void disableReelsScrolling() {
        disableReelsScrolling = true;
    }
    public static boolean disableSwipeToCreate = true;
    public static void disableSwipeToCreate() {
        disableSwipeToCreate = true;
    }
    public static boolean focusLock = true;
    public static void focusLock() {
        focusLock = true;
    }
    public static boolean disableVideoAutoplay = true;
    public static void disableVideoAutoplay() { disableVideoAutoplay = true;    
    }
    public static boolean disableDoubleTapLike = true;
    public static void disableDoubleTapLike() {
        disableDoubleTapLike = true;
    }
    public static boolean hideReelsFollowButton = true;
    public static void hideReelsFollowButton() {
        hideReelsFollowButton = true;
    }
    public static boolean disableDiscoverPeople = true;
    public static void disableDiscoverPeople() {
        disableDiscoverPeople = true;
    }
    public static boolean hideLikes = true;
    public static void hideLikes() {
        hideLikes = true;
    }
    public static boolean hideShareButton = true;
    public static void hideShareButton() {
        hideShareButton = true;
    }
    public static boolean hideSaveButtons = true;
    public static void hideSaveButtons() {
        hideSaveButtons = true;
    }
    public static boolean hideReshareButton = true;
    public static void hideReshareButton() {
        hideReshareButton = true;
    }
    public static boolean distractionFreeSection() {
        return (hideReelsFollowButton || disableDoubleTapLike || hideHiddenRequests || hideNotesTray || disableHighlights || disableStories || disableExplore || disableComments || hideStoriesTray || limitFollowingFeed || hideFeedPosts || disableVideoAutoplay || disableDiscoverPeople || hideGroupCreationOnSharesheet || hideReshareButton || hideSaveButtons || hideLikes || hideShareButton || disableReelsScrolling || disableSwipeToCreate || focusLock);
    }

    //Misc section.
    public static boolean changeLikeAnimation = true;
    public static void changeLikeAnimation() { changeLikeAnimation = true; }
    public static boolean followBackIndicator = true;
    public static void followBackIndicator() { followBackIndicator = true; }
    public static boolean followListNonFollowerBadge = true;
    public static void followListNonFollowerBadge() { followListNonFollowerBadge = true; }
    public static boolean resumeReelsAfterScrolling = true;
    public static void resumeReelsAfterScrolling() { resumeReelsAfterScrolling = true; }
    public static boolean improveImageViewing = true;
    public static void improveImageViewing() {
        improveImageViewing = true;
    }
    public static boolean copyCommentButton = true;
    public static void copyCommentButton() {
        copyCommentButton = true;
    }
    public static boolean removeEmptyBottomSpace = true;
    public static void removeEmptyBottomSpace() {
        removeEmptyBottomSpace = true;
    }
    public static boolean moreOptionsOnPost = true;
    public static void moreOptionsOnPost() { moreOptionsOnPost = true; }
    public static boolean moreOptionsOnProfile = true;
    public static void moreOptionsOnProfile() { moreOptionsOnProfile = true; }
    public static boolean miscSection() {return ( moreOptionsOnProfile || moreOptionsOnPost || changeLikeAnimation || removeEmptyBottomSpace || copyCommentButton || improveImageViewing || resumeReelsAfterScrolling || followBackIndicator || followListNonFollowerBadge || customFont);}

    //Font section.
    public static boolean customFont = true;
    public static void customFont() { customFont = true; }
    public static boolean fontSection(){ return customFont; }
    
    //Download section.
    public static boolean downloadMedia = true;
    public static void downloadMedia() {downloadMedia = true;}
     public static boolean saveMediaCommentButton = true;
    public static void saveMediaCommentButton() {
        saveMediaCommentButton = true;
    }
    public static boolean feedDownloadButton = true;
    public static void feedDownloadButton() {feedDownloadButton = true;}
    public static boolean reelDownloadButton = true;
    public static void reelDownloadButton() {reelDownloadButton = true;}
    public static boolean storyDownloadButton = true;
    public static void storyDownloadButton() {storyDownloadButton = true;}
    public static boolean downloadVoiceMessage = true;
    public static void downloadVoiceMessage() { downloadVoiceMessage = true; }
    public static boolean downloadWithExternalDownloader = true;
    public static void downloadWithExternalDownloader() { downloadWithExternalDownloader = true; }
    public static boolean downloadSection(){return (SettingsStatus.downloadMedia || saveMediaCommentButton || SettingsStatus.downloadWithExternalDownloader);}

    //Instants Section
    public static boolean instantsDownload = true;
    public static void instantsDownload() {
        instantsDownload = true;
    }
    
    //Navigation Section
    public static boolean hideNavigationButtons = true;
    public static void hideNavigationButtons() { hideNavigationButtons = true; }

    // Developer section.
    public static boolean enableDeveloperOptions = true;
    public static void enableDeveloperOptions() {
        enableDeveloperOptions = true;
    }
    public static boolean recommendedFlags = true;
    public static void recommendedFlags() {recommendedFlags = true;}
    public static boolean developerOptionsSection() {
        return (enableDeveloperOptions || recommendedFlags);
    }



        public static void loadStatusMap(){
        FLAGS.put(str("rex_patch_theme"), SettingsStatus.theme);
        FLAGS.put(str("rex_patch_settings"), SettingsStatus.addSettings);
        FLAGS.put(str("rex_disable_reels_scrolling"), SettingsStatus.disableReelsScrolling);
        FLAGS.put(str("rex_disable_ads"),SettingsStatus.disableAds);
        FLAGS.put(str("rex_hide_suggested_content"),SettingsStatus.hideSuggestedContent);

        FLAGS.put(str("rex_category_hide_navigation_buttons"),SettingsStatus.hideNavigationButtons);

        FLAGS.put(str("rex_category_downloads"),SettingsStatus.downloadMedia);
        FLAGS.put(str("rex_download_voice_media"),SettingsStatus.downloadVoiceMessage);
        FLAGS.put(str("rex_download_with_external_downloader"),SettingsStatus.downloadWithExternalDownloader);
        FLAGS.put(str("rex_more_profile_options"),SettingsStatus.moreOptionsOnProfile);
        FLAGS.put(str("rex_enable_more_options_on_post"),SettingsStatus.moreOptionsOnPost);
        FLAGS.put(str("rex_disable_video_autoplay"),SettingsStatus.disableVideoAutoplay);
        FLAGS.put(str("rex_remove_empty_bottom_space"),SettingsStatus.removeEmptyBottomSpace);
        FLAGS.put(str("rex_save_media_comment"),SettingsStatus.saveMediaCommentButton);
        FLAGS.put(str("rex_copy_comment"),SettingsStatus.copyCommentButton);
        FLAGS.put(str("rex_hide_reshare_button"),SettingsStatus.hideReshareButton);
        FLAGS.put(str("rex_hide_save_buttons"), SettingsStatus.hideSaveButtons);
        FLAGS.put(str("rex_hide_likes"), SettingsStatus.hideLikes);
        FLAGS.put(str("rex_hide_share_button"), SettingsStatus.hideShareButton);
        FLAGS.put(str("rex_improve_image_viewing"),SettingsStatus.improveImageViewing);
        FLAGS.put(str("rex_resume_reels_after_scrolling"), SettingsStatus.resumeReelsAfterScrolling);
        FLAGS.put(str("rex_unlimited_replays"),SettingsStatus.unlimitedReplaysOnEphemeralMedia);
        FLAGS.put(str("rex_disable_disappearing_messages_gesture"), SettingsStatus.disableDisappearingMessagesGesture);

        FLAGS.put(str("rex_customise_story_timestamp"),SettingsStatus.customiseStoryTimestamp);
        FLAGS.put(str("rex_disable_story_flipping"),SettingsStatus.disableStoryFlipping);
        FLAGS.put(str("rex_loop_story"),SettingsStatus.loopStory);
        FLAGS.put(str("rex_hide_story_follow_button"),SettingsStatus.hideStoryFollowButton);
        FLAGS.put(str("rex_view_story_mentions"),SettingsStatus.viewStoryMentions);
        FLAGS.put(str("rex_follow_back_indicator"),SettingsStatus.followBackIndicator);
        FLAGS.put(str("rex_disable_discover_people"),SettingsStatus.disableDiscoverPeople);
        FLAGS.put(str("rex_customise_story_ring_size"),SettingsStatus.customiseStoryRingSize);

        FLAGS.put(str("rex_change_like_animation"),SettingsStatus.changeLikeAnimation);
        FLAGS.put(str("rex_inbox_lock"),SettingsStatus.inboxLock);
        FLAGS.put(str("rex_hidden_chats"),SettingsStatus.hiddenChats);

        FLAGS.put(str("rex_disable_double_tap_to_like"),SettingsStatus.disableDoubleTapLike);
        FLAGS.put(str("rex_hide_group_creation_button_on_sharesheet"),SettingsStatus.hideGroupCreationOnSharesheet);
        FLAGS.put(str("rex_hide_reels_follow_button"),SettingsStatus.hideReelsFollowButton);
        FLAGS.put(str("rex_limit_following_feed"),SettingsStatus.limitFollowingFeed);
        FLAGS.put(str("rex_hide_feed_posts"),SettingsStatus.hideFeedPosts);
        FLAGS.put(str("rex_hide_notes_tray"),SettingsStatus.hideNotesTray);
        FLAGS.put(str("rex_hide_stories_tray"),SettingsStatus.hideStoriesTray);
        FLAGS.put(str("rex_hide_hidden_requests"),SettingsStatus.hideHiddenRequests);
        FLAGS.put(str("rex_disable_comments"),SettingsStatus.disableComments);
        FLAGS.put(str("rex_disable_explore"),SettingsStatus.disableExplore);
        FLAGS.put(str("rex_disable_highlights"),SettingsStatus.disableHighlights);
        FLAGS.put(str("rex_disable_stories"),SettingsStatus.disableStories);
        FLAGS.put(str("rex_disable_swipe_to_create"), SettingsStatus.disableSwipeToCreate);
        FLAGS.put(str("rex_focus_lock"), SettingsStatus.focusLock);

        FLAGS.put(str("rex_view_dm_anonymously"),SettingsStatus.viewDmAnonymously);
        FLAGS.put(str("rex_mark_as_read_after_reply"), SettingsStatus.markAsReadAfterReply);
        FLAGS.put(str("rex_save_deleted_messages"),SettingsStatus.saveDeletedMessages);
        FLAGS.put(str("rex_disable_screenshot_detection"),SettingsStatus.disableScreenshotDetection);
        FLAGS.put(str("rex_disable_typing_status"),SettingsStatus.disableTypingStatus);
        FLAGS.put(str("rex_view_live_anonymously"),SettingsStatus.viewLiveAnonymously);
        FLAGS.put(str("rex_view_stories_anonymously"),SettingsStatus.viewStoriesAnonymously);
        FLAGS.put(str("rex_instants_title"),SettingsStatus.instantsDownload);

        FLAGS.put(str("rex_sanitize_share_links"),SettingsStatus.sanitizeShareLinks);
        FLAGS.put(str("rex_custom_sharing_domain"),SettingsStatus.customSharingDomain);
        FLAGS.put(str("rex_open_links_externally"),SettingsStatus.openLinksExternally);
        FLAGS.put(str("rex_enable_dev_options"),SettingsStatus.enableDeveloperOptions);

        FLAGS.put(str("rex_enable_mark_chat_as_read"),SettingsStatus.markChatAsRead);
        FLAGS.put(str("rex_category_filter_content"),SettingsStatus.storyFilters);
        FLAGS.put(str("rex_category_rec_flags"),SettingsStatus.recommendedFlags);
        FLAGS.put(str("rex_custom_font"),SettingsStatus.customFont);

    }

    public static void load() {
        loadStatusMap();
    }
}
