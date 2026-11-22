package app.fontism.extension.orca;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.Build;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * The committed selection replaces every text family, code and monospace
 * included; only icon and symbol glyph fonts keep their faces. The selection comes
 * from OrcaFontStore: "system" passes the original face through, "bundled"
 * uses the shipped Pretendard pair, "pkg:"/"import:" faces were resolved when
 * the store committed. Null-safe throughout: anything broken degrades to the
 * system font instead of throwing.
 */
public final class OrcaFonts {
    private static final String REGULAR_ASSET = "morphe-orca/Pretendard-Regular.ttf";
    private static final String BOLD_ASSET = "morphe-orca/Pretendard-Bold.ttf";

    // Only glyph fonts are kept: their code points draw icons and symbols, not
    // letters, so a text face would turn them into empty boxes. Every text family,
    // code and monospace included, takes the selected face.
    private static final Pattern NON_TEXT = Pattern.compile(
            "(?i)ionicons?|font-?awesome|material[a-z-]*icons?|material ?symbols|feather|codicons|"
                    + "nerd ?font|symbols nerd|terminal symbols|emoji|entypo|octicons|simple-?line-?icons|"
                    + "foundation|zocial|evilicons|antdesign|fontisto");

    private static final Object LOAD_LOCK = new Object();
    private static final Map<Integer, Typeface> STYLE_CACHE = new HashMap<>();

    private static volatile Context appContext;
    /** Faces of the committed selection; null means "system": pass through. */
    private static volatile Faces faces;
    /** The shipped Pretendard pair, loaded lazily for the "bundled" selection. */
    private static volatile Faces bundled;

    static final class Faces {
        final Typeface regular;
        final Typeface bold;

        Faces(Typeface regular, Typeface bold) {
            this.regular = regular;
            this.bold = bold;
        }
    }

    /**
     * Called from Application.attachBaseContext, before React Native starts, so
     * the first paint already sees the committed selection.
     */
    public static void initialize(Context context) {
        if (context != null) {
            // getApplicationContext() is still null during attachBaseContext.
            Context app = context.getApplicationContext();
            appContext = app != null ? app : context;
        }
        Context ready = appContext != null ? appContext : context;
        if (ready != null) {
            OrcaFontStore.prepare(ready); // publishes the committed selection
            ensureLoaded(ready.getAssets());
        }
        OrcaWebFonts.initialize(ready);
    }

    /** Covers RN's implicit text Paint; an explicit fontFamily set later still wins. */
    public static void prime(Paint paint) {
        Faces cooked = faces;
        if (cooked != null && paint != null && paint.getTypeface() == null) paint.setTypeface(cooked.regular);
    }

    public static Typeface nativeTypeface(Typeface original, int style, int weight, String family, AssetManager assets) {
        try {
            // React Native passes -1 for unset style/weight and -1 has every bit
            // set; normalize before any bit test or the face becomes bold-italic.
            if (style < 0) style = 0;
            if (weight < 0) weight = 0;
            Faces cooked = faces;
            if (cooked == null) {
                // "system" selection (or a store that is not ready yet): pass the
                // original through. The passed assets still warm the bundled pair.
                if (assets != null) ensureLoaded(assets);
                return original;
            }
            if (family != null && !family.trim().isEmpty() && NON_TEXT.matcher(family.trim()).find()) return original;
            boolean bold = weight > 0 ? clamp(weight) >= 600 : (style & Typeface.BOLD) != 0;
            boolean italic = (style & Typeface.ITALIC) != 0;
            int key = (bold ? 2 : 0) | (italic ? 1 : 0);
            synchronized (STYLE_CACHE) {
                // At most four variants; faux italic is the only derived face.
                Typeface cached = STYLE_CACHE.get(key);
                if (cached == null) {
                    Typeface base = bold ? cooked.bold : cooked.regular;
                    if (base == null) return original;
                    cached = italic ? fauxItalic(base, bold, weight) : base;
                    if (cached == null) return original;
                    STYLE_CACHE.put(key, cached);
                }
                return cached;
            }
        } catch (RuntimeException failure) {
            return original; // a broken face degrades to the system font, never throws
        }
    }

    /** Publishes the committed selection; every derived variant follows the new faces. */
    static void publish(Faces next) {
        synchronized (STYLE_CACHE) {
            faces = next;
            STYLE_CACHE.clear();
        }
    }

    /** The shipped Pretendard pair, or null while assets are missing/corrupt. */
    static Faces bundledFaces(AssetManager assets) {
        ensureLoaded(assets);
        return bundled;
    }

    /** Weighted derivation keeps a custom face from silently becoming a system face. */
    static Typeface fauxBold(Typeface base) {
        if (base == null) return null;
        return Build.VERSION.SDK_INT >= 28
                ? Typeface.create(base, 700, false) : Typeface.create(base, Typeface.BOLD);
    }

    static Typeface fauxItalic(Typeface base, boolean bold, int weight) {
        if (base == null) return null;
        if (Build.VERSION.SDK_INT >= 28) {
            int derived = weight > 0 ? clamp(weight) : (bold ? 700 : 400);
            return Typeface.create(base, derived, true);
        }
        return Typeface.create(base, (bold ? Typeface.BOLD : 0) | Typeface.ITALIC);
    }

    private static int clamp(int weight) {
        return Math.max(1, Math.min(1000, weight));
    }

    private static void ensureLoaded(AssetManager fallback) {
        if (bundled != null) return;
        synchronized (LOAD_LOCK) {
            if (bundled != null) return; // re-check under the lock; the load runs once
            AssetManager assets = fallback;
            Context ready = appContext;
            if (assets == null && ready != null) assets = ready.getAssets();
            if (assets == null) return; // nothing readable yet; retry on a later hook
            Typeface regular = null;
            Typeface bold = null;
            try {
                regular = Typeface.createFromAsset(assets, REGULAR_ASSET);
                bold = Typeface.createFromAsset(assets, BOLD_ASSET);
            } catch (RuntimeException missing) {
                // A missing or corrupt font degrades to pass-through, never throws.
                return;
            }
            // Partial fonts would skew weights; both load or none do.
            if (regular != null && bold != null) bundled = new Faces(regular, bold);
        }
    }
}
