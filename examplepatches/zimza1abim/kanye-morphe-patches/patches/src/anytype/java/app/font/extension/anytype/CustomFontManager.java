package app.font.extension.anytype;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.OpenableColumns;
import android.database.Cursor;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.io.*;
import java.util.*;
import java.lang.ref.WeakReference;

/** Process-local, synchronously initialized before Application.onCreate. */
public final class CustomFontManager {
    private static final String FILE = "morphe.anytype.font.file";
    private static final String NAME = "morphe.anytype.font.name";
    private static final int MAX_BYTES = 32 * 1024 * 1024;
    private static Context context;
    private static SharedPreferences prefs;
    private static File directory;
    private static Typeface base;
    private static File selectedFile;
    private static WeightAxis weightAxis;
    private static long generation;
    private static String displayName = "Default";
    private static final Map<Integer, Typeface> faces = new HashMap<>();
    private static final WeakHashMap<TextView, Typeface> originals = new WeakHashMap<>();
    private static final Set<Activity> activities = Collections.newSetFromMap(new WeakHashMap<>());
    private static WeakReference<Activity> foreground = new WeakReference<>(null);
    private CustomFontManager() {}

    public static synchronized void initialize(Context app) {
        if (context != null) return;
        context = app;
        prefs = app.getSharedPreferences("prefs", Context.MODE_PRIVATE);
        directory = new File(app.getFilesDir(), "morphe-anytype-fonts");
        String saved = prefs.getString(FILE, null);
        if (saved != null && saved.matches("font-[a-zA-Z0-9-]+\\.sfnt")) {
            File file = new File(directory, saved);
            try {
                if (!file.isFile() || file.length() == 0 || file.length() > MAX_BYTES)
                    throw new IOException("Saved font unavailable");
                weightAxis = WeightAxis.read(file);
                base = new Typeface.Builder(file).build();
                selectedFile = file;
                if (base == null) throw new IOException("Invalid saved font");
                displayName = prefs.getString(NAME, "Custom font");
            } catch (RuntimeException | IOException error) {
                base = null;
                prefs.edit().remove(FILE).remove(NAME).commit();
            }
        }
        // A fresh process cannot hold any previous native font instances.
        File[] oldFiles = directory.listFiles();
        if (oldFiles != null) for (File old : oldFiles) {
            if (old.getName().matches("font-[a-zA-Z0-9-]+\\.sfnt") && (base == null || !old.getName().equals(saved))) old.delete();
        }
        if (app instanceof Application) ((Application) app).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            public void onActivityCreated(Activity a, Bundle b) {
                activities.add(a);
                View root = a.getWindow().getDecorView();
                root.getViewTreeObserver().addOnGlobalLayoutListener(() -> applyTree(root));
            }
            public void onActivityResumed(Activity a) { foreground = new WeakReference<>(a); applyTree(a.getWindow().getDecorView()); }
            public void onActivityDestroyed(Activity a) { activities.remove(a); }
            public void onActivityStarted(Activity a) {}
            public void onActivityPaused(Activity a) {}
            public void onActivityStopped(Activity a) {}
            public void onActivitySaveInstanceState(Activity a, Bundle b) {}
        });
    }

    public static Typeface resolveAdjusted(int weight, int italic, int adjustment) {
        long effective = (long) weight + (adjustment == Integer.MAX_VALUE ? 0 : adjustment);
        return resolve((int) Math.max(1L, Math.min(1000L, effective)), italic);
    }
    public static synchronized Typeface resolve(int weight, int italic) {
        if (base == null) return null;
        weight = Math.max(1, Math.min(1000, weight));
        int key = weight * 2 + (italic == 0 ? 0 : 1);
        Typeface cached = faces.get(key);
        if (cached == null) {
            Typeface variant = base;
            if (weightAxis != null && weightAxis.clamp(weight) != weightAxis.normal) {
                Typeface loaded = new Typeface.Builder(selectedFile)
                        .setFontVariationSettings("'wght' " + weightAxis.clamp(weight)).setWeight(weight).build();
                if (loaded != null) variant = loaded;
            }
            cached = Build.VERSION.SDK_INT >= 28 ? Typeface.create(variant, weight, italic != 0)
                    : Typeface.create(variant, (weight >= 600 ? Typeface.BOLD : 0) | (italic != 0 ? Typeface.ITALIC : 0));
            faces.put(key, cached);
        }
        return cached;
    }

    public static synchronized String name() { return displayName; }
    public static Context context() { return context; }
    public static Activity activity() { return foreground.get(); }

    /** Import is performed on a worker; old font remains valid until durable commit. */
    public static void importFont(Uri uri) throws IOException {
        if (context == null) throw new IOException("Font settings unavailable");
        final long started;
        synchronized (CustomFontManager.class) { started = generation; }
        String name = null;
        try (Cursor c = context.getContentResolver().query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (c != null && c.moveToFirst()) name = c.getString(0);
        } catch (RuntimeException e) { throw new IOException("Cannot read selected file", e); }
        if (name == null) throw new IOException("Cannot read font filename");
        String lower = name.toLowerCase(Locale.ROOT);
        if (!lower.endsWith(".ttf") && !lower.endsWith(".otf")) throw new IOException("Choose a TTF or OTF font");
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Cannot create font storage");
        File candidate = new File(directory, "font-" + UUID.randomUUID() + ".sfnt");
        boolean committed = false;
        try {
            byte[] bytes;
            try (InputStream in = context.getContentResolver().openInputStream(uri); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                if (in == null) throw new IOException("Cannot open selected file");
                byte[] buffer = new byte[16384]; int n;
                while ((n = in.read(buffer)) != -1) {
                    if (out.size() + n > MAX_BYTES) throw new IOException("Font must be 32 MB or smaller");
                    out.write(buffer, 0, n);
                }
                bytes = FontValidator.validate(out.toByteArray());
            }
            try (FileOutputStream out = new FileOutputStream(candidate)) { out.write(bytes); out.getFD().sync(); }
            WeightAxis axis = WeightAxis.read(candidate);
            Typeface face = new Typeface.Builder(candidate).build();
            if (face == null) throw new IOException("Android could not load this font");
            String label = name.substring(0, name.length() - 4);
            synchronized (CustomFontManager.class) {
                if (generation != started) throw new IOException("Font selection was superseded");
                String oldFile = prefs.getString(FILE, null), oldName = prefs.getString(NAME, null);
                if (!prefs.edit().putString(FILE, candidate.getName()).putString(NAME, label).commit()) {
                    prefs.edit().putString(FILE, oldFile).putString(NAME, oldName).commit();
                    throw new IOException("Cannot save font preference");
                }
                committed = true; generation++;
                base = face; selectedFile = candidate; weightAxis = axis; displayName = label; faces.clear();
            }
            // Keep previous generations until the next cold start: existing native Typeface
            // instances may still refer to their files while windows are being recreated.
        } catch (RuntimeException e) { throw new IOException("Unable to load this font", e); }
        finally { if (!committed) candidate.delete(); }
    }

    public static synchronized void reset() throws IOException {
        String oldFile = prefs.getString(FILE, null), oldName = prefs.getString(NAME, null);
        if (!prefs.edit().remove(FILE).remove(NAME).commit()) {
            prefs.edit().putString(FILE, oldFile).putString(NAME, oldName).commit();
            throw new IOException("Cannot save default font preference");
        }
        generation++; base = null; selectedFile = null; weightAxis = null; displayName = "Default"; faces.clear();
    }

    public static void refresh() {
        for (Activity a : new ArrayList<>(activities)) {
            if (!a.isFinishing() && !a.isDestroyed()) a.runOnUiThread(a::recreate);
        }
    }

    public static synchronized Typeface replace(Typeface original) {
        int weight = original == null ? 400 : Build.VERSION.SDK_INT >= 28 ? original.getWeight() : original.isBold() ? 700 : 400;
        Typeface chosen = resolve(weight, original != null && original.isItalic() ? 1 : 0);
        return chosen != null ? chosen : original;
    }
    public static void setTypeface(TextView view, Typeface original) {
        synchronized (CustomFontManager.class) { originals.put(view, original); }
        view.setTypeface(replace(original));
    }
    public static void setTypeface(TextView view, Typeface original, int style) {
        Typeface styled = style > 0 ? Typeface.create(original, style) : original;
        synchronized (CustomFontManager.class) { originals.put(view, styled); }
        view.setTypeface(replace(styled), style);
    }
    public static Typeface setPaintTypeface(android.graphics.Paint paint, Typeface original) {
        return paint.setTypeface(replace(original));
    }
    public static void showDialog(android.app.Dialog dialog) {
        dialog.show();
        if (dialog.getWindow() != null) {
            View root = dialog.getWindow().getDecorView();
            applyTree(root);
            root.getViewTreeObserver().addOnGlobalLayoutListener(() -> applyTree(root));
        }
    }
    public static void applyTree(View view) {
        if (view instanceof TextView) {
            TextView text = (TextView) view;
            Typeface current = text.getTypeface();
            synchronized (CustomFontManager.class) {
                if (base != null) {
                    if (!faces.containsValue(current)) originals.put(text, current);
                    Typeface source = originals.containsKey(text) ? originals.get(text) : current;
                    int weight = source == null ? 400 : Build.VERSION.SDK_INT >= 28 ? source.getWeight() : source.isBold() ? 700 : 400;
                    Typeface selected = resolve(weight, source != null && source.isItalic() ? 1 : 0);
                    if (current != selected) text.setTypeface(selected);
                } else if (originals.containsKey(text)) text.setTypeface(originals.remove(text));
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) applyTree(group.getChildAt(i));
        }
    }
}
