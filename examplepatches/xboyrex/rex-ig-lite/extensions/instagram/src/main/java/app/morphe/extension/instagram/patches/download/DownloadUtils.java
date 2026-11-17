/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.app.Notification;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.media.MediaMetadataRetriever;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.LinearLayout;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.constants.UI;
import app.morphe.extension.instagram.entity.DashVideoData;
import app.morphe.extension.instagram.entity.Entity;
import app.morphe.extension.instagram.entity.ImageResolution;
import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.entity.MediaInterface;
import app.morphe.extension.instagram.entity.VideoData;
import app.morphe.extension.instagram.entity.VideoResolution;
import app.morphe.extension.instagram.entity.VideoVariant;
import app.morphe.extension.instagram.patches.Links;
import app.morphe.extension.instagram.patches.download.MediaActionRegistry.ActionId;
import app.morphe.extension.instagram.patches.download.MediaActionRegistry.ActionSpec;
import app.morphe.extension.instagram.patches.download.MediaContextResolver.MediaCapabilities;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexVectorIcons;
import app.morphe.extension.instagram.utils.MediaUrls;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.rex.downloader.DownloadMetadata;
import app.morphe.extension.rex.downloader.DownloadRequest;
import app.morphe.extension.rex.downloader.MediaDownloader;
import app.morphe.extension.rex.downloader.MediaType;
import app.morphe.extension.rex.downloader.StorageUtils;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

import com.instagram.common.session.UserSession;

public class DownloadUtils {

    private static MediaDownloader downloadAllDownloader;
    private static volatile long lastActionTimestampMs;
    private static final long ACTION_DEBOUNCE_MS = 450L;

    public static synchronized boolean isActionDebounced() {
        long now = SystemClock.elapsedRealtime();
        if (now - lastActionTimestampMs < ACTION_DEBOUNCE_MS) {
            return true;
        }
        lastActionTimestampMs = now;
        return false;
    }

    private static synchronized MediaDownloader getDownloadAllDownloader(Context context) {
        if (downloadAllDownloader == null) {
            downloadAllDownloader = new MediaDownloader(context);
        }
        return downloadAllDownloader;
    }

    public static String getSubfolderName(String username) {
        boolean SPLIT_BY_USERNAME = Pref.downloadUsernameFolder() && SettingsStatus.downloadMedia;
        return SPLIT_BY_USERNAME ? username : null;
    }

    public static void buildVariantDialogBox(
            Context context,
            MediaData mediaInfo,
            int position,
            int filenameIndex,
            MediaType mediaType,
            DialogInterface.OnDismissListener onDismiss
    ) throws Exception {
        MediaData currentMediaData = mediaInfo.getMediaAt(position);
        String username = "instagram";
        try {
            if (mediaInfo.getUserData() != null && mediaInfo.getUserData().getUsername() != null) {
                username = mediaInfo.getUserData().getUsername();
            }
        } catch (Throwable ignored) {
        }
        final String safeUsername = username;
        List<MediaInterface> variantList;
        String title;
        if (mediaType.equals(MediaType.VIDEO)) {
            title = str("rex_video_variants");
            List<VideoVariant> videos = new ArrayList<>();
            if (Pref.preferDashFormat()) videos.addAll(currentMediaData.getDashVideos());
            List<VideoData> progressive = currentMediaData.getVideoVariants();
            if (progressive != null) videos.addAll(progressive);
            variantList = new ArrayList<>(VideoResolution.group(videos));
        } else {
            title = str("rex_image_variants");
            variantList = new ArrayList<>(ImageResolution.group(currentMediaData.getImageVariants()));
        }

        if (variantList.isEmpty()) {
            Utils.showToastShort("No alternative quality variants found — downloading best quality");
            downloadMedia(context, mediaInfo, position, filenameIndex, mediaType);
            if (onDismiss != null) onDismiss.onDismiss(null);
            return;
        }

        ArrayList<String> options = new ArrayList<>();
        ArrayList<String> iconIds = new ArrayList<>();
        for (MediaInterface item : variantList) {
            String label = item.getLabel();
            if (item instanceof VideoResolution) {
                label = item.shortSide() > 0 ? label : str("rex_unknown");
            }
            options.add(label);
            iconIds.add(mediaType.equals(MediaType.VIDEO) ? "film" : "badge-hd");
        }

        RexDialogs.showSemanticMenuDialog(
                context,
                mediaType.equals(MediaType.VIDEO) ? "film" : "badge-hd",
                title,
                options,
                iconIds,
                (d, which) -> {
                    MediaInterface data = variantList.get(which);
                    try {
                        String subFolder = getSubfolderName(safeUsername);
                        String fileName = safeUsername + "_" + currentMediaData.getVariantFileName(data);
                        DownloadRequest request = buildMediaRequest(
                                mediaInfo,
                                currentMediaData,
                                position,
                                filenameIndex,
                                data.getMediaType(),
                                data.getUrl(),
                                subFolder,
                                fileName,
                                data
                        );
                        enqueueDownload(context, request);
                    } catch (Exception e) {
                        RexUtils.logger(e);
                        Logger.printException(() -> "Error at buildVariantDialogBox", e);
                        Utils.showToastShort("Couldn't start variant download. Try again.");
                    }
                },
                onDismiss
        );
    }

    private static void downloadDialogBox(
            Context context,
            MediaData mediaInfo,
            int position,
            DownloadMediaGroup group,
            DialogInterface.OnDismissListener onDismiss
    ) {
        try {
            MediaCapabilities caps = MediaContextResolver.resolve(mediaInfo, group, position, group != null && group.isStoryGroup());
            List<ActionSpec> specs = new ArrayList<>(MediaActionRegistry.buildActions(caps, true));

            ArrayList<String> options = new ArrayList<>();
            ArrayList<String> iconIds = new ArrayList<>();
            for (ActionSpec spec : specs) {
                options.add(spec.label);
                iconIds.add(spec.iconId);
            }
            if (!caps.isStory) {
                options.add("More Post & Caption Options...");
                iconIds.add("hexagon");
            }

            final int filenameIndex = caps.group.currentFilenameIndex(caps.currentIndex);
            final boolean[] childDialogShown = {false};

            String headerTitle = caps.isCarousel && caps.totalCount > 1
                    ? "Download Options (Slide " + caps.displayIndex + " of " + caps.totalCount + ")"
                    : str("rex_download_options");

            RexDialogs.showSemanticMenuDialog(
                    context,
                    "download",
                    headerTitle,
                    options,
                    iconIds,
                    (d, which) -> {
                        try {
                            if (which >= specs.size()) {
                                childDialogShown[0] = true;
                                RexDialogs.showPostOptionsSheet(
                                        context,
                                        caps.rootMedia.getUserSession(),
                                        caps.rootMedia.getObject(),
                                        caps.currentIndex
                                );
                                return;
                            }
                            ActionSpec chosen = specs.get(which);
                            executeMediaAction(
                                    context,
                                    caps,
                                    chosen.id,
                                    filenameIndex,
                                    onDismiss,
                                    childDialogShown
                            );
                        } catch (Exception e) {
                            RexUtils.logger(e);
                            Logger.printException(() -> "Error at downloadDialogBox", e);
                            Utils.showToastShort("Couldn't complete media action. Try again.");
                        }
                    },
                    d -> {
                        if (!childDialogShown[0] && onDismiss != null) onDismiss.onDismiss(d);
                    }
            );
        } catch (Exception e) {
            RexUtils.logger(e);
            Logger.printException(() -> "Error building downloadDialogBox", e);
            Utils.showToastShort("Couldn't load media options. Try again.");
            if (onDismiss != null) onDismiss.onDismiss(null);
        }
    }

    public static void executeMediaAction(
            Context context,
            MediaCapabilities caps,
            ActionId actionId,
            int filenameIndex,
            DialogInterface.OnDismissListener onDismiss,
            boolean[] childDialogShown
    ) throws Exception {
        switch (actionId) {
            case DOWNLOAD_CURRENT:
                downloadMedia(context, caps.rootMedia, caps.currentIndex, filenameIndex, MediaType.ANY);
                break;
            case DOWNLOAD_ALL_CAROUSEL:
                downloadAllMedia(context, caps.group);
                break;
            case DOWNLOAD_FIRST_10:
                downloadFirstMedia(context, caps.group, 10);
                break;
            case SELECT_SLIDES:
                DownloadSelectionSheet.show(context, caps.group, onDismiss);
                if (childDialogShown != null && childDialogShown.length > 0) childDialogShown[0] = true;
                break;
            case IMAGE_VARIANTS:
                buildVariantDialogBox(context, caps.rootMedia, caps.currentIndex, filenameIndex, MediaType.IMAGE, onDismiss);
                if (childDialogShown != null && childDialogShown.length > 0) childDialogShown[0] = true;
                break;
            case VIDEO_VARIANTS:
                buildVariantDialogBox(context, caps.rootMedia, caps.currentIndex, filenameIndex, MediaType.VIDEO, onDismiss);
                if (childDialogShown != null && childDialogShown.length > 0) childDialogShown[0] = true;
                break;
            case DOWNLOAD_AUDIO:
                downloadMedia(context, caps.rootMedia, caps.currentIndex, MediaType.AUDIO);
                break;
            case DOWNLOAD_COVER:
                downloadMedia(context, caps.rootMedia, caps.currentIndex, filenameIndex, MediaType.IMAGE);
                break;
            case COPY_CLEAN_LINK: {
                String link = caps.postLink;
                if (link == null || link.isEmpty()) {
                    link = caps.currentMedia.getMediaLink();
                }
                if (link != null && !link.isEmpty()) {
                    Utils.setClipboard(MediaUrls.forViewing(link));
                    Utils.showToastShort(str("rex_copied_media_link"));
                } else {
                    Utils.showToastShort(str("rex_media_link_unavailable"));
                }
                break;
            }
            case OPEN_EXTERNAL_APP:
                ActivityHook.handleUrlIntent(caps.currentItemIsVideo, caps.currentMedia.getMediaLink());
                break;
            default:
                break;
        }
    }

    public static void downloadPost(Context context, UserSession userSession, Object mediaObject, int position) {
        try {
            if (isActionDebounced()) return;
            position = position < 1 ? 0 : position;
            MediaData mediaInfo = new MediaData(mediaObject, userSession);
            if (directDownloadEnabled()) {
                downloadMedia(context, mediaInfo, position, MediaType.ANY);
            } else {
                downloadDialogBox(context, mediaInfo, position, DownloadMediaGroup.carousel(mediaInfo), null);
            }
        } catch (Exception e) {
            RexUtils.logger(e);
            Logger.printException(() -> "Error at downloadPost", e);
            Utils.showToastShort("Couldn't load media options. Try again.");
        }
    }

    private static boolean directDownloadEnabled() {
        return SettingsStatus.downloadMedia && Pref.enableDirectDownload();
    }

    static boolean onPostDownloadLongClick(Context context, UserSession session, Object mediaObject, int position) {
        try {
            MediaData post = new MediaData(mediaObject, session);
            downloadAllOrShowOptions(context, post, Math.max(0, position), DownloadMediaGroup.carousel(post));
        } catch (Exception e) {
            Logger.printException(() -> "Error on download button long press", e);
            Utils.showToastShort(str("rex_download_failed_media"));
        }
        return true;
    }

    public static void showDownloadOptions(Context context, UserSession userSession, Object mediaObject, int position) {
        showDownloadOptions(context, userSession, mediaObject, position, null);
    }

    public static void showDownloadOptions(Context context, UserSession userSession, Object mediaObject, int position,
                                           DialogInterface.OnDismissListener onDismiss) {
        try {
            MediaData media = mediaObject instanceof MediaData
                    ? (MediaData) mediaObject
                    : new MediaData(mediaObject, userSession);
            downloadDialogBox(context, media, Math.max(0, position), DownloadMediaGroup.carousel(media), onDismiss);
        } catch (Exception e) {
            Logger.printException(() -> "Could not show download options", e);
            Utils.showToastShort(str("rex_download_failed_media"));
            if (onDismiss != null) onDismiss.onDismiss(null);
        }
    }

    public static void showStoryDownloadOptions(Context context, UserSession session, Object media, Object reel,
                                                DialogInterface.OnDismissListener onDismiss) {
        try {
            MediaData current = new MediaData(media, session);
            downloadDialogBox(context, current, 0, DownloadMediaGroup.stories(current, reel, session), onDismiss);
        } catch (Exception e) {
            Logger.printException(() -> "Could not show story download options", e);
            Utils.showToastShort(str("rex_download_failed_media"));
            if (onDismiss != null) onDismiss.onDismiss(null);
        }
    }

    public static void downloadAllMedia(Context context, DownloadMediaGroup group) throws Exception {
        int total = group.size();
        List<Integer> indexes = new ArrayList<>(total);
        for (int index = 0; index < total; index++) indexes.add(index);
        downloadSelectedMedia(context, group, indexes);
    }

    public static void downloadFirstMedia(Context context, DownloadMediaGroup group, int maxItems) throws Exception {
        int total = Math.min(group.size(), Math.max(1, maxItems));
        List<Integer> indexes = new ArrayList<>(total);
        for (int index = 0; index < total; index++) indexes.add(index);
        downloadSelectedMedia(context, group, indexes);
    }

    private static void downloadAllOrShowOptions(Context context, MediaData current, int position, DownloadMediaGroup group) throws Exception {
        if (directDownloadEnabled() && group.size() > 1) {
            downloadAllMedia(context, group);
        } else {
            downloadDialogBox(context, current, position, group, null);
        }
    }

    public static void downloadSelectedMedia(Context context, DownloadMediaGroup group, List<Integer> indexes) throws Exception {
        if (indexes == null || indexes.isEmpty()) return;
        if (!Utils.isNetworkConnected()) {
            Utils.showToastShort(str("rex_no_internet"));
            return;
        }
        int total = group.size();
        String username = group.username();
        String subFolder = getSubfolderName(username);
        List<DownloadRequest> requests = new ArrayList<>(indexes.size());
        for (int index : new TreeSet<>(indexes)) {
            if (index < 0 || index >= total) continue;
            MediaData child = group.itemAt(index);
            MediaData root = group.carouselParent == null ? child : group.carouselParent;
            String link = child.getMediaLink();
            if (link == null || link.isEmpty()) continue;
            requests.add(buildMediaRequest(
                    root,
                    child,
                    group.carouselParent == null ? 0 : index,
                    index,
                    MediaType.ANY,
                    link,
                    subFolder,
                    username + "_" + child.getDownloadFilename(MediaType.ANY),
                    null
            ));
        }
        if (requests.isEmpty()) {
            Utils.showToastShort(str("rex_download_failed_media"));
            return;
        }
        getDownloadAllDownloader(context).enqueueBatch(requests);
    }

    // Position is set to -1 if we want to download all medias from the media info object.
    public static void downloadMedia(Context context, MediaData mediaInfo, int position, MediaType mediaType) throws Exception {
        downloadMedia(context, mediaInfo, position, position, mediaType);
    }

    public static void downloadMedia(Context context, MediaData mediaInfo, int position, int filenameIndex,
                                     MediaType mediaType) throws Exception {
        if (!Utils.isNetworkConnected()) {
            Utils.showToastShort(str("rex_no_internet"));
            return;
        }
        MediaDownloader downloader = position == -1
                ? getDownloadAllDownloader(context)
                : new MediaDownloader(context);
        String username = "instagram";
        try {
            if (mediaInfo.getUserData() != null && mediaInfo.getUserData().getUsername() != null) {
                username = mediaInfo.getUserData().getUsername();
            }
        } catch (Throwable ignored) {
        }
        String subFolder = getSubfolderName(username);

        if (mediaType.equals(MediaType.AUDIO)) {
            MediaData currentMedia = mediaInfo.getMediaAt(Math.max(0, position));
            String audioUrl = currentMedia.resolveAudioDownloadUrl();
            String fileName = currentMedia.resolveAudioDownloadFileName(username);
            if ((audioUrl == null || audioUrl.trim().isEmpty()) && currentMedia != mediaInfo) {
                audioUrl = mediaInfo.resolveAudioDownloadUrl();
                fileName = mediaInfo.resolveAudioDownloadFileName(username);
            }
            if (audioUrl == null || audioUrl.trim().isEmpty()) {
                Utils.showToastShort("No audio track available for this post");
                return;
            }
            downloader.enqueue(new DownloadRequest(audioUrl, Constants.DEFAULT_AUDIO_FOLDER, fileName));

        } else if (position != -1) {
            MediaData mediaData = mediaInfo.getMediaAt(position);
            String mediaUrl;
            if (mediaType.equals(MediaType.IMAGE)) {
                mediaUrl = mediaData.getImageLink();
            } else {
                mediaUrl = mediaData.getMediaLink();
            }
            if (mediaUrl == null || mediaUrl.trim().isEmpty()) {
                Utils.showToastShort("Media stream unavailable. Try again.");
                return;
            }
            String fileName = username + "_" + mediaData.getDownloadFilename(mediaType);
            DownloadRequest request = buildMediaRequest(
                    mediaInfo,
                    mediaData,
                    position,
                    filenameIndex,
                    mediaType,
                    mediaUrl,
                    subFolder,
                    fileName,
                    null
            );
            if (!mediaType.equals(MediaType.IMAGE) || !mediaData.isVideo()
                    || !StorageUtils.checkStoragePermissions()) {
                downloader.enqueue(request);
                return;
            }
            MediaInterface cover = mediaData.getBestImage();
            int coverShortSide = cover == null ? 0 : cover.shortSide();
            // A picture lookup by shortcode addresses a post, never a carousel's child.
            boolean single = mediaInfo.getCarouselSize() == 1;
            String shortcode = mediaData.getShortcode();
            Utils.runOnBackgroundThread(() -> {
                MediaPicture picture = single ? MediaPicture.largerThan(shortcode, coverShortSide) : null;
                long coverPixels = 0;
                MediaInterface frameVideo = null;
                try {
                    coverPixels = picture != null ? (long) picture.width * picture.height
                            : cover == null ? 0 : (long) cover.getWidth() * cover.getHeight();
                    if (coverPixels > 0 && mediaData.isFirstFrameCover()) {
                        List<MediaInterface> videos = new ArrayList<>();
                        List<VideoData> progressive = mediaData.getVideoVariants();
                        if (progressive != null) videos.addAll(progressive);
                        videos.addAll(mediaData.getDashVideos());
                        long bestPixels = (long) (coverPixels * (1 + MediaData.ROUNDING_TOLERANCE));
                        for (MediaInterface video : videos) {
                            long pixels = (long) video.getWidth() * video.getHeight();
                            if (pixels > bestPixels && video.getUrl() != null) {
                                frameVideo = video;
                                bestPixels = pixels;
                            }
                        }
                    }
                } catch (Exception | LinkageError e) {
                    RexUtils.logger(e);
                }
                MediaDownloader coverDownloader = frameVideo == null ? downloader
                        : firstFrameDownloader(context.getApplicationContext(), frameVideo, coverPixels);
                Utils.runOnMainThread(() -> {
                    if (picture != null) {
                        if (request.url != null && !request.url.trim().isEmpty()) {
                            request.fallbackSources.add(0, new DownloadRequest.Source(request.url, null));
                        }
                        request.url = picture.url;
                    }
                    coverDownloader.enqueue(request);
                });
            });

        } else if (position == -1) {
            downloadAllMedia(context, DownloadMediaGroup.carousel(mediaInfo));
        } else {
            Utils.showToastShort("There is nothing to download");
        }
    }

    private static MediaDownloader firstFrameDownloader(Context context, MediaInterface video, long coverPixels) {
        return new MediaDownloader(context) {
            private boolean attempted;

            @Override
            protected void download(String url, OutputStream output, Notification.Builder builder, int notificationId)
                    throws IOException {
                if (attempted) {
                    super.download(url, output, builder, notificationId);
                    return;
                }
                attempted = true;
                File source = null;
                File picture = null;
                Bitmap frame = null;
                boolean extracted = false;
                try {
                    try {
                        source = File.createTempFile("rex-cover-", ".mp4", context.getCacheDir());
                        picture = File.createTempFile("rex-cover-", ".jpg", context.getCacheDir());
                        try (OutputStream cached = new FileOutputStream(source)) {
                            super.download(video.getUrl(), cached, builder, notificationId);
                        }
                        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
                        try {
                            retriever.setDataSource(source.getAbsolutePath());
                            frame = retriever.getFrameAtTime(0, MediaMetadataRetriever.OPTION_CLOSEST);
                        } finally {
                            retriever.release();
                        }
                        if (frame != null && (long) frame.getWidth() * frame.getHeight() > coverPixels) {
                            try (OutputStream jpeg = new FileOutputStream(picture)) {
                                extracted = frame.compress(Bitmap.CompressFormat.JPEG, 95, jpeg);
                            }
                        }
                    } catch (Exception | LinkageError | OutOfMemoryError e) {
                        extracted = false;
                        RexUtils.logger(e);
                    }
                    if (extracted) {
                        // Finish encoding before writing the document so extraction failures leave it untouched.
                        try (FileInputStream jpeg = new FileInputStream(picture)) {
                            byte[] buffer = new byte[8192];
                            int count;
                            while ((count = jpeg.read(buffer)) != -1) output.write(buffer, 0, count);
                        }
                    } else {
                        super.download(url, output, builder, notificationId);
                    }
                } finally {
                    if (frame != null) frame.recycle();
                    if (source != null) source.delete();
                    if (picture != null) picture.delete();
                }
            }
        };
    }

    private static DownloadRequest buildMediaRequest(
            MediaData rootMediaData,
            MediaData childMediaData,
            int postPosition,
            int filenameIndex,
            MediaType mediaType,
            String mediaUrl,
            String subFolder,
            String fallbackFileName,
            MediaInterface variant
    ) throws Exception {
        boolean isVideo = mediaType.equals(MediaType.VIDEO)
                || (mediaType.equals(MediaType.ANY) && childMediaData.isVideo());
        String fileName = fallbackFileName;
        String progressiveUrl = mediaUrl;
        String audioUrl = variant == null ? null : variant.getAudioUrl();

        String variantTag = variant == null ? null : variant.getVariantTag();
        DashVideoData dashVideo = variant instanceof DashVideoData
                ? (DashVideoData) variant
                : isVideo && variant == null && Pref.preferDashFormat()
                ? childMediaData.getSharperDashVideo()
                : null;
        if (dashVideo != null) {
            mediaUrl = dashVideo.getUrl();
            audioUrl = dashVideo.getAudioUrl();
        }

        try {
            String username = rootMediaData.getUserData().getUsername();
            Long takenAtSeconds = rootMediaData.getTakenAtSeconds();
            Long uploadTimestampMillis = takenAtSeconds == null
                    ? null
                    : takenAtSeconds * 1000L;
            String variantSuffix = variantTag == null || variantTag.trim().isEmpty()
                    ? ""
                    : variantTag;
            DownloadFileNameFormatter.Values fileNameValues =
                    new DownloadFileNameFormatter.Values(
                            username,
                            childMediaData.getMediaPkId(),
                            rootMediaData.getShortcode(),
                            uploadTimestampMillis,
                            isVideo ? "video" : "image",
                            filenameIndex,
                            variantSuffix
                    );
            fileName = DownloadFileNameFormatter.format(
                    Pref.downloadFileNameTemplate(),
                    fileNameValues,
                    isVideo ? ".mp4" : ".jpg",
                    ZoneId.systemDefault()
            );
        } catch (Exception | LinkageError fileNameException) {
            RexUtils.logger(fileNameException);
            Logger.printException(
                    () -> "Could not format download filename",
                    fileNameException
            );
        }

        DownloadRequest request = new DownloadRequest(mediaUrl, subFolder, fileName);
        if (variant instanceof VideoResolution) {
            List<VideoVariant> candidates = ((VideoResolution) variant).getCandidates();
            for (int i = 1; i < candidates.size(); i++) {
                try {
                    VideoVariant candidate = candidates.get(i);
                    String url = candidate.getUrl();
                    if (url == null || url.trim().isEmpty()) continue;
                    request.fallbackSources.add(new DownloadRequest.Source(url, candidate.getAudioUrl()));
                } catch (Exception | LinkageError ignored) {
                }
            }
        } else if (variant instanceof ImageResolution) {
            List<String> urls = ((ImageResolution) variant).getCandidateUrls();
            for (int i = 1; i < urls.size(); i++) {
                request.fallbackSources.add(new DownloadRequest.Source(urls.get(i), null));
            }
        }
        MediaInterface originalImage = null;
        if (!isVideo && variant == null && mediaType == MediaType.IMAGE && childMediaData.isVideo()) {
            originalImage = childMediaData.getBestOriginalImage();
            if (originalImage != null && !originalImage.getUrl().equals(mediaUrl)) request.fallbackUrl = originalImage.getUrl();
        }
        request.audioUrl = audioUrl;
        request.audioToAacLc = isVideo && Pref.dashAudioAacLc();
        if (variant == null && dashVideo != null
                && progressiveUrl != null && !progressiveUrl.trim().isEmpty()) {
            request.fallbackUrl = progressiveUrl;
        }
        if (isVideo && variant == null) addSameResolutionFallbacks(request, childMediaData);
        if (!isVideo && variant == null && (mediaType == MediaType.ANY || mediaType == MediaType.IMAGE)) {
            try {
                MediaInterface image = childMediaData.getBestImage();
                if (image != null && request.url != null && request.url.equals(image.getUrl())) {
                    addImageFallbacks(request, childMediaData, image.getWidth(), image.getHeight());
                }
            } catch (Exception | LinkageError ignored) {
            }
            addFinalImageFallbacks(request, childMediaData, originalImage);
        }
        if (!isVideo || !Pref.embedDownloadMetadata()) {
            return request;
        }

        try {
            String username = rootMediaData.getUserData().getUsername();
            Long takenAtSeconds = rootMediaData.getTakenAtSeconds();
            Long uploadTimestampMillis = takenAtSeconds == null
                    ? null
                    : takenAtSeconds * 1000L;
            request.metadata = new DownloadMetadata(
                    rootMediaData.getDescriptionText(),
                    Links.generatePostLink(rootMediaData, postPosition),
                    username,
                    uploadTimestampMillis
            );
            return request;
        } catch (Exception | LinkageError metadataException) {
            RexUtils.logger(metadataException);
            Logger.printException(
                    () -> "Could not collect download metadata",
                    metadataException
            );
            return request;
        }
    }

    private static void addFinalImageFallbacks(DownloadRequest request, MediaData mediaData,
                                               MediaInterface image) {
        if (image == null || request.fallbackUrl == null) return;
        try {
            if (!request.fallbackUrl.equals(image.getUrl())) return;
            DownloadRequest fallback = new DownloadRequest(request.fallbackUrl, request.subFolder, request.fileName);
            addImageFallbacks(fallback, mediaData, image.getWidth(), image.getHeight());
            Set<String> seen = new HashSet<>();
            seen.add(request.url);
            seen.add(request.fallbackUrl);
            for (DownloadRequest.Source source : request.fallbackSources) seen.add(source.url);
            fallback.fallbackSources.removeIf(source -> !seen.add(source.url));
            if (fallback.fallbackSources.isEmpty()) return;
            request.fallbackSources.add(new DownloadRequest.Source(request.fallbackUrl, null));
            request.fallbackSources.addAll(fallback.fallbackSources);
            request.fallbackUrl = null;
        } catch (Exception | LinkageError ignored) {
        }
    }

    private static void addImageFallbacks(DownloadRequest request, MediaData mediaData,
                                          Integer width, Integer height) {
        if (request.url != null && request.url.equals(request.fallbackUrl)) request.fallbackUrl = null;
        if (width == null || height == null || width <= 0 || height <= 0) return;
        try {
            Set<String> seen = new HashSet<>();
            seen.add(request.url);
            seen.add(request.fallbackUrl);
            for (ImageResolution resolution : ImageResolution.group(mediaData.getImageVariants())) {
                if (!width.equals(resolution.getWidth()) || !height.equals(resolution.getHeight())) continue;
                for (String url : resolution.getCandidateUrls()) {
                    if (seen.add(url)) request.fallbackSources.add(new DownloadRequest.Source(url, null));
                }
                break;
            }
        } catch (Exception | LinkageError ignored) {
        }
    }

    private static void addSameResolutionFallbacks(DownloadRequest request, MediaData mediaData) {
        try {
            List<VideoVariant> videos = new ArrayList<>();
            if (Pref.preferDashFormat()) videos.addAll(mediaData.getDashVideos());
            List<VideoData> progressive = mediaData.getVideoVariants();
            if (progressive != null) videos.addAll(progressive);

            List<String> primary = Arrays.asList(request.url, request.audioUrl);
            for (VideoResolution resolution : VideoResolution.group(videos)) {
                if (resolution.shortSide() <= 0) continue;
                List<DownloadRequest.Source> sources = new ArrayList<>();
                boolean containsPrimary = false;
                for (VideoVariant candidate : resolution.getCandidates()) {
                    try {
                        String url = candidate.getUrl();
                        String audio = candidate.getAudioUrl();
                        if (url == null || url.trim().isEmpty()) continue;
                        if (primary.equals(Arrays.asList(url, audio))) containsPrimary = true;
                        sources.add(new DownloadRequest.Source(url, audio));
                    } catch (Exception | LinkageError ignored) {
                    }
                }
                if (!containsPrimary) continue;

                Set<List<String>> seen = new HashSet<>();
                seen.add(primary);
                if (request.fallbackUrl != null) seen.add(Arrays.asList(request.fallbackUrl, null));
                for (DownloadRequest.Source source : sources) {
                    if (seen.add(Arrays.asList(source.url, source.audioUrl))) request.fallbackSources.add(source);
                }
                return;
            }
        } catch (Exception | LinkageError e) {
            RexUtils.logger(e);
        }
    }

    public static void downloadMediaUrl(Context context, String mediaUrl, String subFolder, String fileName) throws Exception {
        enqueueDownload(context, new DownloadRequest(mediaUrl, subFolder, fileName));
    }

    private static final Object FEED_DOWNLOAD_BUTTON_TAG = new Object();
    private static final Object FEED_HEXAGON_BUTTON_TAG = new Object();
    private static final String MEDIA_CLASS_NAME = "com.instagram.feed.media.Media";

    public static boolean isFeedDownloadButtonEnabled() {
        return Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.ENABLE_DOWNLOAD))
                && Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.FEED_DOWNLOAD_BUTTON));
    }

    public static String feedDownloadButtonDescription() {
        return str("rex_download_current_media");
    }

    static final String FEED_VIEW_STATE_FIELD = "feedViewStateField";
    static final String FEED_CURRENT_MEDIA_FIELD = "feedCurrentMediaField";

    public static void addFeedDownloadButton(
            View rootView, Object media, UserSession userSession, Object mediaState) {
        try {
            if (rootView == null || media == null) return;
            if (!isFeedDownloadButtonEnabled()) {
                removeFeedDownloadButton(rootView);
                return;
            }

            Context context = rootView.getContext();
            int saveButtonId = ResourceUtils.getIdentifier(context, ResourceType.ID, "row_feed_button_save");
            View saveButton = saveButtonId == 0 ? null : rootView.findViewById(saveButtonId);
            if (saveButton == null || !(saveButton.getParent() instanceof ViewGroup)) return;

            ViewGroup buttonGroup = (ViewGroup) saveButton.getParent();
            if (buttonGroup.getClass().getName().startsWith("com.facebook.litho.")) return;

            ImageView hexBtn = buttonGroup.findViewWithTag(FEED_HEXAGON_BUTTON_TAG);
            if (hexBtn == null) {
                hexBtn = createFeedHexagonButton(context, saveButton, buttonGroup);
            }
            hexBtn.setOnClickListener(
                    v -> RexDialogs.showPostOptionsSheet(context, userSession, media, currentMediaIndex(mediaState)));

            ImageView button = buttonGroup.findViewWithTag(FEED_DOWNLOAD_BUTTON_TAG);
            if (button == null) {
                button = createFeedDownloadButton(context, saveButton, buttonGroup);
            }
            button.setOnClickListener(
                    v -> downloadPost(context, userSession, media, currentMediaIndex(mediaState)));
            button.setOnLongClickListener(
                    v -> onPostDownloadLongClick(context, userSession, media, currentMediaIndex(mediaState)));

            if (Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.LONG_PRESS_POST_OPTIONS))) {
                rootView.setOnLongClickListener(v -> {
                    RexDialogs.showPostOptionsSheet(context, userSession, media, currentMediaIndex(mediaState));
                    return true;
                });
            }
        } catch (Exception e) {
            Logger.printException(() -> "addFeedDownloadButton failure", e);
        }
    }

    static int currentMediaIndex(Object mediaState) {
        if (mediaState == null) return 0;
        try {
            Object viewState = new Entity(mediaState).getField(FEED_VIEW_STATE_FIELD);
            if (viewState == null) return 0;
            Object index = new Entity(viewState).getField(FEED_CURRENT_MEDIA_FIELD);
            if (index instanceof Integer) return (Integer) index;
        } catch (Exception e) {
            Logger.printException(() -> "Could not read the current media index", e);
        }
        return 0;
    }

    static Object extractMedia(Object source) {
        if (source == null || MEDIA_CLASS_NAME.equals(source.getClass().getName())) return source;
        try {
            for (Field field : source.getClass().getDeclaredFields()) {
                if (!MEDIA_CLASS_NAME.equals(field.getType().getName())) continue;
                field.setAccessible(true);
                Object media = field.get(source);
                if (media != null) return media;
            }
        } catch (Exception e) {
            Logger.printException(() -> "Could not extract the media from the feed row state", e);
        }
        return source;
    }

    private static void removeFeedDownloadButton(View rootView) {
        View existing = rootView.findViewWithTag(FEED_DOWNLOAD_BUTTON_TAG);
        if (existing != null && existing.getParent() instanceof ViewGroup) {
            ((ViewGroup) existing.getParent()).removeView(existing);
        }
        View existingHex = rootView.findViewWithTag(FEED_HEXAGON_BUTTON_TAG);
        if (existingHex != null && existingHex.getParent() instanceof ViewGroup) {
            ((ViewGroup) existingHex.getParent()).removeView(existingHex);
        }
    }

    private static ImageView createFeedHexagonButton(Context context, View saveButton, ViewGroup buttonGroup) {
        ImageView button = new ImageView(context);
        button.setTag(FEED_HEXAGON_BUTTON_TAG);
        button.setContentDescription("xboyrex Options");
        button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        int iconColor = UI.getThemedColour("igds_color_primary_icon");
        button.setImageDrawable(RexVectorIcons.create(context, "rex_vec_hexagon", iconColor, 24));
        button.setPadding(
                saveButton.getPaddingLeft(),
                saveButton.getPaddingTop(),
                saveButton.getPaddingRight(),
                saveButton.getPaddingBottom());
        buttonGroup.addView(button, buttonGroup.indexOfChild(saveButton), cloneLayoutParams(saveButton));
        return button;
    }

    private static ImageView createFeedDownloadButton(Context context, View saveButton, ViewGroup buttonGroup) {
        ImageView button = new ImageView(context);
        button.setTag(FEED_DOWNLOAD_BUTTON_TAG);
        button.setContentDescription(feedDownloadButtonDescription());
        button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        applyFeedDownloadIcon(button, context);
        button.setPadding(
                saveButton.getPaddingLeft(),
                saveButton.getPaddingTop(),
                saveButton.getPaddingRight(),
                saveButton.getPaddingBottom());
        buttonGroup.addView(button, buttonGroup.indexOfChild(saveButton), cloneLayoutParams(saveButton));
        return button;
    }

    private static ViewGroup.LayoutParams cloneLayoutParams(View saveButton) {
        ViewGroup.LayoutParams saveParams = saveButton.getLayoutParams();
        if (saveParams instanceof LinearLayout.LayoutParams) {
            return new LinearLayout.LayoutParams((LinearLayout.LayoutParams) saveParams);
        }
        if (saveParams instanceof ViewGroup.MarginLayoutParams) {
            return new ViewGroup.MarginLayoutParams((ViewGroup.MarginLayoutParams) saveParams);
        }
        if (saveParams != null) {
            return new ViewGroup.LayoutParams(saveParams.width, saveParams.height);
        }
        return new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private static void applyFeedDownloadIcon(ImageView button, Context context) {
        int drawableId = ResourceUtils.getIdentifier(context, ResourceType.DRAWABLE, UI.DRAWABLE_DOWNLOAD_ICON);
        if (drawableId == 0) return;
        button.setImageDrawable(context.getDrawable(drawableId));

        int attrId = ResourceUtils.getAttrIdentifier("igds_color_primary_icon");
        TypedValue typedValue = new TypedValue();
        if (attrId != 0
                && context.getTheme().resolveAttribute(attrId, typedValue, true)
                && typedValue.resourceId != 0) {
            button.setColorFilter(context.getColor(typedValue.resourceId));
        }
    }

    private static final Object STORY_DOWNLOAD_BUTTON_TAG = new Object();

    public static void addStoryDownloadButton(View buttonsContainer, Object media, UserSession userSession, Object reel) {
        try {
            if (!(buttonsContainer instanceof ViewGroup)) return;
            ViewGroup row = (ViewGroup) buttonsContainer;
            ImageView button = row.findViewWithTag(STORY_DOWNLOAD_BUTTON_TAG);
            if (media == null || !SettingsStatus.storyDownloadButton || !Pref.enableDownload()
                    || !SharedPref.getBooleanPref(Settings.STORY_DOWNLOAD_BUTTON)) {
                if (button != null) row.removeView(button);
                return;
            }

            if (button == null) {
                button = createStoryDownloadButton(row);
                if (button == null) return;
            }
            button.getDrawable().setTint(Color.WHITE);
            button.setOnClickListener(v -> downloadStory(v, userSession, media, reel, false));
            button.setOnLongClickListener(v -> {
                downloadStory(v, userSession, media, reel, true);
                return true;
            });
        } catch (Exception e) {
            Logger.printException(() -> "addStoryDownloadButton failure", e);
        }
    }

    private static ImageView createStoryDownloadButton(ViewGroup row) {
        Context context = row.getContext();
        int likeId = ResourceUtils.getIdentifier(context, ResourceType.ID, "toolbar_like_container");
        View model = likeId == 0 ? null : row.findViewById(likeId);
        if (model == null || model.getParent() != row) {
            model = row.getChildCount() == 0 ? null : row.getChildAt(0);
        }
        if (model == null) return null;
        int drawableId = ResourceUtils.getIdentifier(context, ResourceType.DRAWABLE, UI.DRAWABLE_DOWNLOAD_ICON);
        if (drawableId == 0) return null;

        ImageView button = new ImageView(context);
        button.setTag(STORY_DOWNLOAD_BUTTON_TAG);
        button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        button.setImageDrawable(context.getDrawable(drawableId).mutate());
        button.setContentDescription(str("rex_download_current_media"));
        button.setPadding(model.getPaddingLeft(), model.getPaddingTop(), model.getPaddingRight(), model.getPaddingBottom());
        row.addView(button, row.indexOfChild(model), cloneLayoutParams(model));
        return button;
    }

    private static void downloadStory(View anchor, UserSession userSession, Object media, Object reel, boolean longPress) {
        try {
            if (isActionDebounced()) return;
            Activity activity = storyActivity(anchor);
            MediaData current = new MediaData(media, userSession);
            if (!longPress && directDownloadEnabled()) {
                String template = Pref.downloadFileNameTemplate();
                int filenameIndex = template != null && template.contains(DownloadFileNameFormatter.Token.CAROUSEL_INDEX.placeholder())
                        ? DownloadMediaGroup.stories(current, reel, userSession).currentFilenameIndex(0)
                        : 0;
                downloadMedia(activity, current, 0, filenameIndex, MediaType.ANY);
                return;
            }
            DownloadMediaGroup group = DownloadMediaGroup.stories(current, reel, userSession);
            if (longPress) {
                downloadAllOrShowOptions(activity, current, 0, group);
            } else {
                downloadDialogBox(activity, current, 0, group, null);
            }
        } catch (Exception e) {
            Logger.printException(() -> "Error at story download", e);
            Utils.showToastShort(str("rex_download_failed_media"));
        }
    }

    private static Activity storyActivity(View view) {
        for (View current = view; current != null; ) {
            Context context = current.getContext();
            while (context instanceof ContextWrapper) {
                if (context instanceof Activity) return (Activity) context;
                Context base = ((ContextWrapper) context).getBaseContext();
                if (base == context) break;
                context = base;
            }
            ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        throw new IllegalStateException("No activity found above the story download button");
    }

    private static void enqueueDownload(Context context, DownloadRequest request) {
        if (!Utils.isNetworkConnected()) {
            Utils.showToastShort(str("rex_no_internet"));
            return;
        }
        MediaDownloader downloader = new MediaDownloader(context);
        downloader.enqueue(request);
    }

    public static void externalDownloader(Object mediaObject, int currentMediaIndex) {
        try {
            String packageName = Pref.externalDownloaderPackageName();
            packageName = packageName == null ? "" : packageName.trim();
            if (packageName.isEmpty()) {
                RexUtils.toast(str("rex_external_downloader_package_name_not_set"));
                return;
            }
            if (!RexUtils.isAppInstalledAndEnabled(packageName)) {
                RexUtils.toast(str("rex_external_downloader_package_name_not_found"));
                return;
            }
            String link = Links.generatePostLink(mediaObject, currentMediaIndex);
            RexUtils.shareTextToPackageName(link, packageName);
        } catch (Exception e) {
            RexUtils.logger(e);
            Logger.printException(() -> "Error at externalDownloader", e);
        }
    }
}
