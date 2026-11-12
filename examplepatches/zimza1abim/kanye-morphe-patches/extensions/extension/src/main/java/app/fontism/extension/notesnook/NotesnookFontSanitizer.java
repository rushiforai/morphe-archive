package app.fontism.extension.notesnook;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;

/** Rebuilds Unicode cmap only. Outlines and shaping tables remain untouched. */
public final class NotesnookFontSanitizer {
    private NotesnookFontSanitizer() {}

    public static boolean isText(int cp) {
        return cp >= 32 && cp <= 0x10ffff
                && cp != 0xa9 && cp != 0xae && cp != 0x203c && cp != 0x2049
                && cp != 0x2122 && cp != 0x2139 && cp != 0x20e3 && cp != 0x200d
                && cp != 0x3030 && cp != 0x303d && cp != 0x3297 && cp != 0x3299
                && !(cp >= 0x2190 && cp <= 0x2bff)
                && !(cp >= 0xd800 && cp <= 0xf8ff)
                && !(cp >= 0xfe00 && cp <= 0xfe0f)
                && !(cp >= 0x1f000 && cp <= 0x1faff)
                && !(cp >= 0xe0000);
    }

    private static void bounds(byte[] b, long p, long n) throws IOException {
        if (p < 0 || n < 0 || p + n > b.length) throw new IOException("Invalid font table range");
    }
    private static int u16(byte[] b, int p) throws IOException {
        bounds(b, p, 2); return (b[p] & 255) << 8 | (b[p + 1] & 255);
    }
    private static long u32(byte[] b, int p) throws IOException {
        return ((long) u16(b, p) << 16) | u16(b, p + 2);
    }
    private static int offset(byte[] b, int p) throws IOException {
        long v = u32(b, p); if (v > b.length) throw new IOException("Invalid font offset"); return (int) v;
    }

    public static byte[] sanitize(byte[] input) throws IOException {
        if (input.length > 48 * 1024 * 1024) throw new IOException("Font must be 48 MB or smaller");
        bounds(input, 0, 12);
        long signature = u32(input, 0);
        if (signature != 0x10000 && signature != 0x4f54544f && signature != 0x74727565)
            throw new IOException("Only TTF or OTF fonts are supported");
        int count = u16(input, 4);
        if (count == 0 || count > 256) throw new IOException("Invalid font table count");
        bounds(input, 12, count * 16L);
        int cmap = -1, cmapLength = 0;
        List<int[]> tables = new ArrayList<>();
        java.util.Set<Integer> tags = new java.util.HashSet<>();
        long totalTableBytes = 0;
        for (int i = 0; i < count; i++) {
            int p = 12 + i * 16, tag = (int) u32(input, p);
            int start = offset(input, p + 8), size = offset(input, p + 12);
            bounds(input, start, size);
            totalTableBytes += size;
            if (!tags.add(tag) || totalTableBytes > 48 * 1024 * 1024L)
                throw new IOException("Duplicate or too many font tables");
            if (tag == 0x636d6170) { cmap = start; cmapLength = size; }
            if (tag != 0x44534947) tables.add(new int[]{tag, start, size}); // modified signature is invalid
        }
        if (cmap < 0 || cmapLength < 4) throw new IOException("Font has no Unicode cmap");
        int[] glyphs = new int[0x110000];
        int records = u16(input, cmap + 2);
        if (4L + records * 8L > cmapLength) throw new IOException("Invalid cmap header");
        if (records > 64) throw new IOException("Too many cmap records");
        java.util.Set<Integer> visited = new java.util.HashSet<>();
        boolean supported = false;
        // BMP first; full-Unicode records take precedence.
        for (int pass = 0; pass < 2; pass++) {
            for (int i = 0; i < records; i++) {
                int p = cmap + 4 + i * 8;
                int platform = u16(input, p), encoding = u16(input, p + 2);
                if (platform != 0 && !(platform == 3 && (encoding == 1 || encoding == 10))) continue;
                int rel = offset(input, p + 4), s = cmap + rel;
                if (rel + 2 > cmapLength) throw new IOException("Invalid cmap offset");
                int format = u16(input, s);
                if (format == 4 && pass == 0) {
                    if (!visited.add(s)) continue;
                    if (rel + 16L > cmapLength) throw new IOException("Invalid format 4 header");
                    int length = u16(input, s + 2), segments = u16(input, s + 6) / 2;
                    if (rel + (long) length > cmapLength || 16L + segments * 8L > length)
                        throw new IOException("Invalid format 4 cmap");
                    int previousEnd = -1;
                    for (int j = 0; j < segments; j++) {
                        int end = u16(input, s + 14 + j * 2);
                        int start = u16(input, s + 16 + segments * 2 + j * 2);
                        if (start > end || start <= previousEnd) throw new IOException("Overlapping format 4 segments");
                        previousEnd = end;
                        int delta = u16(input, s + 16 + segments * 4 + j * 2);
                        int rangeAt = s + 16 + segments * 6 + j * 2;
                        int range = u16(input, rangeAt);
                        for (int cp = start; cp <= end && cp < 0xffff; cp++) {
                            if (!isText(cp)) continue;
                            int glyph;
                            if (range == 0) glyph = (cp + delta) & 65535;
                            else {
                                int address = rangeAt + range + (cp - start) * 2;
                                if (address + 2 > s + length) throw new IOException("Invalid glyph offset");
                                glyph = u16(input, address);
                                if (glyph != 0) glyph = (glyph + delta) & 65535;
                            }
                            glyphs[cp] = glyph;
                        }
                    }
                    supported = true;
                } else if ((format == 12 || format == 13) && pass == 1) {
                    if (!visited.add(s)) continue;
                    if (rel + 16L > cmapLength) throw new IOException("Invalid format 12 header");
                    long length = u32(input, s + 4), groups = u32(input, s + 12);
                    if (rel + length > cmapLength || 16 + groups * 12 > length || groups > 0x110000)
                        throw new IOException("Invalid format 12 cmap");
                    long previous = -1;
                    for (int j = 0; j < groups; j++) {
                        int g = s + 16 + j * 12;
                        long start = u32(input, g), end = u32(input, g + 4), glyph = u32(input, g + 8);
                        if (start <= previous || end < start || end > 0x10ffff || glyph > 65535
                                || (format == 12 && glyph + end - start > 65535))
                            throw new IOException("Invalid Unicode glyph range");
                        previous = end;
                        for (int cp = (int) start; cp <= end; cp++)
                            if (isText(cp)) glyphs[cp] = (int) (glyph + (format == 12 ? cp - start : 0));
                    }
                    supported = true;
                }
            }
        }
        if (!supported) throw new IOException("No supported Unicode cmap");
        List<int[]> groups = new ArrayList<>();
        for (int cp = 0; cp < glyphs.length; cp++) {
            if (glyphs[cp] == 0) continue;
            int start = cp, first = glyphs[cp];
            while (cp + 1 < glyphs.length && glyphs[cp + 1] != 0 && glyphs[cp + 1] == glyphs[cp] + 1) cp++;
            groups.add(new int[]{start, cp, first});
        }
        if (groups.isEmpty()) throw new IOException("Font has no text glyphs");
        ByteBuffer cm = ByteBuffer.allocate(36 + groups.size() * 12).order(ByteOrder.BIG_ENDIAN);
        cm.putShort((short) 0).putShort((short) 2);
        cm.putShort((short) 0).putShort((short) 4).putInt(20);
        cm.putShort((short) 3).putShort((short) 10).putInt(20);
        cm.putShort((short) 12).putShort((short) 0).putInt(cm.capacity() - 20).putInt(0).putInt(groups.size());
        for (int[] g : groups) for (int v : g) cm.putInt(v);
        int n = tables.size(), size = 12 + n * 16;
        for (int[] t : tables) size += ((t[0] == 0x636d6170 ? cm.capacity() : t[2]) + 3) & ~3;
        ByteBuffer out = ByteBuffer.allocate(size).order(ByteOrder.BIG_ENDIAN);
        int power = Integer.highestOneBit(n);
        out.putInt((int) signature).putShort((short) n).putShort((short) (power * 16))
                .putShort((short) Integer.numberOfTrailingZeros(power)).putShort((short) (n * 16 - power * 16));
        int cursor = 12 + n * 16, head = -1;
        for (int i = 0; i < n; i++) {
            int[] t = tables.get(i); int length = t[0] == 0x636d6170 ? cm.capacity() : t[2];
            out.position(cursor);
            if (t[0] == 0x636d6170) out.put(cm.array()); else out.put(input, t[1], t[2]);
            if (t[0] == 0x68656164) {
                if (length < 12) throw new IOException("Invalid head table");
                head = cursor; out.putInt(head + 8, 0);
            }
            out.position(12 + i * 16);
            out.putInt(t[0]).putInt(checksum(out.array(), cursor, length)).putInt(cursor).putInt(length);
            cursor += (length + 3) & ~3;
        }
        if (head < 0) throw new IOException("Font has no head table");
        out.putInt(head + 8, 0xb1b0afba - checksum(out.array(), 0, size));
        return out.array();
    }

    private static int checksum(byte[] data, int offset, int length) {
        int sum = 0;
        for (int i = 0; i < length; i += 4) {
            int word = 0;
            for (int j = 0; j < 4; j++) word = (word << 8) | (i + j < length ? data[offset + i + j] & 255 : 0);
            sum += word;
        }
        return sum;
    }
}
