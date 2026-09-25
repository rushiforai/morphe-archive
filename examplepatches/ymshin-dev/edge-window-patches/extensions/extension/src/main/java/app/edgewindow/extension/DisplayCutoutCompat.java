package app.edgewindow.extension;

import android.app.Activity;
import android.graphics.Insets;
import android.os.Build;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/** Runtime helper that hides the status bar and permits content in display cutouts. */
public final class DisplayCutoutCompat {
    private static final int MODE_SHORT_EDGES = 1;
    // LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS was added in API 30.
    private static final int MODE_ALWAYS = 3;
    private static final Set<View> ENFORCEMENT_INSTALLED_ON =
        Collections.newSetFromMap(new WeakHashMap<View, Boolean>());
    private static final View.OnApplyWindowInsetsListener TOP_INSET_FILTER =
        new View.OnApplyWindowInsetsListener() {
            @Override
            public WindowInsets onApplyWindowInsets(View view, WindowInsets insets) {
                if (Build.VERSION.SDK_INT >= 30) {
                    return Api30.withoutTopSafeInsets(insets);
                }
                return insets;
            }
        };

    private DisplayCutoutCompat() {
    }

    public static void apply(final Activity activity) {
        if (activity == null) return;

        try {
            applyToWindow(activity);

            // Some apps adjust their window during onResume. Apply once more
            // after that callback has finished to restore the requested mode.
            final Window window = activity.getWindow();
            final View decorView = window == null ? null : window.getDecorView();
            if (decorView != null) {
                decorView.post(new Runnable() {
                    @Override
                    public void run() {
                        if (activity.isFinishing()) return;
                        try {
                            applyToWindow(activity);
                        } catch (RuntimeException ignored) {
                            // A delayed OEM window failure must not crash the host app.
                        } catch (LinkageError ignored) {
                            // Keep the delayed hook fail-soft on older framework builds.
                        }
                    }
                });
            }
        } catch (RuntimeException ignored) {
            // Unsupported OEM window implementations must not break app startup.
        } catch (LinkageError ignored) {
            // Keep the hook fail-soft on devices with incomplete framework APIs.
        }
    }

    private static void applyToWindow(Activity activity) {
        Window window = activity.getWindow();
        if (window == null) return;

        if (Build.VERSION.SDK_INT >= 28) {
            WindowManager.LayoutParams attributes = window.getAttributes();
            int requestedMode = Build.VERSION.SDK_INT >= 30 ? MODE_ALWAYS : MODE_SHORT_EDGES;
            if (attributes.layoutInDisplayCutoutMode != requestedMode) {
                attributes.layoutInDisplayCutoutMode = requestedMode;
                window.setAttributes(attributes);
            }
        }

        if (Build.VERSION.SDK_INT >= 30) {
            try {
                if (!Api30.apply(window)) {
                    applyLegacyFullscreen(window);
                }
            } catch (RuntimeException ignored) {
                applyLegacyFullscreen(window);
            } catch (LinkageError ignored) {
                applyLegacyFullscreen(window);
            }
        } else {
            applyLegacyFullscreen(window);
        }

        installTopInsetFilter(activity);
        installStatusBarEnforcer(activity, window.getDecorView());
    }

    private static void installTopInsetFilter(Activity activity) {
        if (Build.VERSION.SDK_INT < 30) return;

        View contentView = activity.findViewById(android.R.id.content);
        if (contentView == null) return;

        // Remove the top safe area before it reaches the app's player/layout
        // views, while retaining navigation-bar and gesture insets.
        contentView.setOnApplyWindowInsetsListener(TOP_INSET_FILTER);
        contentView.requestApplyInsets();
    }

    private static void installStatusBarEnforcer(final Activity activity, final View decorView) {
        if (decorView == null) return;

        synchronized (ENFORCEMENT_INSTALLED_ON) {
            if (!ENFORCEMENT_INSTALLED_ON.add(decorView)) return;
        }

        decorView.getViewTreeObserver().addOnPreDrawListener(
            new ViewTreeObserver.OnPreDrawListener() {
                @Override
                public boolean onPreDraw() {
                    if (activity.isFinishing() || !activity.hasWindowFocus()) return true;

                    try {
                        if (needsReapplication(activity, decorView)) {
                            applyToWindow(activity);
                        }
                    } catch (RuntimeException ignored) {
                        // A transient OEM window failure must not break drawing.
                    } catch (LinkageError ignored) {
                        // Keep API-specific checks fail-soft on older framework builds.
                    }
                    return true;
                }
            }
        );
    }

    private static boolean needsReapplication(Activity activity, View decorView) {
        Window window = activity.getWindow();
        if (window == null) return false;

        if (Build.VERSION.SDK_INT >= 28) {
            int requestedMode = Build.VERSION.SDK_INT >= 30 ? MODE_ALWAYS : MODE_SHORT_EDGES;
            if (window.getAttributes().layoutInDisplayCutoutMode != requestedMode) return true;
        }

        if (Build.VERSION.SDK_INT >= 30) {
            return Api30.isStatusBarVisible(decorView);
        }

        int flags = decorView.getSystemUiVisibility();
        return (flags & View.SYSTEM_UI_FLAG_FULLSCREEN) == 0
            || (window.getAttributes().flags & WindowManager.LayoutParams.FLAG_FULLSCREEN) == 0;
    }

    @SuppressWarnings("deprecation")
    private static void applyLegacyFullscreen(Window window) {
        window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        if (Build.VERSION.SDK_INT < 16) {
            return;
        }

        View decorView = window.getDecorView();
        if (decorView == null) return;

        int flags = decorView.getSystemUiVisibility();
        flags |= View.SYSTEM_UI_FLAG_FULLSCREEN
            | View.SYSTEM_UI_FLAG_LAYOUT_STABLE
            | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN;
        decorView.setSystemUiVisibility(flags);
    }

    /** API 30 references are isolated so older Android releases can load this helper. */
    private static final class Api30 {
        private Api30() {
        }

        static boolean apply(Window window) {
            window.setDecorFitsSystemWindows(false);
            android.view.WindowInsetsController controller = window.getInsetsController();
            if (controller == null) return false;

            controller.hide(android.view.WindowInsets.Type.statusBars());
            return true;
        }

        static boolean isStatusBarVisible(View decorView) {
            WindowInsets insets = decorView.getRootWindowInsets();
            return insets != null && insets.isVisible(WindowInsets.Type.statusBars());
        }

        static WindowInsets withoutTopSafeInsets(WindowInsets insets) {
            if (insets == null) return null;

            int topInsetTypes = WindowInsets.Type.statusBars()
                | WindowInsets.Type.displayCutout();
            return new WindowInsets.Builder(insets)
                .setInsets(topInsetTypes, Insets.NONE)
                .setInsetsIgnoringVisibility(WindowInsets.Type.statusBars(), Insets.NONE)
                .setVisible(WindowInsets.Type.statusBars(), false)
                .setDisplayCutout(null)
                .build();
        }
    }
}
