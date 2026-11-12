package app.fontism.extension.notesnook;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.os.Build;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Fonts already on the device: system font files (including updatable and
 * vendor fonts via SystemFonts on Android 10+) and font packages such as
 * Samsung FlipFont / Galaxy Store fonts. Encrypted or non-text fonts are skipped.
 */
public final class NotesnookDeviceFonts {
    private static final int MAX_BYTES = 48 * 1024 * 1024;
    private static final Pattern NOT_TEXT = Pattern.compile(
            "(?i).*(emoji|symbol|icon|clock|music|math|dingbat|braille|fallback|ahem).*");
    private static final String[] FONT_PACKAGES = {"com.monotype.android.font.", "com.hy.app.FontSettings."};
    private static final String[] FONT_DIRS = {"/system/fonts", "/product/fonts", "/system_ext/fonts", "/vendor/fonts"};

    private NotesnookDeviceFonts() {}

    public static final class Entry {
        public String label;
        public final String detail;
        final String weight;
        public final boolean hangul;
        public final boolean fromPackage;
        final String path;
        final String zipEntry;
        final int index;

        Entry(String label, String detail, NotesnookFontInfo info, boolean fromPackage, String path, String zipEntry, int index) {
            this.label = label;
            this.weight = weightName(info.weight) + (info.italic ? " Italic" : "");
            this.detail = detail + " · " + weight;
            this.hangul = info.hangul;
            this.fromPackage = fromPackage;
            this.path = path; this.zipEntry = zipEntry; this.index = index;
        }

        public String key() { return path + '!' + zipEntry + '#' + index; }

        /** Standalone TTF/OTF bytes of this face, ready for NotesnookFontSanitizer. */
        public byte[] readFace() throws IOException {
            byte[] bytes;
            if (zipEntry == null) {
                File file = new File(path);
                if (file.length() > MAX_BYTES) throw new IOException("Font file is too large");
                try (RandomAccessFile in = new RandomAccessFile(file, "r")) {
                    bytes = new byte[(int) in.length()];
                    in.readFully(bytes);
                }
            } else {
                try (ZipFile apk = new ZipFile(path)) {
                    ZipEntry entry = apk.getEntry(zipEntry);
                    if (entry == null) throw new IOException("Font file not found in the font app");
                    try (InputStream in = apk.getInputStream(entry)) { bytes = readBounded(in); }
                }
            }
            return NotesnookFontInfo.extractFace(bytes, index);
        }

        /** Preview only; null when Android cannot load it. */
        public Typeface preview(Context context) {
            try {
                if (zipEntry == null && Build.VERSION.SDK_INT >= 26)
                    return new Typeface.Builder(new File(path)).setTtcIndex(index).build();
                File temp = File.createTempFile("font-preview-", ".ttf", context.getCacheDir());
                try {
                    try (FileOutputStream out = new FileOutputStream(temp)) { out.write(readFace()); }
                    return Typeface.createFromFile(temp);
                } finally {
                    temp.delete();
                }
            } catch (IOException | RuntimeException error) {
                return null;
            }
        }
    }

    /** Slow (file I/O); call off the main thread. Hangul-capable fonts first. */
    public static List<Entry> scan(Context context) {
        List<Entry> out = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        if (Build.VERSION.SDK_INT >= 29) {
            try {
                for (android.graphics.fonts.Font font : android.graphics.fonts.SystemFonts.getAvailableFonts()) {
                    File file = font.getFile();
                    if (file != null) addSystem(out, seen, file, font.getTtcIndex());
                }
            } catch (RuntimeException ignored) {}
        }
        for (String dir : FONT_DIRS) {
            File[] files = new File(dir).listFiles();
            if (files == null) continue;
            for (File file : files) {
                String name = file.getName().toLowerCase(Locale.ROOT);
                if (!name.endsWith(".ttf") && !name.endsWith(".otf") && !name.endsWith(".ttc")) continue;
                int faces = 1;
                try (RandomAccessFile in = new RandomAccessFile(file, "r")) { faces = NotesnookFontInfo.faceCount(NotesnookFontInfo.of(in)); }
                catch (IOException | RuntimeException ignored) {}
                for (int i = 0; i < faces; i++) addSystem(out, seen, file, i);
            }
        }
        scanPackages(context, out, seen);
        Collections.sort(out, (a, b) -> {
            if (a.hangul != b.hangul) return a.hangul ? -1 : 1;
            if (a.fromPackage != b.fromPackage) return a.fromPackage ? -1 : 1;
            return a.label.compareToIgnoreCase(b.label);
        });
        return out;
    }

    private static void addSystem(List<Entry> out, Set<String> seen, File file, int index) {
        String key = file.getAbsolutePath() + "!null#" + index;
        if (!seen.add(key) || NOT_TEXT.matcher(file.getName()).matches()) return;
        try (RandomAccessFile in = new RandomAccessFile(file, "r")) {
            NotesnookFontInfo info = NotesnookFontInfo.read(NotesnookFontInfo.of(in), index);
            if (usable(info)) out.add(new Entry(info.fullName, "System font", info, false, file.getAbsolutePath(), null, index));
        } catch (IOException | RuntimeException ignored) {}
    }

    private static void scanPackages(Context context, List<Entry> out, Set<String> seen) {
        PackageManager manager = context.getPackageManager();
        List<String> packageFaces = new ArrayList<>();
        List<ApplicationInfo> apps;
        try { apps = manager.getInstalledApplications(0); }
        catch (RuntimeException error) { return; }
        for (ApplicationInfo app : apps) {
            if (!fontPackage(app.packageName)) continue;
            CharSequence appLabel = manager.getApplicationLabel(app);
            String label = appLabel == null ? app.packageName : appLabel.toString();
            List<String> apks = new ArrayList<>();
            apks.add(app.publicSourceDir);
            if (app.splitPublicSourceDirs != null) Collections.addAll(apks, app.splitPublicSourceDirs);
            for (String apk : apks) {
                if (apk == null || !new File(apk).isFile()) continue;
                try (ZipFile zip = new ZipFile(apk)) {
                    int added = 0;
                    for (java.util.Enumeration<? extends ZipEntry> e = zip.entries(); e.hasMoreElements() && added < 16; ) {
                        ZipEntry entry = e.nextElement();
                        String name = entry.getName().toLowerCase(Locale.ROOT);
                        if (entry.isDirectory() || entry.getSize() > MAX_BYTES
                                || !(name.endsWith(".ttf") || name.endsWith(".otf") || name.endsWith(".ttc"))) continue;
                        byte[] bytes;
                        try (InputStream in = zip.getInputStream(entry)) { bytes = readBounded(in); }
                        catch (IOException tooLarge) { continue; }
                        NotesnookFontInfo.Source source = NotesnookFontInfo.of(bytes);
                        int faces;
                        try { faces = NotesnookFontInfo.faceCount(source); } catch (IOException bad) { continue; }
                        for (int i = 0; i < faces; i++) {
                            String key = apk + '!' + entry.getName() + '#' + i;
                            if (!seen.add(key)) continue;
                            try {
                                NotesnookFontInfo info = NotesnookFontInfo.read(source, i);
                                if (!usable(info)) continue;
                                out.add(new Entry(label, "Font app · " + info.fullName, info, true, apk, entry.getName(), i));
                                packageFaces.add(label);
                                added++;
                            } catch (IOException encryptedOrBroken) { /* skip */ }
                        }
                    }
                } catch (IOException | SecurityException ignored) {}
            }
        }
        // A font app with several faces (regular/bold) keeps its name plus the weight.
        for (Entry entry : out) {
            if (entry.fromPackage && Collections.frequency(packageFaces, entry.label) > 1
                    && !entry.label.endsWith(entry.weight)) entry.label = entry.label + " " + entry.weight;
        }
    }

    private static boolean usable(NotesnookFontInfo info) {
        return (info.latin || info.hangul) && !NOT_TEXT.matcher(info.fullName).matches()
                && !NOT_TEXT.matcher(info.family).matches();
    }

    private static boolean fontPackage(String name) {
        for (String prefix : FONT_PACKAGES) if (name.startsWith(prefix)) return true;
        String lower = name.toLowerCase(Locale.ROOT);
        return lower.contains(".font.") || lower.endsWith(".font") || lower.endsWith(".fonts")
                || lower.contains("fontsettings") || lower.contains(".flipfont");
    }

    static String weightName(int weight) {
        if (weight <= 150) return "Thin";
        if (weight <= 250) return "ExtraLight";
        if (weight <= 350) return "Light";
        if (weight <= 450) return "Regular";
        if (weight <= 550) return "Medium";
        if (weight <= 650) return "SemiBold";
        if (weight <= 750) return "Bold";
        if (weight <= 850) return "ExtraBold";
        return "Black";
    }

    private static byte[] readBounded(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[65536];
        int n;
        while ((n = in.read(buffer)) != -1) {
            if (out.size() + (long) n > MAX_BYTES) throw new IOException("Font file is too large");
            out.write(buffer, 0, n);
        }
        return out.toByteArray();
    }
}
