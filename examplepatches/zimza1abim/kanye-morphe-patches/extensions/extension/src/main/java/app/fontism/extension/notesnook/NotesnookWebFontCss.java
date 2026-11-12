package app.fontism.extension.notesnook;

/** Document-wide WebView font CSS. Icon, math and SVG text keep their own fonts. */
public final class NotesnookWebFontCss {
    private static final String PROTECTED = ".katex,.katex *,.MathJax,.MathJax *,mjx-container,mjx-container *,"
            + "svg,svg *,math,math *,.fa,.fas,.far,.fab,.fal,.fad,[class*=\"fa-\"],[class*=\"icon\"],"
            + "[class*=\"Icon\"],.material-icons,.material-symbols-outlined,.mdi,[class^=\"mdi-\"],"
            + ".codicon,.codicon *,i[class]";

    private NotesnookWebFontCss() {}

    /**
     * @param display "block" when the stylesheet is render-blocking in &lt;head&gt;
     *                (no fallback flash), "swap" when injected after first paint.
     */
    public static String css(String family, String fontUrl, String display) {
        String face = "\"" + family.replace("\"", "") + "\"";
        // The :is() rule may be rejected by very old WebViews; the html/body
        // rule still lets ordinary text inherit the custom font.
        return "@font-face{font-family:" + face + ";src:url(\"" + fontUrl.replace("\"", "%22") + "\");"
                + "font-display:" + display + ";}"
                + "html,body{font-family:" + face + ",sans-serif!important;}"
                + "body *:not(:is(" + PROTECTED + ")),input,textarea,select,button"
                + "{font-family:" + face + ",sans-serif!important;}"
                + "::placeholder{font-family:" + face + ",sans-serif!important;}";
    }
}
