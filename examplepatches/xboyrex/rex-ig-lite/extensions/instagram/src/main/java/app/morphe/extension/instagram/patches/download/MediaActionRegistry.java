/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.patches.download;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.instagram.patches.download.MediaContextResolver.MediaCapabilities;
import app.morphe.extension.instagram.patches.download.MediaContextResolver.SurfaceType;

/**
 * Capability-gated media action registry for InstaRex (Rex IG Lite).
 * Groups media actions into Download, Copy & Caption, Tools, Repost & Share, and Quick Settings,
 * adapting labels and visibility dynamically to Single Image, Video, Reel, Story, and Multi-Item Carousels.
 */
public final class MediaActionRegistry {

    public enum ActionGroup {
        DOWNLOAD("DOWNLOAD"),
        COPY_AND_CAPTION("COPY & CAPTION"),
        TOOLS("TOOLS"),
        SHARE("REPOST & SHARE"),
        QUICK_SETTINGS("QUICK SETTINGS");

        public final String headerTitle;

        ActionGroup(String headerTitle) {
            this.headerTitle = headerTitle;
        }
    }

    public enum ActionId {
        DOWNLOAD_CURRENT,
        DOWNLOAD_ALL_CAROUSEL,
        DOWNLOAD_FIRST_10,
        SELECT_SLIDES,
        IMAGE_VARIANTS,
        VIDEO_VARIANTS,
        DOWNLOAD_AUDIO,
        DOWNLOAD_COVER,
        COPY_CLEAN_LINK,
        COPY_AUTHOR_USERNAME,
        CAPTION_STUDIO,
        COPY_CAPTION,
        SAVE_CAPTION,
        TRANSLATE_CAPTION,
        COPY_HASHTAGS,
        OCR_COVER_TEXT,
        VIEW_STORY_MENTIONS,
        STORY_MEDIA_INFO,
        OPEN_EXTERNAL_APP,
        REPOST_IG_POST,
        REPOST_IG_STORY,
        REPOST_WHATSAPP_STORY,
        REPOST_ALL_IG_POST,
        REPOST_ALL_IG_STORY,
        REPOST_ALL_WHATSAPP_STORY,
        SURFACE_QUICK_SETTINGS
    }

    public static final class ActionSpec {
        public final ActionId id;
        public final ActionGroup group;
        public final String iconId;
        public final String label;

        public ActionSpec(ActionId id, ActionGroup group, String iconId, String label) {
            this.id = id;
            this.group = group;
            this.iconId = iconId;
            this.label = label;
        }
    }

    private MediaActionRegistry() {
    }

    /**
     * Builds the capability-filtered action list for the given {@link MediaCapabilities}.
     *
     * @param caps                Resolved media capabilities for the current surface and slide.
     * @param compactDownloadOnly If true, returns the compact Download & Quick Media action set
     *                            used by the Download button sheet; if false, returns the full
     *                            5-group Post/Reel/Carousel/Story Options + Quick Settings action set.
     */
    public static List<ActionSpec> buildActions(MediaCapabilities caps, boolean compactDownloadOnly) {
        if (caps == null) return Collections.emptyList();
        List<ActionSpec> actions = new ArrayList<>();

        // ---------------------------------------------------------------------
        // Group 1 — Download (Surface-Specific & Capability-Gated)
        // ---------------------------------------------------------------------
        if (caps.isStory) {
            String currentStoryLabel = caps.totalCount > 1
                    ? "Download Current Story (" + caps.displayIndex + "/" + caps.totalCount + ")"
                    : (caps.currentItemIsVideo ? "Download Story Video" : "Download Story Photo");
            actions.add(new ActionSpec(ActionId.DOWNLOAD_CURRENT, ActionGroup.DOWNLOAD, "download", currentStoryLabel));

            if (caps.hasCoverImage || caps.currentItemIsVideo) {
                actions.add(new ActionSpec(
                        ActionId.DOWNLOAD_COVER,
                        ActionGroup.DOWNLOAD,
                        "image",
                        "Download Cover Photo"
                ));
            }
            if (caps.totalCount > 1) {
                actions.add(new ActionSpec(
                        ActionId.DOWNLOAD_ALL_CAROUSEL,
                        ActionGroup.DOWNLOAD,
                        "download-cloud",
                        "Download all " + caps.totalCount + " Stories"
                ));
                if (caps.totalCount > 10) {
                    actions.add(new ActionSpec(
                            ActionId.DOWNLOAD_FIRST_10,
                            ActionGroup.DOWNLOAD,
                            "layers-subtract",
                            "Download First 10 Stories"
                    ));
                }
                actions.add(new ActionSpec(
                        ActionId.SELECT_SLIDES,
                        ActionGroup.DOWNLOAD,
                        "list-checks",
                        "Select Stories to Download (" + caps.totalCount + ")"
                ));
            }
        } else if (caps.isCarousel && caps.totalCount > 1) {
            String slideType = caps.currentItemIsVideo ? "Video" : "Photo";
            actions.add(new ActionSpec(
                    ActionId.DOWNLOAD_CURRENT,
                    ActionGroup.DOWNLOAD,
                    "download",
                    "Download Current Post (Slide " + caps.displayIndex + " of " + caps.totalCount + " • " + slideType + ")"
            ));
            if (caps.hasCoverImage || caps.currentItemIsVideo) {
                actions.add(new ActionSpec(
                        ActionId.DOWNLOAD_COVER,
                        ActionGroup.DOWNLOAD,
                        "image",
                        "Download Cover Photo"
                ));
            }
            actions.add(new ActionSpec(
                    ActionId.DOWNLOAD_ALL_CAROUSEL,
                    ActionGroup.DOWNLOAD,
                    "download-cloud",
                    "Download all " + caps.totalCount + " Posts"
            ));
            if (caps.totalCount > 10) {
                actions.add(new ActionSpec(
                        ActionId.DOWNLOAD_FIRST_10,
                        ActionGroup.DOWNLOAD,
                        "layers-subtract",
                        "Download First 10 Posts"
                ));
            }
            actions.add(new ActionSpec(
                    ActionId.SELECT_SLIDES,
                    ActionGroup.DOWNLOAD,
                    "list-checks",
                    "Select Items to Download (" + caps.totalCount + ")"
            ));
        } else if (caps.surfaceType == SurfaceType.REEL || caps.currentItemIsVideo) {
            actions.add(new ActionSpec(
                    ActionId.DOWNLOAD_CURRENT,
                    ActionGroup.DOWNLOAD,
                    "download",
                    caps.surfaceType == SurfaceType.REEL ? "Download Reel Video" : "Download Video"
            ));
            if (caps.hasCoverImage) {
                actions.add(new ActionSpec(
                        ActionId.DOWNLOAD_COVER,
                        ActionGroup.DOWNLOAD,
                        "image",
                        "Download Cover Photo"
                ));
            }
        } else {
            actions.add(new ActionSpec(
                    ActionId.DOWNLOAD_CURRENT,
                    ActionGroup.DOWNLOAD,
                    "download",
                    "Download"
            ));
            if (caps.hasCoverImage) {
                actions.add(new ActionSpec(
                        ActionId.DOWNLOAD_COVER,
                        ActionGroup.DOWNLOAD,
                        "image",
                        "Download Cover Photo"
                ));
            }
        }

        // Variants & Audio
        if (caps.currentItemIsVideo) {
            actions.add(new ActionSpec(
                    ActionId.VIDEO_VARIANTS,
                    ActionGroup.DOWNLOAD,
                    "film",
                    caps.isCarousel ? "Current Slide Video Variants" : "Video Quality / Variants"
            ));
            if (caps.hasImageVariants) {
                actions.add(new ActionSpec(
                        ActionId.IMAGE_VARIANTS,
                        ActionGroup.DOWNLOAD,
                        "badge-hd",
                        "Cover Image Variants"
                ));
            }
        } else if (caps.hasImageVariants) {
            actions.add(new ActionSpec(
                    ActionId.IMAGE_VARIANTS,
                    ActionGroup.DOWNLOAD,
                    "badge-hd",
                    caps.isCarousel ? "Current Slide Image Variants" : "Image Quality / Variants"
            ));
        }

        // Only expose MP3 audio download when an audio stream or music track actually exists
        if (caps.hasAudioTrack) {
            actions.add(new ActionSpec(
                    ActionId.DOWNLOAD_AUDIO,
                    ActionGroup.DOWNLOAD,
                    "music",
                    "Download Audio (.mp3)"
            ));
        }

        if (compactDownloadOnly) {
            actions.add(new ActionSpec(
                    ActionId.COPY_CLEAN_LINK,
                    ActionGroup.COPY_AND_CAPTION,
                    "link",
                    "Copy Clean Post Link"
            ));
            actions.add(new ActionSpec(
                    ActionId.OPEN_EXTERNAL_APP,
                    ActionGroup.TOOLS,
                    "external-link",
                    "Open by Phone Apps"
            ));
            return actions;
        }

        // ---------------------------------------------------------------------
        // Group 2 — Copy & Caption (Skipped on Story when caption is absent)
        // ---------------------------------------------------------------------
        if (!caps.isStory || (caps.rawCaption != null && !caps.rawCaption.isEmpty())) {
            actions.add(new ActionSpec(
                    ActionId.COPY_CLEAN_LINK,
                    ActionGroup.COPY_AND_CAPTION,
                    "link",
                    "Copy Clean Post Link"
            ));
            actions.add(new ActionSpec(
                    ActionId.COPY_AUTHOR_USERNAME,
                    ActionGroup.COPY_AND_CAPTION,
                    "at-sign",
                    "Copy Author Username (@" + caps.username + ")"
            ));
            actions.add(new ActionSpec(
                    ActionId.CAPTION_STUDIO,
                    ActionGroup.COPY_AND_CAPTION,
                    "edit",
                    "View, Edit & Copy Caption"
            ));
            actions.add(new ActionSpec(
                    ActionId.COPY_CAPTION,
                    ActionGroup.COPY_AND_CAPTION,
                    "copy",
                    "Copy Caption"
            ));
            actions.add(new ActionSpec(
                    ActionId.SAVE_CAPTION,
                    ActionGroup.COPY_AND_CAPTION,
                    "bookmark",
                    "Save Caption"
            ));
            actions.add(new ActionSpec(
                    ActionId.TRANSLATE_CAPTION,
                    ActionGroup.COPY_AND_CAPTION,
                    "language",
                    "Translate Caption"
            ));
            if (caps.hasHashtags) {
                actions.add(new ActionSpec(
                        ActionId.COPY_HASHTAGS,
                        ActionGroup.COPY_AND_CAPTION,
                        "hash",
                        "Copy Hashtags"
                ));
            }
        } else {
            actions.add(new ActionSpec(
                    ActionId.COPY_CLEAN_LINK,
                    ActionGroup.COPY_AND_CAPTION,
                    "link",
                    "Copy Story Link"
            ));
            actions.add(new ActionSpec(
                    ActionId.COPY_AUTHOR_USERNAME,
                    ActionGroup.COPY_AND_CAPTION,
                    "at-sign",
                    "Copy Author Username (@" + caps.username + ")"
            ));
        }

        // ---------------------------------------------------------------------
        // Group 3 — Tools (OCR, External Apps & Story Intelligence)
        // ---------------------------------------------------------------------
        String ocrLabel = caps.currentItemIsVideo
                ? "Cover Image to Text (OCR)"
                : "Image to Text (OCR)";
        actions.add(new ActionSpec(
                ActionId.OCR_COVER_TEXT,
                ActionGroup.TOOLS,
                "text-scan-2",
                ocrLabel
        ));
        if (caps.isStory) {
            actions.add(new ActionSpec(
                    ActionId.VIEW_STORY_MENTIONS,
                    ActionGroup.TOOLS,
                    "at-sign",
                    "View Hidden Mentions"
            ));
            actions.add(new ActionSpec(
                    ActionId.STORY_MEDIA_INFO,
                    ActionGroup.TOOLS,
                    "info",
                    "Story Media Information"
            ));
        }
        actions.add(new ActionSpec(
                ActionId.OPEN_EXTERNAL_APP,
                ActionGroup.TOOLS,
                "external-link",
                "Open by Phone Apps"
        ));

        // ---------------------------------------------------------------------
        // Group 4 — Repost & Share (Single vs Dynamic Carousel All-N Actions)
        // ---------------------------------------------------------------------
        if (caps.isCarousel && caps.totalCount > 1) {
            actions.add(new ActionSpec(
                    ActionId.REPOST_IG_POST,
                    ActionGroup.SHARE,
                    "layout-grid",
                    "Repost Current Post as IG Post"
            ));
            actions.add(new ActionSpec(
                    ActionId.REPOST_IG_STORY,
                    ActionGroup.SHARE,
                    "circle-dashed",
                    "Repost Current Post as IG Story"
            ));
            actions.add(new ActionSpec(
                    ActionId.REPOST_WHATSAPP_STORY,
                    ActionGroup.SHARE,
                    "whatsapp",
                    "Repost Current Post as WA Story"
            ));
            actions.add(new ActionSpec(
                    ActionId.REPOST_ALL_IG_POST,
                    ActionGroup.SHARE,
                    "layers-subtract",
                    "Repost all " + caps.totalCount + " as Posts"
            ));
            actions.add(new ActionSpec(
                    ActionId.REPOST_ALL_IG_STORY,
                    ActionGroup.SHARE,
                    "circle-dashed",
                    "Repost all " + caps.totalCount + " as Stories"
            ));
            actions.add(new ActionSpec(
                    ActionId.REPOST_ALL_WHATSAPP_STORY,
                    ActionGroup.SHARE,
                    "whatsapp",
                    "Repost all " + caps.totalCount + " as WA Stories"
            ));
        } else {
            actions.add(new ActionSpec(
                    ActionId.REPOST_IG_POST,
                    ActionGroup.SHARE,
                    "layout-grid",
                    "Repost as IG Post"
            ));
            actions.add(new ActionSpec(
                    ActionId.REPOST_IG_STORY,
                    ActionGroup.SHARE,
                    "circle-dashed",
                    "Repost as IG Story"
            ));
            actions.add(new ActionSpec(
                    ActionId.REPOST_WHATSAPP_STORY,
                    ActionGroup.SHARE,
                    "whatsapp",
                    "Repost as WhatsApp Story"
            ));
        }

        // ---------------------------------------------------------------------
        // Group 5 — In-Place Surface Quick Settings
        // ---------------------------------------------------------------------
        String quickSettingsLabel;
        if (caps.isStory) {
            quickSettingsLabel = "Story Quick Settings (Ghost, Auto-Play, Sound, Mentions)";
        } else if (caps.surfaceType == SurfaceType.REEL) {
            quickSettingsLabel = "Reels Quick Settings (Loop, Auto-Scroll, Sound, Icons)";
        } else if (caps.isCarousel && caps.totalCount > 1) {
            quickSettingsLabel = "Carousel & Feed Quick Settings (Autoplay, Mute, Quality, Icons)";
        } else {
            quickSettingsLabel = "Feed Quick Settings (Autoplay, Mute, Quality, Icons)";
        }
        actions.add(new ActionSpec(
                ActionId.SURFACE_QUICK_SETTINGS,
                ActionGroup.QUICK_SETTINGS,
                "sliders-horizontal",
                quickSettingsLabel
        ));

        return actions;
    }
}
