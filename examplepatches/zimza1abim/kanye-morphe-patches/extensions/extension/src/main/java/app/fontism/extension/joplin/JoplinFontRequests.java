package app.fontism.extension.joplin;

import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Map;

/** A local, font-only response; no file-origin relaxation or base64 duplication. */
public final class JoplinFontRequests {
    private static final java.util.concurrent.atomic.AtomicBoolean reported = new java.util.concurrent.atomic.AtomicBoolean();
    private JoplinFontRequests() {}
    public static WebResourceResponse intercept(WebResourceRequest request) {
        android.net.Uri uri = request.getUrl();
        if (!"https".equals(uri.getScheme()) || !"morphe-font.invalid".equals(uri.getHost())) return null;
        Map<String, String> headers = new HashMap<>();
        headers.put("Access-Control-Allow-Origin", "*");
        headers.put("Cache-Control", "no-store");
        headers.put("X-Content-Type-Options", "nosniff");
        try {
            String path = uri.getPath();
            File font = path == null ? null : JoplinFontStore.webFont(path);
            if (!"GET".equals(request.getMethod()) || font == null) throw new java.io.IOException("Unknown font revision");
            FileInputStream stream = new FileInputStream(font);
            if (reported.compareAndSet(false, true)) android.util.Log.i("JoplinFontPatch", "v10 WebView font stream opened");
            return new WebResourceResponse("font/ttf", null, 200, "OK", headers, stream);
        } catch (Exception error) {
            android.util.Log.w("JoplinFontPatch", "Font response unavailable", error);
            return new WebResourceResponse("text/plain", "utf-8", 404, "Not Found", headers, new ByteArrayInputStream(new byte[0]));
        }
    }
}
