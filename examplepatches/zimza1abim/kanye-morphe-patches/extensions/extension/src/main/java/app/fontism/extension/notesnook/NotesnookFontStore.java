package app.fontism.extension.notesnook;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.provider.OpenableColumns;
import android.util.AtomicFile;
import android.util.Log;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/** A committed JSON snapshot in private storage is the single source of truth. */
final class NotesnookFontStore {
    static final String TAG = "NotesnookFontPatch";
    private static final int MAX_BYTES = 48 * 1024 * 1024;
    private static final String FILE_PATTERN = "font-[0-9]+\\.ttf";
    private static volatile JSONObject state;
    private static volatile File fontDirectory;

    private NotesnookFontStore() {}

    private static File directory(Context c) { return new File(c.getFilesDir(), "morphe-notesnook-font"); }
    static boolean enabled() { JSONObject s = state; return s != null && s.optBoolean("enabled"); }
    static String displayName() {
        JSONObject s = state;
        return s == null || !s.optBoolean("enabled") ? "Notesnook default (Inter)" : s.optString("name", "Custom font");
    }
    static String sourceKey() { JSONObject s = state; return s == null ? "" : s.optString("source", ""); }

    /** Served file for the WebView: only committed font files, never arbitrary paths. */
    static File webFont(String path) {
        File dir = fontDirectory;
        if (dir == null || path == null || !path.matches("/" + FILE_PATTERN)) return null;
        File file = new File(dir, path.substring(1));
        return file.isFile() ? file : null;
    }

    static synchronized void prepare(Context c) throws Exception {
        File dir = directory(c);
        fontDirectory = dir;
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("Couldn't create the font folder");
        File manifest = new File(dir, "state.json");
        if (!manifest.isFile() && !new File(dir, "state.json.bak").isFile()) {
            commit(c, new JSONObject().put("enabled", false).put("revision", System.currentTimeMillis()), null);
            return;
        }
        JSONObject saved;
        try { saved = new JSONObject(new String(new AtomicFile(manifest).readFully(), StandardCharsets.UTF_8)); }
        catch (Exception corrupt) {
            Log.w(TAG, "Font state unreadable; default font restored", corrupt);
            commit(c, new JSONObject().put("enabled", false).put("revision", System.currentTimeMillis()), null);
            return;
        }
        Typeface face = null;
        if (saved.optBoolean("enabled")) {
            try { face = load(new File(dir, saved.getString("file"))); }
            catch (Exception error) {
                saved.put("enabled", false).put("revision", saved.optLong("revision") + 1);
                commit(c, saved, null);
                Log.w(TAG, "Stored font unavailable; default font restored", error);
                return;
            }
        }
        state = saved;
        NotesnookFontInjector.publish(saved.optLong("revision"), face, saved.optBoolean("enabled") ? saved.optString("file") : null);
    }

    static synchronized void disable(Context c) throws IOException {
        try {
            JSONObject next = state == null ? new JSONObject() : new JSONObject(state.toString());
            commit(c, next.put("enabled", false).put("revision", nextRevision()), null);
        } catch (org.json.JSONException error) { throw new IOException(error); }
    }

    static void importUri(Context c, Uri uri) throws IOException {
        String name = "Selected font";
        try (Cursor cursor = c.getContentResolver().query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst() && !cursor.isNull(0)) name = cursor.getString(0);
        } catch (RuntimeException ignored) {}
        byte[] bytes;
        try (InputStream in = c.getContentResolver().openInputStream(uri)) {
            if (in == null) throw new IOException("Couldn't open the selected file");
            bytes = readBounded(in);
        }
        // A collection picked from files uses its first face.
        bytes = NotesnookFontInfo.extractFace(bytes, 0);
        try { name = NotesnookFontInfo.read(NotesnookFontInfo.of(bytes), 0).fullName; } catch (IOException keepFileName) {}
        importFace(c, bytes, name, "file:" + uri);
    }

    static synchronized void importFace(Context c, byte[] face, String name, String source) throws IOException {
        long revision = nextRevision();
        byte[] safe = NotesnookFontSanitizer.sanitize(face);
        String fileName = "font-" + revision + ".ttf";
        File font = new File(directory(c), fileName);
        atomicWrite(font, safe);
        Typeface typeface;
        try { typeface = load(font); }
        catch (IOException error) { font.delete(); throw error; }
        try {
            commit(c, new JSONObject().put("enabled", true).put("revision", revision).put("name", name)
                    .put("file", fileName).put("source", source).put("schema", 1), typeface);
        } catch (org.json.JSONException error) { throw new IOException(error); }
        Log.i(TAG, "Font committed: revision=" + revision + ", bytes=" + safe.length);
        // Keep the previous revision for WebViews still loading during the switch.
        File[] files = directory(c).listFiles((d, n) -> n.matches(FILE_PATTERN));
        if (files != null) {
            java.util.Arrays.sort(files, (a, b) -> b.getName().compareTo(a.getName()));
            for (int i = 2; i < files.length; i++) files[i].delete();
        }
    }

    /** Newer Android returns Typeface.DEFAULT instead of throwing for unreadable files. */
    static Typeface load(File file) throws IOException {
        if (!file.isFile() || file.length() < 12) throw new IOException("Font file missing");
        Typeface face;
        try { face = Typeface.createFromFile(file); }
        catch (RuntimeException error) { throw new IOException("Android can't read this font", error); }
        if (face == null || face == NotesnookSystemTypefaces.systemDefault() || face == Typeface.DEFAULT)
            throw new IOException("Android can't read this font");
        return face;
    }

    private static long nextRevision() {
        JSONObject s = state;
        return Math.max(System.currentTimeMillis(), s == null ? 1 : s.optLong("revision") + 1);
    }

    private static void commit(Context c, JSONObject next, Typeface face) throws IOException {
        atomicWrite(new File(directory(c), "state.json"), next.toString().getBytes(StandardCharsets.UTF_8));
        state = next;
        NotesnookFontInjector.publish(next.optLong("revision"), face, face == null ? null : next.optString("file"));
    }

    private static void atomicWrite(File file, byte[] bytes) throws IOException {
        AtomicFile atomic = new AtomicFile(file);
        FileOutputStream out = null;
        try { out = atomic.startWrite(); out.write(bytes); atomic.finishWrite(out); }
        catch (IOException error) { if (out != null) atomic.failWrite(out); throw error; }
    }

    private static byte[] readBounded(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[65536];
        int n;
        while ((n = in.read(buffer)) != -1) {
            if (out.size() + (long) n > MAX_BYTES) throw new IOException("Font must be 48 MB or smaller");
            out.write(buffer, 0, n);
        }
        return out.toByteArray();
    }
}
