/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.entity;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.concurrent.ConcurrentHashMap;

public class Entity {
    protected final Object obj;

    // Entity getters run on every RecyclerView bind and list scroll, so the Field/Method a name
    // resolves to is cached instead of re-resolved (and re-setAccessible'd) on every call.
    private static final ConcurrentHashMap<Class<?>, ConcurrentHashMap<String, Field>> FIELD_CACHE = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<Class<?>, ConcurrentHashMap<String, Method>> METHOD_CACHE = new ConcurrentHashMap<>();
    private static final Class<?>[] NO_PARAM_TYPES = new Class<?>[0];

    public Entity(Object obj) {
        this.obj = obj;
    }

    public Entity() {
        this.obj = null;
    }

    public Object getObject() {
        return this.obj;
    }

    public Class<?> getObjClass() throws ClassNotFoundException {
        return this.obj.getClass();
    }

    public Entity construct(String className, Class<?>[] paramTypes, Object... params) throws Exception {
        Class<?> clazz = Class.forName(className);
        Constructor<?> constructor = clazz.getDeclaredConstructor(paramTypes);
        constructor.setAccessible(true);
        Object instance = constructor.newInstance(params);
        return new Entity(instance);
    }

    public Object getField(Class cls, Object clsObj, String fieldName) throws Exception {
        return resolveField(cls, fieldName).get(clsObj);
    }

    private static Field resolveField(Class<?> cls, String fieldName) throws NoSuchFieldException {
        if (cls == null || fieldName == null) {
            throw new NoSuchFieldException("Null class or fieldName: " + fieldName);
        }
        ConcurrentHashMap<String, Field> classCache = FIELD_CACHE.computeIfAbsent(cls, c -> new ConcurrentHashMap<>());
        Field cached = classCache.get(fieldName);
        if (cached != null) return cached;

        Field found = null;
        for (Class<?> current = cls; current != null && found == null; current = current.getSuperclass()) {
            try {
                found = current.getDeclaredField(fieldName);
            } catch (NoSuchFieldException ignored) {
            }
        }
        if (found == null) {
            try {
                found = cls.getField(fieldName);
            } catch (NoSuchFieldException ignored) {
            }
        }
        if (found == null) {
            throw new NoSuchFieldException(cls.getName() + "." + fieldName);
        }
        found.setAccessible(true);
        classCache.putIfAbsent(fieldName, found);
        return classCache.get(fieldName);
    }

    public Object getField(Object clsObj, String fieldName) throws Exception {
        if (clsObj == null) throw new NullPointerException("Cannot read field " + fieldName + " on null target");
        return getField(clsObj.getClass(), clsObj, fieldName);
    }

    public Object getField(String fieldName) throws Exception {
        return getField(this.obj, fieldName);
    }

    public Entity getFieldAsEntity(String fieldName) throws Exception {
        Object object = getField(fieldName);
        return new Entity(object);
    }

    public Object getMethod(Object clsObj, String methodName, Class<?>[] paramTypes, Object... params) throws Exception {
        if (clsObj == null) {
            throw new NullPointerException("Cannot invoke method " + methodName + " on null target");
        }
        Class<?> clazz;
        Object receiver;
        if (clsObj instanceof Class<?>) {
            clazz = (Class<?>) clsObj;
            receiver = null;
        } else {
            clazz = clsObj.getClass();
            receiver = clsObj;
        }

        Method method = resolveMethod(clazz, methodName, paramTypes);
        return method.invoke(receiver, params);
    }

    private static Method resolveMethod(Class<?> cls, String methodName, Class<?>[] paramTypes) throws NoSuchMethodException {
        if (cls == null || methodName == null) {
            throw new NoSuchMethodException("Null class or methodName: " + methodName);
        }
        Class<?>[] safeParams = paramTypes == null ? NO_PARAM_TYPES : paramTypes;
        String key = methodCacheKey(methodName, safeParams);
        ConcurrentHashMap<String, Method> classCache = METHOD_CACHE.computeIfAbsent(cls, c -> new ConcurrentHashMap<>());
        Method cached = classCache.get(key);
        if (cached != null) return cached;

        Method found = findMethodInHierarchy(cls, methodName, safeParams);
        if (found == null) {
            throw new NoSuchMethodException(cls.getName() + "." + methodName + parameterSignature(safeParams));
        }
        found.setAccessible(true);
        classCache.putIfAbsent(key, found);
        return classCache.get(key);
    }

    private static Method findMethodInHierarchy(Class<?> cls, String methodName, Class<?>[] paramTypes) {
        // 1. Exact declared method on class or superclass hierarchy
        for (Class<?> current = cls; current != null; current = current.getSuperclass()) {
            try {
                return current.getDeclaredMethod(methodName, paramTypes);
            } catch (NoSuchMethodException ignored) {
            }
        }
        // 2. Public method on class or implemented interfaces
        try {
            return cls.getMethod(methodName, paramTypes);
        } catch (NoSuchMethodException ignored) {
        }
        // 3. Declared method on implemented interfaces (including super-interfaces)
        for (Class<?> current = cls; current != null; current = current.getSuperclass()) {
            for (Class<?> iface : current.getInterfaces()) {
                Method m = findMethodInInterface(iface, methodName, paramTypes);
                if (m != null) return m;
            }
        }
        // 4. Compatible parameter types (e.g. parameter is an interface or superclass of runtime argument)
        for (Class<?> current = cls; current != null; current = current.getSuperclass()) {
            for (Method candidate : current.getDeclaredMethods()) {
                if (candidate.getName().equals(methodName) && parametersCompatible(candidate.getParameterTypes(), paramTypes)) {
                    return candidate;
                }
            }
        }
        for (Method candidate : cls.getMethods()) {
            if (candidate.getName().equals(methodName) && parametersCompatible(candidate.getParameterTypes(), paramTypes)) {
                return candidate;
            }
        }
        return null;
    }

    private static Method findMethodInInterface(Class<?> iface, String methodName, Class<?>[] paramTypes) {
        if (iface == null) return null;
        try {
            return iface.getDeclaredMethod(methodName, paramTypes);
        } catch (NoSuchMethodException ignored) {
        }
        for (Class<?> superIface : iface.getInterfaces()) {
            Method m = findMethodInInterface(superIface, methodName, paramTypes);
            if (m != null) return m;
        }
        return null;
    }

    private static boolean parametersCompatible(Class<?>[] declared, Class<?>[] actual) {
        if (declared.length != actual.length) return false;
        for (int i = 0; i < declared.length; i++) {
            if (actual[i] == null) continue;
            if (!wrapPrimitive(declared[i]).isAssignableFrom(wrapPrimitive(actual[i]))) {
                return false;
            }
        }
        return true;
    }

    private static Class<?> wrapPrimitive(Class<?> type) {
        if (!type.isPrimitive()) return type;
        if (type == boolean.class) return Boolean.class;
        if (type == int.class) return Integer.class;
        if (type == long.class) return Long.class;
        if (type == float.class) return Float.class;
        if (type == double.class) return Double.class;
        if (type == byte.class) return Byte.class;
        if (type == short.class) return Short.class;
        if (type == char.class) return Character.class;
        return type;
    }

    private static String parameterSignature(Class<?>[] paramTypes) {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < paramTypes.length; i++) {
            if (i > 0) sb.append(", ");
            sb.append(paramTypes[i] == null ? "null" : paramTypes[i].getName());
        }
        return sb.append("]").toString();
    }

    private static String methodCacheKey(String methodName, Class<?>[] paramTypes) {
        StringBuilder key = new StringBuilder(methodName);
        for (Class<?> type : paramTypes) {
            key.append('|').append(type == null ? "null" : type.getName());
        }
        return key.toString();
    }

    public Object getMethod(Object clsObj, String methodName, Object... params) throws Exception {
        if (clsObj == null) {
            throw new NullPointerException("Cannot invoke method " + methodName + " on null target");
        }
        Class<?> clazz;
        Object receiver;
        if (clsObj instanceof Class<?>) {
            clazz = (Class<?>) clsObj;
            receiver = null;
        } else {
            clazz = clsObj.getClass();
            receiver = clsObj;
        }

        if (params == null || params.length == 0) {
            return resolveMethod(clazz, methodName, NO_PARAM_TYPES).invoke(receiver);
        } else {
            Class<?>[] paramTypes = new Class<?>[params.length];
            for (int i = 0; i < params.length; i++) {
                paramTypes[i] = params[i] == null ? Object.class : params[i].getClass();
            }
            return this.getMethod(clsObj, methodName, paramTypes, params);
        }
    }

    public Object getMethod(String methodName, Class<?>[] paramTypes, Object... params) throws Exception {
        return this.getMethod(this.obj, methodName, paramTypes, params);
    }

    public Object getMethod(String methodName, Object... params) throws Exception {
        return this.getMethod(this.obj, methodName, params);
    }
}
