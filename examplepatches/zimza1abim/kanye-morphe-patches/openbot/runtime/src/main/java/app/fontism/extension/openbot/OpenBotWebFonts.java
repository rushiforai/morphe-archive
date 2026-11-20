package app.fontism.extension.openbot;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.ArrayList;
import java.util.List;

/** Serves a render-blocking stylesheet and the committed font entirely inside WebView. */
public final class OpenBotWebFonts {
    private static final String HOST = "morphe-font.invalid";
    private static volatile Context context;
    private static final Map<WebView, Boolean> ownedPages = new WeakHashMap<>();
    private static final String PRESERVE = ".katex,.katex *,.MathJax,.MathJax *,math,math *,mjx-container,mjx-container *,"
            + "[data-morphe-font=preserve],[data-morphe-font=preserve] *,"
            + "[class*=icon],[class*=icon] *,[class*=Icon],[class*=Icon] *,"
            + "[class*=symbol],[class*=symbol] *";

    private OpenBotWebFonts() {}

    static void initialize(Context applicationContext) { context = applicationContext; }

    /** Refreshes the local stylesheet in mounted DOM views, without page reloads. */
    static void changed() {
        Context ready = context;
        if (ready == null) return;
        long revision = OpenBotFontStore.revision(ready);
        String script = "(function(){var l=document.getElementById('morphe-openbot-font');"
                + "if(l)l.href='https://" + HOST + "/openbot.css?rev=" + revision + "';})();";
        new Handler(Looper.getMainLooper()).post(() -> {
            List<WebView> views;
            synchronized (OpenBotWebFonts.class) { views = new ArrayList<>(ownedPages.keySet()); }
            for (WebView view : views) {
                if (view == null) continue;
                synchronized (OpenBotWebFonts.class) {
                    if (!Boolean.TRUE.equals(ownedPages.get(view))) continue;
                }
                try { view.evaluateJavascript(script, null); }
                catch (RuntimeException destroyed) { /* A dismissed route can destroy its view. */ }
            }
        });
    }

    /** Called on the WebView UI callback, including when a local page navigates away. */
    public static synchronized void started(WebView view, String url) {
        if (view == null) return;
        if (ownedPage(url)) ownedPages.put(view, Boolean.TRUE);
        else ownedPages.remove(view);
    }

    private static boolean ownedPage(String url) {
        if (url == null) return false;
        Uri uri;
        try { uri = Uri.parse(url); }
        catch (RuntimeException invalid) { return false; }
        String path = uri.getPath();
        if (path == null || uri.getUserInfo() != null) return false;
        for (String segment : uri.getPathSegments()) if ("..".equals(segment) || ".".equals(segment)) return false;
        return "file".equalsIgnoreCase(uri.getScheme()) && (uri.getAuthority() == null || uri.getAuthority().isEmpty())
                && path.matches("/android_asset/www\\.bundle/[a-f0-9]{32}\\.html");
    }

    public static WebResourceResponse intercept(WebView view, WebResourceRequest request) {
        if (view == null || request == null) return null;
        Uri uri = request.getUrl();
        if (uri == null || !"https".equalsIgnoreCase(uri.getScheme())
                || !HOST.equalsIgnoreCase(uri.getHost()) || uri.getUserInfo() != null
                || (uri.getPort() != -1 && uri.getPort() != 443)) return null;
        String path = uri.getPath();
        synchronized (OpenBotWebFonts.class) {
            if (!Boolean.TRUE.equals(ownedPages.get(view)) || request.isForMainFrame())
                return response("text/plain", new byte[0], 404);
        }
        // File documents have an opaque ("null") origin. A remote subframe must
        // not read the selected device font through a trusted outer document.
        Map<String, String> requestHeaders = request.getRequestHeaders();
        if (requestHeaders != null) for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
            if ("Origin".equalsIgnoreCase(header.getKey()) && !"null".equals(header.getValue()))
                return response("text/plain", new byte[0], 404);
        }
        if (!"GET".equals(request.getMethod())) return response("text/plain", new byte[0], 405);
        Context ready = context;
        if (ready == null) return response("text/plain", new byte[0], 503);
        try {
            // A stylesheet and its revision-specific font each see one committed
            // selection. Mutations cannot delete the file during a request.
            synchronized (OpenBotFontStore.class) {
                if ("/openbot.css".equals(path) && cssQuery(uri)) {
                    long revision = OpenBotFontStore.revision(ready);
                    boolean custom = OpenBotFontStore.hasSelection(ready);
                    String family = custom ? "MorpheOpenBotWeb,system-ui,sans-serif" : "system-ui,sans-serif";
                    String css = custom ? "@font-face{font-family:MorpheOpenBotWeb;src:url('https://" + HOST
                            + "/font.ttf?rev=" + revision + "');font-display:block;}" : "";
                    css += "html,body,body *:not(:where(" + PRESERVE + ")){font-family:" + family + "!important;}";
                    return response("text/css", css.getBytes(StandardCharsets.UTF_8), 200);
                }
                if ("/font.ttf".equals(path) && uri.getQueryParameterNames().size() == 1
                        && uri.getQueryParameters("rev").size() == 1
                        && Long.toString(OpenBotFontStore.revision(ready)).equals(uri.getQueryParameter("rev"))) {
                    byte[] font = OpenBotFontStore.selectedFont(ready);
                    if (font != null) {
                        boolean otf = font.length >= 4 && font[0] == 'O' && font[1] == 'T' && font[2] == 'T' && font[3] == 'O';
                        return response(otf ? "font/otf" : "font/ttf", font, 200);
                    }
                }
            }
            return response("text/plain", new byte[0], 404);
        } catch (IOException | RuntimeException unavailable) {
            return response("text/plain", new byte[0], 404);
        }
    }

    private static boolean cssQuery(Uri uri) {
        if (uri.getQueryParameterNames().isEmpty()) return true;
        return uri.getQueryParameterNames().size() == 1 && uri.getQueryParameters("rev").size() == 1
                && uri.getQueryParameter("rev").matches("[0-9]{1,19}");
    }

    private static WebResourceResponse response(String type, byte[] data, int status) {
        Map<String, String> headers = new HashMap<>();
        headers.put("Cache-Control", "no-store");
        headers.put("Access-Control-Allow-Origin", "null");
        headers.put("X-Content-Type-Options", "nosniff");
        String reason = status == 200 ? "OK" : status == 405 ? "Method Not Allowed"
                : status == 503 ? "Unavailable" : "Not Found";
        return new WebResourceResponse(type, type.startsWith("text/") ? "UTF-8" : null,
                status, reason, headers, new ByteArrayInputStream(data));
    }
}
