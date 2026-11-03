/*
 * Zerobun Morphe patches - GPLv3.
 */

package app.zerobun.extension.followertrack;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.concurrent.ConcurrentHashMap;

/** Cached reflection by name, walking superclasses. Names come from {@link Config}. */
final class Reflect {
    private static final ConcurrentHashMap<String, Field> FIELDS = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Method> METHODS = new ConcurrentHashMap<>();

    private Reflect() {}

    static Object field(Object obj, String name) throws Exception {
        if (obj == null || name == null) return null;
        String key = obj.getClass().getName() + "#" + name;
        Field f = FIELDS.get(key);
        if (f == null) {
            for (Class<?> c = obj.getClass(); c != null && f == null; c = c.getSuperclass()) {
                try {
                    f = c.getDeclaredField(name);
                } catch (NoSuchFieldException ignored) {
                }
            }
            if (f == null) throw new NoSuchFieldException(name);
            f.setAccessible(true);
            FIELDS.put(key, f);
        }
        return f.get(obj);
    }

    static Object call(Object obj, String name) throws Exception {
        if (obj == null || name == null) return null;
        String key = obj.getClass().getName() + "#" + name;
        Method m = METHODS.get(key);
        if (m == null) {
            for (Class<?> c = obj.getClass(); c != null && m == null; c = c.getSuperclass()) {
                try {
                    m = c.getDeclaredMethod(name);
                } catch (NoSuchMethodException ignored) {
                }
            }
            if (m == null) throw new NoSuchMethodException(name);
            m.setAccessible(true);
            METHODS.put(key, m);
        }
        return m.invoke(obj);
    }

    static String str(Object o) {
        return o == null ? "" : String.valueOf(o);
    }
}
