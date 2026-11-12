package app.fontism.extension.joplin;

import android.util.Log;
import android.webkit.WebView;

/**
 * Bundle-independent WebView coverage. The JS bundle only styles HTML it builds
 * itself, with a fixed selector list; this adds a document-wide rule to every page
 * committed by the RN WebView client (editor, viewer, plugin panels, URI loads).
 * Icon, math and SVG text keep their own fonts. Idempotent per font revision.
 */
public final class JoplinFontWebView {
    private static final String STYLE_ID = "morphe-font-global";
    // Elements that render glyphs from dedicated fonts and must not be overridden.
    private static final String PROTECTED = ".katex,.katex *,.MathJax,.MathJax *,mjx-container,mjx-container *,"
            + "svg,svg *,math,math *,.fa,.fas,.far,.fab,.fal,.fad,[class*=\"fa-\"],[class*=\"icon\"],"
            + "[class*=\"Icon\"],.material-icons,.material-symbols-outlined,.codicon,.codicon *,i[class]";
    private static volatile boolean reported;
    private JoplinFontWebView() {}

    public static void inject(WebView view) {
        try {
            JoplinFontInjector.Snapshot font = JoplinFontInjector.current();
            if (view == null || font == null || font.base == null || font.webFile == null) return;
            view.evaluateJavascript(script(font.family, font.revision, font.webFile), null);
            if (!reported) { reported = true; Log.i("JoplinFontPatch", "WebView global font rule injected"); }
        } catch (Throwable error) {
            Log.w("JoplinFontPatch", "WebView font injection skipped", error);
        }
    }

    static String script(String family, long revision, String webFile) {
        String face = "\"" + family + "\"";
        // Two rules: the :is() rule may be rejected by very old WebViews, the
        // html/body rule still lets ordinary text inherit the custom font.
        String css = "@font-face{font-family:" + face + ";src:url(\"https://morphe-font.invalid/" + webFile
                + "\") format(\"truetype\");font-display:swap;}"
                + "html,body{font-family:" + face + ",sans-serif!important;}"
                + "body *:not(:is(" + PROTECTED + ")),input,textarea,select,button,::placeholder"
                + "{font-family:" + face + ",sans-serif!important;}";
        return "(function(){try{var d=document;if(!d||!d.documentElement)return;"
                + "var s=d.getElementById('" + STYLE_ID + "');var r='" + revision + "';"
                + "if(s&&s.getAttribute('data-rev')===r)return;"
                + "if(!s){s=d.createElement('style');s.id='" + STYLE_ID + "';}"
                + "s.setAttribute('data-rev',r);s.textContent=" + jsString(css) + ";"
                + "(d.head||d.documentElement).appendChild(s);}catch(e){}})();";
    }

    private static String jsString(String value) {
        StringBuilder out = new StringBuilder("'");
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c == '\'' || c == '\\') out.append('\\').append(c);
            else if (c < 0x20 || c == 0x2028 || c == 0x2029 || c == '<') out.append(String.format("\\u%04x", (int) c));
            else out.append(c);
        }
        return out.append('\'').toString();
    }
}
