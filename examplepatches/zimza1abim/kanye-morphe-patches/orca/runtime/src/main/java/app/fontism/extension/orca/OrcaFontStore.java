package app.fontism.extension.orca;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.net.Uri;
import android.util.AtomicFile;
import android.util.Log;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Device-local font selection. The committed record ("morphe_font"
 * SharedPreferences) is the only commit point; font bytes live under
 * getFilesDir()/morphe-fonts so a copy outlives font app updates. Keys follow
 * the fixed scheme: "system" (no override), "bundled" (the shipped Pretendard
 * faces), "pkg:&lt;package&gt;:&lt;fontfile path&gt;" and "import:&lt;id&gt;".
 * state.key is null only before the first explicit choice and means "system".
 */
public final class OrcaFontStore {
    static final String KEY_SYSTEM = "system";
    static final String KEY_BUNDLED = "bundled";
    private static final String TAG = "OrcaFont";
    private static final int MAX_BYTES = 48 * 1024 * 1024;
    private static final String DEFAULT_LABEL = "System default";
    private static final String BUNDLED_LABEL = "Pretendard";
    private static final String PREFS_NAME = "morphe_font";
    private static final String REGULAR_ASSET = "morphe-orca/Pretendard-Regular.ttf";
    private static final String BOLD_ASSET = "morphe-orca/Pretendard-Bold.ttf";
    private static boolean prepared;
    private static long revision;
    private static long epoch;
    private static String selectedKey, selectedFile;
    private static String selectedLabel = DEFAULT_LABEL;
    private static Map<String, OrcaDeviceFonts.Entry> inventory = Collections.emptyMap();
    private static long inventoryGeneration;

    private OrcaFontStore() {}

    /** The font bytes a WebView stylesheet is built from; bold may be null. */
    static final class WebFaces {
        final byte[] regular;
        final byte[] bold;
        WebFaces(byte[] regular, byte[] bold) {
            this.regular = regular;
            this.bold = bold;
        }
    }

    private static File directory(Context context) throws IOException {
        File directory = new File(context.getFilesDir(), "morphe-fonts");
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Font storage is unavailable");
        return directory;
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    /** Called before React starts. It reads only the committed selection. */
    public static synchronized void prepare(Context context) {
        if (prepared) return;
        String key = null, label = DEFAULT_LABEL, file = null;
        long savedRevision = 0;
        try {
            String saved = prefs(context).getString("selection", null);
            if (saved != null) {
                JSONObject record = new JSONObject(saved);
                if (record.getInt("version") != 1) throw new IOException("Unknown font selection version");
                savedRevision = record.getLong("revision");
                if (savedRevision < 0) throw new IOException("Invalid font selection revision");
                key = record.isNull("key") ? null : record.getString("key");
                label = record.getString("label");
                file = record.isNull("file") ? null : record.getString("file");
                checkRecord(key, label, file);
            }
            OrcaFonts.Faces faces = file != null ? loadFileFaces(context, file) : facesFor(context, key);
            selectedKey = key; selectedLabel = label; selectedFile = file; revision = savedRevision;
            OrcaFonts.publish(faces);
        } catch (IOException | JSONException | RuntimeException invalid) {
            selectedKey = null; selectedFile = null; selectedLabel = DEFAULT_LABEL;
            revision = Math.max(revision, savedRevision);
            OrcaFonts.publish(null);
            Log.w(TAG, "Saved font is unavailable; using system font");
        }
        prepared = true;
    }

    public static synchronized String state(Context context) throws IOException {
        prepare(context);
        return stateObject().toString();
    }

    public static synchronized long revision(Context context) {
        prepare(context);
        return revision;
    }

    /** Bumped on every committed change and inventory rebuild. */
    static synchronized long epoch() {
        return epoch;
    }

    /** Call on a worker. Each refresh replaces the complete inventory atomically. */
    public static String list(Context context) throws IOException {
        prepare(context);
        List<OrcaDeviceFonts.Entry> entries = OrcaDeviceFonts.scan(context);
        File[] imported = importsDirectory(context).listFiles();
        if (imported != null) for (File file : imported) {
            if (!file.getName().matches("[0-9a-f]{64}\\.ttf")) continue;
            try (java.io.RandomAccessFile in = new java.io.RandomAccessFile(file, "r")) {
                OrcaFontInfo info = OrcaFontInfo.read(OrcaFontInfo.of(in), 0);
                entries.add(importedEntry(file, info));
            } catch (IOException | RuntimeException unavailable) { /* Skip damaged imported files. */ }
        }
        Map<String, OrcaDeviceFonts.Entry> found = new HashMap<>();
        JSONArray fonts = new JSONArray();
        try {
            fonts.put(builtinRow(KEY_SYSTEM, DEFAULT_LABEL, "Phone settings"));
            fonts.put(builtinRow(KEY_BUNDLED, BUNDLED_LABEL, "Bundled font"));
            for (OrcaDeviceFonts.Entry entry : entries) {
                if (entry.key().length() > 4096 || found.put(entry.key(), entry) != null) continue;
                fonts.put(new JSONObject()
                        .put("key", entry.key()).put("label", entry.label).put("detail", entry.detail)
                        .put("hangul", entry.hangul).put("fromPackage", entry.fromPackage)
                        .put("imported", entry.key().startsWith("import:"))
                        .put("weight", entry.fontWeight).put("italic", entry.italic));
            }
            synchronized (OrcaFontStore.class) {
                inventory = found;
                inventoryGeneration++;
                epoch++;
                OrcaFontPreviews.clear();
                return new JSONObject().put("fonts", fonts).put("state", stateObject())
                        .put("generation", inventoryGeneration).toString();
            }
        } catch (JSONException invalid) {
            throw new IOException("Font list cannot be read", invalid);
        }
    }

    private static JSONObject builtinRow(String key, String label, String detail) throws JSONException {
        return new JSONObject().put("key", key).put("label", label).put("detail", detail)
                .put("hangul", true).put("fromPackage", false).put("imported", false)
                .put("weight", 400).put("italic", false);
    }

    private static File importsDirectory(Context context) throws IOException {
        File imports = new File(directory(context), "imports");
        if (!imports.isDirectory() && !imports.mkdirs()) throw new IOException("Font imports are unavailable");
        return imports;
    }

    private static OrcaDeviceFonts.Entry importedEntry(File file, OrcaFontInfo info) {
        String label = info.fullName.length() > 512 ? info.fullName.substring(0, 512) : info.fullName;
        return new OrcaDeviceFonts.Entry(label, "Imported font", info, false,
                file.getAbsolutePath(), null, 0, "import:" + file.getName().replace(".ttf", ""));
    }

    /**
     * Reads the picker's content URI (or its private cache copy) read-only and
     * copies the bytes into the private store; the original is never touched.
     */
    public static synchronized String importFont(Context context, String uri, String name) throws IOException {
        prepare(context);
        byte[] bytes = readSource(context, Uri.parse(uri));
        OrcaFontInfo info = OrcaFontImportPolicy.validate(bytes, name);
        File temp = File.createTempFile("font-check-", ".ttf", context.getCacheDir());
        try {
            try (FileOutputStream out = new FileOutputStream(temp)) {
                out.write(bytes);
                out.getFD().sync();
            }
            if (Typeface.createFromFile(temp) == null) throw new IOException("Font cannot be loaded");
        } catch (RuntimeException invalid) {
            throw new IOException("Font cannot be loaded", invalid);
        } finally {
            temp.delete();
        }
        File target = new File(importsDirectory(context), digest(bytes) + ".ttf");
        AtomicFile imported = new AtomicFile(target);
        FileOutputStream out = imported.startWrite();
        try { out.write(bytes); imported.finishWrite(out); }
        catch (IOException | RuntimeException failure) { imported.failWrite(out); throw failure; }
        OrcaDeviceFonts.Entry entry = importedEntry(target, info);
        Map<String, OrcaDeviceFonts.Entry> updated = new HashMap<>(inventory);
        updated.put(entry.key(), entry);
        inventory = updated;
        epoch++;
        return entry.key().equals(selectedKey) ? stateObject().toString()
                : applyBytes(context, entry.key(), entry.label, bytes);
    }

    /** Content URIs stream through the resolver; file URIs are cache copies only. */
    private static byte[] readSource(Context context, Uri source) throws IOException {
        String scheme = source.getScheme();
        if ("content".equals(scheme)) {
            try (InputStream in = context.getContentResolver().openInputStream(source)) {
                if (in == null) throw new IOException("Font file is unavailable");
                return readBounded(in, MAX_BYTES);
            } catch (RuntimeException failure) {
                throw new IOException("Font file is unavailable", failure);
            }
        }
        if ("file".equals(scheme) && (source.getAuthority() == null || source.getAuthority().isEmpty())
                && source.getPath() != null && source.getQuery() == null && source.getFragment() == null) {
            File file = new File(source.getPath()).getCanonicalFile();
            String cache = context.getCacheDir().getCanonicalPath() + File.separator;
            if (!file.getPath().startsWith(cache) || !file.isFile()) throw new IOException("Font must be a picker cache copy");
            return readFile(file);
        }
        throw new IOException("Invalid font import URI");
    }

    /** Takes a short inventory snapshot. Font loading/rendering happens outside this lock. */
    static synchronized OrcaDeviceFonts.Entry previewEntry(String key, long generation) throws IOException {
        if (KEY_SYSTEM.equals(key) || KEY_BUNDLED.equals(key)) return null; // built-in rows
        OrcaDeviceFonts.Entry entry = inventory.get(key);
        if (generation != inventoryGeneration || entry == null) throw new IOException("Refresh the font list");
        return entry;
    }

    /** Select only a discovered key; caller input is never interpreted as a file path. */
    public static synchronized String select(Context context, String key) throws IOException {
        prepare(context);
        if (key == null || key.isEmpty() || key.length() > 4096) throw new IOException("Choose a device font");
        if (key.equals(selectedKey)) return stateObject().toString();
        if (KEY_SYSTEM.equals(key)) return applyFaceless(context, KEY_SYSTEM, DEFAULT_LABEL, null);
        if (KEY_BUNDLED.equals(key)) return applyFaceless(context, KEY_BUNDLED, BUNDLED_LABEL, bundledFaces(context));
        OrcaDeviceFonts.Entry entry = inventory.get(key);
        if (entry == null) {
            list(context);
            entry = inventory.get(key);
        }
        if (entry == null) throw new IOException("Font is no longer installed. Refresh the list");
        byte[] bytes = entry.readFace();
        validate(bytes);
        return applyBytes(context, entry.key(), entry.label, bytes);
    }

    /** Back to the uncommitted default: no override, the phone settings win. */
    public static synchronized String reset(Context context) throws IOException {
        prepare(context);
        if (selectedKey == null) return stateObject().toString();
        return applyFaceless(context, null, DEFAULT_LABEL, null);
    }

    /** Reuse the validated import buffer instead of reading the full font a second time. */
    private static String applyBytes(Context context, String key, String label, byte[] bytes) throws IOException {
        String file = "font-" + digest(bytes) + ".ttf";
        File selected = new File(directory(context), file);
        File staged = File.createTempFile("font-stage-", ".tmp", directory(context));
        try {
            try (FileOutputStream out = new FileOutputStream(staged)) {
                out.write(bytes);
                out.getFD().sync();
            }
            Typeface base = Typeface.createFromFile(staged);
            if (base == null) throw new IOException("Font cannot be loaded");
            OrcaFonts.Faces faces = new OrcaFonts.Faces(base, OrcaFonts.fauxBold(base));
            // A copied file outlives font app updates/uninstalls. Never overwrite the
            // currently referenced inode: a crash can leave only an unused new file.
            if (!selected.isFile() && !staged.renameTo(selected)) throw new IOException("Font cannot be saved");
            if (selected.isFile() && !file.equals("font-" + digest(readFile(selected)) + ".ttf"))
                throw new IOException("Saved font checksum changed");
            long next = nextRevision();
            writeRecord(context, key, label, file, next);
            selectedKey = key; selectedLabel = label; selectedFile = file; revision = next;
            OrcaFonts.publish(faces);
            epoch++;
            removeUnusedFonts(context, file);
            return stateObject().toString();
        } catch (RuntimeException invalid) {
            throw new IOException("Font cannot be loaded", invalid);
        } finally {
            staged.delete();
        }
    }

    private static String applyFaceless(Context context, String key, String label, OrcaFonts.Faces faces) throws IOException {
        long next = nextRevision();
        writeRecord(context, key, label, null, next);
        selectedKey = key; selectedLabel = label; selectedFile = null; revision = next;
        OrcaFonts.publish(faces);
        epoch++;
        removeUnusedFonts(context, null);
        return stateObject().toString();
    }

    /** Null for the system pass-through; the bundled pair must always resolve. */
    private static OrcaFonts.Faces facesFor(Context context, String key) throws IOException {
        if (key == null || KEY_SYSTEM.equals(key)) return null;
        if (KEY_BUNDLED.equals(key)) return bundledFaces(context);
        throw new IOException("Invalid font selection");
    }

    private static OrcaFonts.Faces bundledFaces(Context context) throws IOException {
        OrcaFonts.Faces faces = OrcaFonts.bundledFaces(context.getAssets());
        if (faces == null) throw new IOException("Font cannot be loaded");
        return faces;
    }

    private static OrcaFonts.Faces loadFileFaces(Context context, String file) throws IOException {
        File selected = new File(directory(context), file);
        byte[] bytes = readFile(selected);
        if (!file.equals("font-" + digest(bytes) + ".ttf")) throw new IOException("Font checksum changed");
        validate(bytes);
        Typeface base;
        try {
            base = Typeface.createFromFile(selected);
        } catch (RuntimeException invalid) {
            throw new IOException("Font cannot be loaded", invalid);
        }
        if (base == null) throw new IOException("Font cannot be loaded");
        return new OrcaFonts.Faces(base, OrcaFonts.fauxBold(base));
    }

    /**
     * The bytes the web shell's faces are served from: the committed selection,
     * or null for the system default so web text keeps the phone font exactly
     * as native text does. A single-face selection lets the browser synthesize bold.
     */
    static synchronized WebFaces webFaces(Context context) {
        try {
            prepare(context);
            if (selectedKey == null || KEY_SYSTEM.equals(selectedKey)) return null;
            if (selectedFile != null) {
                try {
                    byte[] bytes = readFile(new File(directory(context), selectedFile));
                    if (selectedFile.equals("font-" + digest(bytes) + ".ttf")) return new WebFaces(bytes, null);
                } catch (IOException | RuntimeException unavailable) {
                    // The native side already fell back; keep web text on the phone font too.
                }
                return null;
            }
            if (!KEY_BUNDLED.equals(selectedKey)) return null;
            byte[] regular = readAsset(context, REGULAR_ASSET);
            byte[] bold = readAsset(context, BOLD_ASSET);
            if (regular == null || bold == null) return null;
            return new WebFaces(regular, bold);
        } catch (RuntimeException failure) {
            return null;
        }
    }

    private static byte[] readAsset(Context context, String path) {
        InputStream in = null;
        try {
            in = context.getAssets().open(path);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
            return out.toByteArray();
        } catch (IOException | RuntimeException missing) {
            return null;
        } finally {
            if (in != null) {
                try { in.close(); } catch (IOException ignored) {}
            }
        }
    }

    private static long nextRevision() {
        return Math.max(revision + 1, System.currentTimeMillis());
    }

    private static JSONObject stateObject() throws IOException {
        try {
            return new JSONObject().put("key", selectedKey == null ? JSONObject.NULL : selectedKey)
                    .put("label", selectedLabel).put("revision", revision);
        } catch (JSONException invalid) {
            throw new IOException("Font selection cannot be read", invalid);
        }
    }

    private static void writeRecord(Context context, String key, String label, String file, long next) throws IOException {
        String json;
        try {
            json = new JSONObject().put("version", 1).put("revision", next)
                    .put("key", key == null ? JSONObject.NULL : key).put("label", label)
                    .put("file", file == null ? JSONObject.NULL : file)
                    .toString();
        } catch (JSONException invalid) {
            throw new IOException("Font selection cannot be saved", invalid);
        }
        SharedPreferences prefs = prefs(context);
        if (!prefs.edit().putString("selection", json).commit())
            throw new IOException("Font selection was not committed");
        // A failed commit must never leave an in-memory selection the disk does not hold.
        if (!json.equals(prefs.getString("selection", null)))
            throw new IOException("Font selection was not committed");
    }

    private static void checkRecord(String key, String label, String file) throws IOException {
        if (label == null || label.isEmpty() || label.length() > 1024) throw new IOException("Invalid font selection");
        if (key != null && (key.isEmpty() || key.length() > 4096
                || !(KEY_SYSTEM.equals(key) || KEY_BUNDLED.equals(key)
                        || key.startsWith("pkg:") || key.startsWith("import:"))))
            throw new IOException("Invalid font selection");
        if (file != null) {
            if (!file.matches("font-[0-9a-f]{64}\\.ttf")) throw new IOException("Invalid font selection");
            if (key == null || KEY_SYSTEM.equals(key) || KEY_BUNDLED.equals(key))
                throw new IOException("Invalid font selection");
        } else if (key != null && (key.startsWith("pkg:") || key.startsWith("import:")))
            throw new IOException("Invalid font selection");
    }

    private static void validate(byte[] bytes) throws IOException {
        if (bytes.length < 12 || bytes.length > MAX_BYTES) throw new IOException("Invalid font size");
        OrcaFontInfo info = OrcaFontInfo.read(OrcaFontInfo.of(bytes), 0);
        if (!info.latin && !info.hangul) throw new IOException("Font has no supported text glyphs");
    }

    private static byte[] readFile(File file) throws IOException {
        try (FileInputStream in = new FileInputStream(file)) { return readBounded(in, MAX_BYTES); }
    }

    private static byte[] readBounded(InputStream in, int limit) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[65536];
        int count;
        while ((count = in.read(buffer)) != -1) {
            if (out.size() + (long) count > limit) throw new IOException("Font data is too large");
            out.write(buffer, 0, count);
        }
        return out.toByteArray();
    }

    private static String digest(byte[] bytes) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(bytes);
            StringBuilder hex = new StringBuilder(64);
            for (byte value : digest) hex.append(Character.forDigit((value >>> 4) & 15, 16))
                    .append(Character.forDigit(value & 15, 16));
            return hex.toString();
        } catch (NoSuchAlgorithmException missing) {
            throw new IllegalStateException("SHA-256 is unavailable", missing);
        }
    }

    private static void removeUnusedFonts(Context context, String current) {
        try {
            File[] files = directory(context).listFiles();
            if (files == null) return;
            for (File file : files) if (file.getName().matches("font-[0-9a-f]{64}\\.ttf")
                    && !file.getName().equals(current)) file.delete();
        } catch (IOException ignored) {
            // Cleanup is not part of the commit. A stale unreferenced copy is safe.
        }
    }
}
