package app.fontism.extension.openbot;

import android.content.Context;
import android.graphics.Typeface;
import android.util.AtomicFile;
import android.util.Log;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Device-local font selection. The atomic record is the only commit point. */
public final class OpenBotFontStore {
    private static final String TAG = "OpenBotFont";
    private static final int MAX_BYTES = 48 * 1024 * 1024;
    private static final String DEFAULT_LABEL = "System default";
    private static boolean prepared;
    private static long revision;
    private static String selectedKey, selectedFile;
    private static String selectedLabel = DEFAULT_LABEL;
    private static Map<String, OpenBotDeviceFonts.Entry> inventory = Collections.emptyMap();
    private static long inventoryGeneration;

    private OpenBotFontStore() {}

    private static File directory(Context context) throws IOException {
        File directory = new File(context.getNoBackupFilesDir(), "morphe-openbot-fonts");
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Font storage is unavailable");
        return directory;
    }

    private static AtomicFile record(Context context) throws IOException {
        return new AtomicFile(new File(directory(context), "selection.json"));
    }

    /** Called by the provider before React starts. It reads only the committed selection. */
    public static synchronized void prepare(Context context) {
        if (prepared) return;
        try (FileInputStream in = record(context).openRead()) {
            JSONObject saved = new JSONObject(new String(readBounded(in, 16 * 1024), StandardCharsets.UTF_8));
            if (saved.getInt("version") != 1) throw new IOException("Unknown font selection version");
            long savedRevision = saved.getLong("revision");
            if (savedRevision < 0) throw new IOException("Invalid font selection revision");
            if (saved.isNull("key")) {
                revision = savedRevision;
            } else {
                String key = saved.getString("key"), label = saved.getString("label"), file = saved.getString("file");
                if (key.isEmpty() || key.length() > 4096 || label.isEmpty() || label.length() > 1024
                        || !file.matches("font-[0-9a-f]{64}\\.ttf")) throw new IOException("Invalid font selection");
                File selected = new File(directory(context), file);
                byte[] bytes;
                try (FileInputStream font = new FileInputStream(selected)) { bytes = readBounded(font, MAX_BYTES); }
                if (!file.equals("font-" + digest(bytes) + ".ttf")) throw new IOException("Font checksum changed");
                validate(bytes);
                Typeface base = Typeface.createFromFile(selected);
                if (base == null) throw new IOException("Font cannot be loaded");
                selectedKey = key; selectedLabel = label; selectedFile = file; revision = savedRevision;
                OpenBotFontInjector.publish(base, revision);
            }
        } catch (FileNotFoundException firstRun) {
            // A new install follows the phone settings without a persisted override.
        } catch (IOException | JSONException | RuntimeException invalid) {
            selectedKey = null; selectedFile = null; selectedLabel = DEFAULT_LABEL;
            Log.w(TAG, "Saved font is unavailable; using system font");
        }
        if (selectedKey == null) OpenBotFontInjector.publish(null, revision);
        prepared = true;
    }

    public static synchronized String state(Context context) throws IOException {
        prepare(context);
        return stateObject().toString();
    }

    /** Called only from the WebView request worker, never from text measurement. */
    public static synchronized byte[] selectedFont(Context context) throws IOException {
        prepare(context);
        if (selectedFile == null) return null;
        byte[] bytes = readFile(new File(directory(context), selectedFile));
        if (!selectedFile.equals("font-" + digest(bytes) + ".ttf")) throw new IOException("Font checksum changed");
        validate(bytes);
        return bytes;
    }

    public static synchronized long revision(Context context) {
        prepare(context);
        return revision;
    }

    public static synchronized boolean hasSelection(Context context) {
        prepare(context);
        return selectedFile != null;
    }

    /** Call on a worker. Each refresh replaces the complete inventory atomically. */
    public static String list(Context context) throws IOException {
        prepare(context);
        List<OpenBotDeviceFonts.Entry> entries = OpenBotDeviceFonts.scan(context);
        File[] imported = importsDirectory(context).listFiles();
        if (imported != null) for (File file : imported) {
            if (!file.getName().matches("[0-9a-f]{64}\\.ttf")) continue;
            try (java.io.RandomAccessFile in = new java.io.RandomAccessFile(file, "r")) {
                OpenBotFontInfo info = OpenBotFontInfo.read(OpenBotFontInfo.of(in), 0);
                entries.add(importedEntry(file, info));
            } catch (IOException | RuntimeException unavailable) { /* Skip damaged imported files. */ }
        }
        Map<String, OpenBotDeviceFonts.Entry> found = new HashMap<>();
        JSONArray fonts = new JSONArray();
        try {
            for (OpenBotDeviceFonts.Entry entry : entries) {
                if (entry.key().length() > 4096 || found.put(entry.key(), entry) != null) continue;
                fonts.put(new JSONObject()
                        .put("key", entry.key()).put("label", entry.label).put("detail", entry.detail)
                        .put("hangul", entry.hangul).put("fromPackage", entry.fromPackage)
                        .put("imported", entry.key().startsWith("import:"))
                        .put("weight", entry.fontWeight).put("italic", entry.italic));
            }
            synchronized (OpenBotFontStore.class) {
                inventory = found;
                inventoryGeneration++;
                OpenBotFontPreviews.clear();
                return new JSONObject().put("fonts", fonts).put("state", stateObject())
                        .put("generation", inventoryGeneration).toString();
            }
        } catch (JSONException invalid) {
            throw new IOException("Font list cannot be read", invalid);
        }
    }

    private static File importsDirectory(Context context) throws IOException {
        File imports = new File(directory(context), "imports");
        if (!imports.isDirectory() && !imports.mkdirs()) throw new IOException("Font imports are unavailable");
        return imports;
    }

    private static OpenBotDeviceFonts.Entry importedEntry(File file, OpenBotFontInfo info) {
        String label = info.fullName.length() > 512 ? info.fullName.substring(0, 512) : info.fullName;
        return new OpenBotDeviceFonts.Entry(label, "Imported TTF", info, false,
                file.getAbsolutePath(), null, 0, "import:" + file.getName().replace(".ttf", ""));
    }

    /** Only consume the document picker's cache copy; never accept an arbitrary private path. */
    public static synchronized String importFont(Context context, String uri, String name) throws IOException {
        prepare(context);
        android.net.Uri source = android.net.Uri.parse(uri);
        if (!"file".equals(source.getScheme()) || source.getAuthority() != null && !source.getAuthority().isEmpty()
                || source.getPath() == null || source.getQuery() != null || source.getFragment() != null)
            throw new IOException("Invalid font import URI");
        File file = new File(source.getPath()).getCanonicalFile();
        String cache = context.getCacheDir().getCanonicalPath() + File.separator;
        if (!file.getPath().startsWith(cache) || !file.isFile()) throw new IOException("Font must be a picker cache copy");
        byte[] bytes = readFile(file);
        OpenBotFontInfo info = OpenBotFontImportPolicy.validate(bytes, name);
        if (Typeface.createFromFile(file) == null) throw new IOException("Font cannot be loaded");
        File target = new File(importsDirectory(context), digest(bytes) + ".ttf");
        AtomicFile imported = new AtomicFile(target);
        FileOutputStream out = imported.startWrite();
        try { out.write(bytes); imported.finishWrite(out); }
        catch (IOException | RuntimeException failure) { imported.failWrite(out); throw failure; }
        OpenBotDeviceFonts.Entry entry = importedEntry(target, info);
        Map<String, OpenBotDeviceFonts.Entry> updated = new HashMap<>(inventory);
        updated.put(entry.key(), entry);
        inventory = updated;
        return entry.key().equals(selectedKey) ? stateObject().toString()
                : applyBytes(context, entry.key(), entry.label, bytes);
    }

    /** Takes a short inventory snapshot. Font loading/rendering happens outside this lock. */
    static synchronized OpenBotDeviceFonts.Entry previewEntry(String key, long generation) throws IOException {
        OpenBotDeviceFonts.Entry entry = inventory.get(key);
        if (generation != inventoryGeneration || entry == null) throw new IOException("Refresh the font list");
        return entry;
    }

    /** Select only a discovered key; caller input is never interpreted as a file path. */
    public static synchronized String select(Context context, String key) throws IOException {
        prepare(context);
        if (key == null || key.isEmpty() || key.length() > 4096) throw new IOException("Choose a device font");
        if (key.equals(selectedKey)) return stateObject().toString();
        OpenBotDeviceFonts.Entry entry = inventory.get(key);
        if (entry == null) {
            list(context);
            entry = inventory.get(key);
        }
        if (entry == null) throw new IOException("Font is no longer installed. Refresh the list");
        byte[] bytes = entry.readFace();
        validate(bytes);
        return applyBytes(context, entry.key(), entry.label, bytes);
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
            // A copied file outlives font app updates/uninstalls. Never overwrite the
            // currently referenced inode: a crash can leave only an unused new file.
            if (!selected.isFile() && !staged.renameTo(selected)) throw new IOException("Font cannot be saved");
            if (selected.isFile() && !file.equals("font-" + digest(readFile(selected)) + ".ttf"))
                throw new IOException("Saved font checksum changed");
            long next = nextRevision();
            writeRecord(context, key, label, file, next);
            selectedKey = key; selectedLabel = label; selectedFile = file; revision = next;
            OpenBotFontInjector.publish(base, next);
            OpenBotWebFonts.changed();
            removeUnusedFonts(context, file);
            return stateObject().toString();
        } catch (RuntimeException invalid) {
            throw new IOException("Font cannot be loaded", invalid);
        } finally {
            staged.delete();
        }
    }

    public static synchronized String reset(Context context) throws IOException {
        prepare(context);
        if (selectedKey == null) return stateObject().toString();
        long next = nextRevision();
        writeRecord(context, null, DEFAULT_LABEL, null, next);
        selectedKey = null; selectedFile = null; selectedLabel = DEFAULT_LABEL; revision = next;
        OpenBotFontInjector.publish(null, next);
        OpenBotWebFonts.changed();
        removeUnusedFonts(context, null);
        return stateObject().toString();
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
        byte[] json;
        try {
            json = new JSONObject().put("version", 1).put("revision", next)
                    .put("key", key == null ? JSONObject.NULL : key).put("label", label)
                    .put("file", file == null ? JSONObject.NULL : file)
                    .toString().getBytes(StandardCharsets.UTF_8);
        } catch (JSONException invalid) {
            throw new IOException("Font selection cannot be saved", invalid);
        }
        AtomicFile record = record(context);
        FileOutputStream out = record.startWrite();
        boolean finished = false;
        try {
            out.write(json);
            out.getFD().sync();
            record.finishWrite(out);
            finished = true;
            // AtomicFile logs a failed rename on some Android releases rather
            // than throwing. Do not publish an in-memory selection in that case.
            try (FileInputStream committed = record.openRead()) {
                if (!Arrays.equals(json, readBounded(committed, 16 * 1024)))
                    throw new IOException("Font selection was not committed");
            }
        } catch (IOException | RuntimeException error) {
            if (!finished) record.failWrite(out);
            throw error;
        }
    }

    private static void validate(byte[] bytes) throws IOException {
        if (bytes.length < 12 || bytes.length > MAX_BYTES) throw new IOException("Invalid font size");
        OpenBotFontInfo info = OpenBotFontInfo.read(OpenBotFontInfo.of(bytes), 0);
        if (!info.latin && !info.hangul) throw new IOException("Font has no supported text glyphs");
    }

    private static byte[] readFile(File file) throws IOException {
        try (FileInputStream in = new FileInputStream(file)) { return readBounded(in, MAX_BYTES); }
    }

    private static byte[] readBounded(FileInputStream in, int limit) throws IOException {
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
