package app.fontism.extension.brave;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Typeface;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

final class BraveFontPackageScanner {
    private static final String[] KNOWN_FONT_PREFIXES = {
            "com.monotype.android.font.",
            "com.hy.app.FontSettings."
    };

    static final class InstalledFont {
        final String label;
        final String packageName;
        final String apkPath;
        final String entryName;

        InstalledFont(String label, String packageName, String apkPath, String entryName) {
            this.label = label;
            this.packageName = packageName;
            this.apkPath = apkPath;
            this.entryName = entryName;
        }

        String displayLabel() {
            String file = entryName.substring(entryName.lastIndexOf('/') + 1);
            return label + (file.equalsIgnoreCase(label) ? "" : "\n" + file);
        }

        String previewKey() {
            return apkPath + '!' + entryName;
        }

        Typeface loadPreviewTypeface(Context context) {
            File temporary = null;
            try (ZipFile apk = new ZipFile(apkPath)) {
                ZipEntry entry = apk.getEntry(entryName);
                if (entry == null || entry.isDirectory()) return null;
                temporary = File.createTempFile("brave-font-preview-", ".font", context.getCacheDir());
                try (InputStream input = apk.getInputStream(entry);
                     FileOutputStream output = new FileOutputStream(temporary)) {
                    byte[] buffer = new byte[64 * 1024];
                    int count;
                    while ((count = input.read(buffer)) != -1) output.write(buffer, 0, count);
                }
                return Typeface.createFromFile(temporary);
            } catch (IOException | RuntimeException ignored) {
                return null;
            } finally {
                if (temporary != null) temporary.delete();
            }
        }

        void install(Context context) throws IOException {
            try (ZipFile apk = new ZipFile(apkPath)) {
                ZipEntry entry = apk.getEntry(entryName);
                if (entry == null || entry.isDirectory()) throw new IOException("Font disappeared from APK");
                try (InputStream input = apk.getInputStream(entry)) {
                    BraveFontStore.importFont(context, input, label);
                }
            }
        }
    }

    private BraveFontPackageScanner() {}

    static List<InstalledFont> scan(Context context) {
        PackageManager manager = context.getPackageManager();
        List<ApplicationInfo> applications;
        try {
            applications = manager.getInstalledApplications(PackageManager.GET_META_DATA);
        } catch (RuntimeException error) {
            return Collections.emptyList();
        }

        List<InstalledFont> results = new ArrayList<>();
        for (ApplicationInfo application : applications) {
            if (!looksLikeFontPackage(application.packageName)) continue;
            CharSequence applicationLabel = manager.getApplicationLabel(application);
            String label = applicationLabel == null
                    ? application.packageName : applicationLabel.toString();
            scanApk(results, label, application.packageName, application.publicSourceDir);
            if (application.splitPublicSourceDirs != null) {
                for (String split : application.splitPublicSourceDirs) {
                    scanApk(results, label, application.packageName, split);
                }
            }
        }
        results.sort(Comparator.comparing(font -> font.label.toLowerCase(Locale.ROOT)));
        return results;
    }

    private static boolean looksLikeFontPackage(String packageName) {
        for (String prefix : KNOWN_FONT_PREFIXES) {
            if (packageName.startsWith(prefix)) return true;
        }
        String lower = packageName.toLowerCase(Locale.ROOT);
        return lower.contains(".font.") || lower.endsWith(".font") || lower.contains("fontsettings");
    }

    private static void scanApk(List<InstalledFont> output, String label,
                                String packageName, String apkPath) {
        if (apkPath == null || !new File(apkPath).isFile()) return;
        try (ZipFile apk = new ZipFile(apkPath)) {
            apk.stream()
                    .filter(entry -> !entry.isDirectory() && isFont(entry.getName()))
                    .limit(16)
                    .forEach(entry -> output.add(new InstalledFont(
                            label, packageName, apkPath, entry.getName())));
        } catch (IOException | SecurityException ignored) {
        }
    }

    private static boolean isFont(String path) {
        String lower = path.toLowerCase(Locale.ROOT);
        return lower.endsWith(".ttf") || lower.endsWith(".otf") || lower.endsWith(".ttc");
    }
}
