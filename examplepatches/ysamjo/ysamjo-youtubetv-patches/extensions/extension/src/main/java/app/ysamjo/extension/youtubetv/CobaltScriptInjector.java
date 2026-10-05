package app.ysamjo.extension.youtubetv;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Arrays;

/**
 * Injects a userscript into the leanback web app that the Cobalt engine loads from
 * youtube.com/tv.
 *
 * <p>Why reflection instead of a direct call: the pieces we need are present in the shipped
 * APK, but their names are not all stable. Cobalt's own {@code dev.cobalt.coat.CobaltActivity}
 * is unobfuscated, while the {@code WebContentsImpl} field holding the native pointer is
 * R8-renamed and changes between app versions. Resolving everything at runtime by shape
 * (the only {@code long} field of the WebContents object, the {@code GEN_JNI} method whose
 * name ends in {@code _evaluateJavaScript}) keeps one patch build working across versions.
 */
public final class CobaltScriptInjector {

    private static final String TAG = "ysamjo-tv-adblock";

    private static final long POLL_INTERVAL_MS = 250L;

    /** Interval used once the first injection has gone through. */
    private static final long REINJECT_INTERVAL_MS = 2000L;

    /** 240 * 250 ms = 60 s of polling before giving up on the first injection. */
    private static final int MAX_POLL_ATTEMPTS = 240;

    /** 300 * 2 s = 10 min of re-injection after the first success. */
    private static final int MAX_REINJECT_ATTEMPTS = 300;

    /**
     * How many re-injections stay on the fast interval. 120 * 250 ms = 30 s, which comfortably
     * covers app start plus the first video's player request.
     */
    private static final int FAST_REINJECT_ATTEMPTS = 120;

    private static boolean scheduled;

    /** Number of successful injections so far; drives the one-off diagnostics. */
    private static int injectionCount;

    private CobaltScriptInjector() {
    }

    /**
     * Entry point called from the patched {@code CobaltActivity.onCreate}.
     *
     * <p>The WebContents handle does not exist yet when onCreate runs, so poll on the main
     * looper until the page is up.
     *
     * <p>Polling alone is not enough. The handle becomes valid long before the leanback app
     * has finished loading, so the first script lands in a document that the very next
     * navigation throws away. Cobalt's own log shows this clearly: the injection succeeds
     * roughly 300 ms before the first navigation commits. Injecting once and stopping
     * therefore looks successful while doing nothing.
     *
     * <p>So keep re-injecting on a slower interval afterwards. The payload guards itself with
     * a flag, which makes repeats in the same document no-ops; a fresh document has no flag
     * and gets the hooks again.
     */
    public static void schedule(final Activity activity) {
        if (activity == null || scheduled) {
            return;
        }
        scheduled = true;

        final Handler handler = new Handler(Looper.getMainLooper());

        handler.postDelayed(new Runnable() {
            private int pollAttempts;
            private int reinjectAttempts;
            private boolean firstSuccess;

            @Override
            public void run() {
                boolean injectedNow = false;
                try {
                    injectedNow = inject(activity);
                } catch (Throwable throwable) {
                    if (pollAttempts < 5) {
                        Log.w(TAG, "injection attempt failed", throwable);
                    }
                }

                if (injectedNow && !firstSuccess) {
                    firstSuccess = true;
                    Log.i(TAG, "userscript injected");
                } else if (injectedNow && reinjectAttempts < 10) {
                    Log.i(TAG, "re-injected (" + reinjectAttempts + ")");
                }

                if (!firstSuccess) {
                    if (++pollAttempts >= MAX_POLL_ATTEMPTS) {
                        Log.w(TAG, "gave up injecting the userscript after "
                                + MAX_POLL_ATTEMPTS + " attempts");
                        return;
                    }
                    handler.postDelayed(this, POLL_INTERVAL_MS);
                    return;
                }

                // Stay on the fast interval for a while after the first success. That first
                // success is almost always into a document the next navigation throws away,
                // so nothing is actually hooked yet. Measured on the Google TV Streamer: the
                // first injection lands ~300 ms before the navigation commits, and the app's
                // first ad beacon follows within two seconds — before a 2 s re-injection ever
                // gets its turn. The payload guards itself, so the extra calls are no-ops.
                ++reinjectAttempts;
                if (reinjectAttempts >= MAX_REINJECT_ATTEMPTS) {
                    return;
                }

                handler.postDelayed(this, reinjectAttempts <= FAST_REINJECT_ATTEMPTS
                        ? POLL_INTERVAL_MS
                        : REINJECT_INTERVAL_MS);
            }
        }, POLL_INTERVAL_MS);
    }

    private static boolean inject(final Activity activity) throws Exception {
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

        // The first injection lands before the document exists, so run the diagnostics a few
        // attempts later, when the leanback app is actually loaded.
        if (++injectionCount == 4) {
            Log.i(TAG, "diag: webContents=" + webContents.getClass().getName()
                    + " field=" + pointerField.getName()
                    + " pointer=" + pointer
                    + " jni=" + evaluateJavaScript.getName()
                    + " returnType=" + evaluateJavaScript.getReturnType().getName());
            probeReadBack(pointer, evaluateJavaScript);
        }

        evaluateJavaScript.invoke(null, pointer, USERSCRIPT, null);
        return true;
    }

    /**
     * Class names the callback interface has lived under.
     *
     * <p>The stock app re-vendors Cobalt under {@code cobalt.org.chromium.*}, and R8 collapses
     * the interface down to a single no-argument method, so nothing can be read back from it.
     * TizenTube Cobalt keeps the plain {@code org.chromium.*} namespace and the original
     * {@code onEvaluateJavaScriptResult(String)}, so the probe returns a real value there.
     */
    private static final String[] CALLBACK_CLASS_NAMES = {
            "org.chromium.content_public.browser.JavaScriptCallback",
            "cobalt.org.chromium.content_public.browser.JavaScriptCallback",
    };

    /**
     * Evaluates a trivial expression with a real {@code JavaScriptCallback} attached.
     *
     * <p>This is the only way to tell "the script did not run" apart from "the script ran but
     * its console output is not forwarded to logcat" — an injected script's {@code console.log}
     * is demonstrably dropped on the stock app, while the callback proves execution from the
     * engine's own side.
     */
    private static void probeReadBack(final long pointer, final Method evaluateJavaScript) {
        for (final String className : CALLBACK_CLASS_NAMES) {
            try {
                probeReadBack(pointer, evaluateJavaScript, className);
                return;
            } catch (final Throwable throwable) {
                Log.i(TAG, "read-back probe: " + className + " not usable ("
                        + throwable.getClass().getSimpleName() + ")");
            }
        }

        Log.w(TAG, "read-back probe failed: no JavaScriptCallback interface was usable");
    }

    private static void probeReadBack(final long pointer, final Method evaluateJavaScript,
                                      final String className) throws Exception {
        final Class<?> callbackClass = Class.forName(className);

        for (final Method declared : callbackClass.getDeclaredMethods()) {
            Log.i(TAG, "callback " + callbackClass.getName() + " method: " + declared.getName()
                    + Arrays.toString(declared.getParameterTypes()));
        }

        final Object callback = Proxy.newProxyInstance(
                callbackClass.getClassLoader(),
                new Class<?>[] {callbackClass},
                new InvocationHandler() {
                    @Override
                    public Object invoke(final Object proxy, final Method method,
                                         final Object[] arguments) {
                        Log.i(TAG, "js callback " + method.getName() + " -> "
                                + (arguments == null
                                        ? "(keine Argumente)"
                                        : Arrays.toString(arguments)));
                        return null;
                    }
                });

        evaluateJavaScript.invoke(null, pointer,
                "document.readyState + '|' + (40 + 2)", callback);
        Log.i(TAG, "read-back probe sent via " + className);
    }

    /**
     * The native pointer is a {@code long} field on the WebContents implementation. Its name
     * is obfuscated, so pick the field by type instead. Fields declared directly on the
     * concrete class are checked first, and a non-zero value is required.
     */
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

    /**
     * Finds the still-registered {@code WebContentsImpl.evaluateJavaScript} native in
     * jni_zero's generated glue. Only the Java wrapper was removed by R8, the native itself
     * is intact.
     */
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
     * The payload body. Deliberately plain ES5 and free of double quotes so it survives being
     * embedded as a Java string literal and still runs in Cobalt's JS engine.
     *
     * <p>It hooks JSON.parse, which is where the leanback app turns InnerTube responses into
     * objects, and deletes the ad keys before the app ever sees them. The fetch hook is a
     * second line of defence and only engages when the engine exposes a Response constructor.
     */
    private static final String PAYLOAD_BODY =
            "var KEYS = ['adPlacements','playerAds','adSlots','adBreakHeartbeatParams',"
            + "'importantAdBreak','adBreakServiceMetadata'];"
            + "function strip(o){"
            + "if(!o || typeof o !== 'object') return o;"
            + "for (var i=0;i<KEYS.length;i++){"
            + "if (KEYS[i] in o){ try{ delete o[KEYS[i]]; }catch(e){} }"
            + "}"
            + "return o;"
            + "}"
            + "var parse = JSON.parse;"
            + "JSON.parse = function(){"
            + "var r = parse.apply(this, arguments);"
            + "try{ strip(r); }catch(e){}"
            + "return r;"
            + "};"
            + "var origFetch = window.fetch;"
            + "if (origFetch && typeof Response === 'function'){"
            + "window.fetch = function(){"
            + "return origFetch.apply(this, arguments).then(function(res){"
            + "try{"
            + "var u = (res && res.url) || '';"
            + "if (u.indexOf('/youtubei/') !== -1 || u.indexOf('get_midroll_info') !== -1){"
            + "return res.clone().text().then(function(t){"
            + "try{"
            + "var j = parse(t); strip(j);"
            + "return new Response(JSON.stringify(j), {status: res.status, "
            + "statusText: res.statusText, headers: res.headers});"
            + "}catch(e){ return res; }"
            + "}).catch(function(){ return res; });"
            + "}"
            + "}catch(e){}"
            + "return res;"
            + "});"
            + "};"
            + "}";

    /** The payload as it ships. Guarded, so a re-injection into the same document is a no-op. */
    private static final String FULL_PAYLOAD =
            "(function(){"
            + "if (window.__ysamjoTvAdblock) return; window.__ysamjoTvAdblock = true;"
            + PAYLOAD_BODY
            + "console.log('YSAMJO_ADBLOCK_ACTIVE');"
            + "})();";

    /**
     * Diagnostic build. Answers, in one run, the questions that decide the next move:
     *
     * <ol>
     *   <li><b>Does the script run?</b> Proven by a same-document navigation, which Cobalt logs
     *       as {@code Navigated to ...#ysamjo-...}. That is an engine-side observation, so it
     *       cannot be faked by a console line that never arrives — and it is now established
     *       that console output from an injected script is <em>not</em> forwarded, while the
     *       page's own console messages are.</li>
     *   <li><b>Which transport carries the ad data?</b> The page demonstrably uses
     *       {@code XMLHttpRequest}, but the shipping payload only hooks {@code JSON.parse} and
     *       {@code fetch}. The counters separate "the hook never fires" from "the hook fires
     *       but never sees an ad key".</li>
     *   <li><b>Does stripping actually suppress the ad?</b> This is the one question the
     *       counters alone cannot answer, so the script carries a switch: if the loaded URL
     *       contains {@code nostrip}, {@code strip()} counts the ad keys but leaves them in
     *       place. Patching the same bundle twice — once with {@code ?ysamjo=1}, once with
     *       {@code ?ysamjo=1&nostrip=1} — turns "ads went away" into a controlled A/B instead
     *       of a coincidence that could just be ad rotation. The mode letter is part of the
     *       reported string so the log says which half of the experiment it belongs to.</li>
     * </ol>
     *
     * <p>Counter order: JSON.parse calls, JSON.parse results carrying any ad key, results
     * carrying {@code adPlacements}, fetch calls, fetch calls to an InnerTube URL, XHR opens,
     * XHR opens to an InnerTube URL, results carrying {@code playerAds}.
     */
    private static final String DIAG_PAYLOAD =
            "(function(){"
            + "if (window.__ysamjoTvAdblock) return; window.__ysamjoTvAdblock = true;"
            + "var KEYS = ['adPlacements','playerAds','adSlots','adBreakHeartbeatParams',"
            + "'importantAdBreak','adBreakServiceMetadata'];"
            + "var C = [0,0,0,0,0,0,0,0];"
            + "var NOSTRIP = location.search.indexOf('nostrip') !== -1;"
            + "function strip(o){"
            + "if(!o || typeof o !== 'object') return false;"
            + "var hit = false;"
            + "for (var i=0;i<KEYS.length;i++){"
            + "if (KEYS[i] in o){"
            + "hit = true;"
            + "if (KEYS[i] === 'adPlacements') C[2]++;"
            + "if (KEYS[i] === 'playerAds') C[7]++;"
            + "if (!NOSTRIP){ try{ delete o[KEYS[i]]; }catch(e){} }"
            + "}"
            + "}"
            + "return hit;"
            + "}"
            + "function isAd(u){ u = '' + u;"
            + "return u.indexOf('/youtubei/') !== -1 || u.indexOf('get_midroll_info') !== -1; }"
            + "var P = JSON.parse;"
            + "JSON.parse = function(){"
            + "C[0]++;"
            + "var r = P.apply(this, arguments);"
            + "try{ if (strip(r)) C[1]++; }catch(e){}"
            + "return r;"
            + "};"
            + "var origFetch = window.fetch;"
            + "if (origFetch){"
            + "window.fetch = function(a){"
            + "C[3]++;"
            + "var u = '';"
            + "try{ u = (a && a.url) ? a.url : a; }catch(e){}"
            + "if (isAd(u)) C[4]++;"
            + "return origFetch.apply(this, arguments).then(function(res){"
            + "try{"
            + "if (isAd((res && res.url) || u) && res && res.clone"
            + " && typeof Response === 'function'){"
            + "return res.clone().text().then(function(t){"
            + "try{"
            + "var j = P(t);"
            + "if (strip(j)) C[1]++;"
            + "return new Response(JSON.stringify(j), {status: res.status, "
            + "statusText: res.statusText, headers: res.headers});"
            + "}catch(e){ return res; }"
            + "}).catch(function(){ return res; });"
            + "}"
            + "}catch(e){}"
            + "return res;"
            + "});"
            + "};"
            + "}"
            + "var xhrOpen = XMLHttpRequest.prototype.open;"
            + "XMLHttpRequest.prototype.open = function(m, u){"
            + "C[5]++;"
            + "try{ if (isAd(u)) C[6]++; }catch(e){}"
            + "return xhrOpen.apply(this, arguments);"
            + "};"
            + "var n = 0;"
            + "var timer = setInterval(function(){"
            + "var s = (NOSTRIP ? 'B-' : 'A-') + C.join('.');"
            + "if (s !== window.__ysamjoLast){"
            + "window.__ysamjoLast = s;"
            + "try{ location.hash = '#ysamjo-' + s; }catch(e){}"
            + "}"
            + "if (++n > 20) clearInterval(timer);"
            + "}, 3000);"
            + "})();";

    /**
     * What actually gets injected. {@link #DIAG_PAYLOAD} while the runtime behaviour is still
     * unproven, {@link #FULL_PAYLOAD} once it is.
     */
    private static final String USERSCRIPT = FULL_PAYLOAD;
}
