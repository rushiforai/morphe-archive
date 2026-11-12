package app.fontism.extension.notesnook;

import android.graphics.Typeface;
import android.os.Build;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;

/**
 * Process-wide default typeface replacement. Covers text that never reaches the
 * React Native typeface hook: RN text without font props (null paint typeface),
 * native dialogs, menus, toasts and XML "sans-serif*" families. Every step is
 * independent and best effort; a failed step leaves that path on the system font.
 * Explicit typefaces (icon fonts, monospace, serif) are never touched.
 */
public final class NotesnookSystemTypefaces {
    private static final String TAG = NotesnookFontStore.TAG;
    private static final String[] PUBLIC_FIELDS = {"DEFAULT", "DEFAULT_BOLD", "SANS_SERIF"};
    // family -> weight; only sans-serif aliases so code/serif text keeps its design.
    private static final Object[][] FAMILIES = {
            {"sans-serif", 400}, {"sans-serif-thin", 100}, {"sans-serif-light", 300},
            {"sans-serif-medium", 500}, {"sans-serif-black", 900},
            {"sans-serif-condensed", 400}, {"sans-serif-condensed-light", 300},
            {"sans-serif-condensed-medium", 500}, {"roboto", 400}, {"arial", 400},
            {"helvetica", 400}, {"verdana", 400}, {"tahoma", 400}, {"system-ui", 400},
    };

    private static final Map<String, Typeface> originalFields = new HashMap<>();
    private static final Map<String, Typeface> originalFamilies = new HashMap<>();
    private static Typeface[] originalDefaults;
    private static Typeface originalNativeDefault;
    private static boolean captured;
    /** Typeface.setDefault/sDefaultTypeface are max-target-P/O hidden APIs. */
    private static final boolean NATIVE_DEFAULT_ACCESSIBLE = Build.VERSION.SDK_INT <= 28;
    private static volatile Typeface paintDefault;
    private static boolean applied;

    private NotesnookSystemTypefaces() {}

    /** Custom regular face for paints created without a typeface; null when off. */
    static Typeface paintDefault() { return paintDefault; }

    /** The untouched system default, valid even after {@link #apply}. */
    public static synchronized Typeface systemDefault() {
        capture();
        Typeface original = originalFields.get("DEFAULT");
        return original != null ? original : Typeface.DEFAULT;
    }

    public static synchronized void apply(Typeface base) {
        capture();
        if (base == null) { restore(); return; }
        java.util.List<String> done = new java.util.ArrayList<>();
        Typeface regular = style(base, 400, false), bold = style(base, 700, false);
        if (setStatic("DEFAULT", regular)) done.add("DEFAULT");
        if (setStatic("DEFAULT_BOLD", bold)) done.add("DEFAULT_BOLD");
        if (setStatic("SANS_SERIF", regular)) done.add("SANS_SERIF");
        if (originalDefaults != null) {
            Typeface[] next = {regular, bold, style(base, 400, true), style(base, 700, true)};
            if (setStatic("sDefaults", next)) done.add("sDefaults");
        }
        Map<String, Typeface> map = systemFontMap();
        if (map != null) {
            try {
                synchronized (map) {
                    for (Object[] family : FAMILIES) {
                        String name = (String) family[0];
                        if (!originalFamilies.containsKey(name) && !map.containsKey(name)) continue;
                        map.put(name, style(base, (Integer) family[1], false));
                    }
                }
                done.add("sSystemFontMap");
            } catch (RuntimeException error) {
                Log.w(TAG, "System font map is read-only; XML sans-serif families keep the system font", error);
            }
        }
        if (NATIVE_DEFAULT_ACCESSIBLE && setNativeDefault(regular)) done.add("native default");
        paintDefault = regular;
        applied = true;
        // Android 10+ blocks the native default; the app's own Paint construction
        // sites are patched instead (NotesnookFontInjector.prime).
        Log.i(TAG, "Global typeface override: " + done + (NATIVE_DEFAULT_ACCESSIBLE ? "" : " + app paint hook"));
    }

    private static void restore() {
        if (!applied) return;
        for (Map.Entry<String, Typeface> entry : originalFields.entrySet()) setStatic(entry.getKey(), entry.getValue());
        if (originalDefaults != null) setStatic("sDefaults", originalDefaults.clone());
        Map<String, Typeface> map = systemFontMap();
        if (map != null) {
            try {
                synchronized (map) {
                    for (Map.Entry<String, Typeface> entry : originalFamilies.entrySet()) map.put(entry.getKey(), entry.getValue());
                }
            } catch (RuntimeException ignored) {}
        }
        if (NATIVE_DEFAULT_ACCESSIBLE)
            setNativeDefault(originalNativeDefault != null ? originalNativeDefault : originalFields.get("DEFAULT"));
        paintDefault = null;
        applied = false;
        Log.i(TAG, "Global typeface override removed");
    }

    private static void capture() {
        if (captured) return;
        captured = true;
        for (String name : PUBLIC_FIELDS) {
            Object value = getStatic(name);
            if (value instanceof Typeface) originalFields.put(name, (Typeface) value);
        }
        Object defaults = getStatic("sDefaults");
        if (defaults instanceof Typeface[]) originalDefaults = ((Typeface[]) defaults).clone();
        if (NATIVE_DEFAULT_ACCESSIBLE) {
            Object nativeDefault = getStatic("sDefaultTypeface");
            if (nativeDefault instanceof Typeface) originalNativeDefault = (Typeface) nativeDefault;
        }
        Map<String, Typeface> map = systemFontMap();
        if (map != null) {
            try {
                synchronized (map) {
                    for (Object[] family : FAMILIES) {
                        Typeface face = map.get((String) family[0]);
                        if (face != null) originalFamilies.put((String) family[0], face);
                    }
                }
            } catch (RuntimeException ignored) {}
        }
    }

    public static Typeface style(Typeface base, int weight, boolean italic) {
        if (Build.VERSION.SDK_INT >= 28) return Typeface.create(base, weight, italic);
        return Typeface.create(base, (weight >= 600 ? Typeface.BOLD : 0) | (italic ? Typeface.ITALIC : 0));
    }

    @SuppressWarnings("unchecked")
    private static Map<String, Typeface> systemFontMap() {
        Object map = getStatic("sSystemFontMap");
        return map instanceof Map ? (Map<String, Typeface>) map : null;
    }

    private static Object getStatic(String name) {
        try {
            Field field = Typeface.class.getDeclaredField(name);
            if (!Modifier.isStatic(field.getModifiers())) return null;
            field.setAccessible(true);
            return field.get(null);
        } catch (Throwable error) {
            return null;
        }
    }

    private static boolean setStatic(String name, Object value) {
        try {
            Field field = Typeface.class.getDeclaredField(name);
            if (!Modifier.isStatic(field.getModifiers())) return false;
            field.setAccessible(true);
            field.set(null, value);
            return true;
        } catch (Throwable error) {
            Log.w(TAG, "Typeface." + name + " not replaceable: " + error);
            return false;
        }
    }

    /** Paint with a null typeface (RN text without font props) uses the native default. */
    private static boolean setNativeDefault(Typeface face) {
        if (face == null) return false;
        try {
            Method method = Typeface.class.getDeclaredMethod("setDefault", Typeface.class);
            method.setAccessible(true);
            method.invoke(null, face);
            return true;
        } catch (Throwable error) {
            Log.w(TAG, "Native default typeface not replaceable: " + error);
            return false;
        }
    }
}
