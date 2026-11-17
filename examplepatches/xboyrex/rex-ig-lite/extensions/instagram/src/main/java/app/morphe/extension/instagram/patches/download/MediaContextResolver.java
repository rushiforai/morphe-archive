/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.patches.download;

import com.instagram.common.session.UserSession;

import java.util.List;

import app.morphe.extension.instagram.constants.PostType;
import app.morphe.extension.instagram.entity.DashVideoData;
import app.morphe.extension.instagram.entity.ImageData;
import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.entity.VideoData;
import app.morphe.extension.instagram.patches.Links;

/**
 * Capability-aware media context resolver (Section 4.1 of the Master Prompt).
 * Resolves the exact surface type, carousel slide count, active index, video/image/audio
 * capabilities, and caption metadata before any download or post-options menu is built.
 */
public final class MediaContextResolver {

    public enum SurfaceType {
        SINGLE_IMAGE_POST,
        SINGLE_VIDEO_POST,
        CAROUSEL_POST,
        REEL,
        STORY_IMAGE,
        STORY_VIDEO,
        PROFILE_MEDIA
    }

    public static final class MediaCapabilities {
        public final SurfaceType surfaceType;
        public final MediaData rootMedia;
        public final MediaData currentMedia;
        public final DownloadMediaGroup group;
        public final boolean isCarousel;
        public final boolean isStory;
        public final int currentIndex;
        public final int displayIndex;
        public final int totalCount;
        public final boolean currentItemIsVideo;
        public final boolean currentItemIsImage;
        public final boolean hasAudioTrack;
        public final boolean hasCoverImage;
        public final boolean hasImageVariants;
        public final boolean hasVideoVariants;
        public final boolean hasCaption;
        public final boolean hasHashtags;
        public final boolean hasCleanLink;
        public final boolean hasAuthorUsername;
        public final String username;
        public final String rawCaption;
        public final String postLink;

        private MediaCapabilities(
                SurfaceType surfaceType,
                MediaData rootMedia,
                MediaData currentMedia,
                DownloadMediaGroup group,
                boolean isCarousel,
                boolean isStory,
                int currentIndex,
                int displayIndex,
                int totalCount,
                boolean currentItemIsVideo,
                boolean currentItemIsImage,
                boolean hasAudioTrack,
                boolean hasCoverImage,
                boolean hasImageVariants,
                boolean hasVideoVariants,
                boolean hasCaption,
                boolean hasHashtags,
                boolean hasCleanLink,
                boolean hasAuthorUsername,
                String username,
                String rawCaption,
                String postLink
        ) {
            this.surfaceType = surfaceType;
            this.rootMedia = rootMedia;
            this.currentMedia = currentMedia;
            this.group = group;
            this.isCarousel = isCarousel;
            this.isStory = isStory;
            this.currentIndex = currentIndex;
            this.displayIndex = displayIndex;
            this.totalCount = totalCount;
            this.currentItemIsVideo = currentItemIsVideo;
            this.currentItemIsImage = currentItemIsImage;
            this.hasAudioTrack = hasAudioTrack;
            this.hasCoverImage = hasCoverImage;
            this.hasImageVariants = hasImageVariants;
            this.hasVideoVariants = hasVideoVariants;
            this.hasCaption = hasCaption;
            this.hasHashtags = hasHashtags;
            this.hasCleanLink = hasCleanLink;
            this.hasAuthorUsername = hasAuthorUsername;
            this.username = username;
            this.rawCaption = rawCaption;
            this.postLink = postLink;
        }
    }

    private MediaContextResolver() {
    }

    public static MediaCapabilities resolveForPost(
            Object mediaObject,
            UserSession userSession,
            int requestedIndex
    ) {
        MediaData root = mediaObject instanceof MediaData
                ? (MediaData) mediaObject
                : new MediaData(mediaObject, userSession);
        return resolve(root, DownloadMediaGroup.carousel(root), requestedIndex, false);
    }

    public static MediaCapabilities resolve(
            MediaData rootMedia,
            DownloadMediaGroup group,
            int requestedIndex,
            boolean forceStorySurface
    ) {
        DownloadMediaGroup effectiveGroup = group != null ? group : DownloadMediaGroup.carousel(rootMedia);
        boolean isStory = forceStorySurface || effectiveGroup.isStoryGroup();

        int resolvedTotal = 1;
        try {
            resolvedTotal = Math.max(1, effectiveGroup.size());
        } catch (Throwable ignored) {
            try {
                resolvedTotal = Math.max(1, rootMedia.getCarouselSize());
            } catch (Throwable ignored2) {
                resolvedTotal = 1;
            }
        }

        int safeIndex = Math.max(0, Math.min(requestedIndex, resolvedTotal - 1));
        int displayIndex = safeIndex + 1;

        MediaData currentMedia = rootMedia;
        try {
            MediaData candidate = effectiveGroup.itemAt(safeIndex);
            if (candidate != null) currentMedia = candidate;
        } catch (Throwable ignored) {
            try {
                MediaData candidate = rootMedia.getMediaAt(safeIndex);
                if (candidate != null) currentMedia = candidate;
            } catch (Throwable ignored2) {
            }
        }

        boolean isVideo = false;
        try {
            isVideo = currentMedia.isVideo();
        } catch (Throwable ignored) {
        }
        boolean isImage = !isVideo;

        boolean hasImageVars = false;
        try {
            List<ImageData> imgs = currentMedia.getImageVariants();
            hasImageVars = imgs != null && !imgs.isEmpty();
        } catch (Throwable ignored) {
        }

        boolean hasVideoVars = false;
        if (isVideo) {
            try {
                List<VideoData> vids = currentMedia.getVideoVariants();
                List<DashVideoData> dash = currentMedia.getDashVideos();
                hasVideoVars = (vids != null && !vids.isEmpty()) || (dash != null && !dash.isEmpty());
            } catch (Throwable ignored) {
            }
        }

        boolean hasCover = isVideo && hasImageVars;

        // Still images without attached music never expose MP3 audio download
        boolean hasAudio = false;
        try {
            if (isVideo) {
                hasAudio = currentMedia.hasAudio() || rootMedia.hasAudio();
            } else {
                hasAudio = currentMedia.getAudioMedia() != null || rootMedia.getAudioMedia() != null;
            }
        } catch (Throwable ignored) {
        }

        String username = "instagram";
        try {
            String u = effectiveGroup.username();
            if (u != null && !u.trim().isEmpty()) {
                username = u.trim();
            } else {
                UserData ud = rootMedia.getUserData();
                if (ud != null && ud.getUsername() != null && !ud.getUsername().trim().isEmpty()) {
                    username = ud.getUsername().trim();
                }
            }
        } catch (Throwable ignored) {
        }
        boolean hasAuthorUsername = !username.isEmpty() && !"instagram".equalsIgnoreCase(username);

        String caption = "";
        try {
            String desc = rootMedia.getDescriptionText();
            if (desc != null) caption = desc;
        } catch (Throwable ignored) {
        }
        boolean hasCaption = !caption.trim().isEmpty();
        boolean hasHashtags = hasCaption && caption.contains("#");

        String postLink = "";
        try {
            String generated = Links.generatePostLink(rootMedia, safeIndex);
            if (generated != null && !generated.trim().isEmpty()) {
                postLink = generated.trim();
            }
        } catch (Throwable ignored) {
        }
        if (postLink.isEmpty()) {
            try {
                String shortcode = rootMedia.getShortcode();
                if (shortcode != null && !shortcode.isEmpty() && !"A".equals(shortcode)) {
                    postLink = "https://www.instagram.com/p/" + shortcode + "/";
                }
            } catch (Throwable ignored) {
            }
        }
        if (postLink.isEmpty()) {
            try {
                String mediaUrl = currentMedia.getMediaLink();
                if (mediaUrl != null) postLink = mediaUrl;
            } catch (Throwable ignored) {
            }
        }
        boolean hasCleanLink = !postLink.isEmpty();

        boolean isCarousel = !isStory && resolvedTotal > 1;
        PostType postType = PostType.POST;
        try {
            postType = rootMedia.getPostType();
        } catch (Throwable ignored) {
        }

        SurfaceType surfaceType;
        if (isStory || postType == PostType.STORY) {
            surfaceType = isVideo ? SurfaceType.STORY_VIDEO : SurfaceType.STORY_IMAGE;
        } else if (isCarousel || postType == PostType.CAROUSEL) {
            surfaceType = SurfaceType.CAROUSEL_POST;
        } else if (postType == PostType.REEL) {
            surfaceType = SurfaceType.REEL;
        } else {
            surfaceType = isVideo ? SurfaceType.SINGLE_VIDEO_POST : SurfaceType.SINGLE_IMAGE_POST;
        }

        return new MediaCapabilities(
                surfaceType,
                rootMedia,
                currentMedia,
                effectiveGroup,
                isCarousel,
                isStory,
                safeIndex,
                displayIndex,
                resolvedTotal,
                isVideo,
                isImage,
                hasAudio,
                hasCover,
                hasImageVars,
                hasVideoVars,
                hasCaption,
                hasHashtags,
                hasCleanLink,
                hasAuthorUsername,
                username,
                caption,
                postLink
        );
    }
}
