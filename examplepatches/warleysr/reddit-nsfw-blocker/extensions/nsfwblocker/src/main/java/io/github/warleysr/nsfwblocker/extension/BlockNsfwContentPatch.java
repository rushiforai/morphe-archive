/*
 * Copyright 2026 warleysr.
 * https://github.com/warleysr/reddit-nsfw-blocker
 *
 * Based on Morphe Patches, Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package io.github.warleysr.nsfwblocker.extension;

import android.util.Log;

import com.reddit.domain.model.Link;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Deque;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Always-on patch. There is intentionally no setting to turn this off.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class BlockNsfwContentPatch {

    private static final String TAG = "RedditNsfwBlocker";

    /**
     * Enum classes Reddit uses to mark a post as NSFW.
     * These classes are not obfuscated, unlike the feed element classes that hold them.
     */
    private static final Set<String> NSFW_ENUM_CLASSES = new HashSet<>(Arrays.asList(
            "com.reddit.feeds.model.IndicatorType",
            "com.reddit.domain.media.MediaBlurType"
    ));
    private static final String NSFW_ENUM_NAME = "NSFW";

    /**
     * Packages whose objects never contain feed post data,
     * and that can reference very large object graphs.
     */
    private static final String[] IGNORED_PACKAGE_PREFIXES = {
            "java.",
            "javax.",
            "android.",
            "androidx.",
            "kotlin.",
            "kotlinx.",
            "com.google.",
            "okhttp3.",
            "okio.",
            "dalvik.",
            "sun.",
    };

    private static final int MAX_DEPTH = 8;
    private static final int MAX_VISITED_OBJECTS = 4000;

    private static final Map<Class<?>, Field[]> fieldCache = new ConcurrentHashMap<>();
    private static final Field[] NO_FIELDS = new Field[0];

    /**
     * Suspend lambda that RedditPreferenceRepository.setOver18() runs.
     * It saves the value locally and sends it to Reddit's servers.
     */
    private static final String SET_OVER_18_LAMBDA_CLASS =
            "com.reddit.account.repository.RedditPreferenceRepository$setOver18$2";
    private static final long ACCOUNT_SYNC_DELAY_MILLISECONDS = 5000;

    /**
     * RedditPreferenceRepository instance.
     */
    private static volatile Object preferenceRepository;
    private static volatile boolean accountOver18Enabled;
    private static final AtomicBoolean accountSyncStarted = new AtomicBoolean();

    /**
     * Injection point.
     */
    public static void setPreferenceRepository(Object repository) {
        if (repository == null || preferenceRepository == repository) return;

        preferenceRepository = repository;
        if (accountOver18Enabled) {
            turnOffAccountOver18();
        }
    }

    /**
     * Injection point.
     *
     * @param over18 The value of the account 'over_18' preference.
     * @return Always false.
     */
    public static boolean getAccountOver18(boolean over18) {
        if (over18 && !accountOver18Enabled) {
            accountOver18Enabled = true;
            turnOffAccountOver18();
        }

        return false;
    }

    /**
     * Turns off 'Show mature content' on the Reddit account, once per app launch.
     * Otherwise the account keeps NSFW content enabled on other devices and the website,
     * and Reddit keeps sending NSFW content that must be filtered by this patch.
     */
    private static void turnOffAccountOver18() {
        Object repository = preferenceRepository;
        if (repository == null) return; // Called again when the repository is available.
        if (!accountSyncStarted.compareAndSet(false, true)) return;

        Thread thread = new Thread(() -> {
            try {
                Thread.sleep(ACCOUNT_SYNC_DELAY_MILLISECONDS); // Do not slow down app startup.
                Log.i(TAG, "Turning off account 'Show mature content'");
                runSetOver18(repository);
            } catch (Exception ex) {
                Log.e(TAG, "Could not turn off account 'Show mature content'", ex);
            }
        }, "reddit-nsfw-blocker");
        thread.setDaemon(true);
        thread.start();
    }

    /**
     * Runs the suspend lambda of RedditPreferenceRepository.setOver18(false).
     * Kotlin coroutine classes are obfuscated, so everything is resolved with reflection.
     */
    private static void runSetOver18(Object repository) throws Exception {
        ClassLoader classLoader = repository.getClass().getClassLoader();
        Class<?> lambdaClass = Class.forName(SET_OVER_18_LAMBDA_CLASS, true, classLoader);

        Constructor<?> constructor = null;
        for (Constructor<?> c : lambdaClass.getDeclaredConstructors()) {
            Class<?>[] types = c.getParameterTypes();
            if (types.length == 3 && types[0].isInstance(repository) && types[1] == boolean.class) {
                constructor = c;
                break;
            }
        }
        if (constructor == null) {
            throw new IllegalStateException("Could not find constructor of " + SET_OVER_18_LAMBDA_CLASS);
        }
        constructor.setAccessible(true);

        // Continuation interface.
        Class<?> continuationClass = constructor.getParameterTypes()[2];
        Class<?> coroutineContextClass = Class.forName("kotlin.coroutines.CoroutineContext", true, classLoader);
        Object emptyCoroutineContext = Class.forName("kotlin.coroutines.EmptyCoroutineContext", true, classLoader)
                .getField("INSTANCE").get(null);

        Object completion = Proxy.newProxyInstance(classLoader, new Class<?>[]{continuationClass},
                (proxy, method, args) -> {
                    if (method.getReturnType() == coroutineContextClass) {
                        return emptyCoroutineContext; // getContext()
                    }
                    switch (method.getName()) {
                        case "equals":
                            return proxy == args[0];
                        case "hashCode":
                            return System.identityHashCode(proxy);
                        case "toString":
                            return "BlockNsfwContentPatch continuation";
                    }
                    if (args != null && args.length == 1) { // resumeWith(Result)
                        Object result = args[0];
                        Log.i(TAG, "Account 'Show mature content' update finished: " + result);
                    }
                    return null;
                });

        Object lambda = constructor.newInstance(repository, false, null);
        // Function1.invoke(Continuation) creates a new instance with the completion and runs it.
        Method invoke = lambdaClass.getMethod("invoke", Object.class);
        invoke.setAccessible(true);
        invoke.invoke(lambda, completion);
    }

    /**
     * Injection point.
     * Filters the children of legacy listings ({@code Listing.children}).
     */
    public static List<?> filterLinks(List<?> list) {
        if (list == null || list.isEmpty()) return list;

        try {
            List<Object> filtered = new ArrayList<>(list.size());
            for (Object item : list) {
                if (item instanceof Link link && link.getOver18()) {
                    Log.d(TAG, "Removing NSFW link");
                    continue;
                }
                filtered.add(item);
            }
            return filtered;
        } catch (Exception ex) {
            Log.e(TAG, "filterLinks failure", ex);
            return list;
        }
    }

    /**
     * Injection point.
     * Filters the elements of compose feeds (home, popular, communities, profiles).
     */
    public static List<?> filterFeedItems(List<?> list) {
        if (list == null || list.isEmpty()) return list;

        try {
            List<Object> filtered = null;
            final int size = list.size();
            for (int i = 0; i < size; i++) {
                Object item = list.get(i);
                if (isNsfw(item)) {
                    if (filtered == null) {
                        filtered = new ArrayList<>(list.subList(0, i));
                    }
                    Log.d(TAG, "Removing NSFW feed element: " + item.getClass().getName());
                } else if (filtered != null) {
                    filtered.add(item);
                }
            }

            return filtered == null ? list : filtered;
        } catch (Exception ex) {
            Log.e(TAG, "filterFeedItems failure", ex);
            return list;
        }
    }

    /**
     * Searches the object graph of a feed element for anything that marks it as NSFW.
     */
    private static boolean isNsfw(Object root) {
        if (root == null) return false;

        IdentityHashMap<Object, Boolean> visited = new IdentityHashMap<>();
        Deque<Object> stack = new ArrayDeque<>();
        Deque<Integer> depths = new ArrayDeque<>();
        stack.push(root);
        depths.push(0);

        while (!stack.isEmpty()) {
            Object obj = stack.pop();
            final int depth = depths.pop();

            if (visited.put(obj, Boolean.TRUE) != null) continue;
            if (visited.size() > MAX_VISITED_OBJECTS) {
                Log.d(TAG, "Object graph too large: " + root.getClass().getName());
                return false;
            }

            if (obj instanceof Enum<?> e) {
                if (isNsfwEnum(e)) return true;
                continue;
            }

            if (obj instanceof Link link) {
                if (link.getOver18()) return true;
                continue;
            }

            if (depth >= MAX_DEPTH) continue;
            final int childDepth = depth + 1;

            if (obj instanceof Collection<?> collection) {
                if (isEnumCatalog(collection)) continue;
                for (Object child : collection) {
                    if (child != null) {
                        stack.push(child);
                        depths.push(childDepth);
                    }
                }
                continue;
            }

            if (obj instanceof Map<?, ?> map) {
                for (Object child : map.values()) {
                    if (child != null) {
                        stack.push(child);
                        depths.push(childDepth);
                    }
                }
                continue;
            }

            Class<?> clazz = obj.getClass();
            if (clazz.isArray()) {
                if (clazz.getComponentType().isPrimitive()) continue;
                final int length = Array.getLength(obj);
                for (int i = 0; i < length; i++) {
                    Object child = Array.get(obj, i);
                    if (child != null) {
                        stack.push(child);
                        depths.push(childDepth);
                    }
                }
                continue;
            }

            if (obj instanceof Iterable<?> iterable) {
                // Obfuscated immutable collections.
                for (Object child : iterable) {
                    if (child != null) {
                        stack.push(child);
                        depths.push(childDepth);
                    }
                }
                continue;
            }

            for (Field field : getFields(clazz)) {
                try {
                    Object child = field.get(obj);
                    if (child != null) {
                        stack.push(child);
                        depths.push(childDepth);
                    }
                } catch (Exception ignored) {
                }
            }
        }

        return false;
    }

    private static boolean isNsfwEnum(Enum<?> e) {
        return NSFW_ENUM_NAME.equals(e.name())
                && NSFW_ENUM_CLASSES.contains(e.getDeclaringClass().getName());
    }

    /**
     * @return If the collection holds every constant of an NSFW enum class,
     *         which means it's a list of all possible values and not the values of a post.
     */
    private static boolean isEnumCatalog(Collection<?> collection) {
        if (collection.size() < 2) return false;

        Class<? extends Enum> enumClass = null;
        for (Object item : collection) {
            if (item instanceof Enum<?> e && isNsfwEnum(e)) {
                enumClass = e.getDeclaringClass();
                break;
            }
        }
        if (enumClass == null) return false;

        EnumSet found = EnumSet.noneOf(enumClass);
        for (Object item : collection) {
            if (enumClass.isInstance(item)) {
                found.add(item);
            }
        }
        return found.size() == enumClass.getEnumConstants().length;
    }

    private static Field[] getFields(Class<?> clazz) {
        Field[] cached = fieldCache.get(clazz);
        if (cached != null) return cached;

        Field[] fields;
        if (isIgnoredClass(clazz)) {
            fields = NO_FIELDS;
        } else {
            List<Field> list = new ArrayList<>();
            for (Class<?> c = clazz; c != null && c != Object.class && !isIgnoredClass(c); c = c.getSuperclass()) {
                for (Field field : c.getDeclaredFields()) {
                    final int modifiers = field.getModifiers();
                    if (Modifier.isStatic(modifiers)) continue;
                    Class<?> type = field.getType();
                    if (type.isPrimitive() || type == String.class) continue;
                    try {
                        field.setAccessible(true);
                        list.add(field);
                    } catch (Exception ignored) {
                    }
                }
            }
            fields = list.toArray(NO_FIELDS);
        }

        fieldCache.put(clazz, fields);
        return fields;
    }

    private static boolean isIgnoredClass(Class<?> clazz) {
        if (clazz.isSynthetic()) return true; // Lambdas can capture view models with other posts.

        String name = clazz.getName();
        for (String prefix : IGNORED_PACKAGE_PREFIXES) {
            if (name.startsWith(prefix)) return true;
        }

        for (Class<?> anInterface : clazz.getInterfaces()) {
            String interfaceName = anInterface.getName();
            if (interfaceName.startsWith("kotlin.jvm.functions.Function")
                    || interfaceName.equals("kotlin.Function")) {
                return true;
            }
        }

        return false;
    }
}
