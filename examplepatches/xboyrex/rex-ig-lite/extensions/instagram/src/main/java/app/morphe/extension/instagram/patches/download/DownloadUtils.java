/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.patches.download;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Color;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.LinearLayout;

import java.lang.reflect.Field;
import java.time.ZoneId;
import java.util.List;
import java.util.ArrayList;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.constants.UI;
import app.morphe.extension.instagram.patches.feed.MoreOptionsOnPostPatch;
import app.morphe.extension.instagram.ui.RexDialogs;
import app.morphe.extension.instagram.ui.RexVectorIcons;
import android.widget.FrameLayout;
import android.view.Gravity;
import java.util.IdentityHashMap;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.entity.Entity;
import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.entity.VideoData;
import app.morphe.extension.instagram.entity.InstagramDialogBox;
import app.morphe.extension.instagram.entity.AudioMediaInterface;
import app.morphe.extension.instagram.entity.MediaInterface;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.patches.Links;
import app.morphe.extension.rex.ObjectBrowser;
import app.morphe.extension.rex.downloader.MediaDownloader;
import app.morphe.extension.rex.downloader.DownloadMetadata;
import app.morphe.extension.rex.downloader.DownloadRequest;
import app.morphe.extension.rex.downloader.MediaType;
import app.morphe.extension.rex.RexUtils;

import com.instagram.common.session.UserSession;

public class DownloadUtils {

    public static String getSubfolderName(String username){
        boolean SPLIT_BY_USERNAME = Pref.downloadUsernameFolder() && SettingsStatus.downloadMedia;
        return SPLIT_BY_USERNAME ? username : null;
    }

    private static void buildVariantDialogBox(
            Context context,
            MediaData mediaInfo,
            int position,
            MediaType mediaType
    ) throws Exception {
        MediaData currentMediaData = mediaInfo.getMediaAt(position);
        String username = mediaInfo.getUserData().getUsername();
        List<MediaInterface> variantList;
        String title = "";
        if(mediaType.equals(MediaType.VIDEO)){
            title = str("rex_video_variants");
            variantList = currentMediaData.getVideoVariants();
        }else{
            title = str("rex_image_variants");
            variantList = currentMediaData.getImageVariants();
        }

        InstagramDialogBox dialog = new InstagramDialogBox(context);
        ArrayList<String> options = new ArrayList<>();
        variantList.forEach(item -> options.add(item.getVariantTag()));
        CharSequence[] items = options.toArray(new CharSequence[0]);

        dialog.addDialogMenuItems(items, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface d, int which) {
                MediaInterface data = variantList.get(which);

                try {
                    String subFolder = getSubfolderName(username);
                    String fileName = username + "_" + currentMediaData.getVariantFileName(data);
                    DownloadRequest request = buildMediaRequest(
                            mediaInfo,
                            currentMediaData,
                            position,
                            data.getMediaType(),
                            data.getUrl(),
                            subFolder,
                            fileName,
                            data.getVariantTag()
                    );
                    enqueueDownload(context, request);
                } catch (Exception e) {
                    RexUtils.logger(e);
                    Logger.printException(() -> "Error at buildVariantDialogBox", e);
                    Utils.showToastShort(e.getMessage());
                }

            }
        });

        dialog.setTitle(title);
        dialog.setNegativeButton(str("rex_close"), (d, which) -> d.dismiss());
        dialog.setCancelable(true);
        dialog.setCanceledOnTouchOutside(true);

        Dialog dlg = dialog.getDialog();
        dlg.show();

    }

    private static void downloadDialogBox(Context context, MediaData mediaInfo, int position) throws Exception {
        int carouselSize = mediaInfo.getCarouselSize();
        MediaData currentMediaData = mediaInfo.getMediaAt(position);
        String username = mediaInfo.getUserData().getUsername();
        Boolean isCurrentMediaVideo = currentMediaData.isVideo();
        Boolean currentMediaHasAudio = currentMediaData.hasAudio();

        InstagramDialogBox dialog = new InstagramDialogBox(context);

        ArrayList<String> options = new ArrayList<>();
        options.add(str("rex_download_current_media"));
        options.add(str("rex_download_as_image"));
        if (currentMediaHasAudio) options.add(str("rex_download_audio"));
        options.add(str("rex_copy_media_link"));
        options.add(str("rex_image_variants"));
        if (isCurrentMediaVideo) {
            options.add(str("rex_video_variants"));
            options.add(str("rex_open_video_externally"));
        } else {
            options.add(str("rex_open_image_externally"));
        }

        if (carouselSize > 1) options.add(str("rex_download_all"));

        CharSequence[] items = options.toArray(new CharSequence[0]);

        dialog.addDialogMenuItems(items, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface d, int which) {
                try {
                    // Doing like this because options are dynamic.
                    String selectedOption = options.get(which);

                    if (selectedOption.equals(str("rex_download_current_media"))) {
                        downloadMedia(context, mediaInfo, position, MediaType.ANY);

                    } else if (selectedOption.equals(str("rex_download_as_image"))) {
                        downloadMedia(context, mediaInfo, position, MediaType.IMAGE);

                    } else if (selectedOption.equals(str("rex_copy_media_link"))) {
                        Utils.setClipboard(currentMediaData.getMediaLink());
                        Utils.showToastShort(str("rex_copied_media_link"));

                    } else if (selectedOption.equals(str("rex_open_video_externally")) || selectedOption.equals(str("rex_open_image_externally"))) {
                        ActivityHook.handleUrlIntent(isCurrentMediaVideo, currentMediaData.getMediaLink());

                    } else if (selectedOption.equals(str("rex_download_all"))) {
                        downloadMedia(context, mediaInfo, -1, MediaType.ANY);

                    } else if (selectedOption.equals(str("rex_download_audio"))) {
                        downloadMedia(context, mediaInfo, position, MediaType.AUDIO);

                    } else if (selectedOption.equals(str("rex_video_variants"))) {
                        buildVariantDialogBox(context, mediaInfo, position, MediaType.VIDEO);

                    } else if (selectedOption.equals(str("rex_image_variants"))) {
                        buildVariantDialogBox(context, mediaInfo, position, MediaType.IMAGE);

                    }
                } catch (Exception e) {
                    RexUtils.logger(e);
                    Logger.printException(() -> "Error at downloadDialogBox", e);
                    Utils.showToastShort(e.getMessage());
                }
            }
        });


        dialog.setTitle(str("rex_download_options"));
        dialog.setNegativeButton(str("rex_close"), (d, which) -> d.dismiss());
        dialog.setCancelable(true);
        dialog.setCanceledOnTouchOutside(true);

        Dialog dlg = dialog.getDialog();
        dlg.show();
    }


    public static void downloadPost(Context context,  UserSession userSession, Object mediaObject, int position) {
        try {
            boolean ENABLE_DIRECT_DOWNLOAD = Pref.enableDirectDownload() && SettingsStatus.downloadMedia;
            position = position < 1 ? 0 : position;
            MediaData mediaInfo = new MediaData(mediaObject, userSession);
            if (ENABLE_DIRECT_DOWNLOAD) {
                downloadMedia(context, mediaInfo, position, MediaType.ANY);
            } else {
                downloadDialogBox(context, mediaInfo, position);
            }

        } catch (Exception e) {
            RexUtils.logger(e);
            Logger.printException(() -> "Error at downloadPost", e);
        }
    }

    // Position is set to -1 if we want to download all medias from the media info object.
    public static void downloadMedia(Context context, MediaData mediaInfo, int position, MediaType mediaType) throws Exception {
        if(!Utils.isNetworkConnected()){
            Utils.showToastShort(str("rex_no_internet"));
            return;
        }
        MediaDownloader downloader = new MediaDownloader(context);
        String username = mediaInfo.getUserData().getUsername();
        String subFolder = getSubfolderName(username);

        if (mediaType.equals(MediaType.AUDIO)) {
            AudioMediaInterface audioMedia = mediaInfo.getMediaAt(position).getAudioMedia();
            String audioUrl = audioMedia.getAudioUrl();
            String fileName = audioMedia.getDownloadName() + ".mp3";
            downloader.enqueue(new DownloadRequest(audioUrl, Constants.DEFAULT_AUDIO_FOLDER, fileName));

        } else if (position != -1) {
            MediaData mediaData = mediaInfo.getMediaAt(position);
            String mediaUrl;
            if (mediaType.equals(MediaType.IMAGE)) {
                mediaUrl = mediaData.getImageLink();
            } else {
                mediaUrl = mediaData.getMediaLink();
            }
            String fileName = username + "_" + mediaData.getDownloadFilename(mediaType);
            downloader.enqueue(buildMediaRequest(
                    mediaInfo,
                    mediaData,
                    position,
                    mediaType,
                    mediaUrl,
                    subFolder,
                    fileName,
                    null
            ));

        } else if (position == -1) {
            int carouselSize = mediaInfo.getCarouselSize();

            for (int index = 0; index < carouselSize; index++) {
                MediaData currentMediaData = mediaInfo.getMediaAt(index);
                String fileName = username + "_"
                        + currentMediaData.getDownloadFilename(MediaType.ANY);
                String mediaUrl = currentMediaData.getMediaLink();
                downloader.enqueue(buildMediaRequest(
                        mediaInfo,
                        currentMediaData,
                        index,
                        MediaType.ANY,
                        mediaUrl,
                        subFolder,
                        fileName,
                        null
                ));
            }
        } else {
            Utils.showToastShort("There is nothing to download");
        }

    }

    private static DownloadRequest buildMediaRequest(
            MediaData rootMediaData,
            MediaData childMediaData,
            int carouselIndex,
            MediaType mediaType,
            String mediaUrl,
            String subFolder,
            String fallbackFileName,
            String variantTag
    ) throws Exception {
        boolean isVideo = mediaType.equals(MediaType.VIDEO)
                || (mediaType.equals(MediaType.ANY) && childMediaData.isVideo());
        String fileName = fallbackFileName;

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
                            carouselIndex,
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
        if (!isVideo || !Pref.embedDownloadMetadata()) {
            return request;
        }

        try {
            String username = rootMediaData.getUserData().getUsername();
            Long takenAtSeconds = rootMediaData.getTakenAtSeconds();
            Long uploadTimestampMillis = takenAtSeconds == null
                    ? null
                    : takenAtSeconds * 1000L;
            DownloadMetadata metadata = new DownloadMetadata(
                    rootMediaData.getDescriptionText(),
                    Links.generatePostLink(rootMediaData, carouselIndex),
                    username,
                    uploadTimestampMillis
            );
            return new DownloadRequest(mediaUrl, subFolder, fileName, metadata);
        } catch (Exception | LinkageError metadataException) {
            RexUtils.logger(metadataException);
            Logger.printException(
                    () -> "Could not collect download metadata",
                    metadataException
            );
            return request;
        }
    }


    public static void downloadMediaUrl(Context context, String mediaUrl, String subFolder, String fileName) throws Exception {
        enqueueDownload(context, new DownloadRequest(mediaUrl, subFolder, fileName));
    }

    private static final Object FEED_DOWNLOAD_BUTTON_TAG = "rex_feed_download_btn";
    private static final Object FEED_OPTIONS_BUTTON_TAG = "rex_feed_options_btn";
    private static final String REELS_TOOLBAR_TAG = "rex_reels_floating_toolbar";
    private static final String MEDIA_CLASS_NAME = "com.instagram.feed.media.Media";
    private static final String USER_SESSION_CLASS_NAME = "com.instagram.common.session.UserSession";

    private static volatile Object sLastActiveMedia;
    private static volatile UserSession sLastUserSession;
    private static volatile int sLastMediaIndex;

    public static void recordActiveReelMedia(Object mediaObject, UserSession userSession, int index) {
        if (mediaObject != null) sLastActiveMedia = mediaObject;
        if (userSession != null) sLastUserSession = userSession;
        sLastMediaIndex = Math.max(0, index);
    }

    /** Shared by the injected Litho component and the view holder hook. */
    public static boolean isFeedDownloadButtonEnabled() {
        return Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.ENABLE_DOWNLOAD))
                && Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.FEED_DOWNLOAD_BUTTON))
                && !Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.DISABLE_FEED_DOWNLOAD_ICON));
    }

    // Placeholders the patch rewrites inside `currentMediaIndex` with the live-index field names.
    static final String FEED_VIEW_STATE_FIELD = "feedViewStateField";
    static final String FEED_CURRENT_MEDIA_FIELD = "feedCurrentMediaField";

    /**
     * Adds BOTH the xboyrex Options Hexagon button and the Direct Download button beside the save button,
     * plus attaches long-press on the post for xboyrex Options (matching Screenshots 062921, 062929, 063214).
     */
    public static void addFeedDownloadButton(
            View rootView, Object media, UserSession userSession, Object mediaState) {
        try {
            if (rootView == null || media == null) return;
            recordActiveReelMedia(media, userSession, currentMediaIndex(mediaState));

            Context context = rootView.getContext();

            // Long-press on feed post -> open 12-option modal sheet
            if (Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.LONG_PRESS_FEED_OPTIONS))) {
                rootView.setOnLongClickListener(v -> {
                    MoreOptionsOnPostPatch.postMoreOptions(
                            context, userSession, media, currentMediaIndex(mediaState));
                    return true;
                });
            }

            int saveButtonId = ResourceUtils.getIdentifier(context, ResourceType.ID, "row_feed_button_save");
            View saveButton = saveButtonId == 0 ? null : rootView.findViewById(saveButtonId);
            if (saveButton == null || !(saveButton.getParent() instanceof ViewGroup)) return;

            ViewGroup buttonGroup = (ViewGroup) saveButton.getParent();
            if (buttonGroup.getClass().getName().startsWith("com.facebook.litho.")) return;

            // 1. xboyrex Options Hexagon Icon in Feed UFI bar
            boolean showOptionsIcon = !Boolean.TRUE.equals(
                    SharedPref.getBooleanPref(Settings.DISABLE_FEED_OPTIONS_ICON));
            ImageView optBtn = buttonGroup.findViewWithTag(FEED_OPTIONS_BUTTON_TAG);
            if (showOptionsIcon) {
                if (optBtn == null) {
                    optBtn = createFeedVectorButton(
                            context, saveButton, buttonGroup, FEED_OPTIONS_BUTTON_TAG, RexVectorIcons.IC_HEXAGON_NUT);
                }
                optBtn.setOnClickListener(v -> MoreOptionsOnPostPatch.postMoreOptions(
                        context, userSession, media, currentMediaIndex(mediaState)));
            } else if (optBtn != null) {
                buttonGroup.removeView(optBtn);
            }

            // 2. Direct Download Icon in Feed UFI bar
            if (isFeedDownloadButtonEnabled()) {
                ImageView dlBtn = buttonGroup.findViewWithTag(FEED_DOWNLOAD_BUTTON_TAG);
                if (dlBtn == null) {
                    dlBtn = createFeedVectorButton(
                            context, saveButton, buttonGroup, FEED_DOWNLOAD_BUTTON_TAG, RexVectorIcons.IC_DOWNLOAD_TRAY);
                }
                dlBtn.setOnClickListener(
                        v -> downloadPost(context, userSession, media, currentMediaIndex(mediaState)));
            } else {
                removeFeedDownloadButton(rootView);
            }
        } catch (Exception e) {
            Logger.printException(() -> "addFeedDownloadButton failure", e);
        }
    }

    private static ImageView createFeedVectorButton(
            Context context, View saveButton, ViewGroup buttonGroup, Object tag, String vectorIconName) {
        ImageView button = new ImageView(context);
        button.setTag(tag);
        button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        int color = UI.getThemedColour("igds_color_primary_icon");
        button.setImageDrawable(RexVectorIcons.create(context, vectorIconName, color, 23));
        button.setPadding(
                saveButton.getPaddingLeft(),
                saveButton.getPaddingTop(),
                saveButton.getPaddingRight(),
                saveButton.getPaddingBottom());
        int idx = Math.max(0, buttonGroup.indexOfChild(saveButton));
        buttonGroup.addView(button, idx, cloneLayoutParams(saveButton));
        return button;
    }

    /**
     * Attaches the top-right vertical floating toolbar (Hexagon Options Icon + Download Icon)
     * directly onto the Reels / Explore Clips viewer screen (matching Screenshot_20261101-063328_Instagram.png).
     */
    public static void onClipsTouchOrBind(Object clipsHost) {
        try {
            View hostView = null;
            if (clipsHost instanceof View) {
                hostView = (View) clipsHost;
            } else if (clipsHost != null) {
                for (Field f : clipsHost.getClass().getDeclaredFields()) {
                    if (View.class.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        Object v = f.get(clipsHost);
                        if (v instanceof View) {
                            hostView = (View) v;
                            break;
                        }
                    }
                }
            }
            if (hostView == null) return;

            final View targetView = hostView;
            targetView.post(() -> attachReelsFloatingToolbar(targetView));
        } catch (Throwable ignored) {}
    }

    private static void attachReelsFloatingToolbar(View clipsView) {
        try {
            if (clipsView == null || !clipsView.isAttachedToWindow()) return;
            Context ctx = clipsView.getContext();

            // Find a FrameLayout ancestor inside the Reels fragment so absolute top-right positioning works cleanly
            ViewGroup parentFrame = null;
            ViewParent p = clipsView.getParent();
            int hops = 0;
            while (p instanceof ViewGroup && hops < 5) {
                if (p instanceof FrameLayout) {
                    parentFrame = (ViewGroup) p;
                    break;
                }
                p = p.getParent();
                hops++;
            }
            if (parentFrame == null && clipsView instanceof ViewGroup) {
                parentFrame = (ViewGroup) clipsView;
            }
            if (parentFrame == null) return;

            boolean hideOptions = Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.HIDE_REEL_OPTIONS_ICON));
            boolean hideDownload = Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.HIDE_REEL_DOWNLOAD_ICON));

            View existing = parentFrame.findViewWithTag(REELS_TOOLBAR_TAG);
            if (hideOptions && hideDownload) {
                if (existing != null) parentFrame.removeView(existing);
                return;
            }
            if (existing != null) {
                existing.bringToFront();
                return;
            }

            LinearLayout bar = new LinearLayout(ctx);
            bar.setTag(REELS_TOOLBAR_TAG);
            bar.setOrientation(LinearLayout.VERTICAL);
            bar.setGravity(Gravity.CENTER_HORIZONTAL);
            int pad = RexDialogs.dp(ctx, 8);
            bar.setPadding(pad, pad, pad, pad);

            if (!hideOptions) {
                ImageView optBtn = new ImageView(ctx);
                optBtn.setImageDrawable(RexVectorIcons.create(ctx, RexVectorIcons.IC_HEXAGON_NUT, Color.WHITE, 26));
                optBtn.setPadding(pad, pad, pad, pad);
                optBtn.setOnClickListener(v -> {
                    Object media = resolveActiveMediaFromTree(clipsView);
                    if (media != null) {
                        MoreOptionsOnPostPatch.postMoreOptions(ctx, sLastUserSession, media, sLastMediaIndex);
                    } else {
                        RexDialogs.showQuickActionMenu(ctx);
                    }
                });
                LinearLayout.LayoutParams optLp = new LinearLayout.LayoutParams(
                        RexDialogs.dp(ctx, 44), RexDialogs.dp(ctx, 44));
                optLp.bottomMargin = RexDialogs.dp(ctx, 6);
                bar.addView(optBtn, optLp);
            }

            if (!hideDownload) {
                ImageView dlBtn = new ImageView(ctx);
                dlBtn.setImageDrawable(RexVectorIcons.create(ctx, RexVectorIcons.IC_DOWNLOAD_TRAY, Color.WHITE, 26));
                dlBtn.setPadding(pad, pad, pad, pad);
                dlBtn.setOnClickListener(v -> {
                    Object media = resolveActiveMediaFromTree(clipsView);
                    if (media != null) {
                        downloadPost(ctx, sLastUserSession, media, sLastMediaIndex);
                    } else {
                        Utils.showToastShort("Tap the 3-dot menu on this Reel to download");
                    }
                });
                LinearLayout.LayoutParams dlLp = new LinearLayout.LayoutParams(
                        RexDialogs.dp(ctx, 44), RexDialogs.dp(ctx, 44));
                bar.addView(dlBtn, dlLp);
            }

            FrameLayout.LayoutParams barLp = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.TOP | Gravity.END
            );
            barLp.topMargin = RexDialogs.dp(ctx, 10);
            barLp.rightMargin = RexDialogs.dp(ctx, 8);
            parentFrame.addView(bar, barLp);
            bar.bringToFront();
        } catch (Throwable ignored) {}
    }

    private static Object resolveActiveMediaFromTree(View startView) {
        try {
            View root = startView != null ? startView.getRootView() : null;
            if (root != null) {
                IdentityHashMap<Object, Boolean> visited = new IdentityHashMap<>();
                Object found = findMediaInViewOrObject(root, visited, 0);
                if (found != null) return found;
            }
        } catch (Throwable ignored) {}
        return sLastActiveMedia;
    }

    private static Object findMediaInViewOrObject(Object obj, IdentityHashMap<Object, Boolean> visited, int depth) {
        if (obj == null || depth > 5 || visited.containsKey(obj)) return null;
        visited.put(obj, Boolean.TRUE);
        Class<?> cls = obj.getClass();
        String clsName = cls.getName();
        if (MEDIA_CLASS_NAME.equals(clsName)) {
            return obj;
        }
        if (USER_SESSION_CLASS_NAME.equals(clsName) && obj instanceof UserSession) {
            sLastUserSession = (UserSession) obj;
            return null;
        }
        if (obj instanceof View) {
            View v = (View) obj;
            if (v.getVisibility() != View.VISIBLE) return null;
            Object tag = v.getTag();
            if (tag != null) {
                Object m = findMediaInViewOrObject(tag, visited, depth + 1);
                if (m != null) return m;
            }
            if (v instanceof ViewGroup) {
                ViewGroup vg = (ViewGroup) v;
                for (int i = 0; i < vg.getChildCount(); i++) {
                    Object m = findMediaInViewOrObject(vg.getChildAt(i), visited, depth + 1);
                    if (m != null) return m;
                }
            }
        }
        if (!clsName.startsWith("android.") && !clsName.startsWith("java.")) {
            try {
                for (Field f : cls.getDeclaredFields()) {
                    String fType = f.getType().getName();
                    if (MEDIA_CLASS_NAME.equals(fType)) {
                        f.setAccessible(true);
                        Object val = f.get(obj);
                        if (val != null) return val;
                    } else if (USER_SESSION_CLASS_NAME.equals(fType)) {
                        f.setAccessible(true);
                        Object val = f.get(obj);
                        if (val instanceof UserSession) sLastUserSession = (UserSession) val;
                    } else if (depth < 3 && !f.getType().isPrimitive() && !fType.startsWith("java.") && !fType.startsWith("android.")) {
                        f.setAccessible(true);
                        Object val = f.get(obj);
                        if (val != null) {
                            Object m = findMediaInViewOrObject(val, visited, depth + 1);
                            if (m != null) return m;
                        }
                    }
                }
            } catch (Throwable ignored) {}
        }
        return null;
    }

    /** Reads the live carousel index at click time, so the download follows a swipe. */
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

    /** Unwraps a feed row state to the single `Media` it holds; anything else is returned as is. */
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

    /** Drops the button on rebind so turning the toggle off takes effect without recreating the row. */
    private static void removeFeedDownloadButton(View rootView) {
        View existing = rootView.findViewWithTag(FEED_DOWNLOAD_BUTTON_TAG);
        if (existing == null) return;
        ViewParent parent = existing.getParent();
        if (parent instanceof ViewGroup) ((ViewGroup) parent).removeView(existing);
    }

    private static ImageView createFeedDownloadButton(Context context, View saveButton, ViewGroup buttonGroup) {
        ImageView button = new ImageView(context);
        button.setTag(FEED_DOWNLOAD_BUTTON_TAG);
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

    /** Copies the save button's slot so the download icon matches its size and spacing. */
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

    /** Uses the row context: the application context cannot resolve activity scoped theme attributes. */
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

    private static void enqueueDownload(Context context, DownloadRequest request) {
        if(!Utils.isNetworkConnected()){
            Utils.showToastShort(str("rex_no_internet"));
            return;
        }
        MediaDownloader downloader = new MediaDownloader(context);
        downloader.enqueue(request);
    }

    public static void externalDownloader(Object mediaObject, int currentMediaIndex){
        try {
            String packageName = Pref.externalDownloaderPackageName();
            packageName = packageName == null ? "" : packageName.trim();
            if(packageName.isEmpty()){
                RexUtils.toast(str("rex_external_downloader_package_name_not_set"));
                return;
            }
            if(!RexUtils.isAppInstalledAndEnabled(packageName)){
                RexUtils.toast(str("rex_external_downloader_package_name_not_found"));
                return;
            }
            String link = Links.generatePostLink(mediaObject, currentMediaIndex);
            RexUtils.shareTextToPackageName(link, packageName);
        } catch (Exception e){
            RexUtils.logger(e);
            Logger.printException(() -> "Error at externalDownloader", e);
        }
    }
}
