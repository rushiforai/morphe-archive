package app.fontism.extension.openbot;

import java.io.IOException;
import java.util.Locale;

/** File extension is only a picker hint: verify the SFNT and text coverage too. */
public final class OpenBotFontImportPolicy {
    static final int MAX_BYTES = 48 * 1024 * 1024;

    public static OpenBotFontInfo validate(byte[] bytes, String name) throws IOException {
        if (name == null || name.length() > 1024 || !name.toLowerCase(Locale.ROOT).endsWith(".ttf"))
            throw new IOException("Choose a TTF file");
        if (bytes.length < 12 || bytes.length > MAX_BYTES) throw new IOException("Invalid TTF size");
        int signature = ((bytes[0] & 255) << 24) | ((bytes[1] & 255) << 16)
                | ((bytes[2] & 255) << 8) | (bytes[3] & 255);
        if (signature != 0x00010000 && signature != 0x74727565) throw new IOException("Not a TrueType font");
        OpenBotFontInfo info = OpenBotFontInfo.read(OpenBotFontInfo.of(bytes), 0);
        if (!info.latin && !info.hangul) throw new IOException("Font has no supported text glyphs");
        return info;
    }
}
