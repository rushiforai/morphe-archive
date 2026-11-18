/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.entity;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import com.instagram.common.session.UserSession;
import com.instagram.common.typedurl.ImageUrl;

public class UserData extends Entity {
    private final Object obj;

    public UserData(Object obj) {
        super(obj);
        this.obj = obj;
    }

    public Object getAdditionalUserInfo() {
        return this.obj;
    }

    private Object resolveUserDictTarget() {
        if (this.obj == null) return null;
        for (Class<?> c = this.obj.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                String tName = f.getType().getName();
                if (tName.contains("LiveTreeUserDict") || tName.contains("UserDict")) {
                    try {
                        f.setAccessible(true);
                        Object dict = f.get(this.obj);
                        if (dict != null) return dict;
                    } catch (Throwable ignored) {
                    }
                }
            }
        }
        return this.obj;
    }

    public Boolean isPrivate() throws Exception {
        Object additionalUserInfo = getAdditionalUserInfo();
        try {
            return (Boolean) super.getMethod(additionalUserInfo, "isPrivate");
        } catch (Throwable ignored) {
            return (Boolean) super.getMethod(resolveUserDictTarget(), "isPrivate");
        }
    }

    public Boolean isVerified() throws Exception {
        Object additionalUserInfo = getAdditionalUserInfo();
        try {
            Boolean v = (Boolean) super.getMethod(additionalUserInfo, "isVerified");
            if (v != null) return v;
        } catch (Throwable ignored) {
        }
        try {
            Object dict = resolveUserDictTarget();
            if (dict != null && dict != additionalUserInfo) {
                Boolean v = (Boolean) super.getMethod(dict, "isVerified");
                if (v != null) return v;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    public String getUsername() throws Exception {
        Object additionalUserInfo = getAdditionalUserInfo();
        try {
            String u = (String) super.getMethod(additionalUserInfo, "methodName");
            if (u != null && !u.isEmpty()) return u;
        } catch (Throwable ignored) {
        }
        try {
            Object dict = resolveUserDictTarget();
            if (dict != null && dict != additionalUserInfo) {
                String u = (String) super.getMethod(dict, "methodName");
                if (u != null && !u.isEmpty()) return u;
            }
        } catch (Throwable ignored) {
        }
        return "";
    }

    public String getFullName() throws Exception {
        Object additionalUserInfo = getAdditionalUserInfo();
        try {
            String name = (String) super.getMethod(additionalUserInfo, "methodName");
            if (name != null && !name.isEmpty()) {
                return name;
            }
        } catch (Throwable ignored) {
        }
        try {
            Object dict = resolveUserDictTarget();
            if (dict != null && dict != additionalUserInfo) {
                String name = (String) super.getMethod(dict, "methodName");
                if (name != null && !name.isEmpty()) {
                    return name;
                }
            }
        } catch (Throwable ignored) {
        }
        return this.getUsername();
    }

    public String getBio() throws Exception {
        Object additionalUserInfo = getAdditionalUserInfo();
        try {
            return (String) super.getMethod(additionalUserInfo, "BCu");
        } catch (Throwable ignored) {
            return (String) super.getMethod(resolveUserDictTarget(), "BCu");
        }
    }

    /**
     * Resolves the user's profile picture URL across:
     * 1) HD profile picture info (ProfilePicUrlInfo -> getUrl())
     * 2) Standard / Story Mention profile picture (ImageUrl -> getUrl())
     * 3) Reflective fallback across User and LiveTreeUserDict for any 0-arg ImageUrl / ProfilePicUrlInfo getter
     */
    public String getProfilePictureUrl() throws Exception {
        Object additionalUserInfo = getAdditionalUserInfo();
        try {
            Object profilePicObject = super.getMethod(additionalUserInfo, "Bvt");
            String url = extractImageUrlString(profilePicObject);
            if (!url.isEmpty()) return url;
        } catch (Throwable ignored) {
        }
        try {
            ImageUrl lowRes = getLowResProfilePicture();
            String url = extractImageUrlString(lowRes);
            if (!url.isEmpty()) return url;
        } catch (Throwable ignored) {
        }
        Object dict = resolveUserDictTarget();
        for (Object target : new Object[]{additionalUserInfo, dict}) {
            if (target == null) continue;
            for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Method m : c.getDeclaredMethods()) {
                    if (m.getParameterTypes().length != 0) continue;
                    String rt = m.getReturnType().getName();
                    if (rt.endsWith("ImageUrl") || rt.contains("ProfilePicUrlInfo")) {
                        try {
                            m.setAccessible(true);
                            String url = extractImageUrlString(m.invoke(target));
                            if (!url.isEmpty()) return url;
                        } catch (Throwable ignored) {
                        }
                    }
                }
            }
        }
        return "";
    }

    private static String extractImageUrlString(Object candidate) {
        if (candidate == null) return "";
        if (candidate instanceof String) {
            String s = ((String) candidate).trim();
            return (s.startsWith("http://") || s.startsWith("https://")) ? s : "";
        }
        try {
            Method m = candidate.getClass().getMethod("getUrl");
            Object val = m.invoke(candidate);
            if (val instanceof String && !((String) val).trim().isEmpty()) {
                return ((String) val).trim();
            }
        } catch (Throwable ignored) {
        }
        try {
            Entity entity = new Entity(candidate);
            Object val = entity.getMethod("getUrl");
            if (val instanceof String && !((String) val).trim().isEmpty()) {
                return ((String) val).trim();
            }
        } catch (Throwable ignored) {
        }
        return "";
    }

    public String refreshProfilePictureUrl(UserSession session) throws Exception {
        String userId = getUserId();
        if (session == null || userId == null || userId.isEmpty()) return null;
        Object result = fetchProfileUser(session, userId);
        if (result == null) return null;
        UserData refreshed = new UserData(result);
        return userId.equals(refreshed.getUserId()) ? refreshed.getProfilePictureUrl() : null;
    }

    public Object fetchProfileUser(UserSession session, String userId) {
        // Replaced with Instagram's synchronous profile request. Called on the image worker.
        return null;
    }

    public ImageUrl getLowResProfilePicture() throws Exception {
        Object additionalUserInfo = getAdditionalUserInfo();
        try {
            Object imageUrlObject = super.getMethod(additionalUserInfo, "mediaName");
            if (imageUrlObject instanceof ImageUrl) return (ImageUrl) imageUrlObject;
        } catch (Throwable ignored) {
        }
        try {
            Object dict = resolveUserDictTarget();
            if (dict != null && dict != additionalUserInfo) {
                Object imageUrlObject = super.getMethod(dict, "mediaName");
                if (imageUrlObject instanceof ImageUrl) return (ImageUrl) imageUrlObject;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    /** The public permalink of this profile: what "share" and "copy link" both hand out. */
    public String getProfileLink() throws Exception {
        return "https://www.instagram.com/" + getUsername() + "/";
    }

    public String getUserId() throws Exception {
        try {
            String id = (String) super.getMethod(this.obj, "getId");
            if (id != null && !id.isEmpty()) return id;
        } catch (Throwable ignored) {
        }
        return (String) super.getMethod(resolveUserDictTarget(), "getId");
    }

    public UserFriendshipStatus getUserFriendshipStatus() throws Exception {
        Object additionalUserInfo = getAdditionalUserInfo();
        Object friendshipStatusObject = super.getMethod(additionalUserInfo, "methodname");
        return new UserFriendshipStatus(friendshipStatusObject);
    }
}