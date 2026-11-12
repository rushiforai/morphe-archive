package app.fontism.extension.notesnook;

import android.util.Log;
import android.webkit.WebView;

/**
 * Covers pages that do not carry the patch-time stylesheet (anything other than
 * the bundled editor HTML) and refreshes the sheet when the font revision
 * changes while a page is open. Idempotent per revision.
 */
public final class NotesnookFontWebView {
    private static final String LINK_ID = "morphe-font-link";
    private static volatile boolean reported;
    private NotesnookFontWebView() {}

    public static void inject(WebView view) {
        try {
            if (view == null) return;
            NotesnookFontInjector.Snapshot font = NotesnookFontInjector.current();
            long revision = font == null || font.base == null ? 0 : font.revision;
            String href = "https://" + NotesnookFontRequests.HOST + NotesnookFontRequests.CSS_PATH + "?rev=" + revision;
            view.evaluateJavascript("(function(){try{var d=document;if(!d||!d.documentElement)return;"
                    + "var l=d.getElementById('" + LINK_ID + "');var h='" + href + "';"
                    + "if(l&&l.getAttribute('href')===h)return;"
                    + "if(!l){l=d.createElement('link');l.id='" + LINK_ID + "';l.rel='stylesheet';"
                    + "(d.head||d.documentElement).appendChild(l);}"
                    + "l.setAttribute('href',h);}catch(e){}})();", null);
            if (!reported && revision != 0) { reported = true; Log.i(NotesnookFontStore.TAG, "WebView font link checked"); }
        } catch (Throwable error) {
            Log.w(NotesnookFontStore.TAG, "WebView font injection skipped", error);
        }
    }
}
