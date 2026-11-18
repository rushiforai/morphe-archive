/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.feed;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.graphics.drawable.Drawable;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;

import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.instagram.entity.Entity;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceUtils;

public class ChangeLikeAnimationPatch {
    public static final String RANDOM = "RANDOM";
    private static final String DEFAULT = "ARES_LIKE_ACTIVATION";
    private static final String LAST_RANDOM = "last_random_like_animation";
    private static volatile String sessionAnimation;
    private static final Set<Integer> sessionTaskIds = new HashSet<>();

    private static String currentChoice() {
        String val = Pref.changeLikeAnimation();
        return (val == null || val.trim().isEmpty()) ? DEFAULT : val.trim();
    }

    public static synchronized void onSelectionChanged(String newChoice) {
        sessionAnimation = null;
    }

    public static synchronized void onActivityCreated(Activity activity) {
        if (activity == null || !RANDOM.equals(currentChoice())) return;
        int taskId = activity.getTaskId();
        if (taskId < 0 || sessionTaskIds.contains(taskId)) return;

        try {
            if (!sessionTaskIds.isEmpty()) {
                ActivityManager manager = activity.getSystemService(ActivityManager.class);
                if (manager == null) return;
                Set<Integer> currentTaskIds = new HashSet<>();
                for (ActivityManager.AppTask task : manager.getAppTasks()) {
                    currentTaskIds.add(task.getTaskInfo().persistentId);
                }
                sessionTaskIds.retainAll(currentTaskIds);
                if (sessionTaskIds.isEmpty()) sessionAnimation = null;
            }
            sessionTaskIds.add(taskId);
        } catch (RuntimeException e) {
            Logger.printException(() -> "Failed to check the like animation session", e);
        }
    }

    private static Class<?> animationClass() throws ClassNotFoundException {
        return Class.forName("className");
    }

    public static Object changeLikeAnimation(Object defaultAnimation) {
        try {
            Object selected = selectedAnimation();
            return selected != null ? selected : defaultAnimation;
        } catch (Exception e) {
            Logger.printException(() -> "changeLikeAnimation failure", e);
        }
        return defaultAnimation;
    }

    public static Object changeRenderAnimation(Object defaultAnimation) {
        try {
            Object animation = selectedAnimation();
            if (animation == null) return defaultAnimation;
            Object mapped = mapAnimation(animation);
            return mapped != null ? mapped : defaultAnimation;
        } catch (Exception e) {
            Logger.printException(() -> "changeRenderAnimation failure", e);
            return defaultAnimation;
        }
    }

    private static Object selectedAnimation() throws Exception {
        String choice = currentChoice();
        if (choice == null || DEFAULT.equals(choice)) return null;
        String name = RANDOM.equals(choice) ? sessionAnimation() : choice;
        if (DEFAULT.equals(name)) return null;
        Class<?> enumCls = animationClass();
        try {
            return new Entity().getMethod(enumCls, "valueOf", name);
        } catch (Throwable ignored) {
            Object[] constants = enumCls.getEnumConstants();
            if (constants != null) {
                for (Object c : constants) {
                    if (c instanceof Enum<?> && ((Enum<?>) c).name().equalsIgnoreCase(name)) {
                        return c;
                    }
                }
            }
            return null;
        }
    }

    private static Object mapAnimation(Object animation) {
        // Replaced with Instagram's mapping from metadata to rendering animations.
        return null;
    }

    private static synchronized String sessionAnimation() throws ClassNotFoundException {
        if (sessionAnimation == null) {
            sessionAnimation = randomAnimation(SharedPref.getStringPref(LAST_RANDOM, ""));
            SharedPref.setStringPref(LAST_RANDOM, sessionAnimation);
        }
        return sessionAnimation;
    }

    private static String randomAnimation(String previous) {
        List<String> candidates = new ArrayList<>();
        Set<String> available = new HashSet<>();
        try {
            Object[] constants = animationClass().getEnumConstants();
            if (constants != null) {
                for (Object value : constants) {
                    available.add(((Enum<?>) value).name());
                }
            }
        } catch (Throwable ignored) {}
        String[] allValues = ResourceUtils.getStringArray("rex_array_change_like_animation_val");
        if (allValues != null) {
            for (String name : allValues) {
                if (DEFAULT.equals(name) || RANDOM.equals(name)) continue;
                if (available.isEmpty() || available.contains(name)) {
                    candidates.add(name);
                }
            }
        }
        if (candidates.size() > 1) candidates.remove(previous);
        return candidates.isEmpty() ? DEFAULT
                : candidates.get(ThreadLocalRandom.current().nextInt(candidates.size()));
    }

    public static String previewAnimation(String selection) {
        return RANDOM.equals(selection) ? randomAnimation("") : selection;
    }

    public static Drawable previewDrawable(Context context, String animation) {
        // Replaced by the patch with Instagram's own animation drawable factory.
        return null;
    }

    public static Drawable defaultPreviewDrawable(Context context) {
        // Replaced with the native default heart factory and its color initialization.
        return null;
    }

    public static void startPreview(Drawable drawable) {
        // Replaced by the patch with the native playback method.
    }

    public static void stopPreview(Drawable drawable) {
        // Replaced by the patch with the native stop method.
    }
}
