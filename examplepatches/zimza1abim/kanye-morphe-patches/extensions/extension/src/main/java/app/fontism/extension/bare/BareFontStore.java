package app.fontism.extension.bare;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

final class BareFontStore {
    static final String SOURCE_INTERNAL = "internal";
    static final String SOURCE_DEFAULT = "default";

    private static final String DIRECTORY = "bare-font";
    private static final String FONT_FILE = "selected-font.bin";
    private static final String TEMP_FILE = "selected-font.tmp";
    private static final String PREFS = "bare_custom_font";
    private static final String SOURCE = "source";
    private static final String DISPLAY_NAME = "display_name";
    private static final long MAX_FONT_BYTES = 256L * 1024L * 1024L;

    private BareFontStore() {}

    static String source(Context context) {
        // Older builds defaulted to the removed Fontism app provider.
        String source = preferences(context).getString(SOURCE, SOURCE_DEFAULT);
        return SOURCE_INTERNAL.equals(source) ? SOURCE_INTERNAL : SOURCE_DEFAULT;
    }

    static void useBrowserDefault(Context context) {
        preferences(context).edit().putString(SOURCE, SOURCE_DEFAULT).commit();
    }

    static String displayName(Context context) {
        return preferences(context).getString(DISPLAY_NAME, "Selected font");
    }

    static boolean hasValidInternalFont(Context context) {
        return validSfntFile(selectedFile(context));
    }

    static ParcelFileDescriptor openInternalFont(Context context) throws IOException {
        File file = selectedFile(context);
        if (!validSfntFile(file)) return null;
        return ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
    }

    static void importFont(Context context, Uri uri) throws IOException {
        String name = readDisplayName(context, uri);
        try (InputStream input = context.getContentResolver().openInputStream(uri)) {
            if (input == null) throw new IOException("The selected file cannot be opened");
            importFont(context, input, name);
        }
    }

    static void importFont(Context context, InputStream input, String name) throws IOException {
        File directory = fontDirectory(context);
        if (!directory.isDirectory() && !directory.mkdirs()) {
            throw new IOException("Could not create Bare font storage");
        }
        File destination = selectedFile(context);
        File temporary = new File(directory, TEMP_FILE);

        long total = 0;
        byte[] header = new byte[4];
        int headerCount = 0;
        try (FileOutputStream output = new FileOutputStream(temporary, false)) {
            byte[] buffer = new byte[64 * 1024];
            int count;
            while ((count = input.read(buffer)) != -1) {
                if (headerCount < header.length) {
                    int copied = Math.min(count, header.length - headerCount);
                    System.arraycopy(buffer, 0, header, headerCount, copied);
                    headerCount += copied;
                }
                total += count;
                if (total > MAX_FONT_BYTES) throw new IOException("Font is larger than 256 MB");
                output.write(buffer, 0, count);
            }
            output.getFD().sync();
        } catch (IOException error) {
            temporary.delete();
            throw error;
        }

        if (total < 12 || !validSfntHeader(header)) {
            temporary.delete();
            throw new IOException("This is not a supported TTF, OTF, or TTC font");
        }

        if (destination.exists() && !destination.delete()) {
            copyAndSync(temporary, destination);
            temporary.delete();
        } else if (!temporary.renameTo(destination)) {
            copyAndSync(temporary, destination);
            temporary.delete();
        }

        boolean committed = preferences(context).edit()
                .putString(DISPLAY_NAME, name == null || name.isEmpty() ? "Selected font" : name)
                .putString(SOURCE, SOURCE_INTERNAL)
                .commit();
        if (!committed) throw new IOException("Could not save the Bare font selection");
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static File fontDirectory(Context context) {
        return new File(context.getFilesDir(), DIRECTORY);
    }

    private static File selectedFile(Context context) {
        return new File(fontDirectory(context), FONT_FILE);
    }

    private static boolean validSfntFile(File file) {
        if (!file.isFile() || file.length() < 12 || file.length() > MAX_FONT_BYTES) return false;
        byte[] header = new byte[4];
        try (FileInputStream input = new FileInputStream(file)) {
            int offset = 0;
            while (offset < header.length) {
                int count = input.read(header, offset, header.length - offset);
                if (count < 0) return false;
                offset += count;
            }
            return validSfntHeader(header);
        } catch (IOException | SecurityException ignored) {
            return false;
        }
    }

    private static boolean validSfntHeader(byte[] header) {
        if (header.length < 4) return false;
        return (header[0] == 0x00 && header[1] == 0x01 && header[2] == 0x00 && header[3] == 0x00)
                || "OTTO".equals(new String(header, StandardCharsets.US_ASCII))
                || "ttcf".equals(new String(header, StandardCharsets.US_ASCII))
                || "true".equals(new String(header, StandardCharsets.US_ASCII));
    }

    private static String readDisplayName(Context context, Uri uri) {
        try (Cursor cursor = context.getContentResolver().query(
                uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst() && !cursor.isNull(0)) {
                return cursor.getString(0);
            }
        } catch (RuntimeException ignored) {
        }
        String tail = uri.getLastPathSegment();
        return tail == null || tail.isEmpty() ? "Selected font" : tail;
    }

    private static void copyAndSync(File source, File destination) throws IOException {
        try (FileInputStream input = new FileInputStream(source);
             FileOutputStream output = new FileOutputStream(destination, false)) {
            byte[] buffer = new byte[64 * 1024];
            int count;
            while ((count = input.read(buffer)) != -1) output.write(buffer, 0, count);
            output.getFD().sync();
        }
    }
}
