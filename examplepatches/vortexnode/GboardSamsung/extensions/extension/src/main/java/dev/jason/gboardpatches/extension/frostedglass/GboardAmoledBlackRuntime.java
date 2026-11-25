package dev.jason.gboardpatches.extension.frostedglass;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsetsController;
import android.view.WindowManager;

import androidx.annotation.RequiresApi;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.WeakHashMap;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

/**
 * Applies a true AMOLED pure-black (#000000) keyboard/header/nav-bar background with subtle
 * charcoal keycaps (#141414) while preserving Material You action-key accents.
 * Supports both Android 12–15 Window navigation bar AND Android 16 (SDK 36) Gboard-painted
 * InputView navigation strip via rra.f(Window, rqz) interception.
 */
@RequiresApi(Build.VERSION_CODES.S)
public final class GboardAmoledBlackRuntime {
    static final int AMOLED_BACKGROUND_COLOR = 0xFF000000;
    static final int AMOLED_KEY_COLOR = 0xFF141414;

    private static final Map<Window, State> STATES = new WeakHashMap<>();
    private static final ThreadLocal<Boolean> REPLAYING = ThreadLocal.withInitial(() -> false);
    private static volatile PorterDuffColorFilter keyColorFilter;
    private static volatile NavParams cachedNavParams;

    private GboardAmoledBlackRuntime() {
    }

    private static PorterDuffColorFilter keyColorFilter() {
        PorterDuffColorFilter filter = keyColorFilter;
        if (filter == null) {
            filter = new PorterDuffColorFilter(AMOLED_KEY_COLOR, PorterDuff.Mode.SRC_IN);
            keyColorFilter = filter;
        }
        return filter;
    }

    static boolean shouldApply(Context context) {
        if (context == null || !GboardFlagRuntimeContext.isUserUnlocked(context)) {
            return false;
        }
        return shouldApplyForState(
                GboardFrostedGlassSettingsRuntime.isAmoledBlackEnabled(),
                GboardFrostedGlassSettingsRuntime.isEnabled(),
                isNightMode(context));
    }

    static boolean shouldApplyForState(
            boolean amoledEnabled,
            boolean frostedGlassEnabled,
            boolean nightMode) {
        return amoledEnabled && !frostedGlassEnabled && nightMode;
    }

    static boolean isNightMode(Context context) {
        if (context == null || context.getResources() == null
                || context.getResources().getConfiguration() == null) {
            return false;
        }
        return (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    static void afterConfigureWindow(Window window, boolean fullscreen, boolean candidatesOnly) {
        try {
            if (window == null) {
                return;
            }
            Context context = window.getContext();
            if (!GboardFlagRuntimeContext.isUserUnlocked(context)) {
                return;
            }
            if (fullscreen || candidatesOnly || !shouldApply(context)) {
                restore(window);
                return;
            }
            apply(window);
        } catch (Throwable ignored) {
            // Never disrupt Gboard window configuration.
        }
    }

    static void onWindowShown(Object receiver) {
        try {
            if (!(receiver instanceof InputMethodService service)) {
                return;
            }
            if (!GboardFlagRuntimeContext.isUserUnlocked(service)) {
                return;
            }
            Dialog dialog = service.getWindow();
            Window window = dialog == null ? null : dialog.getWindow();
            if (window == null) {
                return;
            }
            if (!shouldApply(service)) {
                restore(window);
                return;
            }
            apply(window);
        } catch (Throwable ignored) {
            // Never disrupt showing the IME.
        }
    }

    static void onWindowHidden(Object receiver) {
        try {
            if (!(receiver instanceof InputMethodService service)) {
                return;
            }
            if (!GboardFlagRuntimeContext.isUserUnlocked(service)) {
                return;
            }
            Dialog dialog = service.getWindow();
            Window window = dialog == null ? null : dialog.getWindow();
            if (window != null && !shouldApply(service)) {
                restore(window);
            }
        } catch (Throwable ignored) {
            // Never disrupt hiding the IME.
        }
    }

    /**
     * Intercepts Gboard's rra.f(Window, rqz) entry so Android 16's InputView nav strip and
     * Window navigation bar are natively painted pure #000000 with light icons.
     */
    static Object onApplyNavBarEntry(Window window, Object owner, Object params) {
        if (REPLAYING.get() || window == null || params == null) {
            return params;
        }
        try {
            Context context = window.getContext();
            if (!GboardFlagRuntimeContext.isUserUnlocked(context)) {
                return params;
            }
            State state = stateFor(window);
            state.navOwner = new WeakReference<>(owner);
            state.navMethod = resolveApplyMethod(owner, params);
            state.navOriginalParams = params;
            if (!shouldApply(context)) {
                return params;
            }
            state.navRewritten = true;
            return rewriteNavBarParams(params);
        } catch (Throwable ignored) {
            return params;
        }
    }

    static void onApplyNavBarExit(Window window) {
        if (REPLAYING.get() || window == null) {
            return;
        }
        try {
            if (!GboardFlagRuntimeContext.isUserUnlocked(window.getContext())) {
                return;
            }
            if (!shouldApply(window.getContext())) {
                return;
            }
            applyNavBarBlack(window, stateFor(window));
        } catch (Throwable ignored) {
            // Never disrupt stock nav bar styling.
        }
    }

    static Object rewriteNavBarParams(Object original) throws ReflectiveOperationException {
        if (original == null) {
            return null;
        }
        NavParams fields = navParamsFor(original.getClass());
        int nav = fields.nav.getInt(original);
        int divider = fields.divider.getInt(original);
        boolean light = fields.light.getBoolean(original);
        if (nav == AMOLED_BACKGROUND_COLOR && divider == AMOLED_BACKGROUND_COLOR && !light) {
            return original;
        }
        return fields.constructor.newInstance(
                AMOLED_BACKGROUND_COLOR,
                AMOLED_BACKGROUND_COLOR,
                fields.body.get(original),
                fields.header.get(original),
                false);
    }

    private static void apply(Window window) {
        State state = stateFor(window);
        View decor = window.getDecorView();
        if (decor == null) {
            return;
        }
        replayNavBarIfCaptured(window, state, true);
        applyNavBarBlack(window, state);
        applyToHierarchy(decor, state);
        if (state.layoutListener == null) {
            View.OnLayoutChangeListener listener =
                    (v, l, t, r, b, ol, ot, or, ob) -> {
                        try {
                            if (shouldApply(window.getContext())) {
                                applyToHierarchy(decor, state);
                                applyNavBarBlack(window, state);
                            } else {
                                restore(window);
                            }
                        } catch (Throwable ignored) {
                            // Never disrupt layout passes.
                        }
                    };
            state.layoutListener = listener;
            state.observedDecor = decor;
            decor.addOnLayoutChangeListener(listener);
        }
    }

    private static void replayNavBarIfCaptured(Window window, State state, boolean toAmoled) {
        if (state.navOriginalParams == null || state.navMethod == null) {
            return;
        }
        if (toAmoled && state.navRewritten) {
            return;
        }
        Object owner = state.navOwner == null ? null : state.navOwner.get();
        if (owner == null) {
            return;
        }
        try {
            Object targetParams = toAmoled
                    ? rewriteNavBarParams(state.navOriginalParams)
                    : state.navOriginalParams;
            REPLAYING.set(true);
            try {
                state.navMethod.invoke(owner, window, targetParams);
                state.navRewritten = toAmoled;
            } finally {
                REPLAYING.remove();
            }
        } catch (Throwable ignored) {
            // Best-effort nav strip replay.
        }
    }

    private static void applyNavBarBlack(Window window, State state) {
        if (!state.navCaptured) {
            state.originalNavColor = window.getNavigationBarColor();
            state.originalNavDividerColor = window.getNavigationBarDividerColor();
            state.originalNavContrast = window.isNavigationBarContrastEnforced();
            state.navCaptured = true;
        }
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        if (window.getNavigationBarColor() != AMOLED_BACKGROUND_COLOR) {
            window.setNavigationBarColor(AMOLED_BACKGROUND_COLOR);
        }
        if (window.getNavigationBarDividerColor() != AMOLED_BACKGROUND_COLOR) {
            window.setNavigationBarDividerColor(AMOLED_BACKGROUND_COLOR);
        }
        if (window.isNavigationBarContrastEnforced()) {
            window.setNavigationBarContrastEnforced(false);
        }
        WindowInsetsController controller = window.getInsetsController();
        if (controller != null) {
            controller.setSystemBarsAppearance(
                    0, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }
    }

    static void applyToHierarchy(View view, State state) {
        if (view == null) {
            return;
        }
        if (view.getTag() instanceof String tag) {
            if (isAmoledSurfaceTag(tag)) {
                applyBlackSurface(view, state);
                if (tag.equals(".keyboard-base-area")
                        || tag.equals(".keyboard-base-area.keyboard-outline")) {
                    applyBlackNavStripAncestors(view, state);
                }
            } else if (isAmoledKeyTag(tag)) {
                applyCharcoalKey(view, state);
            }
        }
        if (view instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                applyToHierarchy(group.getChildAt(i), state);
            }
        }
    }

    /**
     * On Android 16 (SDK 36), Gboard's InputView ancestor holds bottom navigation-bar padding and
     * paints the strip behind the system nav buttons. Ensure that ancestor is also pure #000000.
     */
    private static void applyBlackNavStripAncestors(View keyboardRoot, State state) {
        View current = keyboardRoot;
        for (int depth = 0; depth < 6 && current != null; depth++) {
            if (!(current.getParent() instanceof View parent)) {
                break;
            }
            if (parent.getPaddingBottom() > 0 && parent.getBackground() != null) {
                applyBlackSurface(parent, state);
            }
            current = parent;
        }
    }

    static boolean isAmoledSurfaceTag(String tag) {
        if (tag == null) {
            return false;
        }
        return tag.equals(".keyboard-base-area")
                || tag.equals(".keyboard-base-area.keyboard-outline")
                || tag.contains(".keyboard-header-area")
                || tag.contains(".keyboard-body-area")
                || tag.startsWith(".candidates-area");
    }

    static boolean isAmoledKeyTag(String tag) {
        if (tag == null) {
            return false;
        }
        if (tag.contains(".for-action-key") || tag.contains(".for-candidate-key")) {
            return false;
        }
        return tag.equals(".keytop")
                || tag.startsWith(".keytop.")
                || tag.equals(".space_bar")
                || tag.startsWith(".space_bar.");
    }

    private static void applyBlackSurface(View view, State state) {
        Drawable current = view.getBackground();
        if (current instanceof AmoledBlackDrawable) {
            return;
        }
        state.originalSurfaceBackgrounds.put(view, current);
        view.setBackground(new AmoledBlackDrawable());
    }

    private static void applyCharcoalKey(View view, State state) {
        Drawable target = unwrapDrawable(view.getBackground());
        if (target == null || target.getAlpha() == 0) {
            return;
        }
        if (!state.tintedKeyDrawables.containsKey(target)) {
            target.mutate();
            state.tintedKeyDrawables.put(target, Boolean.TRUE);
        }
        target.setColorFilter(keyColorFilter());
    }

    static void restore(Window window) {
        State state;
        synchronized (STATES) {
            state = STATES.remove(window);
        }
        if (state == null) {
            return;
        }
        if (state.observedDecor != null && state.layoutListener != null) {
            state.observedDecor.removeOnLayoutChangeListener(state.layoutListener);
        }
        if (state.navRewritten) {
            replayNavBarIfCaptured(window, state, false);
        }
        for (Map.Entry<View, Drawable> entry : state.originalSurfaceBackgrounds.entrySet()) {
            View view = entry.getKey();
            if (view != null && view.getBackground() instanceof AmoledBlackDrawable) {
                view.setBackground(entry.getValue());
            }
        }
        state.originalSurfaceBackgrounds.clear();
        for (Drawable drawable : state.tintedKeyDrawables.keySet()) {
            if (drawable != null) {
                drawable.clearColorFilter();
            }
        }
        state.tintedKeyDrawables.clear();
        if (state.navCaptured) {
            try {
                window.setNavigationBarColor(state.originalNavColor);
                window.setNavigationBarDividerColor(state.originalNavDividerColor);
                window.setNavigationBarContrastEnforced(state.originalNavContrast);
            } catch (Throwable ignored) {
                // Best-effort nav bar restore.
            }
        }
    }

    private static Method resolveApplyMethod(Object owner, Object params) {
        if (owner == null || params == null) {
            return null;
        }
        Method found = null;
        for (Method method : owner.getClass().getDeclaredMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (Modifier.isStatic(method.getModifiers())
                    || method.getReturnType() != void.class
                    || types.length != 2
                    || types[0] != Window.class
                    || types[1] != params.getClass()) {
                continue;
            }
            if (found != null) {
                return null;
            }
            found = method;
        }
        if (found != null) {
            found.setAccessible(true);
        }
        return found;
    }

    private static NavParams navParamsFor(Class<?> type) throws ReflectiveOperationException {
        NavParams cached = cachedNavParams;
        if (cached != null && cached.type == type) {
            return cached;
        }
        NavParams created = new NavParams(type);
        cachedNavParams = created;
        return created;
    }

    private static Drawable unwrapDrawable(Drawable drawable) {
        for (int depth = 0; depth < 16 && drawable instanceof DrawableWrapper wrapper; depth++) {
            drawable = wrapper.getDrawable();
        }
        return drawable;
    }

    private static State stateFor(Window window) {
        synchronized (STATES) {
            State state = STATES.get(window);
            if (state == null) {
                state = new State();
                STATES.put(window, state);
            }
            return state;
        }
    }

    private static final class AmoledBlackDrawable extends ColorDrawable {
        AmoledBlackDrawable() {
            super(AMOLED_BACKGROUND_COLOR);
        }
    }

    private static final class NavParams {
        final Class<?> type;
        final Field nav;
        final Field divider;
        final Field body;
        final Field header;
        final Field light;
        final Constructor<?> constructor;

        NavParams(Class<?> type) throws ReflectiveOperationException {
            this.type = type;
            nav = declaredFinalField(type, "a", int.class);
            divider = declaredFinalField(type, "b", int.class);
            body = type.getDeclaredField("c");
            if (!Modifier.isFinal(body.getModifiers()) || Modifier.isStatic(body.getModifiers())) {
                throw new NoSuchFieldException("c");
            }
            body.setAccessible(true);
            header = declaredFinalField(type, "d", body.getType());
            light = declaredFinalField(type, "e", boolean.class);
            constructor = type.getDeclaredConstructor(
                    int.class, int.class, body.getType(), body.getType(), boolean.class);
            constructor.setAccessible(true);
        }

        private static Field declaredFinalField(Class<?> type, String name, Class<?> expectedType)
                throws ReflectiveOperationException {
            Field field = type.getDeclaredField(name);
            if (field.getType() != expectedType
                    || Modifier.isStatic(field.getModifiers())
                    || !Modifier.isFinal(field.getModifiers())) {
                throw new NoSuchFieldException(name);
            }
            field.setAccessible(true);
            return field;
        }
    }

    static final class State {
        final Map<View, Drawable> originalSurfaceBackgrounds = new WeakHashMap<>();
        final Map<Drawable, Boolean> tintedKeyDrawables = new IdentityHashMap<>();
        View observedDecor;
        View.OnLayoutChangeListener layoutListener;
        boolean navCaptured;
        int originalNavColor;
        int originalNavDividerColor;
        boolean originalNavContrast;
        WeakReference<Object> navOwner;
        Method navMethod;
        Object navOriginalParams;
        boolean navRewritten;
    }
}
