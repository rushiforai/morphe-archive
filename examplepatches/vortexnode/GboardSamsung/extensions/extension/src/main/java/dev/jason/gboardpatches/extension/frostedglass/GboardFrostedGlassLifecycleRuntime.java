package dev.jason.gboardpatches.extension.frostedglass;

import android.os.Build;
import android.view.Window;

/** Thin lifecycle adapter; Gboard version bindings stay in the patch module. */
public final class GboardFrostedGlassLifecycleRuntime {
    private static final ThreadLocal<Window> PENDING_AMOLED_WINDOW = new ThreadLocal<>();
    private GboardFrostedGlassLifecycleRuntime() {}

    private static boolean supported() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;
    }

    public static void afterConfigureWindow(Window window, boolean fullscreen, boolean candidatesOnly) {
        if (!supported()) return;
        try {
            GboardFrostedGlassRuntime.afterConfigureWindow(window, fullscreen, candidatesOnly);
        } catch (Throwable ignored) { /* Stock window configuration stays in effect. */ }
        try {
            GboardAmoledBlackRuntime.afterConfigureWindow(window, fullscreen, candidatesOnly);
        } catch (Throwable ignored) { /* Stock window configuration stays in effect. */ }
    }
    public static void onInputViewStarted(Object receiver) {
        if (!supported()) return;
        try {
            GboardFrostedGlassRuntime.onWindowShown(receiver);
        } catch (Throwable ignored) { /* Never affect showing the IME. */ }
        try {
            GboardAmoledBlackRuntime.onWindowShown(receiver);
        } catch (Throwable ignored) { /* Never affect showing the IME. */ }
    }
    public static void onInputWindowHidden(Object receiver) {
        if (!supported()) return;
        try {
            GboardFrostedGlassRuntime.onWindowHidden(receiver);
        } catch (Throwable ignored) { /* Never affect hiding the IME. */ }
        try {
            GboardAmoledBlackRuntime.onWindowHidden(receiver);
        } catch (Throwable ignored) { /* Never affect hiding the IME. */ }
    }
    /** Entry of the 18.5.4 nav-bar styling method; returns the model to apply. */
    public static Object onApplyNavBarEntry(Window window, Object owner, Object params) {
        if (!supported()) return params;
        PENDING_AMOLED_WINDOW.set(window);
        Object resolved = params;
        try {
            resolved = GboardSeamlessNavBarRuntime.onApplyNavBarEntry(window, owner, resolved);
        } catch (Throwable ignored) {
        }
        try {
            return GboardAmoledBlackRuntime.onApplyNavBarEntry(window, owner, resolved);
        } catch (Throwable ignored) {
            return resolved;
        }
    }
    /** Before each return of the nav-bar styling method. */
    public static void onApplyNavBarExit(Object params) {
        if (!supported()) return;
        Window window = PENDING_AMOLED_WINDOW.get();
        PENDING_AMOLED_WINDOW.remove();
        try {
            GboardSeamlessNavBarRuntime.onApplyNavBarExit(params);
        } catch (Throwable ignored) { /* Stock navigation styling stays in effect. */ }
        try {
            GboardAmoledBlackRuntime.onApplyNavBarExit(window);
        } catch (Throwable ignored) { /* Stock navigation styling stays in effect. */ }
    }
}
