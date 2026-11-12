package app.fontism.extension.joplin;
import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.util.Log;
import android.util.LruCache;

/** No I/O or reflection in text measurement. Snapshot changes only on commit. */
public final class JoplinFontInjector {
    private static volatile Snapshot snapshot;
    private JoplinFontInjector() {}
    static final class Snapshot {
        final long revision;
        final String family;
        final Typeface base;
        /** Served path of the committed font file, e.g. "font-123.ttf"; null when disabled. */
        final String webFile;
        final LruCache<Integer, Typeface> styles = new LruCache<>(32);
        Snapshot(long revision, Typeface base, String webFile) {
            this.revision = revision; this.base = base; this.webFile = base == null ? null : webFile;
            this.family = "JoplinCustomFont_" + revision;
        }
    }
    static Snapshot current() { return snapshot; }
    static void publish(long revision, Typeface base, String webFile) {
        snapshot = new Snapshot(revision, base, webFile);
        try { JoplinSystemTypefaces.apply(base); }
        catch (Throwable error) { Log.w("JoplinFontPatch", "Global typeface override skipped", error); }
    }
    static void initialize(Context context) {
        try {
            JoplinFontStore.prepare(context);
            Snapshot ready = snapshot;
            Log.i("JoplinFontPatch", "v10 native startup: enabled=" + (ready != null && ready.base != null));
        }
        catch (Exception error) {
            snapshot = null;
            Log.e("JoplinFontPatch", "Font startup failed; keeping original typefaces", error);
        }
    }
    private static final java.util.regex.Pattern ORDINARY = java.util.regex.Pattern.compile(
            "(?i)(Roboto(?:[ -](?:Light|Regular|Medium|Bold|Thin|Black|Condensed))?|sans-serif(?:-(?:light|medium|thin|black|condensed(?:-light|-medium)?))?|serif|monospace|System|system-ui|-apple-system|Arial|Helvetica(?: Neue)?|Courier New|Menlo|Avenir|Inter|Noto Sans)");
    // Any revision: the JS layer may still carry the previous family until it refreshes.
    private static final java.util.regex.Pattern CUSTOM = java.util.regex.Pattern.compile("JoplinCustomFont_[0-9]+");
    private static boolean ordinaryFamily(String family) {
        return family == null || family.isEmpty() || CUSTOM.matcher(family).matches()
                || ORDINARY.matcher(family.trim()).matches();
    }
    public static Typeface nativeTypeface(Typeface original, int style, int weight, String family) {
        Snapshot current = snapshot;
        if (current == null || current.base == null) return original;
        // Ordinary native text no longer depends on the JS metadata reader.
        // Never override unknown families: icon fonts must retain their glyphs.
        if (!ordinaryFamily(family)) return original;
        Typeface fallback = original == null ? Typeface.DEFAULT : original;
        boolean italic = style < 0 ? fallback.isItalic() : (style & Typeface.ITALIC) != 0;
        int resolvedWeight = weight > 0 ? weight : (Build.VERSION.SDK_INT >= 28
                ? fallback.getWeight() : (fallback.isBold() ? 700 : 400));
        resolvedWeight = Math.max(1, Math.min(1000, resolvedWeight));
        int key = resolvedWeight * 2 + (italic ? 1 : 0);
        synchronized (current.styles) {
            Typeface result = current.styles.get(key);
            if (result == null) {
                result = JoplinSystemTypefaces.style(current.base, resolvedWeight, italic);
                if (current.styles.size() == 0) Log.i("JoplinFontPatch", "v10 native typeface hook active");
                current.styles.put(key, result);
            }
            return result;
        }
    }
}
