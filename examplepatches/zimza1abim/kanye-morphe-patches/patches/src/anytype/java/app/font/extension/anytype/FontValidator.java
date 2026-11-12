package app.font.extension.anytype;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;

/** Rebuilds Unicode cmap only. Outlines and shaping tables remain untouched. */
public final class FontValidator {
    private FontValidator() {}

    // Unicode 17.0 Emoji property, excluding ASCII keycap bases so plain digits
    // retain the chosen font. System fallback handles missing emoji glyphs.
    // Source: https://www.unicode.org/Public/17.0.0/ucd/emoji/emoji-data.txt
    private static final int[] EMOJI = {
        0xa9, 0xa9,
        0xae, 0xae,
        0x203c, 0x203c,
        0x2049, 0x2049,
        0x2122, 0x2122,
        0x2139, 0x2139,
        0x2194, 0x2199,
        0x21a9, 0x21aa,
        0x231a, 0x231b,
        0x2328, 0x2328,
        0x23cf, 0x23cf,
        0x23e9, 0x23f3,
        0x23f8, 0x23fa,
        0x24c2, 0x24c2,
        0x25aa, 0x25ab,
        0x25b6, 0x25b6,
        0x25c0, 0x25c0,
        0x25fb, 0x25fe,
        0x2600, 0x2604,
        0x260e, 0x260e,
        0x2611, 0x2611,
        0x2614, 0x2615,
        0x2618, 0x2618,
        0x261d, 0x261d,
        0x2620, 0x2620,
        0x2622, 0x2623,
        0x2626, 0x2626,
        0x262a, 0x262a,
        0x262e, 0x262f,
        0x2638, 0x263a,
        0x2640, 0x2640,
        0x2642, 0x2642,
        0x2648, 0x2653,
        0x265f, 0x2660,
        0x2663, 0x2663,
        0x2665, 0x2666,
        0x2668, 0x2668,
        0x267b, 0x267b,
        0x267e, 0x267f,
        0x2692, 0x2697,
        0x2699, 0x2699,
        0x269b, 0x269c,
        0x26a0, 0x26a1,
        0x26a7, 0x26a7,
        0x26aa, 0x26ab,
        0x26b0, 0x26b1,
        0x26bd, 0x26be,
        0x26c4, 0x26c5,
        0x26c8, 0x26c8,
        0x26ce, 0x26cf,
        0x26d1, 0x26d1,
        0x26d3, 0x26d4,
        0x26e9, 0x26ea,
        0x26f0, 0x26f5,
        0x26f7, 0x26fa,
        0x26fd, 0x26fd,
        0x2702, 0x2702,
        0x2705, 0x2705,
        0x2708, 0x270d,
        0x270f, 0x270f,
        0x2712, 0x2712,
        0x2714, 0x2714,
        0x2716, 0x2716,
        0x271d, 0x271d,
        0x2721, 0x2721,
        0x2728, 0x2728,
        0x2733, 0x2734,
        0x2744, 0x2744,
        0x2747, 0x2747,
        0x274c, 0x274c,
        0x274e, 0x274e,
        0x2753, 0x2755,
        0x2757, 0x2757,
        0x2763, 0x2764,
        0x2795, 0x2797,
        0x27a1, 0x27a1,
        0x27b0, 0x27b0,
        0x27bf, 0x27bf,
        0x2934, 0x2935,
        0x2b05, 0x2b07,
        0x2b1b, 0x2b1c,
        0x2b50, 0x2b50,
        0x2b55, 0x2b55,
        0x3030, 0x3030,
        0x303d, 0x303d,
        0x3297, 0x3297,
        0x3299, 0x3299,
        0x1f004, 0x1f004,
        0x1f0cf, 0x1f0cf,
        0x1f170, 0x1f171,
        0x1f17e, 0x1f17f,
        0x1f18e, 0x1f18e,
        0x1f191, 0x1f19a,
        0x1f1e6, 0x1f1ff,
        0x1f201, 0x1f202,
        0x1f21a, 0x1f21a,
        0x1f22f, 0x1f22f,
        0x1f232, 0x1f23a,
        0x1f250, 0x1f251,
        0x1f300, 0x1f321,
        0x1f324, 0x1f393,
        0x1f396, 0x1f397,
        0x1f399, 0x1f39b,
        0x1f39e, 0x1f3f0,
        0x1f3f3, 0x1f3f5,
        0x1f3f7, 0x1f4fd,
        0x1f4ff, 0x1f53d,
        0x1f549, 0x1f54e,
        0x1f550, 0x1f567,
        0x1f56f, 0x1f570,
        0x1f573, 0x1f57a,
        0x1f587, 0x1f587,
        0x1f58a, 0x1f58d,
        0x1f590, 0x1f590,
        0x1f595, 0x1f596,
        0x1f5a4, 0x1f5a5,
        0x1f5a8, 0x1f5a8,
        0x1f5b1, 0x1f5b2,
        0x1f5bc, 0x1f5bc,
        0x1f5c2, 0x1f5c4,
        0x1f5d1, 0x1f5d3,
        0x1f5dc, 0x1f5de,
        0x1f5e1, 0x1f5e1,
        0x1f5e3, 0x1f5e3,
        0x1f5e8, 0x1f5e8,
        0x1f5ef, 0x1f5ef,
        0x1f5f3, 0x1f5f3,
        0x1f5fa, 0x1f64f,
        0x1f680, 0x1f6c5,
        0x1f6cb, 0x1f6d2,
        0x1f6d5, 0x1f6d8,
        0x1f6dc, 0x1f6e5,
        0x1f6e9, 0x1f6e9,
        0x1f6eb, 0x1f6ec,
        0x1f6f0, 0x1f6f0,
        0x1f6f3, 0x1f6fc,
        0x1f7e0, 0x1f7eb,
        0x1f7f0, 0x1f7f0,
        0x1f90c, 0x1f93a,
        0x1f93c, 0x1f945,
        0x1f947, 0x1f9ff,
        0x1fa70, 0x1fa7c,
        0x1fa80, 0x1fa8a,
        0x1fa8e, 0x1fac6,
        0x1fac8, 0x1fac8,
        0x1facd, 0x1fadc,
        0x1fadf, 0x1faea,
        0x1faef, 0x1faf8
    };
    public static boolean isText(int cp) {
        if (cp < 32 || cp > 0x10ffff || cp >= 0xd800 && cp <= 0xdfff
                || cp >= 0xfe00 && cp <= 0xfe0f || cp >= 0xe0000) return false;
        for (int i = 0; i < EMOJI.length; i += 2) {
            if (cp < EMOJI[i]) return true;
            if (cp <= EMOJI[i + 1]) return false;
        }
        return true;
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

    public static byte[] validate(byte[] input) throws IOException {
        if (input.length > 32 * 1024 * 1024) throw new IOException("Font must be 32 MB or smaller");
        bounds(input, 0, 12);
        long signature = u32(input, 0);
        if (signature != 0x10000 && signature != 0x4f54544f && signature != 0x74727565)
            throw new IOException("Only TTF or OTF fonts are supported");
        int count = u16(input, 4);
        if (count == 0 || count > 256) throw new IOException("Invalid font table count");
        bounds(input, 12, count * 16L);
        int cmap = -1, cmapLength = 0, glyphCount = -1;
        List<int[]> tables = new ArrayList<>();
        java.util.Set<Integer> tags = new java.util.HashSet<>();
        long totalTableBytes = 0;
        for (int i = 0; i < count; i++) {
            int p = 12 + i * 16, tag = (int) u32(input, p);
            int start = offset(input, p + 8), size = offset(input, p + 12);
            bounds(input, start, size);
            totalTableBytes += size;
            if (!tags.add(tag) || totalTableBytes > 32 * 1024 * 1024L)
                throw new IOException("Duplicate or too many font tables");
            if (tag == 0x6d617870) {
                if (size < 6) throw new IOException("Truncated maxp table");
                glyphCount = u16(input, start + 4);
                if (glyphCount == 0) throw new IOException("Font has no glyphs");
            }
            if (tag == 0x636d6170) { cmap = start; cmapLength = size; }
            if (tag != 0x44534947) tables.add(new int[]{tag, start, size}); // modified signature is invalid
        }
        if (glyphCount < 0) throw new IOException("Missing maxp table");
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
            if (glyphs[cp] >= glyphCount) throw new IOException("Invalid glyph index");
            int start = cp, first = glyphs[cp];
            while (cp + 1 < glyphs.length && glyphs[cp + 1] != 0 && glyphs[cp + 1] == glyphs[cp] + 1) {
                cp++; if (glyphs[cp] >= glyphCount) throw new IOException("Invalid glyph index");
            }
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
        if (size > 32 * 1024 * 1024) throw new IOException("Validated font exceeds 32 MB");
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
                if (length < 54) throw new IOException("Invalid head table");
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
