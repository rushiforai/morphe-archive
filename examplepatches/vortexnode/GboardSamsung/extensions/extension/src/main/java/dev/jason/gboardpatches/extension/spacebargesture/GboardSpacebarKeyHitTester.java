package dev.jason.gboardpatches.extension.spacebargesture;

import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Resolves the {@code SoftKeyView} under a raw screen coordinate inside {@code KeyboardViewHolder}
 * and verifies that its {@code PRESS} action has real keycode {@link KeyEvent#KEYCODE_SPACE} (62)
 * via Gboard's {@code SoftKeyDef}/{@code ActionDef} metadata (never relying on layout-dependent IDs).
 */
public final class GboardSpacebarKeyHitTester {
    private static final String SOFT_KEY_VIEW_CLASS =
            "com.google.android.libraries.inputmethod.widgets.SoftKeyView";
    private static final String SOFT_KEY_DEF_CLASS =
            "com.google.android.libraries.inputmethod.metadata.SoftKeyDef";
    private static final String ACTION_DEF_CLASS =
            "com.google.android.libraries.inputmethod.metadata.ActionDef";
    private static final String ACTION_TYPE_CLASS = "qae";
    private static final String ACTION_ENTRY_CLASS = "qbc";

    private static final Map<ClassLoader, WeakReference<MetadataHandles>> HANDLES =
            Collections.synchronizedMap(new WeakHashMap<>());

    private GboardSpacebarKeyHitTester() {
    }

    public static boolean isSpaceKeyAt(View holder, float rawX, float rawY) {
        if (holder == null || !holder.isShown()) {
            return false;
        }
        int[] location = new int[2];
        View softKeyView = findSoftKeyViewAt(holder, true, rawX, rawY, location);
        if (softKeyView == null) {
            return false;
        }
        return isSpaceSoftKeyView(softKeyView);
    }

    static boolean isSpaceSoftKeyView(View softKeyView) {
        return extractPressKeycode(softKeyView) == KeyEvent.KEYCODE_SPACE;
    }

    /**
     * Reads the primary {@code PRESS} action keycode from a {@code SoftKeyView}'s bound
     * {@code SoftKeyDef} metadata, or returns {@code 0} if unavailable.
     */
    static int extractPressKeycode(View softKeyView) {
        if (!isSoftKeyViewInstance(softKeyView)) {
            return 0;
        }
        try {
            MetadataHandles handles = resolveHandles(softKeyView.getClass().getClassLoader());
            Object softKeyDef = handles.softKeyMetadataField.get(softKeyView);
            if (softKeyDef == null) {
                return 0;
            }
            Object pressAction = handles.exactActionLookupMethod.invoke(
                    softKeyDef, handles.pressActionType);
            if (pressAction == null) {
                return 0;
            }
            return handles.extractFirstKeycode(pressAction);
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static View findSoftKeyViewAt(
            View root, boolean isRootHolder, float rawX, float rawY, int[] location) {
        if (root == null || root.getVisibility() != View.VISIBLE || !root.isShown()) {
            return null;
        }
        if (isSoftKeyViewInstance(root)) {
            return containsRawPoint(root, rawX, rawY, location) ? root : null;
        }
        if (root instanceof ViewGroup group) {
            if (!isRootHolder && group.getClipChildren()
                    && !containsRawPoint(root, rawX, rawY, location)) {
                return null;
            }
            for (int index = group.getChildCount() - 1; index >= 0; index--) {
                View match = findSoftKeyViewAt(
                        group.getChildAt(index), false, rawX, rawY, location);
                if (match != null) {
                    return match;
                }
            }
        }
        return null;
    }

    private static boolean containsRawPoint(View view, float rawX, float rawY, int[] location) {
        int width = view.getWidth();
        int height = view.getHeight();
        if (width <= 0 || height <= 0) {
            return false;
        }
        float scaleX = Math.abs(view.getScaleX());
        float scaleY = Math.abs(view.getScaleY());
        float visualWidth = scaleX > 0f ? width * scaleX : width;
        float visualHeight = scaleY > 0f ? height * scaleY : height;
        view.getLocationOnScreen(location);
        float left = location[0];
        float top = location[1];
        return rawX >= left
                && rawX < left + visualWidth
                && rawY >= top
                && rawY < top + visualHeight;
    }

    private static boolean isSoftKeyViewInstance(View view) {
        if (view == null) {
            return false;
        }
        for (Class<?> current = view.getClass(); current != null; current = current.getSuperclass()) {
            if (SOFT_KEY_VIEW_CLASS.equals(current.getName())) {
                return true;
            }
        }
        return false;
    }

    private static MetadataHandles resolveHandles(ClassLoader classLoader) throws Throwable {
        if (classLoader == null) {
            throw new IllegalStateException("Missing ClassLoader for SoftKeyView metadata");
        }
        synchronized (HANDLES) {
            WeakReference<MetadataHandles> reference = HANDLES.get(classLoader);
            MetadataHandles cached = reference == null ? null : reference.get();
            if (cached != null) {
                return cached;
            }
            MetadataHandles created = new MetadataHandles(classLoader);
            HANDLES.put(classLoader, new WeakReference<>(created));
            return created;
        }
    }

    private static final class MetadataHandles {
        final Field softKeyMetadataField;
        final Method exactActionLookupMethod;
        final Field actionEntriesField;
        final Field entryKeycodeField;
        final Object pressActionType;

        @SuppressWarnings({"rawtypes", "unchecked"})
        MetadataHandles(ClassLoader classLoader) throws Throwable {
            Class<?> softKeyViewClass = Class.forName(SOFT_KEY_VIEW_CLASS, false, classLoader);
            Class<?> softKeyDefClass = Class.forName(SOFT_KEY_DEF_CLASS, false, classLoader);
            Class<?> actionDefClass = Class.forName(ACTION_DEF_CLASS, false, classLoader);
            Class<?> actionTypeClass = Class.forName(ACTION_TYPE_CLASS, false, classLoader);
            Class<?> actionEntryClass = Class.forName(ACTION_ENTRY_CLASS, false, classLoader);

            softKeyMetadataField = softKeyViewClass.getDeclaredField("e");
            exactActionLookupMethod = softKeyDefClass.getDeclaredMethod("g", actionTypeClass);
            actionEntriesField = actionDefClass.getDeclaredField("f");
            entryKeycodeField = actionEntryClass.getDeclaredField("c");

            softKeyMetadataField.setAccessible(true);
            exactActionLookupMethod.setAccessible(true);
            actionEntriesField.setAccessible(true);
            entryKeycodeField.setAccessible(true);

            pressActionType = Enum.valueOf(
                    (Class<? extends Enum>) actionTypeClass.asSubclass(Enum.class), "PRESS");
        }

        int extractFirstKeycode(Object actionDef) throws IllegalAccessException {
            Object rawEntries = actionEntriesField.get(actionDef);
            Object firstEntry = null;
            if (rawEntries instanceof List<?> list && !list.isEmpty()) {
                firstEntry = list.get(0);
            } else if (rawEntries instanceof Object[] array && array.length > 0) {
                firstEntry = array[0];
            }
            return firstEntry == null ? 0 : entryKeycodeField.getInt(firstEntry);
        }
    }
}
