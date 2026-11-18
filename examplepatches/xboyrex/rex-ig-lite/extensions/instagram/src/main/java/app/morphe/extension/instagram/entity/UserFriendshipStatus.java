/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.entity;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.HashMap;
import java.util.Locale;
import app.morphe.extension.rex.RexUtils;

public class UserFriendshipStatus extends Entity {
    private final Object obj;
    private boolean lastExtractionSucceeded;

    public UserFriendshipStatus(Object obj) {
        super(obj);
        this.obj = super.getObject();
    }

    @SuppressWarnings("unchecked")
    public Map<String, Boolean> getMappings() {
        Map<String, Boolean> result = new HashMap<>();
        lastExtractionSucceeded = false;
        if (this.obj == null) {
            return result;
        }
        try {
            Class<?> helperClass = Class.forName("classname");
            Object raw = super.getMethod(helperClass, "methodname",
                    new Class[]{Class.forName("friendshipstatusclass")}, this.obj);
            if (raw instanceof Map) {
                Map<?, ?> rawMap = (Map<?, ?>) raw;
                for (Map.Entry<?, ?> entry : rawMap.entrySet()) {
                    if (entry.getKey() != null && entry.getValue() instanceof Boolean) {
                        result.put(String.valueOf(entry.getKey()), (Boolean) entry.getValue());
                    }
                }
                if (!result.isEmpty()) {
                    lastExtractionSucceeded = true;
                    return result;
                }
            }
        } catch (Exception e) {
            RexUtils.logger(e);
        }

        // Reflective fallback over FriendshipStatus object getters/fields when mapper is unavailable
        try {
            for (Class<?> c = this.obj.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Method m : c.getDeclaredMethods()) {
                    if (m.getParameterTypes().length == 0 && (m.getReturnType() == Boolean.class || m.getReturnType() == boolean.class)) {
                        try {
                            m.setAccessible(true);
                            Object v = m.invoke(this.obj);
                            if (v instanceof Boolean) {
                                String key = normalizeKey(m.getName());
                                if (!key.isEmpty()) result.putIfAbsent(key, (Boolean) v);
                            }
                        } catch (Throwable ignored) {}
                    }
                }
                for (Field f : c.getDeclaredFields()) {
                    if (f.getType() == Boolean.class || f.getType() == boolean.class) {
                        try {
                            f.setAccessible(true);
                            Object v = f.get(this.obj);
                            if (v instanceof Boolean) {
                                String key = normalizeKey(f.getName());
                                if (!key.isEmpty()) result.putIfAbsent(key, (Boolean) v);
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            }
            if (!result.isEmpty()) {
                lastExtractionSucceeded = true;
            }
        } catch (Throwable ignored) {}
        return result;
    }

    private static String normalizeKey(String raw) {
        if (raw == null || raw.isEmpty()) return "";
        String s = raw;
        if (s.startsWith("get") && s.length() > 3 && Character.isUpperCase(s.charAt(3))) {
            s = s.substring(3);
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (Character.isUpperCase(ch)) {
                if (i > 0) sb.append('_');
                sb.append(Character.toLowerCase(ch));
            } else {
                sb.append(ch);
            }
        }
        return sb.toString().toLowerCase(Locale.ROOT);
    }

    public boolean isExtractionSuccessful() {
        return lastExtractionSucceeded;
    }

    public Boolean getNullableValue(String key) {
        Map<String, Boolean> mappings = getMappings();
        return mappings.get(key);
    }

    private Boolean getValue(String key) throws Exception {
        Map<String, Boolean> mappings = getMappings();
        return mappings.getOrDefault(key, false);
    }

    public Boolean getFollowBackStatus() throws Exception {
        return getValue("followed_by");
    }

    public Boolean getFollowingStatus() throws Exception {
        return getValue("following");
    }
}
