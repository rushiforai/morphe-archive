/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.entity;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import android.net.Uri;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.rex.downloader.MediaType;
import app.morphe.extension.instagram.constants.PostType;

import com.instagram.api.schemas.MusicInfo;
import com.instagram.common.session.UserSession;

public class MediaData extends Entity {
    private final Object obj;
    /** Picture sizes within this fraction of each other differ only by rounding. */
    public static final double ROUNDING_TOLERANCE = 0.02;
    private static final Pattern FRAME_RATE = Pattern.compile("frameRate=\"(\\d+)(?:/(\\d+))?\"");
    private final UserSession userSession;

    private static Object unwrapMediaCandidate(Object candidate) {
        Object unwrapped = Entity.unwrapEntityObject(candidate);
        if (unwrapped != null && unwrapped.getClass().getName().equals("com.instagram.model.reels.ReelItem")) {
            for (Class<?> c = unwrapped.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Field f : c.getDeclaredFields()) {
                    if (f.getType().getName().equals("com.instagram.feed.media.Media")) {
                        try {
                            f.setAccessible(true);
                            Object media = f.get(unwrapped);
                            if (media != null) return media;
                        } catch (Throwable ignored) {}
                    }
                }
            }
        }
        return unwrapped;
    }

    public MediaData(Object obj) {
        super(unwrapMediaCandidate(obj));
        this.obj = super.getObject();
        this.userSession = null;
    }

    public MediaData(Object obj, UserSession userSession) {
        super(unwrapMediaCandidate(obj));
        this.obj = super.getObject();
        this.userSession = userSession;
    }

    public UserSession getUserSession() {
        return this.userSession;
    }

    private Class<?> getHelperClass() throws Exception {
        return Class.forName("className");
    }

    // MediaData instances can outlive a single call (e.g. captured in a download dialog's click
    // listener), so only whether the wrapper field exists is cached, not its value - the value is
    // still re-read fresh every call. On current app versions the field is gone (see below), so
    // this only saves the repeated NoSuchFieldException on every uncached call.
    private Boolean extendedDataFieldExists;

    private Object getExtendedData() throws Exception {
        if (Boolean.FALSE.equals(extendedDataFieldExists)) return this.obj;

        try {
            Object result = super.getField("fieldName");
            extendedDataFieldExists = true;
            return result != null ? result : this.obj;
        } catch (Exception ignored) {
            // v441 folded the mutable media dict into Media itself, so there is no wrapper field to
            // hop through and the getters sit directly on the media object.
            extendedDataFieldExists = false;
            return this.obj;
        }
    }

    public String getShortcode() {
        try {
            long instaId = Long.parseLong(this.getPostID());
            String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
            if (instaId == 0) {
                return String.valueOf(alphabet.charAt(0));
            }
            StringBuilder shortCode = new StringBuilder();
            while (instaId > 0) {
                int remainder = (int) (instaId % 64);
                shortCode.append(alphabet.charAt(remainder));
                instaId = instaId / 64;
            }
            return shortCode.reverse().toString();
        } catch (Throwable ignored) {
            return "";
        }
    }

    public String getPostID() {
        try {
            String postId_ts = (String) super.getMethod(this.getExtendedData(), "getId");
            if (postId_ts != null && !postId_ts.isEmpty()) {
                return postId_ts.split("_")[0];
            }
        } catch (Exception ignored) {
        }
        try {
            String pk = this.getMediaPkId();
            if (pk != null && !pk.isEmpty()) {
                return pk.split("_")[0];
            }
        } catch (Exception ignored) {
        }
        return "0";
    }

    public PostType getPostType() {
        try {
            if (this.getCarouselSize() > 1) {
                return PostType.CAROUSEL;
            }
        } catch (Throwable ignored) {
        }
        try {
            String postType = this.getPostTypeKey();
            if (postType != null) {
                String lower = postType.toLowerCase();
                if (lower.equals("clips") || lower.contains("reel")) {
                    return PostType.REEL;
                }
                if (lower.equals("story") || lower.contains("reel_media")) {
                    return PostType.STORY;
                }
                if (lower.contains("carousel")) {
                    return PostType.CAROUSEL;
                }
            }
        } catch (Exception ignored) {
        }
        return PostType.POST;
    }

    private String getPostTypeKey() throws Exception {
        return (String) super.getField(this.getMoreExtendedData(), "fieldName");
    }

    private List<MediaData> getCarouselMediaData() throws Exception {
        List<MediaData> carouselMediaData = new ArrayList<>();
        List<Object> mediaList = this.getMediaList();
        if (mediaList == null || mediaList.isEmpty()) {
            carouselMediaData.add(new MediaData(this.obj, this.userSession));
        } else {
            mediaList.forEach(item -> {
                if (item != null) {
                    carouselMediaData.add(new MediaData(item, this.userSession));
                }
            });
            if (carouselMediaData.isEmpty()) {
                carouselMediaData.add(new MediaData(this.obj, this.userSession));
            }
        }
        return carouselMediaData;
    }

    public String getMediaPkId() throws Exception {
        try {
            String id = (String) super.getMethod("methodName");
            if (id != null && !id.isEmpty()) return id.split("_")[0];
        } catch (Exception ignored) {
        }
        try {
            String id = (String) super.getMethod(this.getExtendedData(), "getId");
            if (id != null && !id.isEmpty()) return id.split("_")[0];
        } catch (Exception ignored) {
        }
        return String.valueOf(System.currentTimeMillis() / 1000L);
    }

    public Long getTakenAtSeconds() throws Exception {
        try {
            return (Long) super.getMethod(this.getExtendedData(), "taken_at");
        } catch (Exception ignored) {
            return null;
        }
    }

    public boolean isVideo() throws Exception {
        try {
            return (boolean) super.getMethod(this.obj, "methodName");
        } catch (Exception ignored) {
        }
        try {
            List<VideoData> v = this.getVideoVariants();
            if (v != null && !v.isEmpty()) return true;
        } catch (Exception ignored) {
        }
        try {
            String dash = this.getVideoDashManifest();
            if (dash != null && !dash.isEmpty()) return true;
        } catch (Exception ignored) {
        }
        return false;
    }

    public boolean hasAudio() throws Exception {
        try {
            AudioMediaInterface audio = this.getAudioMedia();
            if (audio != null && audio.getAudioUrl() != null && !audio.getAudioUrl().trim().isEmpty()) {
                return true;
            }
        } catch (Throwable ignored) {
        }
        try {
            if (this.isVideo() && this.hasAudioTrack()) {
                for (DashVideoData dash : this.getDashVideos()) {
                    if (dash != null && dash.getAudioUrl() != null && !dash.getAudioUrl().trim().isEmpty()) {
                        return true;
                    }
                }
                String videoUrl = this.getVideoLink();
                if (videoUrl != null && !videoUrl.trim().isEmpty()) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /**
     * Resolves a direct downloadable audio URL (or fallback video stream containing audio)
     * across OriginalSoundDataIntf, TrackDataIntf, DASH audio renditions, DM voice notes,
     * and progressive MP4 streams so "Download Audio (.mp3)" never crashes with NullPointerException.
     */
    public String resolveAudioDownloadUrl() {
        try {
            AudioMediaInterface audio = this.getAudioMedia();
            if (audio != null) {
                String url = audio.getAudioUrl();
                if (url != null && !url.trim().isEmpty()) return url;
            }
        } catch (Throwable ignored) {
        }
        try {
            for (DashVideoData dash : this.getDashVideos()) {
                if (dash != null && dash.getAudioUrl() != null && !dash.getAudioUrl().trim().isEmpty()) {
                    return dash.getAudioUrl();
                }
            }
        } catch (Throwable ignored) {
        }
        try {
            String msgAudio = this.getMessageAudioUrl();
            if (msgAudio != null && !msgAudio.trim().isEmpty()) return msgAudio;
        } catch (Throwable ignored) {
        }
        try {
            if (this.isVideo()) {
                String videoUrl = this.getVideoLink();
                if (videoUrl != null && !videoUrl.trim().isEmpty()) return videoUrl;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    public String resolveAudioDownloadFileName(String fallbackUsername) {
        try {
            AudioMediaInterface audio = this.getAudioMedia();
            if (audio != null) {
                String name = audio.getDownloadName();
                if (name != null && !name.trim().isEmpty()) {
                    return name.endsWith(".mp3") ? name : (name + ".mp3");
                }
            }
        } catch (Throwable ignored) {
        }
        String safeUser = (fallbackUsername == null || fallbackUsername.isEmpty()) ? "instagram" : fallbackUsername;
        String pk = "audio";
        try {
            pk = getMediaPkId();
        } catch (Throwable ignored) {
        }
        return safeUser + "_" + pk + "_audio.mp3";
    }

    private String getMediaExtension(MediaType mediaType) throws Exception {
        String imageExtension = ".jpg";
        String videoExtension = ".mp4";
        String audioExtension = ".mp3";

        if (mediaType.equals(MediaType.ANY)) {
            if (this.isVideo()) {
                return videoExtension;
            }
            return imageExtension;
        }

        if (mediaType.equals(MediaType.IMAGE)) return imageExtension;
        if (mediaType.equals(MediaType.VIDEO)) return videoExtension;
        if (mediaType.equals(MediaType.AUDIO)) return audioExtension;

        return imageExtension;
    }

    public String getDownloadFilename(MediaType mediaType) throws Exception {
        String mediaPkId = this.getMediaPkId();
        String extension = this.getMediaExtension(mediaType);
        return mediaPkId + extension;
    }

    public String getVariantFileName(MediaInterface mediaIntfData) throws Exception {
        String mediaPkId = this.getMediaPkId();
        String variantTag = mediaIntfData.getVariantTag();
        String extension = this.getMediaExtension(mediaIntfData.getMediaType());
        return mediaPkId + "_" + variantTag + extension;
    }

    public UserData getUserDataWithoutUserSession() throws Exception {
        Object userData = super.getMethod(this.getExtendedData(), "methodName");
        return new UserData(userData);
    }

    public UserData getUserDataWithUserSession() throws Exception {
        Class<?> helperClass = this.getHelperClass();
        Object result = super.getMethod(helperClass, "methodname", this.userSession, this.obj);
        return result != null ? new UserData(result) : null;
    }

    public UserData getUserData() throws Exception {
        UserSession userSession = this.userSession;
        if (userSession != null) {
            try {
                UserData withSession = this.getUserDataWithUserSession();
                if (withSession != null && withSession.getObject() != null) {
                    return withSession;
                }
            } catch (Throwable ignored) {
            }
        }
        return this.getUserDataWithoutUserSession();
    }

    public HashSet<UserData> getStoryMentions() throws Exception {
        return getMentionSet();
    }

    public HashSet<UserData> getMentionSet() throws Exception {
        Object result = null;
        List<Object> receivers = new ArrayList<>();
        try {
            Object ext = this.getExtendedData();
            if (ext != null) receivers.add(ext);
        } catch (Throwable ignored) {}
        if (this.obj != null && !receivers.contains(this.obj)) {
            receivers.add(this.obj);
        }
        if (this.obj != null) {
            for (Class<?> c = this.obj.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Field f : c.getDeclaredFields()) {
                    String fType = f.getType().getName();
                    if (fType.contains("LiveTreeMediaDict") || fType.startsWith("X.") || fType.contains("MediaDict")) {
                        try {
                            f.setAccessible(true);
                            Object sub = f.get(this.obj);
                            if (sub != null && !receivers.contains(sub)) receivers.add(sub);
                        } catch (Throwable ignored) {}
                    }
                }
            }
        }

        for (Object recv : receivers) {
            if (recv == null) continue;
            try {
                result = super.getMethod(recv, "methodName");
                if (result != null) break;
            } catch (Throwable ignored) {}
        }

        // Fallback: scan receivers for any 0-arg method returning List/array of mention wrappers containing User
        if (result == null) {
            outer:
            for (Object recv : receivers) {
                if (recv == null) continue;
                for (Class<?> c = recv.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                    for (Method m : c.getDeclaredMethods()) {
                        if (m.getParameterTypes().length != 0) continue;
                        Class<?> rt = m.getReturnType();
                        if (List.class.isAssignableFrom(rt) || rt.isArray()) {
                            try {
                                m.setAccessible(true);
                                Object cand = m.invoke(recv);
                                if (cand instanceof List<?> && !((List<?>) cand).isEmpty()) {
                                    Object first = ((List<?>) cand).get(0);
                                    if (first != null && !first.getClass().getName().equals("com.instagram.feed.media.Media")
                                            && extractUserObjectFallback(first) != null) {
                                        result = cand;
                                        break outer;
                                    }
                                } else if (cand != null && cand.getClass().isArray() && java.lang.reflect.Array.getLength(cand) > 0) {
                                    Object first = java.lang.reflect.Array.get(cand, 0);
                                    if (first != null && !first.getClass().getName().equals("com.instagram.feed.media.Media")
                                            && extractUserObjectFallback(first) != null) {
                                        result = cand;
                                        break outer;
                                    }
                                }
                            } catch (Throwable ignored) {}
                        }
                    }
                }
            }
        }

        if (result == null) {
            return new HashSet<>();
        }
        List<Object> items = new ArrayList<>();
        if (result instanceof Iterable<?>) {
            for (Object o : (Iterable<?>) result) {
                if (o != null) items.add(o);
            }
        } else if (result.getClass().isArray()) {
            int len = java.lang.reflect.Array.getLength(result);
            for (int i = 0; i < len; i++) {
                Object o = java.lang.reflect.Array.get(result, i);
                if (o != null) items.add(o);
            }
        } else {
            items.add(result);
        }

        HashSet<UserData> userDataHashSet = new HashSet<>();
        HashSet<String> seenUserKeys = new HashSet<>();
        for (Object data : items) {
            if (data == null) continue;
            Object userObj = null;
            try {
                userObj = super.getMethod(data, "methodName2");
            } catch (Throwable ignored) {}
            if (userObj == null) {
                userObj = extractUserObjectFallback(data);
            }
            if (userObj != null) {
                UserData ud = new UserData(userObj);
                String dedupKey = null;
                try {
                    dedupKey = ud.getUsername();
                } catch (Throwable ignored) {}
                if (dedupKey == null || dedupKey.isEmpty()) {
                    try {
                        dedupKey = ud.getUserId();
                    } catch (Throwable ignored) {}
                }
                if (dedupKey == null || dedupKey.isEmpty() || seenUserKeys.add(dedupKey)) {
                    userDataHashSet.add(ud);
                }
            }
        }
        return userDataHashSet;
    }

    private static Object extractUserObjectFallback(Object interactionObj) {
        if (interactionObj == null) return null;
        String clsName = interactionObj.getClass().getName();
        if (clsName.contains("user.model.User")) return interactionObj;
        for (Method m : interactionObj.getClass().getMethods()) {
            if (m.getParameterCount() == 0 && m.getReturnType().getName().endsWith(".User")) {
                try {
                    Object v = m.invoke(interactionObj);
                    if (v != null) return v;
                } catch (Throwable ignored) {}
            }
        }
        for (Class<?> c = interactionObj.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (f.getType().getName().endsWith(".User")) {
                    try {
                        f.setAccessible(true);
                        Object v = f.get(interactionObj);
                        if (v != null) return v;
                    } catch (Throwable ignored) {}
                }
            }
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    public List<Object> getMediaList() throws Exception {
        // 1. Primary bytecode-patched carousel getter on Media
        try {
            Object raw = super.getMethod(this.getExtendedData(), "methodName");
            if (raw instanceof List) {
                List<Object> list = filterMediaElementList((List<?>) raw);
                if (!list.isEmpty()) {
                    return list;
                }
            }
        } catch (Throwable ignored) {
        }

        // 2. Fallback scan across Media and its underlying dict/Pando tree for List<Media>
        List<Object> fallback = resolveCarouselMediaFallback();
        if (fallback != null && !fallback.isEmpty()) {
            return fallback;
        }

        // 3. Single-item post fallback (never return an empty list of size 0)
        return this.obj != null ? Arrays.asList(this.obj) : Collections.emptyList();
    }

    private List<Object> filterMediaElementList(List<?> rawList) {
        if (rawList == null || rawList.isEmpty() || this.obj == null) return Collections.emptyList();
        Class<?> mediaClass = this.obj.getClass();
        List<Object> valid = new ArrayList<>(rawList.size());
        for (Object item : rawList) {
            if (item == null) continue;
            if (mediaClass.isInstance(item) || "com.instagram.feed.media.Media".equals(item.getClass().getName())) {
                valid.add(item);
            }
        }
        return valid;
    }

    private List<Object> resolveCarouselMediaFallback() {
        if (this.obj == null) return Collections.emptyList();
        Object[] targets;
        try {
            targets = new Object[]{this.getExtendedData(), this.getMoreExtendedData(), this.obj};
        } catch (Throwable ignored) {
            targets = new Object[]{this.obj};
        }

        for (Object target : targets) {
            if (target == null) continue;
            // Check fields holding a List of Media objects
            for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Field f : c.getDeclaredFields()) {
                    if (Modifier.isStatic(f.getModifiers()) || !List.class.isAssignableFrom(f.getType())) continue;
                    try {
                        f.setAccessible(true);
                        Object val = f.get(target);
                        if (val instanceof List) {
                            List<Object> filtered = filterMediaElementList((List<?>) val);
                            if (filtered.size() > 1) return filtered;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
            // Check no-arg methods returning List of Media objects
            for (Method m : target.getClass().getDeclaredMethods()) {
                if (Modifier.isStatic(m.getModifiers())
                        || m.getParameterCount() != 0
                        || !List.class.isAssignableFrom(m.getReturnType())) {
                    continue;
                }
                try {
                    m.setAccessible(true);
                    Object val = m.invoke(target);
                    if (val instanceof List) {
                        List<Object> filtered = filterMediaElementList((List<?>) val);
                        if (filtered.size() > 1) return filtered;
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return Collections.emptyList();
    }

    public int getCarouselSize() throws Exception {
        List<Object> list = this.getMediaList();
        return (list == null || list.isEmpty()) ? 1 : list.size();
    }

    public MediaData getMediaAt(int position) throws Exception {
        List<MediaData> mediaList = this.getCarouselMediaData();
        int safePosition = Math.max(0, Math.min(position, mediaList.size() - 1));
        return mediaList.get(safePosition);
    }

    private Object getMoreExtendedData() throws Exception {
        // This field always exists (unlike getExtendedData()'s), so there's no exception overhead
        // to save here - always read fresh since the instance can outlive a single call.
        try {
            Object more = super.getField(this.getExtendedData(), "fieldName");
            if (more != null) return more;
        } catch (Throwable ignored) {
        }
        return this.getExtendedData();
    }

    private List<VideoData> getVideoVariantsV1() throws Exception {
        Object variantObject = super.getMethod(this.getExtendedData(), "methodName");
        if (variantObject instanceof List) {
            List<?> variantList = (List<?>) variantObject;
            List<VideoData> videoList = new ArrayList<>();
            for (Object item : variantList) {
                if (item != null) videoList.add(new VideoData(item));
            }
            return videoList;
        }
        return null;
    }

    private List<VideoData> getVideoVariantsV2() throws Exception {
        Object variantObject = super.getField(this.getMoreExtendedData(), "fieldName");
        if (variantObject instanceof List) {
            List<?> variantList = (List<?>) variantObject;
            List<VideoData> videoList = new ArrayList<>();
            for (Object item : variantList) {
                if (item != null) videoList.add(new VideoData(item));
            }
            return videoList;
        }
        return null;
    }

    public List<VideoData> getVideoVariants() throws Exception {
        try {
            List<VideoData> v1 = this.getVideoVariantsV1();
            if (v1 != null && !v1.isEmpty()) return v1;
        } catch (Exception ignored) {
        }
        try {
            List<VideoData> v2 = this.getVideoVariantsV2();
            if (v2 != null && !v2.isEmpty()) return v2;
        } catch (Exception ignored) {
        }
        List<VideoData> fallback = resolveVideoVariantsFallback();
        if (!fallback.isEmpty()) return fallback;
        return new ArrayList<>();
    }

    private List<VideoData> resolveVideoVariantsFallback() {
        List<VideoData> results = new ArrayList<>();
        Object[] targets;
        try {
            targets = new Object[]{this.getExtendedData(), this.getMoreExtendedData(), this.obj};
        } catch (Throwable ignored) {
            targets = new Object[]{this.obj};
        }
        for (Object target : targets) {
            if (target == null) continue;
            for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Field f : c.getDeclaredFields()) {
                    if (Modifier.isStatic(f.getModifiers()) || !List.class.isAssignableFrom(f.getType())) continue;
                    try {
                        f.setAccessible(true);
                        Object v = f.get(target);
                        if (v instanceof List && isVideoCandidateList((List<?>) v)) {
                            for (Object item : (List<?>) v) {
                                if (item != null) results.add(new VideoData(item));
                            }
                            if (!results.isEmpty()) return results;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
            for (Method m : target.getClass().getDeclaredMethods()) {
                if (Modifier.isStatic(m.getModifiers())
                        || m.getParameterCount() != 0
                        || !List.class.isAssignableFrom(m.getReturnType())) {
                    continue;
                }
                try {
                    m.setAccessible(true);
                    Object v = m.invoke(target);
                    if (v instanceof List && isVideoCandidateList((List<?>) v)) {
                        for (Object item : (List<?>) v) {
                            if (item != null) results.add(new VideoData(item));
                        }
                        if (!results.isEmpty()) return results;
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return results;
    }

    private static boolean isVideoCandidateList(List<?> list) {
        if (list == null || list.isEmpty()) return false;
        Object first = null;
        for (Object item : list) {
            if (item != null) {
                first = item;
                break;
            }
        }
        if (first == null) return false;
        String clsName = first.getClass().getName();
        if (clsName.contains("VideoUrlImpl") || clsName.contains("VideoVersion")) {
            return true;
        }
        for (Class<?> iface : first.getClass().getInterfaces()) {
            if (iface.getName().contains("VideoVersion")) return true;
        }
        return false;
    }

    private Object getImageInfoByMethod() throws Exception {
        return super.getMethod(this.getExtendedData(), "imageInfoGetterMethod");
    }

    private Object resolveImageInfoObject() throws Exception {
        try {
            Object info = getImageInfoByMethod();
            if (info != null) return info;
        } catch (Exception ignored) {
        }
        try {
            Object info = super.getField(this.getMoreExtendedData(), "fieldName");
            if (info != null) return info;
        } catch (Exception ignored) {
        }
        // Fallback: locate any field or no-arg method returning ImageInfo (ImageInfoImpl / ImmutablePandoImageInfo)
        Object[] targets;
        try {
            targets = new Object[]{this.getExtendedData(), this.getMoreExtendedData(), this.obj};
        } catch (Throwable ignored) {
            targets = new Object[]{this.obj};
        }
        for (Object target : targets) {
            if (target == null) continue;
            for (Method m : target.getClass().getMethods()) {
                if (m.getParameterCount() == 0 && m.getReturnType().getName().endsWith(".ImageInfo")) {
                    try {
                        Object v = m.invoke(target);
                        if (v != null) return v;
                    } catch (Throwable ignored) {
                    }
                }
            }
            for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Field f : c.getDeclaredFields()) {
                    if (f.getType().getName().endsWith(".ImageInfo")) {
                        try {
                            f.setAccessible(true);
                            Object v = f.get(target);
                            if (v != null) return v;
                        } catch (Throwable ignored) {
                        }
                    }
                }
            }
        }
        return null;
    }

    /**
     * Resolves image variants across both {@code com.instagram.model.mediasize.ImageInfoImpl}
     * and {@code com.instagram.model.mediasize.ImmutablePandoImageInfo} without crashing when
     * obfuscated method or field names shift across Instagram versions (BUG-DL-001 & BUG-DL-002).
     */
    public List<ImageData> getImageVariants() throws Exception {
        Object imageInfoObject = resolveImageInfoObject();
        if (imageInfoObject == null) return new ArrayList<>();

        List<?> variantList = null;
        try {
            Object res = super.getMethod(imageInfoObject, "methodName");
            if (res instanceof List && !((List<?>) res).isEmpty()) {
                variantList = (List<?>) res;
            }
        } catch (Throwable ignored) {
        }

        if (variantList == null || variantList.isEmpty()) {
            variantList = resolveImageCandidateListFallback(imageInfoObject);
        }

        List<ImageData> imageList = new ArrayList<>();
        if (variantList != null) {
            for (Object item : variantList) {
                if (item != null) {
                    imageList.add(new ImageData(item));
                }
            }
        }
        return imageList;
    }

    private static List<?> resolveImageCandidateListFallback(Object imageInfoObject) {
        if (imageInfoObject == null) return Collections.emptyList();
        // 1. Check methods declared on com.instagram.model.mediasize.ImageInfo interface
        try {
            Class<?> imageInfoIface = Class.forName("com.instagram.model.mediasize.ImageInfo");
            if (imageInfoIface.isInstance(imageInfoObject)) {
                for (Method m : imageInfoIface.getDeclaredMethods()) {
                    if (m.getParameterCount() == 0 && List.class.isAssignableFrom(m.getReturnType())) {
                        try {
                            m.setAccessible(true);
                            Object v = m.invoke(imageInfoObject);
                            if (v instanceof List && !((List<?>) v).isEmpty()) {
                                return (List<?>) v;
                            }
                        } catch (Throwable ignored) {
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        // 2. Check no-arg List-returning methods on concrete class (ImageInfoImpl / ImmutablePandoImageInfo)
        for (Method m : imageInfoObject.getClass().getMethods()) {
            if (m.getParameterCount() == 0 && List.class.isAssignableFrom(m.getReturnType())) {
                try {
                    m.setAccessible(true);
                    Object v = m.invoke(imageInfoObject);
                    if (v instanceof List && isImageCandidateList((List<?>) v)) {
                        return (List<?>) v;
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        // 3. Check List fields on concrete class
        for (Class<?> c = imageInfoObject.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers()) || !List.class.isAssignableFrom(f.getType())) continue;
                try {
                    f.setAccessible(true);
                    Object v = f.get(imageInfoObject);
                    if (v instanceof List && isImageCandidateList((List<?>) v)) {
                        return (List<?>) v;
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return Collections.emptyList();
    }

    private static boolean isImageCandidateList(List<?> list) {
        if (list == null || list.isEmpty()) return false;
        for (Object item : list) {
            if (item == null) continue;
            String name = item.getClass().getName();
            if (name.contains("ExtendedImageUrl") || name.contains("ImageUrl") || name.contains("mediasize")) {
                return true;
            }
            try {
                ImageData candidate = new ImageData(item);
                String url = candidate.getUrl();
                if (url != null && (url.startsWith("http://") || url.startsWith("https://"))) {
                    return true;
                }
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    private Object[] getAdditionalImageCandidates() throws Exception {
        try {
            Object imageInfo = resolveImageInfoObject();
            if (imageInfo == null) return new Object[0];
            Class<?> imageInfoType = Class.forName("com.instagram.model.mediasize.ImageInfo");
            Object additional = null;
            try {
                additional = imageInfoType.getMethod("additionalMethod").invoke(imageInfo);
            } catch (Throwable ignored) {
                for (Method m : imageInfoType.getDeclaredMethods()) {
                    if (m.getParameterCount() == 0 && m.getReturnType().getName().endsWith(".AdditionalCandidates")) {
                        additional = m.invoke(imageInfo);
                        break;
                    }
                }
            }
            if (additional == null) return new Object[0];
            Class<?> additionalType = Class.forName("com.instagram.model.mediasize.AdditionalCandidates");
            try {
                return new Object[]{
                        additionalType.getMethod("firstFrameMethod").invoke(additional),
                        additionalType.getMethod("igtvFrameMethod").invoke(additional),
                        additionalType.getMethod("smartFrameMethod").invoke(additional)
                };
            } catch (Throwable ignored) {
                List<Object> frames = new ArrayList<>();
                for (Method m : additionalType.getDeclaredMethods()) {
                    if (m.getParameterCount() == 0 && m.getReturnType().getName().endsWith(".ExtendedImageUrl")) {
                        frames.add(m.invoke(additional));
                    }
                }
                return frames.toArray(new Object[0]);
            }
        } catch (Throwable ignored) {
            return new Object[0];
        }
    }

    public boolean isFirstFrameCover() {
        try {
            if (this.isStillVideo()) return true;
            ImageData cover = this.getBestImage();
            if (cover == null) return false;
            Object[] candidates = this.getAdditionalImageCandidates();
            for (int i = 0; i < Math.min(2, candidates.length); i++) {
                if (candidates[i] != null && sameCover(cover, new ImageData(candidates[i]))) return true;
            }
        } catch (Exception | LinkageError ignored) {
        }
        return false;
    }

    private static boolean sameCover(ImageData cover, ImageData candidate) throws Exception {
        String asset = imageAsset(cover.getUrl());
        int width = cover.getWidth();
        int height = cover.getHeight();
        int cw = candidate.getWidth();
        int ch = candidate.getHeight();
        // Additional frames may show a different image or aspect ratio.
        return asset != null && width > 0 && height > 0 && cw > 0 && ch > 0
                && asset.equals(imageAsset(candidate.getUrl()))
                && Math.abs((double) cw * height - (double) ch * width) <= (double) ch * width * ROUNDING_TOLERANCE;
    }

    private static String imageAsset(String url) {
        if (url == null) return null;
        String file = Uri.parse(url).getLastPathSegment();
        if (file == null) return null;
        int dot = file.lastIndexOf('.');
        return dot > 0 ? file.substring(0, dot) : null;
    }

    /**
     * Whether the video shows one picture throughout, as a photo with music does: every DASH
     * rendition plays at one frame a second or slower, written as 16384/16384.
     */
    private boolean isStillVideo() throws Exception {
        String manifest = getVideoDashManifest();
        if (manifest == null) return false;
        Matcher rate = FRAME_RATE.matcher(manifest);
        boolean found = false;
        while (rate.find()) {
            long frames = Long.parseLong(rate.group(1));
            long seconds = rate.group(2) == null ? 1 : Long.parseLong(rate.group(2));
            if (frames > seconds) return false;
            found = true;
        }
        return found;
    }

    // Through the app's getter, not the dict field it caches into: that field can stay null until
    // the getter has run once.
    private String getVideoDashManifest() throws Exception {
        try {
            return (String) super.getMethod(this.getExtendedData(), "methodName");
        } catch (Exception ignored) {
            return null;
        }
    }

    public enum AudioState {
        YES,
        NO,
        UNKNOWN
    }

    public AudioState getAudioTrackState() {
        try {
            Boolean hasAudio = (Boolean) super.getMethod(this.getExtendedData(), "methodName");
            if (hasAudio != null) {
                return hasAudio ? AudioState.YES : AudioState.NO;
            }
        } catch (Throwable ignored) {
        }
        try {
            if (this.getAudioMedia() != null) {
                return AudioState.YES;
            }
        } catch (Throwable ignored) {
        }
        return AudioState.UNKNOWN;
    }

    /** Whether the video has a sound track; returns false on unknown/exception rather than assuming audio exists. */
    public boolean hasAudioTrack() throws Exception {
        AudioState state = getAudioTrackState();
        if (state == AudioState.YES) return true;
        if (state == AudioState.NO) return false;
        try {
            for (DashVideoData dash : DashVideoData.parse(this.getVideoDashManifest())) {
                if (dash != null && dash.getAudioUrl() != null && !dash.getAudioUrl().trim().isEmpty()) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /**
     * The media's DASH video renditions (see {@link DashVideoData}) that keep its sound: empty
     * when the manifest lists no audio for a video that has some, since that would save it
     * silent, and without a manifest or on any failure.
     */
    public List<DashVideoData> getDashVideos() {
        try {
            List<DashVideoData> videos = DashVideoData.parse(this.getVideoDashManifest());
            boolean silent = !videos.isEmpty() && videos.get(0).getAudioUrl() == null && this.hasAudioTrack();
            return silent ? new ArrayList<>() : videos;
        } catch (Exception e) {
            Logger.printException(() -> "Could not read the DASH manifest", e);
            return new ArrayList<>();
        }
    }

    /** The sharpest DASH rendition when it beats the progressive file the media downloads as by default; null otherwise. */
    public DashVideoData getSharperDashVideo() throws Exception {
        List<DashVideoData> videos = this.getDashVideos();
        if (videos.isEmpty()) return null;
        VideoData progressive = this.getBestVideo();
        int progressiveShortSide = progressive == null ? 0 : progressive.shortSide();
        return videos.get(0).shortSide() > progressiveShortSide ? videos.get(0) : null;
    }

    private static <T extends MediaInterface> T highestResolution(List<T> variants) throws Exception {
        T best = null;
        long bestResolution = -1;
        long bestPixels = -1;
        if (variants == null) return null;
        for (T variant : variants) {
            if (variant == null) continue;
            String url = variant.getUrl();
            if (url == null || url.trim().isEmpty()) continue;
            Integer width = variant.getWidth();
            Integer height = variant.getHeight();
            boolean known = width != null && height != null && width > 0 && height > 0;
            long pixels = known ? (long) width * height : 0;
            long resolution = variant.getMediaType() == MediaType.VIDEO
                    ? known ? Math.min(width, height) : 0
                    : pixels;
            if (resolution > bestResolution || (resolution == bestResolution && pixels > bestPixels)) {
                best = variant;
                bestResolution = resolution;
                bestPixels = pixels;
            }
        }
        return best;
    }

    public VideoData getBestVideo() throws Exception {
        return highestResolution(this.getVideoVariants());
    }

    public ImageData getBestOriginalImage() throws Exception {
        return highestResolution(this.getImageVariants());
    }

    public ImageData getBestImage() throws Exception {
        ImageData original = this.getBestOriginalImage();
        ImageData best = original;
        if (original == null) return null;
        try {
            if (!this.isVideo()) return original;
            long bestPixels = (long) original.getWidth() * original.getHeight();
            for (Object value : this.getAdditionalImageCandidates()) {
                if (value == null) continue;
                ImageData candidate = new ImageData(value);
                long pixels = (long) candidate.getWidth() * candidate.getHeight();
                if (pixels > bestPixels && sameCover(original, candidate)) {
                    best = candidate;
                    bestPixels = pixels;
                }
            }
        } catch (Exception | LinkageError ignored) {
        }
        return best;
    }

    public String getVideoLink() throws Exception {
        VideoData video = this.getBestVideo();
        if (video != null && video.getUrl() != null && !video.getUrl().isEmpty()) {
            return video.getUrl();
        }
        List<DashVideoData> dash = this.getDashVideos();
        if (!dash.isEmpty() && dash.get(0).getUrl() != null) {
            return dash.get(0).getUrl();
        }
        return null;
    }

    public String getImageLink() throws Exception {
        ImageData image = this.getBestImage();
        return image == null ? null : image.getUrl();
    }

    public String getMediaLink() throws Exception {
        if (this.isVideo()) {
            String videoLink = this.getVideoLink();
            if (videoLink != null && !videoLink.isEmpty()) return videoLink;
        }
        return this.getImageLink();
    }

    private OriginalSoundDataIntf getOriginalSoundDataIntf() throws Exception {
        try {
            Class<?> helperClass = this.getHelperClass();
            Object result = super.getMethod(helperClass, "A06", this.obj);
            if (result != null) {
                return new OriginalSoundDataIntf(result);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private TrackDataIntf getTrackDataIntf() throws Exception {
        try {
            Object metadata = super.getMethod(this.obj, "clipsMetadata");
            Object result;
            if (metadata != null) {
                result = super.getMethod(metadata, "clipsMusicInfo");
            } else {
                metadata = super.getMethod(this.obj, "musicMetadata");
                if (metadata == null) return null;
                result = super.getMethod(metadata, "musicInfo");
            }
            if (result != null) {
                return new TrackDataIntf((MusicInfo) result);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    public AudioMediaInterface getAudioMedia() throws Exception {
        AudioMediaInterface originalSoundDataIntf = this.getOriginalSoundDataIntf();
        if (originalSoundDataIntf != null) {
            return originalSoundDataIntf;
        }

        AudioMediaInterface trackDataIntf = this.getTrackDataIntf();
        if (trackDataIntf != null) {
            return trackDataIntf;
        }
        return null;
    }

    public String getDescriptionText() throws Exception {
        try {
            Class<?> helperClass = this.getHelperClass();
            Object result = super.getMethod(helperClass, "A0J", this.obj);
            return result != null ? (String) super.getField(result, "A0Z") : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    public String getMessageAudioUrl() throws Exception {
        try {
            Object audioIntfObject = super.getMethod(this.getExtendedData(), "methodName");
            return audioIntfObject != null ? (String) super.getMethod(audioIntfObject, "BAj") : null;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
