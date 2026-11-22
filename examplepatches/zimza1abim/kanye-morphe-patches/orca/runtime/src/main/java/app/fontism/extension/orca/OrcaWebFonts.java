package app.fontism.extension.orca;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/**
 * Fonts for Orca's web shell (home, bot and worktree chats, review, files).
 *
 * React Native Web writes a font-family onto every text element, so inheritance
 * from the root never reaches them and a universal selector would also hit code.
 * Instead the shell's own family names are redefined with {@code @font-face}:
 * {@code -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial}
 * (RNW), {@code Geist, ...} (rich markdown) and the code stacks
 * ({@code ui-monospace, "SF Mono", SFMono-Regular, Menlo, ...}) used by markdown
 * code and the file editor, plus the terminal and KaTeX text faces. Only glyph
 * fonts (Nerd/terminal symbols, KaTeX_Size and AMS symbols) stay untouched.
 *
 * The faces are served same-origin under {@code /__morphe-font/}, which the shell
 * CSP already allows ({@code font-src 'self'}): one fetch and one decode shared by
 * every family alias, instead of megabytes of base64 repeated per alias. The
 * stylesheet link is written into the shell document itself, so the first paint
 * already uses the selected face.
 */
public final class OrcaWebFonts {
    private static final String PREFIX = "/__morphe-font/";
    private static final String HOST_SUFFIX = ".orca-mobile-web.invalid";
    private static final String LINK_ID = "morphe-orca-font";
    private static final String[] FAMILIES = {
            "Geist", "-apple-system", "BlinkMacSystemFont", "Segoe UI", "Roboto",
            "Helvetica", "Helvetica Neue", "Arial", "Inter", "MorpheOrcaText", "Trebuchet MS", "Verdana",
            // Code: markdown code, the file editor and any terminal preview in the shell.
            "ui-monospace", "SF Mono", "SFMono-Regular", "Menlo", "Monaco", "Consolas", "Liberation Mono",
            "Courier New", "Cascadia Mono", "DejaVu Sans Mono", "JetBrains Mono", "Fira Code", "Geist Mono",
            // Letters and digits in math; KaTeX_Size*/AMS draw delimiters and symbols and stay.
            "KaTeX_Main", "KaTeX_Math", "KaTeX_SansSerif", "KaTeX_Typewriter"};
    private static final Object LOCK = new Object();
    private static volatile Context appContext;
    private static volatile Cached cached;

    private static final class Cached {
        final long revision;
        final OrcaFontStore.WebFaces faces; // null: system default, no override
        final byte[] css;

        Cached(long revision, OrcaFontStore.WebFaces faces, byte[] css) {
            this.revision = revision;
            this.faces = faces;
            this.css = css;
        }
    }

    private OrcaWebFonts() {}

    public static void initialize(Context context) {
        if (context == null) return;
        Context app = context.getApplicationContext();
        appContext = app != null ? app : context;
    }

    /** Font and stylesheet requests under /__morphe-font/; null for everything else. */
    public static WebResourceResponse serve(WebResourceRequest request) {
        try {
            Uri url = request == null ? null : request.getUrl();
            if (url == null || !shellHost(url) || url.getPath() == null || !url.getPath().startsWith(PREFIX)) return null;
            if (!"GET".equalsIgnoreCase(request.getMethod())) return response("text/plain", 405, new byte[0]);
            Cached current = current();
            String name = url.getPath().substring(PREFIX.length());
            if ("fonts.css".equals(name)) return response("text/css", 200, current == null ? new byte[0] : current.css);
            byte[] face = null;
            if (current != null && current.faces != null) {
                if ("regular.ttf".equals(name)) face = current.faces.regular;
                else if ("bold.ttf".equals(name)) face = current.faces.bold;
            }
            return face == null ? response("text/plain", 404, new byte[0]) : response("font/ttf", 200, face);
        } catch (RuntimeException failure) {
            return null; // the shell's own handler refuses unknown paths
        }
    }

    /** Adds the stylesheet link to the shell document before its first paint. */
    public static WebResourceResponse rewrite(WebResourceRequest request, WebResourceResponse response) {
        if (response == null || request == null || !request.isForMainFrame()) return response;
        try {
            Uri url = request.getUrl();
            String mime = response.getMimeType();
            if (url == null || !shellHost(url) || mime == null || !mime.toLowerCase().startsWith("text/html")
                    || response.getStatusCode() != 200 || response.getData() == null) return response;
            Cached current = current();
            if (current == null || current.faces == null) return response;
            byte[] body = read(response.getData());
            String charset = response.getEncoding() == null ? "UTF-8" : response.getEncoding();
            String html = new String(body, charset);
            if (html.contains(LINK_ID)) return replace(response, body);
            String link = "<link id=\"" + LINK_ID + "\" rel=\"stylesheet\" href=\"" + PREFIX + "fonts.css?r="
                    + current.revision + "\">";
            int head = html.indexOf("</head>");
            if (head < 0) return replace(response, body);
            return replace(response, (html.substring(0, head) + link + html.substring(head)).getBytes(charset));
        } catch (IOException | RuntimeException failure) {
            return response; // never break the shell document over a font
        }
    }

    /**
     * Fallback for documents that were cached before the link existed: adds or
     * refreshes the same same-origin link. Literal JS; no page content is read.
     */
    public static void inject(WebView view) {
        if (view == null) return;
        try {
            Uri url = Uri.parse(String.valueOf(view.getUrl()));
            if (!shellHost(url)) return;
        } catch (RuntimeException unknown) {
            return;
        }
        Cached current = current();
        if (current == null) return;
        final String href = current.faces == null ? "" : PREFIX + "fonts.css?r=" + current.revision;
        final String js = "(function(){var l=document.getElementById('" + LINK_ID + "');var h='" + href + "';"
                + "if(!h){if(l)l.remove();return;}"
                + "if(!l){l=document.createElement('link');l.id='" + LINK_ID + "';l.rel='stylesheet';"
                + "(document.head||document.documentElement).appendChild(l);}"
                + "if(l.getAttribute('href')!==h)l.setAttribute('href',h);})();";
        Runnable job = () -> {
            try {
                view.evaluateJavascript(js, null);
            } catch (RuntimeException destroyed) {
                // A dismissed route can destroy its view mid-post.
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) job.run();
        else new Handler(Looper.getMainLooper()).post(job);
    }

    /**
     * The terminal is a separate WebView whose page the app builds as an HTML
     * string, so it gets the face inline as a data URL (its CSP is the page's own).
     * Empty for the system default. Built once per revision.
     */
    static String terminalCss() {
        Context ready = appContext;
        if (ready == null) return "";
        long revision = OrcaFontStore.revision(ready);
        TerminalCss hit = terminal;
        if (hit != null && hit.revision == revision) return hit.css;
        synchronized (LOCK) {
            hit = terminal;
            if (hit != null && hit.revision == revision) return hit.css;
            OrcaFontStore.WebFaces faces = OrcaFontStore.webFaces(ready);
            StringBuilder css = new StringBuilder();
            if (faces != null) {
                css.append("@font-face{font-family:\"MorpheOrcaText\";src:url(data:font/ttf;base64,")
                        .append(android.util.Base64.encodeToString(faces.regular, android.util.Base64.NO_WRAP))
                        .append(") format(\"truetype\");font-weight:400;font-display:block;}");
                if (faces.bold != null) css.append("@font-face{font-family:\"MorpheOrcaText\";src:url(data:font/ttf;base64,")
                        .append(android.util.Base64.encodeToString(faces.bold, android.util.Base64.NO_WRAP))
                        .append(") format(\"truetype\");font-weight:700;font-display:block;}");
            }
            TerminalCss built = new TerminalCss(revision, css.toString());
            terminal = built;
            return built.css;
        }
    }

    private static final class TerminalCss {
        final long revision;
        final String css;
        TerminalCss(long revision, String css) { this.revision = revision; this.css = css; }
    }

    private static volatile TerminalCss terminal;

    private static boolean shellHost(Uri url) {
        String host = url.getHost();
        return "https".equals(url.getScheme()) && host != null && host.endsWith(HOST_SUFFIX);
    }

    private static Cached current() {
        Context ready = appContext;
        if (ready == null) return null;
        long revision = OrcaFontStore.revision(ready);
        Cached hit = cached;
        if (hit != null && hit.revision == revision) return hit;
        synchronized (LOCK) {
            hit = cached;
            if (hit != null && hit.revision == revision) return hit;
            OrcaFontStore.WebFaces faces = OrcaFontStore.webFaces(ready);
            Cached built = new Cached(revision, faces, css(faces, revision));
            cached = built;
            return built;
        }
    }

    private static byte[] css(OrcaFontStore.WebFaces faces, long revision) {
        if (faces == null) return new byte[0];
        StringBuilder css = new StringBuilder();
        for (String family : FAMILIES) {
            face(css, family, "regular.ttf", 400, revision);
            // One face only (device or imported font): let the browser synthesize bold.
            if (faces.bold != null) face(css, family, "bold.ttf", 700, revision);
        }
        return css.toString().getBytes(StandardCharsets.UTF_8);
    }

    private static void face(StringBuilder css, String family, String file, int weight, long revision) {
        css.append("@font-face{font-family:\"").append(family).append("\";src:url(").append(PREFIX).append(file)
                .append("?r=").append(revision).append(") format(\"truetype\");font-weight:").append(weight)
                .append(";font-display:block;}");
    }

    private static WebResourceResponse response(String mime, int status, byte[] body) {
        Map<String, String> headers = new HashMap<>();
        headers.put("Cache-Control", "no-store");
        headers.put("X-Content-Type-Options", "nosniff");
        return new WebResourceResponse(mime, mime.startsWith("text/") ? "utf-8" : null, status,
                status == 200 ? "OK" : status == 404 ? "Not Found" : "Method Not Allowed", headers,
                new ByteArrayInputStream(body));
    }

    private static WebResourceResponse replace(WebResourceResponse original, byte[] body) {
        return new WebResourceResponse(original.getMimeType(), original.getEncoding(), original.getStatusCode(),
                original.getReasonPhrase(), original.getResponseHeaders(), new ByteArrayInputStream(body));
    }

    private static byte[] read(InputStream in) throws IOException {
        try (InputStream source = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[16384];
            int count;
            while ((count = source.read(buffer)) != -1) out.write(buffer, 0, count);
            return out.toByteArray();
        }
    }
}
