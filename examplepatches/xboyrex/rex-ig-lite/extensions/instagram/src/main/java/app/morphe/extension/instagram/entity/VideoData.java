/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.entity;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import app.morphe.extension.rex.downloader.MediaType;

public class VideoData extends Entity implements VideoVariant {
    public VideoData(Object obj) {
        super(obj);
    }

    public Integer getHeight() throws Exception {
        try {
            Integer height = (Integer) super.getMethod("methodname");
            if (height != null && height > 0) return height;
        } catch (Exception ignored) {
        }
        try {
            Integer height = (Integer) super.getMethod("getHeight");
            if (height != null && height > 0) return height;
        } catch (Exception ignored) {
        }
        return resolveIntDimension(false);
    }

    public Integer getWidth() throws Exception {
        try {
            Integer width = (Integer) super.getMethod("methodname");
            if (width != null && width > 0) return width;
        } catch (Exception ignored) {
        }
        try {
            Integer width = (Integer) super.getMethod("getWidth");
            if (width != null && width > 0) return width;
        } catch (Exception ignored) {
        }
        return resolveIntDimension(true);
    }

    private Integer resolveIntDimension(boolean first) {
        if (this.obj == null) return 0;
        try {
            int idx = 0;
            for (Field f : this.obj.getClass().getDeclaredFields()) {
                Class<?> ft = f.getType();
                if (ft == int.class || ft == Integer.class) {
                    f.setAccessible(true);
                    Object v = f.get(this.obj);
                    if (v instanceof Number) {
                        int val = ((Number) v).intValue();
                        if (val >= 120 && val <= 8192) {
                            if ((first && idx == 0) || (!first && idx == 1)) return val;
                            idx++;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    private Integer getCodec() throws Exception {
        try {
            Integer codec = (Integer) super.getMethod("methodname");
            return codec != null ? codec : 0;
        } catch (Exception ignored) {
            return 0;
        }
    }

    public String getVariantTag() {
        try {
            return this.getHeight() + "x" + this.getWidth() + "-" + this.getCodec();
        } catch (Exception e) {
            return "unknown";
        }
    }

    public String getUrl() throws Exception {
        try {
            String url = (String) super.getMethod("methodname");
            if (url != null && !url.isEmpty()) return url;
        } catch (Exception ignored) {
        }
        try {
            String url = (String) super.getMethod("getUrl");
            if (url != null && !url.isEmpty()) return url;
        } catch (Exception ignored) {
        }
        if (this.obj != null) {
            try {
                for (Method m : this.obj.getClass().getMethods()) {
                    if (m.getParameterCount() == 0 && m.getReturnType() == String.class) {
                        Object v = m.invoke(this.obj);
                        if (v instanceof String) {
                            String s = (String) v;
                            if (s.startsWith("http://") || s.startsWith("https://")) return s;
                        }
                    }
                }
                for (Field f : this.obj.getClass().getDeclaredFields()) {
                    if (f.getType() == String.class) {
                        f.setAccessible(true);
                        Object v = f.get(this.obj);
                        if (v instanceof String) {
                            String s = (String) v;
                            if (s.startsWith("http://") || s.startsWith("https://")) return s;
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    public MediaType getMediaType() {
        return MediaType.VIDEO;
    }
}
