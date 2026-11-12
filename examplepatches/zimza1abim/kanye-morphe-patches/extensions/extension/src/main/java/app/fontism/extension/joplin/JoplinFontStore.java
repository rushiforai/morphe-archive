package app.fontism.extension.joplin;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.provider.OpenableColumns;
import android.util.AtomicFile;
import android.util.Log;
import org.json.JSONObject;
import java.io.*;
import java.nio.charset.StandardCharsets;

/** A committed JSON snapshot is the authority for both Java and React Native. */
final class JoplinFontStore {
    private static final int MAX_BYTES = 32 * 1024 * 1024;
    private static volatile JSONObject state;
    private static volatile File fontDirectory;
    static File webFont(String path) {
        File dir = fontDirectory;
        if (dir == null || !path.matches("/font-[0-9]+\\.ttf")) return null;
        File file = new File(dir, path.substring(1));
        return file.isFile() ? file : null;
    }
    private JoplinFontStore() {}
    private static File directory(Context c) { return new File(c.getFilesDir(), "joplin-custom-font"); }
    static boolean enabled(Context c) { return state != null && state.optBoolean("enabled"); }
    static String displayName(Context c) { return state == null ? "No font selected" : state.optString("name", "No font selected"); }
    static File selectedFile(Context c) { return state == null ? new File(directory(c), "selected-font.bin") : new File(state.optString("fontPath")); }

    static synchronized void prepare(Context c) throws Exception {
        File dir = directory(c);
        fontDirectory = dir;
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("Couldn't create the font folder");
        AtomicFile manifest = new AtomicFile(new File(dir, "state.json"));
        if (manifest.getBaseFile().isFile() || new File(dir, "state.json.bak").isFile()) {
            JSONObject saved = new JSONObject(new String(manifest.readFully(), StandardCharsets.UTF_8));
            Typeface face = null;
            if (saved.optBoolean("enabled")) {
                try { face = load(new File(saved.getString("fontPath"))); }
                catch (Exception error) {
                    saved.put("enabled", false).put("revision", saved.optLong("revision") + 1);
                    commit(c, saved, null);
                    Log.w("JoplinFontPatch", "Stored font unavailable; default font restored", error);
                    return;
                }
            }
            state = saved;
            JoplinFontInjector.publish(saved.getLong("revision"), face, webName(saved));
            return;
        }
        SharedPreferences old = c.getSharedPreferences("joplin_custom_font_native", Context.MODE_PRIVATE);
        File legacy = new File(dir, "selected-font.bin");
        if (old.getBoolean("enabled", false) && legacy.isFile()) {
            try (InputStream in = new FileInputStream(legacy)) {
                importBytes(c, readBounded(in), old.getString("display_name", "Previous font"));
                return;
            } catch (Exception error) {
                Log.w("JoplinFontPatch", "Legacy font migration failed; select a TTF/OTF font", error);
            }
        }
        commit(c, new JSONObject().put("enabled", false).put("revision", System.currentTimeMillis()), null);
    }

    static synchronized void setEnabled(Context c, boolean enabled) throws IOException {
        try {
            JSONObject next = state == null ? new JSONObject() : new JSONObject(state.toString());
            next.put("enabled", enabled).put("revision", nextRevision());
            commit(c, next, enabled ? load(selectedFile(c)) : null);
        } catch (Exception error) { throw new IOException("Couldn't save font settings", error); }
    }

    static synchronized void importFont(Context c, Uri uri) throws IOException {
        String name = "Selected font";
        try (Cursor cursor = c.getContentResolver().query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst() && !cursor.isNull(0)) name = cursor.getString(0);
        } catch (RuntimeException ignored) {}
        try (InputStream in = c.getContentResolver().openInputStream(uri)) {
            if (in == null) throw new IOException("Couldn't open the selected file");
            importBytes(c, readBounded(in), name);
        } catch (Exception error) { throw new IOException(error.getMessage(), error); }
    }

    private static void importBytes(Context c, byte[] bytes, String name) throws Exception {
        long revision = nextRevision();
        byte[] safe = FontSanitizer.sanitize(bytes);
        File font = new File(directory(c), "font-" + revision + ".ttf");
        atomicWrite(font, safe);
        Typeface face;
        try { face = load(font); }
        catch (IOException error) { font.delete(); throw error; }
        JSONObject next = new JSONObject().put("enabled", true).put("revision", revision)
                .put("name", name).put("fontPath", font.getAbsolutePath())
                .put("fontUrl", Uri.fromFile(font).toString()).put("schema", 1);
        commit(c, next, face);
        Log.i("JoplinFontPatch", "v9 font committed: revision=" + revision + ", bytes=" + safe.length);
        // Keep one previous revision for WebViews still loading during transition.
        File[] files = directory(c).listFiles((d, n) -> n.matches("font-[0-9]+\\.ttf"));
        if (files != null) {
            java.util.Arrays.sort(files, (a, b) -> b.getName().compareTo(a.getName()));
            for (int i = 2; i < files.length; i++) files[i].delete();
        }
    }

    private static long nextRevision() { return Math.max(System.currentTimeMillis(), state == null ? 1 : state.optLong("revision") + 1); }
    private static void commit(Context c, JSONObject next, Typeface face) throws IOException {
        atomicWrite(new File(directory(c), "state.json"), next.toString().getBytes(StandardCharsets.UTF_8));
        state = next;
        JoplinFontInjector.publish(next.optLong("revision"), face, webName(next));
    }
    /** Newer Android returns Typeface.DEFAULT instead of throwing for unreadable files. */
    static Typeface load(File file) throws IOException {
        if (!file.isFile() || file.length() < 12) throw new IOException("Font file missing: " + file.getName());
        Typeface face;
        try { face = Typeface.createFromFile(file); }
        catch (RuntimeException error) { throw new IOException("Android can't read this font", error); }
        if (face == null || face == JoplinSystemTypefaces.systemDefault() || face == Typeface.DEFAULT)
            throw new IOException("Android can't read this font");
        return face;
    }
    /** Served file name; setEnabled bumps the revision without renaming the file. */
    private static String webName(JSONObject s) {
        String name = new File(s.optString("fontPath", "")).getName();
        return name.matches("font-[0-9]+\\.ttf") ? name : null;
    }
    private static void atomicWrite(File file, byte[] bytes) throws IOException {
        AtomicFile atomic = new AtomicFile(file);
        FileOutputStream out = null;
        try { out = atomic.startWrite(); out.write(bytes); atomic.finishWrite(out); }
        catch (IOException error) { if (out != null) atomic.failWrite(out); throw error; }
    }
    private static byte[] readBounded(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[32768]; int count;
        while ((count = in.read(buffer)) != -1) {
            if (out.size() + (long) count > MAX_BYTES) throw new IOException("Font must be 32 MB or smaller");
            out.write(buffer, 0, count);
        }
        return out.toByteArray();
    }
}
