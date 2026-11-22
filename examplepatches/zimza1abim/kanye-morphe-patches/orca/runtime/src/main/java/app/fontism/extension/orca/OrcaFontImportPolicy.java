package app.fontism.extension.orca;

import java.io.IOException;
import java.util.Locale;

/** File extension is only a picker hint: verify the SFNT and text coverage too. */
public final class OrcaFontImportPolicy {
    static final int MAX_BYTES = 48 * 1024 * 1024;

    public static OrcaFontInfo validate(byte[] bytes, String name) throws IOException {
        if (name == null || name.length() > 1024) throw new IOException("Choose a font file");
        String lower = name.toLowerCase(Locale.ROOT);
        if (!lower.endsWith(".ttf") && !lower.endsWith(".otf"))
            throw new IOException("Choose a TTF or OTF file");
        if (bytes.length < 12 || bytes.length > MAX_BYTES) throw new IOException("Invalid font size");
        int signature = ((bytes[0] & 255) << 24) | ((bytes[1] & 255) << 16)
                | ((bytes[2] & 255) << 8) | (bytes[3] & 255);
        // TrueType (0x00010000, 'true') and OpenType/CFF ('OTTO') outlines.
        if (signature != 0x00010000 && signature != 0x74727565 && signature != 0x4f54544f)
            throw new IOException("Not a TrueType/OpenType font");
        OrcaFontInfo info = OrcaFontInfo.read(OrcaFontInfo.of(bytes), 0);
        if (!info.latin && !info.hangul) throw new IOException("Font has no supported text glyphs");
        return info;
    }
}
