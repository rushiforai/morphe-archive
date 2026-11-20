package app.fontism.extension.openbot;

import android.graphics.Typeface;
import android.os.Build;
import android.util.LruCache;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** In-memory RN text resolution. No disk I/O or platform static-field changes. */
public final class OpenBotFontInjector {
    private static final Pattern INTER = Pattern.compile(
            "(?i)Inter(?:[- ]?(Thin|ExtraLight|Light|Regular|Medium|SemiBold|Bold|ExtraBold|Black))?([- ]?Italic)?");
    private static final Pattern TEXT = Pattern.compile(
            "(?i)(sans-serif(?:-[a-z-]+)?|serif(?:-[a-z-]+)?|monospace|System|system-ui|-apple-system|"
                    + "Roboto(?:[- ][a-z-]+)?|Arial|Helvetica(?: Neue)?|Noto Sans(?:[- ][a-z-]+)?|"
                    + "OpenBotCustomFont(?:_[0-9]+)?|MorpheOpenBot(?:_[0-9]+)?)");
    private static final Pattern ALIAS = Pattern.compile("MorpheOpenBot(?:_[0-9]+)?");
    private static volatile Snapshot snapshot = new Snapshot(null, 0);

    private OpenBotFontInjector() {}

    private static final class Snapshot {
        final Typeface selected;
        final long revision;
        final LruCache<Integer, Typeface> styles = new LruCache<>(64);
        Typeface system;
        Snapshot(Typeface selected, long revision) { this.selected = selected; this.revision = revision; }
    }

    static void publish(Typeface selected, long revision) {
        snapshot = new Snapshot(selected, revision);
    }

    /** Covers RN's implicit text Paint before the first measurement. */
    public static void prime(android.graphics.Paint paint) {
        Typeface selected = snapshot.selected;
        if (selected != null && paint != null && paint.getTypeface() == null) paint.setTypeface(selected);
    }

    /** Revision aliases must never enter RN's process-wide font-family registry. */
    public static Typeface resolveTypeface(Typeface original, int style, int weight, String family) {
        return family != null && ALIAS.matcher(family).matches()
                ? nativeTypeface(original, style, weight, family) : null;
    }

    /** All other families keep the existing post-resolution hook and style behavior. */
    public static Typeface nativeTypeface(Typeface original, int style, int weight, String family) {
        int namedWeight = 0;
        boolean namedItalic = false;
        if (family != null && !family.trim().isEmpty()) {
            Matcher inter = INTER.matcher(family.trim());
            if (inter.matches()) {
                namedWeight = weightOf(inter.group(1));
                namedItalic = inter.group(2) != null;
            } else if (!TEXT.matcher(family.trim()).matches()) {
                // Custom icon, emoji, KaTeX and other symbol fonts retain their glyphs.
                return original;
            }
        }
        Snapshot current = snapshot;
        Typeface base = current.selected == null ? Typeface.DEFAULT : current.selected;
        Typeface fallback = original == null ? base : original;
        boolean italic = namedItalic || (style < 0 ? fallback.isItalic() : (style & Typeface.ITALIC) != 0);
        int resolved;
        if (weight > 0) resolved = weight;
        else if (namedWeight > 0) resolved = namedWeight;
        else if (style >= 0 && (style & Typeface.BOLD) != 0) resolved = 700;
        else if (style < 0) resolved = Build.VERSION.SDK_INT >= 28 ? fallback.getWeight() : fallback.isBold() ? 700 : 400;
        else resolved = Build.VERSION.SDK_INT >= 28 ? base.getWeight() : base.isBold() ? 700 : 400;
        resolved = Math.max(1, Math.min(1000, resolved));
        int key = resolved * 2 + (italic ? 1 : 0);
        synchronized (current.styles) {
            // OEM settings can replace the system face while this process stays alive.
            if (current.selected == null && current.system != base) {
                current.styles.evictAll();
                current.system = base;
            }
            Typeface cached = current.styles.get(key);
            if (cached == null) {
                cached = Build.VERSION.SDK_INT >= 28 ? Typeface.create(base, resolved, italic)
                        : Typeface.create(base, (resolved >= 600 ? Typeface.BOLD : Typeface.NORMAL)
                                | (italic ? Typeface.ITALIC : Typeface.NORMAL));
                current.styles.put(key, cached);
            }
            return cached;
        }
    }

    private static int weightOf(String name) {
        if (name == null) return 0;
        switch (name.toLowerCase(Locale.ROOT)) {
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
