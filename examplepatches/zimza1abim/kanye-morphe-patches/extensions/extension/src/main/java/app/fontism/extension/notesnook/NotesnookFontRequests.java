package app.fontism.extension.notesnook;

import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/**
 * Serves https://morphe-font.invalid/ for the RN WebView client: the editor's
 * render-blocking stylesheet (inserted into assets/index.html at patch time)
 * and the committed font file. Everything else falls through to the app.
 */
public final class NotesnookFontRequests {
    static final String HOST = "morphe-font.invalid";
    static final String CSS_PATH = "/notesnook.css";
    private static final java.util.concurrent.atomic.AtomicBoolean reported = new java.util.concurrent.atomic.AtomicBoolean();
    private NotesnookFontRequests() {}

    public static WebResourceResponse intercept(WebResourceRequest request) {
        Uri uri = request.getUrl();
        if (uri == null || !"https".equals(uri.getScheme()) || !HOST.equals(uri.getHost())) return null;
        Map<String, String> headers = new HashMap<>();
        headers.put("Access-Control-Allow-Origin", "*");
        headers.put("Cache-Control", "no-store");
        headers.put("X-Content-Type-Options", "nosniff");
        String path = uri.getPath();
        try {
            if (!"GET".equals(request.getMethod())) throw new java.io.IOException("Unsupported method");
            if (CSS_PATH.equals(path)) {
                // Disabled or not ready: an empty sheet, so the page never waits on us.
                NotesnookFontInjector.Snapshot font = NotesnookFontInjector.current();
                String css = font == null || font.base == null || font.webFile == null ? ""
                        : NotesnookWebFontCss.css(font.family, "https://" + HOST + "/" + font.webFile, "block");
                if (reported.compareAndSet(false, true)) Log.i(NotesnookFontStore.TAG, "WebView font stylesheet served");
                return new WebResourceResponse("text/css", "utf-8", 200, "OK", headers,
                        new ByteArrayInputStream(css.getBytes(StandardCharsets.UTF_8)));
            }
            File font = NotesnookFontStore.webFont(path);
            if (font == null) throw new java.io.IOException("Unknown font revision");
            return new WebResourceResponse("font/ttf", null, 200, "OK", headers, new FileInputStream(font));
        } catch (Exception error) {
            Log.w(NotesnookFontStore.TAG, "Font response unavailable", error);
            return new WebResourceResponse("text/plain", "utf-8", 404, "Not Found", headers,
                    new ByteArrayInputStream(new byte[0]));
        }
    }
}
