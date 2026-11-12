package app.fontism.extension.notesnook;

import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;

/**
 * Minimal SFNT/TTC metadata reader: names, weight, italic and cmap coverage.
 * Reads only the table directory, name, OS/2 and cmap, so listing hundreds of
 * device fonts does not load their outlines. Malformed input throws IOException.
 */
public final class NotesnookFontInfo {
    public interface Source {
        long size() throws IOException;
        void read(long offset, byte[] into, int length) throws IOException;
    }

    public static Source of(final byte[] data) {
        return new Source() {
            @Override public long size() { return data.length; }
            @Override public void read(long offset, byte[] into, int length) throws IOException {
                if (offset < 0 || length < 0 || offset + length > data.length) throw new IOException("Truncated font");
                System.arraycopy(data, (int) offset, into, 0, length);
            }
        };
    }

    public static Source of(final RandomAccessFile file) {
        return new Source() {
            @Override public long size() throws IOException { return file.length(); }
            @Override public void read(long offset, byte[] into, int length) throws IOException {
                if (offset < 0 || length < 0 || offset + length > file.length()) throw new IOException("Truncated font");
                file.seek(offset);
                file.readFully(into, 0, length);
            }
        };
    }

    private static final int TTCF = 0x74746366, CMAP = 0x636d6170, NAME = 0x6e616d65, OS2 = 0x4f532f32;

    public final String family;
    public final String fullName;
    public final int weight;
    public final boolean italic;
    public final boolean hangul;
    public final boolean latin;

    private NotesnookFontInfo(String family, String fullName, int weight, boolean italic, boolean hangul, boolean latin) {
        this.family = family; this.fullName = fullName; this.weight = weight;
        this.italic = italic; this.hangul = hangul; this.latin = latin;
    }

    /** Number of faces: 1 for TTF/OTF, n for a TTC collection. */
    public static int faceCount(Source in) throws IOException {
        if (u32(in, 0) != TTCF) return 1;
        long count = u32(in, 8);
        if (count < 1 || count > 64) throw new IOException("Invalid font collection");
        return (int) count;
    }

    public static NotesnookFontInfo read(Source in, int index) throws IOException {
        long base = faceOffset(in, index);
        long sfnt = u32(in, base);
        if (sfnt != 0x10000 && sfnt != 0x4f54544f && sfnt != 0x74727565) throw new IOException("Not a TTF/OTF face");
        int tables = u16(in, base + 4);
        if (tables < 1 || tables > 256) throw new IOException("Invalid table count");
        long name = -1, nameLen = 0, os2 = -1, os2Len = 0, cmap = -1, cmapLen = 0;
        for (int i = 0; i < tables; i++) {
            long p = base + 12 + i * 16L;
            int tag = (int) u32(in, p);
            long offset = u32(in, p + 8), length = u32(in, p + 12);
            if (offset + length > in.size()) throw new IOException("Table outside file");
            if (tag == NAME) { name = offset; nameLen = length; }
            else if (tag == OS2) { os2 = offset; os2Len = length; }
            else if (tag == CMAP) { cmap = offset; cmapLen = length; }
        }
        if (cmap < 0) throw new IOException("Missing cmap");
        String family = null, typographic = null, full = null;
        if (name >= 0 && nameLen >= 6) {
            typographic = nameString(in, name, nameLen, 16);
            family = nameString(in, name, nameLen, 1);
            full = nameString(in, name, nameLen, 4);
        }
        String resolvedFamily = typographic != null ? typographic : family;
        int weight = 400;
        boolean italic = false;
        if (os2 >= 0 && os2Len >= 64) {
            weight = Math.max(1, Math.min(1000, u16(in, os2 + 4)));
            italic = (u16(in, os2 + 62) & 1) != 0;
        }
        int[] glyphs = lookup(in, cmap, cmapLen, new int[]{'A', 'a', 0xac00, 0xd55c});
        boolean latin = glyphs[0] != 0 && glyphs[1] != 0;
        boolean hangul = glyphs[2] != 0 && glyphs[3] != 0;
        if (resolvedFamily == null) resolvedFamily = full;
        if (full == null) full = resolvedFamily;
        if (resolvedFamily == null) throw new IOException("Unnamed font");
        return new NotesnookFontInfo(resolvedFamily, full, weight, italic, hangul, latin);
    }

    /** Copies one face of a collection into a standalone SFNT (tables unchanged). */
    public static byte[] extractFace(byte[] data, int index) throws IOException {
        Source in = of(data);
        if (faceCount(in) == 1 && index == 0) return data;
        long base = faceOffset(in, index);
        int tables = u16(in, base + 4);
        if (tables < 1 || tables > 256) throw new IOException("Invalid table count");
        long total = 12 + tables * 16L;
        long[][] records = new long[tables][4];
        for (int i = 0; i < tables; i++) {
            long p = base + 12 + i * 16L;
            records[i] = new long[]{u32(in, p), u32(in, p + 4), u32(in, p + 8), u32(in, p + 12)};
            if (records[i][2] + records[i][3] > data.length) throw new IOException("Table outside file");
            total += (records[i][3] + 3) & ~3L;
        }
        if (total > 48L * 1024 * 1024) throw new IOException("Font face too large");
        byte[] out = new byte[(int) total];
        System.arraycopy(data, (int) base, out, 0, 12);
        int cursor = 12 + tables * 16;
        for (int i = 0; i < tables; i++) {
            int p = 12 + i * 16;
            put32(out, p, records[i][0]); put32(out, p + 4, records[i][1]);
            put32(out, p + 8, cursor); put32(out, p + 12, records[i][3]);
            System.arraycopy(data, (int) records[i][2], out, cursor, (int) records[i][3]);
            cursor += (int) ((records[i][3] + 3) & ~3L);
        }
        return out;
    }

    private static long faceOffset(Source in, int index) throws IOException {
        if (u32(in, 0) != TTCF) {
            if (index != 0) throw new IOException("Not a font collection");
            return 0;
        }
        int count = faceCount(in);
        if (index < 0 || index >= count) throw new IOException("Face index out of range");
        long offset = u32(in, 12 + index * 4L);
        if (offset + 12 > in.size()) throw new IOException("Face outside file");
        return offset;
    }

    /** Prefers Windows Korean, then Windows English, any Windows, then Mac Roman. */
    private static String nameString(Source in, long table, long length, int nameId) throws IOException {
        int count = u16(in, table + 2), strings = u16(in, table + 4);
        if (6 + count * 12L > length) throw new IOException("Invalid name table");
        String best = null; int bestScore = -1;
        for (int i = 0; i < count; i++) {
            long p = table + 6 + i * 12L;
            int platform = u16(in, p), encoding = u16(in, p + 2), language = u16(in, p + 4);
            if (u16(in, p + 6) != nameId) continue;
            int len = u16(in, p + 8), off = u16(in, p + 10);
            if (strings + off + (long) len > length || len == 0 || len > 512) continue;
            int score;
            if (platform == 3 && (encoding == 1 || encoding == 10)) score = language == 0x412 ? 4 : language == 0x409 ? 3 : 2;
            else if (platform == 0) score = 2;
            else if (platform == 1 && encoding == 0) score = 1;
            else continue;
            if (score <= bestScore) continue;
            byte[] raw = new byte[len];
            in.read(table + strings + off, raw, len);
            String value = (platform == 1 ? new String(raw, StandardCharsets.ISO_8859_1)
                    : new String(raw, StandardCharsets.UTF_16BE)).trim();
            if (value.isEmpty()) continue;
            best = value; bestScore = score;
        }
        return best;
    }

    /** Glyph ids for the given code points from the best Unicode cmap (0 = missing). */
    private static int[] lookup(Source in, long cmap, long length, int[] codepoints) throws IOException {
        int records = u16(in, cmap + 2);
        if (4 + records * 8L > length || records > 64) throw new IOException("Invalid cmap");
        long format4 = -1, format12 = -1;
        for (int i = 0; i < records; i++) {
            long p = cmap + 4 + i * 8L;
            int platform = u16(in, p), encoding = u16(in, p + 2);
            long sub = cmap + u32(in, p + 4);
            if (sub + 4 > cmap + length) continue;
            int format = u16(in, sub);
            boolean unicode = platform == 0 || (platform == 3 && (encoding == 1 || encoding == 10));
            if (!unicode) continue;
            if (format == 12 && format12 < 0) format12 = sub;
            if (format == 4 && format4 < 0) format4 = sub;
        }
        int[] result = new int[codepoints.length];
        for (int i = 0; i < codepoints.length; i++) {
            int cp = codepoints[i];
            if (format12 >= 0) result[i] = format12Glyph(in, format12, cp);
            if (result[i] == 0 && format4 >= 0 && cp <= 0xffff) result[i] = format4Glyph(in, format4, cp);
        }
        return result;
    }

    private static int format4Glyph(Source in, long s, int cp) throws IOException {
        int segments = u16(in, s + 6) / 2;
        if (segments < 1 || segments > 8192) return 0;
        byte[] table = new byte[16 + segments * 8];
        long available = Math.min(table.length, in.size() - s);
        if (available < table.length) return 0;
        in.read(s, table, table.length);
        for (int j = 0; j < segments; j++) {
            int end = b16(table, 14 + j * 2);
            if (end < cp) continue;
            int start = b16(table, 16 + segments * 2 + j * 2);
            if (start > cp) return 0;
            int delta = b16(table, 16 + segments * 4 + j * 2);
            long rangeAt = s + 16 + segments * 6L + j * 2L;
            int range = b16(table, 16 + segments * 6 + j * 2);
            if (range == 0) return (cp + delta) & 0xffff;
            int glyph = u16(in, rangeAt + range + (cp - start) * 2L);
            return glyph == 0 ? 0 : (glyph + delta) & 0xffff;
        }
        return 0;
    }

    private static int format12Glyph(Source in, long s, int cp) throws IOException {
        long groups = u32(in, s + 12);
        if (groups > 0x110000) return 0;
        long lo = 0, hi = groups - 1;
        while (lo <= hi) {
            long mid = (lo + hi) >>> 1, g = s + 16 + mid * 12;
            long start = u32(in, g), end = u32(in, g + 4);
            if (cp < start) hi = mid - 1;
            else if (cp > end) lo = mid + 1;
            else return (int) (u32(in, g + 8) + (cp - start));
        }
        return 0;
    }

    private static int u16(Source in, long p) throws IOException {
        byte[] b = new byte[2]; in.read(p, b, 2); return b16(b, 0);
    }
    private static long u32(Source in, long p) throws IOException {
        byte[] b = new byte[4]; in.read(p, b, 4);
        return ((long) (b[0] & 255) << 24) | ((b[1] & 255) << 16) | ((b[2] & 255) << 8) | (b[3] & 255);
    }
    private static int b16(byte[] b, int p) { return (b[p] & 255) << 8 | (b[p + 1] & 255); }
    private static void put32(byte[] b, int p, long v) {
        b[p] = (byte) (v >>> 24); b[p + 1] = (byte) (v >>> 16); b[p + 2] = (byte) (v >>> 8); b[p + 3] = (byte) v;
    }
}
