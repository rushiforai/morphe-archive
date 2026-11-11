package app.ysamjo.extension.youtubetv;

import android.app.Activity;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Exits the app when the user presses Back on the YouTube TV home screen.
 *
 * <p>YouTube for Android TV (Cobalt shell) has no native back-button handler that closes
 * the app when on the home screen — the back button is consumed by the leanback web app's
 * own navigation stack. This class injects a JavaScript handler that fires a callback when
 * the app returns to the home URL, and the callback calls {@link Activity#finish()}.
 *
 * <p>Detection relies on the Cobalt engine firing a {@code popstate} event with an empty
 * or single-entry history when the user presses Back on the home screen and the web app
 * runs out of its own navigation stack. At that point the URL is the home path, and a
 * single call to {@code history.back()} would exit the shell. The injected JS detects this
 * condition and fires the callback.
 *
 * <p>The callback is a {@code JavaScriptCallback} proxy registered the same way the
 * existing read-back probe uses one: passed as the third argument to
 * {@code WebContents.evaluateJavaScript} and invoked by the engine with the result string.
 * The first argument to the injected JS function is the callback reference.
 *
 * <p>Scheduling is deferred until the page is past the first navigation commit, same
 * pattern as {@link CobaltScriptInjector#schedule(Activity)}. The back button is a rare
 * user action — the handler will be injected long before any user ever reaches for it.
 */
public final class BackToExitInjector {

    private static final String TAG = "ysamjo-tv-adblock";

    private static final long POLL_INTERVAL_MS = 250L;
    private static final int MAX_POLL_ATTEMPTS = 240;

    private static boolean scheduled;

    private BackToExitInjector() {
    }

    /**
     * Entry point, called from the patched {@code CobaltActivity.onCreate}.
     *
     * <p>Polls until {@code getActiveWebContents()} returns a non-null handle, then injects
     * the back-to-exit script with a callback proxy that calls {@code activity.finish()}.
     */
    public static void schedule(final Activity activity) {
        if (activity == null || scheduled) {
            return;
        }
        scheduled = true;

        final android.os.Handler handler = new android.os.Handler(
                android.os.Looper.getMainLooper());

        handler.postDelayed(new Runnable() {
            private int pollAttempts;

            @Override
            public void run() {
                boolean injected = false;
                try {
                    injected = injectBackHandler(activity);
                } catch (Throwable t) {
                    if (pollAttempts < 5) {
                        Log.w(TAG, "back-to-exit injection attempt failed", t);
                    }
                }

                if (injected) {
                    Log.i(TAG, "back-to-exit injected");
                    return;
                }

                if (++pollAttempts >= MAX_POLL_ATTEMPTS) {
                    Log.w(TAG, "gave up injecting back-to-exit after "
                            + MAX_POLL_ATTEMPTS + " attempts");
                    return;
                }

                handler.postDelayed(this, POLL_INTERVAL_MS);
            }
        }, POLL_INTERVAL_MS);
    }

    private static boolean injectBackHandler(final Activity activity) throws Exception {
        final Method getActiveWebContents =
                activity.getClass().getMethod("getActiveWebContents");
        final Object webContents = getActiveWebContents.invoke(activity);
        if (webContents == null) {
            return false;
        }

        final Field pointerField = findNativePointerField(webContents);
        if (pointerField == null) {
            return false;
        }

        final long pointer = pointerField.getLong(webContents);
        if (pointer == 0L) {
            return false;
        }

        final Method evaluateJavaScript = findEvaluateJavaScript();
        if (evaluateJavaScript == null) {
            return false;
        }

        // Build the JS callback proxy. The callback interface lives under two class names
        // depending on the build (stock app vs TizenTube Cobalt).
        final Object callback = buildCallback(activity, evaluateJavaScript, pointer);

        // Inject with the callback as the first argument to the script.
        evaluateJavaScript.invoke(null, pointer, BACK_TO_EXIT_PAYLOAD, callback);
        return true;
    }

    private static Object buildCallback(final Activity activity,
                                         final Method evaluateJavaScript,
                                         final long pointer) {
        final Class<?>[] callbackInterfaces;
        final String className;

        // Try the unobfuscated TizenTube Cobalt callback first, then the re-namespaced one.
        try {
            callbackInterfaces = new Class<?>[]{
                    Class.forName("org.chromium.content_public.browser.JavaScriptCallback")};
            className = "org.chromium.content_public.browser.JavaScriptCallback";
        } catch (ClassNotFoundException notTizenTube) {
            try {
                callbackInterfaces = new Class<?>[]{
                        Class.forName("cobalt.org.chromium.content_public.browser.JavaScriptCallback")};
                className = "cobalt.org.chromium.content_public.browser.JavaScriptCallback";
            } catch (ClassNotFoundException notStockEither) {
                Log.w(TAG, "back-to-exit: no JavaScriptCallback interface found");
                return null;
            }
        }

        return Proxy.newProxyInstance(
                BackToExitInjector.class.getClassLoader(),
                callbackInterfaces,
                new InvocationHandler() {
                    @Override
                    public Object invoke(final Object proxy, final Method method,
                                         final Object[] arguments) {
                        if ("handleJavaScriptResult".equals(method.getName())) {
                            if (arguments != null && arguments.length > 0
                                    && "BACK_TO_EXIT_HOME".equals(String.valueOf(arguments[0]))) {
                                Log.i(TAG, "home-screen back detected — finishing activity");
                                activity.finish();
                            }
                        }
                        return null;
                    }
                });
    }

    private static Field findNativePointerField(final Object webContents) {
        Class<?> type = webContents.getClass();

        while (type != null && type != Object.class) {
            for (final Field field : type.getDeclaredFields()) {
                if (field.getType() != long.class) {
                    continue;
                }

                try {
                    field.setAccessible(true);
                    if (field.getLong(webContents) != 0L) {
                        return field;
                    }
                } catch (Throwable ignored) {
                    // Not readable, keep looking.
                }
            }

            type = type.getSuperclass();
        }

        return null;
    }

    private static Method findEvaluateJavaScript() {
        try {
            final Class<?> genJni = Class.forName("org.jni_zero.GEN_JNI");

            for (final Method method : genJni.getDeclaredMethods()) {
                if (!method.getName().endsWith("_evaluateJavaScript")) {
                    continue;
                }

                final Class<?>[] parameters = method.getParameterTypes();
                if (parameters.length == 3 && parameters[0] == long.class) {
                    method.setAccessible(true);
                    return method;
                }
            }
        } catch (Throwable ignored) {
            // Engine not loaded yet, the caller retries.
        }

        return null;
    }

    /**
     * JavaScript injected when the back handler is scheduled. The script:
     * <ol>
     *   <li>Attaches a {@code popstate} listener.</li>
     *   <li>When the URL matches the home path ({@code /tv}), checks if
     *       {@code history.length <= 1} — meaning there is nowhere left to go back to.</li>
     *   <li>If so, calls the Java callback with the magic string {@code "BACK_TO_EXIT_HOME"},
     *       which triggers {@code activity.finish()}.</li>
     * </ol>
     *
     * <p>The callback (the third argument to {@code evaluateJavaScript}) is available in the
     * injected script as {@code arguments[3]}.  Calling it triggers
     * {@code JavaScriptCallback.handleJavaScriptResult(String)} on the Java side.
     *
     * <p>Safety net: the script is guarded by a module flag so that a re-injection into the
     * same document is always a no-op.
     */
    private static final String BACK_TO_EXIT_PAYLOAD =
            "(function(){"
            + "if(window.__ysamjoBackToExit) return;"
            + "window.__ysamjoBackToExit=true;"
            + "var HOME_PATHS=['/tv','/'];"
            + "function isHome(){"
            + "var p=location.pathname;"
            + "if(!p||p==='/') return true;"
            + "return HOME_PATHS.indexOf(p)!==-1;"
            + "}"
            + "function tryExit(){"
            + "if(isHome()&&history.length<=1){"
            + "try{arguments[3]('BACK_TO_EXIT_HOME');}catch(e){}"
            + "}"
            + "}"
            + "window.addEventListener('popstate',function(){"
            + "tryExit();"
            + "});"
            + "})();";
}
