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
 * Capability-gated media action registry (Section 4.2 of the Master Prompt).
 * Groups media actions into Download, Copy & Caption, Tools, and Share, hiding
 * unsupported actions (such as MP3 download on still images or 0-count carousels).
 */
public final class MediaActionRegistry {

    public enum ActionGroup {
        DOWNLOAD("DOWNLOAD"),
        COPY_AND_CAPTION("COPY & CAPTION"),
        TOOLS("TOOLS"),
        SHARE("SHARE");

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
        OPEN_EXTERNAL_APP,
        REPOST_IG_POST,
        REPOST_IG_STORY,
        REPOST_WHATSAPP_STORY
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
     *                            4-group Post/Reel Options action set.
     */
    public static List<ActionSpec> buildActions(MediaCapabilities caps, boolean compactDownloadOnly) {
        if (caps == null) return Collections.emptyList();
        List<ActionSpec> actions = new ArrayList<>();

        // ---------------------------------------------------------------------
        // Group 1 — Download (Surface-Specific & Capability-Gated)
        // ---------------------------------------------------------------------
        if (caps.isStory) {
            String currentStoryLabel = caps.totalCount > 1
                    ? "Download current story (" + caps.displayIndex + "/" + caps.totalCount + ")"
                    : (caps.currentItemIsVideo ? "Download story video" : "Download story photo");
            actions.add(new ActionSpec(ActionId.DOWNLOAD_CURRENT, ActionGroup.DOWNLOAD, "download", currentStoryLabel));

            if (caps.totalCount > 1) {
                actions.add(new ActionSpec(
                        ActionId.DOWNLOAD_ALL_CAROUSEL,
                        ActionGroup.DOWNLOAD,
                        "download-cloud",
                        "Download all stories (" + caps.totalCount + ")"
                ));
                if (caps.totalCount > 10) {
                    actions.add(new ActionSpec(
                            ActionId.DOWNLOAD_FIRST_10,
                            ActionGroup.DOWNLOAD,
                            "layers-subtract",
                            "Download first 10 stories"
                    ));
                }
                actions.add(new ActionSpec(
                        ActionId.SELECT_SLIDES,
                        ActionGroup.DOWNLOAD,
                        "list-checks",
                        "Select stories to download"
                ));
            }
        } else if (caps.isCarousel && caps.totalCount > 1) {
            String slideType = caps.currentItemIsVideo ? "Video" : "Photo";
            actions.add(new ActionSpec(
                    ActionId.DOWNLOAD_CURRENT,
                    ActionGroup.DOWNLOAD,
                    "download",
                    "Download current item (Slide " + caps.displayIndex + " of " + caps.totalCount + " • " + slideType + ")"
            ));
            actions.add(new ActionSpec(
                    ActionId.DOWNLOAD_ALL_CAROUSEL,
                    ActionGroup.DOWNLOAD,
                    "download-cloud",
                    "Download all (" + caps.totalCount + ")"
            ));
            if (caps.totalCount > 10) {
                actions.add(new ActionSpec(
                        ActionId.DOWNLOAD_FIRST_10,
                        ActionGroup.DOWNLOAD,
                        "layers-subtract",
                        "Download first 10"
                ));
            }
            actions.add(new ActionSpec(
                    ActionId.SELECT_SLIDES,
                    ActionGroup.DOWNLOAD,
                    "list-checks",
                    "Select slides to download"
            ));
        } else if (caps.surfaceType == SurfaceType.REEL || caps.currentItemIsVideo) {
            actions.add(new ActionSpec(
                    ActionId.DOWNLOAD_CURRENT,
                    ActionGroup.DOWNLOAD,
                    "download",
                    caps.surfaceType == SurfaceType.REEL ? "Download reel video" : "Download video"
            ));
        } else {
            actions.add(new ActionSpec(
                    ActionId.DOWNLOAD_CURRENT,
                    ActionGroup.DOWNLOAD,
                    "download",
                    "Download image"
            ));
        }

        // Variants & Cover / Audio
        if (caps.currentItemIsVideo) {
            actions.add(new ActionSpec(
                    ActionId.VIDEO_VARIANTS,
                    ActionGroup.DOWNLOAD,
                    "film",
                    caps.isCarousel ? "Current slide video variants" : "Video quality / variants"
            ));
            actions.add(new ActionSpec(
                    ActionId.DOWNLOAD_COVER,
                    ActionGroup.DOWNLOAD,
                    "image",
                    "Download cover photo"
            ));
            if (caps.hasImageVariants) {
                actions.add(new ActionSpec(
                        ActionId.IMAGE_VARIANTS,
                        ActionGroup.DOWNLOAD,
                        "badge-hd",
                        "Cover image variants"
                ));
            }
        } else {
            actions.add(new ActionSpec(
                    ActionId.IMAGE_VARIANTS,
                    ActionGroup.DOWNLOAD,
                    "badge-hd",
                    caps.isCarousel ? "Current slide image variants" : "Image quality / variants"
            ));
        }

        // Only expose MP3 audio download when an audio stream or music track actually exists
        if (caps.hasAudioTrack) {
            actions.add(new ActionSpec(
                    ActionId.DOWNLOAD_AUDIO,
                    ActionGroup.DOWNLOAD,
                    "music",
                    "Download audio (.mp3)"
            ));
        }

        if (compactDownloadOnly) {
            actions.add(new ActionSpec(
                    ActionId.COPY_CLEAN_LINK,
                    ActionGroup.COPY_AND_CAPTION,
                    "link",
                    "Copy clean media link"
            ));
            actions.add(new ActionSpec(
                    ActionId.OPEN_EXTERNAL_APP,
                    ActionGroup.TOOLS,
                    "external-link",
                    caps.currentItemIsVideo ? "Open video in external app" : "Open image in external app"
            ));
            return actions;
        }

        // ---------------------------------------------------------------------
        // Group 2 — Copy & Caption
        // ---------------------------------------------------------------------
        actions.add(new ActionSpec(
                ActionId.COPY_CLEAN_LINK,
                ActionGroup.COPY_AND_CAPTION,
                "link",
                "Copy clean link"
        ));
        actions.add(new ActionSpec(
                ActionId.COPY_AUTHOR_USERNAME,
                ActionGroup.COPY_AND_CAPTION,
                "at-sign",
                "Copy author username (@" + caps.username + ")"
        ));
        actions.add(new ActionSpec(
                ActionId.CAPTION_STUDIO,
                ActionGroup.COPY_AND_CAPTION,
                "edit",
                "View, edit & copy caption"
        ));
        actions.add(new ActionSpec(
                ActionId.COPY_CAPTION,
                ActionGroup.COPY_AND_CAPTION,
                "copy",
                "Copy caption"
        ));
        actions.add(new ActionSpec(
                ActionId.SAVE_CAPTION,
                ActionGroup.COPY_AND_CAPTION,
                "bookmark",
                "Save caption"
        ));
        actions.add(new ActionSpec(
                ActionId.TRANSLATE_CAPTION,
                ActionGroup.COPY_AND_CAPTION,
                "language",
                "Translate caption"
        ));
        if (caps.hasHashtags) {
            actions.add(new ActionSpec(
                    ActionId.COPY_HASHTAGS,
                    ActionGroup.COPY_AND_CAPTION,
                    "hash",
                    "Copy hashtags"
            ));
        }

        // ---------------------------------------------------------------------
        // Group 3 — Tools
        // ---------------------------------------------------------------------
        actions.add(new ActionSpec(
                ActionId.OCR_COVER_TEXT,
                ActionGroup.TOOLS,
                "text-scan-2",
                "Cover image to text (OCR)"
        ));
        actions.add(new ActionSpec(
                ActionId.OPEN_EXTERNAL_APP,
                ActionGroup.TOOLS,
                "external-link",
                "Open in external app"
        ));

        // ---------------------------------------------------------------------
        // Group 4 — Share
        // ---------------------------------------------------------------------
        actions.add(new ActionSpec(
                ActionId.REPOST_IG_POST,
                ActionGroup.SHARE,
                "layout-grid",
                "Repost as Instagram post"
        ));
        actions.add(new ActionSpec(
                ActionId.REPOST_IG_STORY,
                ActionGroup.SHARE,
                "circle-dashed",
                "Repost as Instagram story"
        ));
        actions.add(new ActionSpec(
                ActionId.REPOST_WHATSAPP_STORY,
                ActionGroup.SHARE,
                "whatsapp",
                "Repost to WhatsApp status"
        ));

        return actions;
    }
}
