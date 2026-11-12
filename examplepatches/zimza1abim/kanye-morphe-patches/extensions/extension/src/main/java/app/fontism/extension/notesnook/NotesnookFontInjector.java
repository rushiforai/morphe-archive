package app.fontism.extension.notesnook;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.util.Log;
import android.util.LruCache;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** No I/O or reflection in text measurement. Snapshot changes only on commit. */
public final class NotesnookFontInjector {
    private static volatile Snapshot snapshot;
    private NotesnookFontInjector() {}

    static final class Snapshot {
        final long revision;
        final Typeface base;
        /** Committed file served to WebViews, e.g. "font-123.ttf"; null when disabled. */
        final String webFile;
        final String family;
        final LruCache<Integer, Typeface> styles = new LruCache<>(48);
        Snapshot(long revision, Typeface base, String webFile) {
            this.revision = revision; this.base = base; this.webFile = base == null ? null : webFile;
            this.family = "NotesnookCustomFont_" + revision;
        }
    }

    static Snapshot current() { return snapshot; }

    static void publish(long revision, Typeface base, String webFile) {
        snapshot = new Snapshot(revision, base, webFile);
        try { NotesnookSystemTypefaces.apply(base); }
        catch (Throwable error) { Log.w(NotesnookFontStore.TAG, "Global typeface override skipped", error); }
    }

    static void initialize(Context context) {
        try {
            NotesnookFontStore.prepare(context);
            Snapshot ready = snapshot;
            Log.i(NotesnookFontStore.TAG, "startup: enabled=" + (ready != null && ready.base != null));
        } catch (Throwable error) {
            snapshot = null;
            Log.e(NotesnookFontStore.TAG, "Font startup failed; keeping original typefaces", error);
        }
    }

    // Notesnook's UI asks for its bundled Inter by weight name ("Inter-SemiBold").
    private static final Pattern INTER = Pattern.compile(
            "(?i)Inter(?:[- ]?(Thin|ExtraLight|Light|Regular|Medium|SemiBold|Bold|ExtraBold|Black))?([- ]?Italic)?");
    // Generic and system families. Anything else (MaterialCommunityIcons,
    // EvilIcons, other icon fonts) keeps its own glyphs.
    private static final Pattern ORDINARY = Pattern.compile(
            "(?i)(Roboto(?:[ -](?:Thin|Light|Regular|Medium|Bold|Black|Condensed))?|sans-serif(?:-(?:thin|light|medium|black|condensed(?:-light|-medium)?))?"
                    + "|serif|monospace|System|system-ui|-apple-system|Arial|Helvetica(?: Neue)?|OpenSans(?:-\\w+)?|Open Sans|Noto Sans|NotesnookCustomFont_[0-9]+)");

    /**
     * Called right after the app constructs a text Paint (patched call sites).
     * Android 10+ forbids replacing the native default typeface, so text without
     * any font (RN text with no fontFamily, Material/AppCompat helpers) would
     * otherwise fall back to the system font. Explicit typefaces are untouched.
     */
    public static void prime(android.graphics.Paint paint) {
        Typeface face = NotesnookSystemTypefaces.paintDefault();
        if (paint == null || face == null || paint.getTypeface() != null) return;
        paint.setTypeface(face);
    }

    public static Typeface nativeTypeface(Typeface original, int style, int weight, String family) {
        Snapshot current = snapshot;
        if (current == null || current.base == null) return original;
        int familyWeight = 0;
        boolean familyItalic = false;
        if (family != null && !family.isEmpty()) {
            String name = family.trim();
            Matcher inter = INTER.matcher(name);
            if (inter.matches()) {
                familyWeight = weightOf(inter.group(1));
                familyItalic = inter.group(2) != null;
            } else if (!ORDINARY.matcher(name).matches()) {
                return original;
            }
        }
        Typeface fallback = original == null ? Typeface.DEFAULT : original;
        boolean italic = familyItalic || (style < 0 ? fallback.isItalic() : (style & Typeface.ITALIC) != 0);
        int resolved = weight > 0 ? weight : (Build.VERSION.SDK_INT >= 28
                ? fallback.getWeight() : (fallback.isBold() ? 700 : 400));
        // "Inter-Light" + fontWeight 400 stays light; an explicit bolder weight wins.
        if (familyWeight > 0) resolved = weight > 400 ? Math.max(familyWeight, weight) : familyWeight;
        resolved = Math.max(1, Math.min(1000, resolved));
        int key = resolved * 2 + (italic ? 1 : 0);
        synchronized (current.styles) {
            Typeface result = current.styles.get(key);
            if (result == null) {
                result = NotesnookSystemTypefaces.style(current.base, resolved, italic);
                if (current.styles.size() == 0) Log.i(NotesnookFontStore.TAG, "native typeface hook active");
                current.styles.put(key, result);
            }
            return result;
        }
    }

    private static int weightOf(String name) {
        if (name == null) return 400;
        switch (name.toLowerCase(java.util.Locale.ROOT)) {
            case "thin": return 100;
            case "extralight": return 200;
            case "light": return 300;
            case "medium": return 500;
            case "semibold": return 600;
            case "bold": return 700;
            case "extrabold": return 800;
            case "black": return 900;
            default: return 400;
        }
    }
}
