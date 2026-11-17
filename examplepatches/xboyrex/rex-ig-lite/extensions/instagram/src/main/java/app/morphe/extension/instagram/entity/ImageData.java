/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.entity;

import com.instagram.model.mediasize.ExtendedImageUrl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import app.morphe.extension.rex.downloader.MediaType;

public class ImageData extends Entity implements MediaInterface {
    private final Object rawObj;
    private final ExtendedImageUrl typedObj;

    public ImageData(Object obj) {
        super(obj);
        this.rawObj = obj;
        this.typedObj = obj instanceof ExtendedImageUrl ? (ExtendedImageUrl) obj : null;
    }

    public Integer getHeight() throws Exception {
        if (typedObj != null) {
            try {
                return Integer.valueOf(typedObj.getHeight());
            } catch (Throwable ignored) {
            }
        }
        return resolveDimension("getHeight", "height", false);
    }

    public Integer getWidth() throws Exception {
        if (typedObj != null) {
            try {
                return Integer.valueOf(typedObj.getWidth());
            } catch (Throwable ignored) {
            }
        }
        return resolveDimension("getWidth", "width", true);
    }

    private Integer resolveDimension(String getterName, String keyword, boolean firstDimension) {
        if (rawObj == null) return 0;
        try {
            Object v = super.getMethod(rawObj, getterName);
            if (v instanceof Number) return ((Number) v).intValue();
        } catch (Throwable ignored) {
        }
        try {
            for (Method m : rawObj.getClass().getMethods()) {
                if (m.getParameterCount() == 0 && m.getName().toLowerCase().contains(keyword)) {
                    Class<?> rt = m.getReturnType();
                    if (rt == int.class || rt == Integer.class) {
                        Object val = m.invoke(rawObj);
                        if (val instanceof Number) return ((Number) val).intValue();
                    }
                }
            }
            int foundCount = 0;
            for (Field f : rawObj.getClass().getDeclaredFields()) {
                Class<?> ft = f.getType();
                if (ft == int.class || ft == Integer.class) {
                    f.setAccessible(true);
                    Object val = f.get(rawObj);
                    if (val instanceof Number) {
                        int dim = ((Number) val).intValue();
                        if (dim > 0 && dim <= 16384) {
                            if ((firstDimension && foundCount == 0) || (!firstDimension && foundCount == 1)) {
                                return dim;
                            }
                            foundCount++;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    public String getVariantTag() {
        try {
            return this.getHeight() + "x" + this.getWidth();
        } catch (Exception e) {
            return "unknown";
        }
    }

    public String getUrl() throws Exception {
        if (typedObj != null) {
            try {
                String url = typedObj.getUrl();
                if (url != null && !url.isEmpty()) return url;
            } catch (Throwable ignored) {
            }
        }
        if (rawObj == null) return null;
        if (rawObj instanceof String) return (String) rawObj;
        try {
            Object v = super.getMethod(rawObj, "getUrl");
            if (v instanceof String && !((String) v).isEmpty()) return (String) v;
        } catch (Throwable ignored) {
        }
        try {
            for (Method m : rawObj.getClass().getMethods()) {
                if (m.getParameterCount() == 0 && m.getReturnType() == String.class) {
                    Object val = m.invoke(rawObj);
                    if (val instanceof String) {
                        String s = (String) val;
                        if (s.startsWith("http://") || s.startsWith("https://")) return s;
                    }
                }
            }
            for (Field f : rawObj.getClass().getDeclaredFields()) {
                if (f.getType() == String.class) {
                    f.setAccessible(true);
                    Object val = f.get(rawObj);
                    if (val instanceof String) {
                        String s = (String) val;
                        if (s.startsWith("http://") || s.startsWith("https://")) return s;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    public MediaType getMediaType() {
        return MediaType.IMAGE;
    }
}