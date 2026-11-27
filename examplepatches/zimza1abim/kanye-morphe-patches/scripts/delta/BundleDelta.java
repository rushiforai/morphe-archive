// WDLT v1: bsdiff 4.x control/diff/extra streams, compressed with zlib Deflate
// instead of bzip2. Header carries both file sizes and both SHA-256 hashes so a
// delta applied to the wrong original fails before any output is produced.
//
//   magic "WDLT" | u8 version=1
//   u64 little-endian oldSize | u64 little-endian newSize
//   32 bytes oldSha256 | 32 bytes newSha256
//   u32 little-endian length + deflate(control)
//   u32 little-endian length + deflate(diff)
//   u32 little-endian length + deflate(extra)
//
// control is a sequence of bsdiff offtout triples (addLen, copyLen, seek).
// Run: java -Xmx2g -Xss16m BundleDelta.java diff|apply|check|selftest ...

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.zip.Deflater;
import java.util.zip.Inflater;

public final class BundleDelta {
    private static final byte[] MAGIC = {'W', 'D', 'L', 'T'};
    private static final int VERSION = 1;
    private static final int HEADER = 4 + 1 + 8 + 8 + 32 + 32;
    private static final int MAX_FILE = 256 * 1024 * 1024;
    private static boolean progress;

    public static void main(String[] args) {
        try {
            if (args.length == 0) usage();
            switch (args[0]) {
                case "diff" -> {
                    if (args.length != 4) usage();
                    long started = System.nanoTime();
                    byte[] oldBytes = Files.readAllBytes(Path.of(args[1]));
                    byte[] newBytes = Files.readAllBytes(Path.of(args[2]));
                    progress = true;
                    byte[] delta = diff(oldBytes, newBytes);
                    Files.write(Path.of(args[3]), delta);
                    System.err.println("WDLT old=" + oldBytes.length + " new=" + newBytes.length
                            + " delta=" + delta.length + " ms=" + ((System.nanoTime() - started) / 1_000_000));
                }
                case "apply" -> {
                    if (args.length != 4) usage();
                    Files.write(Path.of(args[3]), apply(Files.readAllBytes(Path.of(args[1])), Files.readAllBytes(Path.of(args[2]))));
                }
                case "check" -> {
                    if (args.length != 4) usage();
                    byte[] out = apply(Files.readAllBytes(Path.of(args[1])), Files.readAllBytes(Path.of(args[2])));
                    String actual = hex(sha256(out));
                    if (!actual.equals(args[3].toLowerCase())) {
                        throw new Failure("hash mismatch: expected " + args[3].toLowerCase() + " actual " + actual);
                    }
                    System.out.println("OK " + actual);
                }
                case "selftest" -> selftest();
                default -> usage();
            }
        } catch (Failure e) {
            System.err.println(e.getMessage());
            System.exit(1);
        } catch (Exception e) {
            e.printStackTrace(System.err);
            System.exit(1);
        }
    }

    private static void usage() {
        throw new Failure("usage: BundleDelta.java diff|apply <old> <delta-or-new> <out> | check <old> <delta> <sha256> | selftest");
    }

    static byte[] diff(byte[] oldBytes, byte[] newBytes) {
        if (oldBytes.length > MAX_FILE || newBytes.length > MAX_FILE) throw new Failure("file exceeds 256MB");
        int oldSize = oldBytes.length;
        int newSize = newBytes.length;
        int[] suffix = new int[oldSize + 1];
        int[] groups = new int[oldSize + 1];
        qsufsort(suffix, groups, oldBytes);
        groups = null;

        byte[] diffBytes = new byte[newSize];
        byte[] extraBytes = new byte[newSize];
        int diffLen = 0;
        int extraLen = 0;
        ByteArrayOutputStream control = new ByteArrayOutputStream();
        byte[] triple = new byte[24];

        int scan = 0;
        int len = 0;
        int lastScan = 0;
        int lastPos = 0;
        int lastOffset = 0;
        int nextReport = 4 * 1024 * 1024;
        while (scan < newSize) {
            int oldScore = 0;
            int position = 0;
            int scsc = scan += len;
            for (; scan < newSize; scan++) {
                int[] found = search(suffix, oldBytes, newBytes, scan, newSize - scan, 0, oldSize);
                len = found[0];
                position = found[1];
                for (; scsc < scan + len; scsc++) {
                    if (scsc + lastOffset < oldSize && oldBytes[scsc + lastOffset] == newBytes[scsc]) oldScore++;
                }
                if ((len == oldScore && len != 0) || len > oldScore + 8) break;
                if (scan + lastOffset < oldSize && oldBytes[scan + lastOffset] == newBytes[scan]) oldScore--;
            }

            if (len != oldScore || scan == newSize) {
                int score = 0;
                int bestForward = 0;
                int forward = 0;
                for (int i = 0; lastScan + i < scan && lastPos + i < oldSize; ) {
                    if (oldBytes[lastPos + i] == newBytes[lastScan + i]) score++;
                    i++;
                    if ((long) score * 2 - i > (long) bestForward * 2 - forward) {
                        bestForward = score;
                        forward = i;
                    }
                }

                int backward = 0;
                if (scan < newSize) {
                    score = 0;
                    int bestBackward = 0;
                    for (int i = 1; scan >= lastScan + i && position >= i; i++) {
                        if (oldBytes[position - i] == newBytes[scan - i]) score++;
                        if ((long) score * 2 - i > (long) bestBackward * 2 - backward) {
                            bestBackward = score;
                            backward = i;
                        }
                    }
                }

                if (lastScan + forward > scan - backward) {
                    int overlap = (lastScan + forward) - (scan - backward);
                    score = 0;
                    int bestOverlap = 0;
                    int overlapLen = 0;
                    for (int i = 0; i < overlap; i++) {
                        if (newBytes[lastScan + forward - overlap + i] == oldBytes[lastPos + forward - overlap + i]) score++;
                        if (newBytes[scan - backward + i] == oldBytes[position - backward + i]) score--;
                        if (score > bestOverlap) {
                            bestOverlap = score;
                            overlapLen = i + 1;
                        }
                    }
                    forward += overlapLen - overlap;
                    backward -= overlapLen;
                }

                int extra = (scan - backward) - (lastScan + forward);
                if (forward < 0 || extra < 0) throw new Failure("bsdiff produced a negative block");
                for (int i = 0; i < forward; i++) {
                    diffBytes[diffLen + i] = (byte) (newBytes[lastScan + i] - oldBytes[lastPos + i]);
                }
                for (int i = 0; i < extra; i++) extraBytes[extraLen + i] = newBytes[lastScan + forward + i];
                diffLen += forward;
                extraLen += extra;

                offtout(forward, triple, 0);
                offtout(extra, triple, 8);
                offtout((long) (position - backward) - (lastPos + forward), triple, 16);
                control.write(triple, 0, 24);

                lastScan = scan - backward;
                lastPos = position - backward;
                lastOffset = position - scan;
            }
            if (progress && scan >= nextReport) {
                System.err.println("scan " + scan + "/" + newSize);
                nextReport = scan + 4 * 1024 * 1024;
            }
        }

        return pack(oldBytes, newBytes, control.toByteArray(), diffBytes, diffLen, extraBytes, extraLen);
    }

    static byte[] apply(byte[] original, byte[] delta) {
        if (delta.length < HEADER + 12) throw new Failure("bundle delta is truncated");
        if (!Arrays.equals(delta, 0, 4, MAGIC, 0, 4)) throw new Failure("bundle delta magic mismatch");
        if ((delta[4] & 0xff) != VERSION) throw new Failure("bundle delta version mismatch");
        ByteBuffer header = ByteBuffer.wrap(delta, 5, 16).order(ByteOrder.LITTLE_ENDIAN);
        long oldSize = header.getLong();
        long newSize = header.getLong();
        if (oldSize != original.length || oldSize < 0 || newSize < 0 || newSize > MAX_FILE) {
            throw new Failure("bundle delta size does not match this original");
        }
        byte[] oldHash = Arrays.copyOfRange(delta, 21, 53);
        byte[] newHash = Arrays.copyOfRange(delta, 53, 85);
        if (!Arrays.equals(oldHash, sha256(original))) throw new Failure("bundle delta original hash mismatch");

        int cursor = HEADER;
        byte[] control = inflateBlock(delta, cursor, blockCap(newSize, true));
        cursor += 4 + u32(delta, cursor);
        byte[] diffBytes = inflateBlock(delta, cursor, blockCap(newSize, false));
        cursor += 4 + u32(delta, cursor);
        byte[] extraBytes = inflateBlock(delta, cursor, blockCap(newSize, false));
        cursor += 4 + u32(delta, cursor);
        if (cursor != delta.length) throw new Failure("bundle delta has trailing bytes");
        if (control.length % 24 != 0) throw new Failure("bundle delta control block is corrupt");

        byte[] out = new byte[(int) newSize];
        int ctrlAt = 0;
        int diffAt = 0;
        int extraAt = 0;
        int newPos = 0;
        long oldPos = 0;
        while (newPos < newSize) {
            if (ctrlAt + 24 > control.length) throw new Failure("bundle delta control block ended early");
            long add = offtin(control, ctrlAt);
            long copy = offtin(control, ctrlAt + 8);
            long seek = offtin(control, ctrlAt + 16);
            ctrlAt += 24;
            if (add < 0 || copy < 0 || add > newSize - newPos || copy > newSize - newPos - add) {
                throw new Failure("bundle delta control block is corrupt");
            }
            int addLen = (int) add;
            int copyLen = (int) copy;
            if (diffAt + addLen > diffBytes.length || extraAt + copyLen > extraBytes.length) {
                throw new Failure("bundle delta data block ended early");
            }
            for (int i = 0; i < addLen; i++) {
                int value = diffBytes[diffAt + i] & 0xff;
                long at = oldPos + i;
                if (at >= 0 && at < original.length) value = (value + (original[(int) at] & 0xff)) & 0xff;
                out[newPos + i] = (byte) value;
            }
            newPos += addLen;
            diffAt += addLen;
            oldPos += addLen;
            System.arraycopy(extraBytes, extraAt, out, newPos, copyLen);
            newPos += copyLen;
            extraAt += copyLen;
            oldPos += seek;
        }
        if (ctrlAt != control.length || diffAt != diffBytes.length || extraAt != extraBytes.length) {
            throw new Failure("bundle delta did not consume its blocks");
        }
        if (!Arrays.equals(newHash, sha256(out))) throw new Failure("bundle delta result hash mismatch");
        return out;
    }

    private static byte[] pack(byte[] oldBytes, byte[] newBytes, byte[] control, byte[] diffBytes, int diffLen, byte[] extraBytes, int extraLen) {
        byte[] controlZip = deflate(control, 0, control.length);
        byte[] diffZip = deflate(diffBytes, 0, diffLen);
        byte[] extraZip = deflate(extraBytes, 0, extraLen);
        if (controlZip.length > Integer.MAX_VALUE - 4 || (long) controlZip.length + diffZip.length + extraZip.length + HEADER + 12 > Integer.MAX_VALUE) {
            throw new Failure("bundle delta is too large");
        }
        ByteBuffer out = ByteBuffer.allocate(HEADER + 12 + controlZip.length + diffZip.length + extraZip.length).order(ByteOrder.LITTLE_ENDIAN);
        out.put(MAGIC);
        out.put((byte) VERSION);
        out.putLong(oldBytes.length);
        out.putLong(newBytes.length);
        out.put(sha256(oldBytes));
        out.put(sha256(newBytes));
        putBlock(out, controlZip);
        putBlock(out, diffZip);
        putBlock(out, extraZip);
        return out.array();
    }

    private static void putBlock(ByteBuffer out, byte[] compressed) {
        out.putInt(compressed.length);
        out.put(compressed);
    }

    /** Uncompressed control can be many triples; diff and extra never exceed the new file. */
    private static int blockCap(long newSize, boolean control) {
        long cap = control ? newSize * 24L + 24 : newSize;
        if (cap < 0 || cap > MAX_FILE) cap = MAX_FILE;
        return (int) cap;
    }

    private static byte[] inflateBlock(byte[] delta, int offset, int maxOut) {
        if (offset + 4 > delta.length) throw new Failure("bundle delta is truncated");
        int length = u32(delta, offset);
        if (length < 0 || offset + 4 + length > delta.length) throw new Failure("bundle delta block length is corrupt");
        Inflater inflater = new Inflater();
        try {
            inflater.setInput(delta, offset + 4, length);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[65536];
            while (!inflater.finished()) {
                if (inflater.needsInput()) throw new Failure("bundle delta block is truncated");
                int n = inflater.inflate(buf);
                if (n == 0) {
                    if (inflater.finished()) break;
                    throw new Failure("bundle delta block is corrupt");
                }
                if ((long) out.size() + n > maxOut) throw new Failure("bundle delta block is too large");
                out.write(buf, 0, n);
            }
            if (inflater.getRemaining() != 0) throw new Failure("bundle delta block has trailing bytes");
            return out.toByteArray();
        } catch (Failure e) {
            throw e;
        } catch (Exception e) {
            throw new Failure("bundle delta block is corrupt");
        } finally {
            inflater.end();
        }
    }

    private static byte[] deflate(byte[] data, int offset, int length) {
        Deflater deflater = new Deflater(Deflater.BEST_COMPRESSION);
        try {
            deflater.setInput(data, offset, length);
            deflater.finish();
            ByteArrayOutputStream out = new ByteArrayOutputStream(Math.max(64, length / 8));
            byte[] buf = new byte[65536];
            while (!deflater.finished()) {
                int n = deflater.deflate(buf);
                if (n == 0) break;
                out.write(buf, 0, n);
            }
            if (!deflater.finished()) throw new Failure("deflate did not finish");
            return out.toByteArray();
        } finally {
            deflater.end();
        }
    }

    /** Group rank of the suffix starting h bytes after {@code suffix}. Past the end sorts first. */
    private static int rank(int[] groups, int suffix, int h, int size) {
        long at = (long) suffix + h;
        if (at > size) return -1;
        return groups[(int) at];
    }

    private static void qsufsort(int[] index, int[] groups, byte[] old) {
        int size = old.length;
        int[] buckets = new int[256];
        for (byte value : old) buckets[value & 0xff]++;
        for (int i = 1; i < 256; i++) buckets[i] += buckets[i - 1];
        for (int i = 255; i > 0; i--) buckets[i] = buckets[i - 1];
        buckets[0] = 0;
        for (int i = 0; i < size; i++) index[++buckets[old[i] & 0xff]] = i;
        index[0] = size;
        for (int i = 0; i < size; i++) groups[i] = buckets[old[i] & 0xff];
        groups[size] = 0;
        for (int i = 1; i < 256; i++) if (buckets[i] == buckets[i - 1] + 1) index[buckets[i]] = -1;
        index[0] = -1;

        for (int h = 1; index[0] != -(size + 1); h += h) {
            if (h <= 0) throw new Failure("suffix sort did not finish");
            int len = 0;
            int i = 0;
            for (; i < size + 1; ) {
                if (index[i] < 0) {
                    len -= index[i];
                    i -= index[i];
                } else {
                    if (len != 0) index[i - len] = -len;
                    len = groups[index[i]] + 1 - i;
                    split(index, groups, i, len, h, size);
                    i += len;
                    len = 0;
                }
            }
            if (len != 0) index[i - len] = -len;
        }
        for (int i = 0; i < size + 1; i++) index[groups[i]] = i;
    }

    private static void split(int[] index, int[] groups, int start, int len, int h, int size) {
        if (len < 16) {
            for (int k = start; k < start + len; ) {
                int j = 1;
                int pivot = rank(groups, index[k], h, size);
                for (int i = 1; k + i < start + len; i++) {
                    int value = rank(groups, index[k + i], h, size);
                    if (value < pivot) {
                        pivot = value;
                        j = 0;
                    }
                    if (value == pivot) {
                        int tmp = index[k + j];
                        index[k + j] = index[k + i];
                        index[k + i] = tmp;
                        j++;
                    }
                }
                for (int i = 0; i < j; i++) groups[index[k + i]] = k + j - 1;
                if (j == 1) index[k] = -1;
                k += j;
            }
            return;
        }

        int pivot = rank(groups, index[start + len / 2], h, size);
        int less = 0;
        int equal = 0;
        for (int i = start; i < start + len; i++) {
            int value = rank(groups, index[i], h, size);
            if (value < pivot) less++;
            if (value == pivot) equal++;
        }
        less += start;
        equal += less;

        int i = start;
        int j = 0;
        int k = 0;
        while (i < less) {
            int value = rank(groups, index[i], h, size);
            if (value < pivot) {
                i++;
            } else if (value == pivot) {
                swap(index, i, less + j);
                j++;
            } else {
                swap(index, i, equal + k);
                k++;
            }
        }
        while (less + j < equal) {
            if (rank(groups, index[less + j], h, size) == pivot) {
                j++;
            } else {
                swap(index, less + j, equal + k);
                k++;
            }
        }
        if (less > start) split(index, groups, start, less - start, h, size);
        for (int n = 0; n < equal - less; n++) groups[index[less + n]] = equal - 1;
        if (less == equal - 1) index[less] = -1;
        if (start + len > equal) split(index, groups, equal, start + len - equal, h, size);
    }

    private static void swap(int[] array, int a, int b) {
        int tmp = array[a];
        array[a] = array[b];
        array[b] = tmp;
    }

    /** @return [matchLength, oldPosition] */
    private static int[] search(int[] suffix, byte[] oldBytes, byte[] newBytes, int newOff, int newLen, int start, int end) {
        if (end - start < 2) {
            int left = matchlen(oldBytes, suffix[start], newBytes, newOff, newLen);
            int right = matchlen(oldBytes, suffix[end], newBytes, newOff, newLen);
            if (left > right) return new int[] {left, suffix[start]};
            return new int[] {right, suffix[end]};
        }
        int mid = start + (end - start) / 2;
        if (memcmp(oldBytes, suffix[mid], newBytes, newOff, newLen) < 0) {
            return search(suffix, oldBytes, newBytes, newOff, newLen, mid, end);
        }
        return search(suffix, oldBytes, newBytes, newOff, newLen, start, mid);
    }

    private static int matchlen(byte[] oldBytes, int oldOff, byte[] newBytes, int newOff, int newLen) {
        if (oldOff < 0 || oldOff > oldBytes.length) return 0;
        int n = Math.min(oldBytes.length - oldOff, newLen);
        if (n <= 0) return 0;
        int mismatch = Arrays.mismatch(oldBytes, oldOff, oldOff + n, newBytes, newOff, newOff + n);
        return mismatch < 0 ? n : mismatch;
    }

    private static int memcmp(byte[] oldBytes, int oldOff, byte[] newBytes, int newOff, int newLen) {
        int n = oldOff > oldBytes.length ? 0 : Math.min(oldBytes.length - oldOff, newLen);
        if (n <= 0) return 0;
        int mismatch = Arrays.mismatch(oldBytes, oldOff, oldOff + n, newBytes, newOff, newOff + n);
        if (mismatch < 0) return 0;
        return (oldBytes[oldOff + mismatch] & 0xff) - (newBytes[newOff + mismatch] & 0xff);
    }

    private static void offtout(long value, byte[] buf, int offset) {
        long magnitude = value < 0 ? -value : value;
        for (int i = 0; i < 8; i++) {
            buf[offset + i] = (byte) (magnitude & 0xff);
            magnitude >>>= 8;
        }
        if (value < 0) buf[offset + 7] |= (byte) 0x80;
    }

    private static long offtin(byte[] buf, int offset) {
        long value = buf[offset + 7] & 0x7f;
        for (int i = 6; i >= 0; i--) value = value * 256 + (buf[offset + i] & 0xff);
        return (buf[offset + 7] & 0x80) != 0 ? -value : value;
    }

    private static int u32(byte[] data, int offset) {
        return ByteBuffer.wrap(data, offset, 4).order(ByteOrder.LITTLE_ENDIAN).getInt();
    }

    private static byte[] sha256(byte[] data) {
        try {
            return MessageDigest.getInstance("SHA-256").digest(data);
        } catch (Exception e) {
            throw new Failure("SHA-256 unavailable");
        }
    }

    private static String hex(byte[] data) {
        StringBuilder out = new StringBuilder(data.length * 2);
        for (byte value : data) out.append(String.format("%02x", value & 0xff));
        return out.toString();
    }

    private static void selftest() {
        java.util.Random random = new java.util.Random(0xB5D1FF);
        round(new byte[0], new byte[0]);
        round(new byte[0], new byte[] {1, 2, 3, 4});
        round(new byte[] {9, 8, 7}, new byte[0]);
        round("aaaa".getBytes(), "aaaa".getBytes());
        round("abcdefghij".getBytes(), "abcdefghij".getBytes());
        round("The quick brown fox".getBytes(), "The quick brown fox jumps".getBytes());
        round("abcdefgXYZ".getBytes(), "abcDEFgXYZ".getBytes());
        byte[] repeated = new byte[4096];
        Arrays.fill(repeated, (byte) 'a');
        byte[] repeatedEdit = repeated.clone();
        repeatedEdit[100] = 'b';
        repeatedEdit[4000] = 'c';
        round(repeated, repeatedEdit);
        for (int n = 0; n < 40; n++) {
            byte[] oldBytes = new byte[random.nextInt(3000)];
            random.nextBytes(oldBytes);
            round(oldBytes, mutate(oldBytes, random));
        }
        byte[] big = new byte[1 << 20];
        random.nextBytes(big);
        byte[] edited = big.clone();
        edited[10] ^= 1;
        edited[500000] = 7;
        System.arraycopy(new byte[] {1, 2, 3, 4, 5}, 0, edited, 800000, 5);
        byte[] delta = diff(big, edited);
        if (delta.length > 64 * 1024) throw new Failure("similar 1MB inputs produced a " + delta.length + " byte delta");
        if (!Arrays.equals(apply(big, delta), edited)) throw new Failure("large round trip mismatch");

        byte[] sampleOld = "original-bundle".getBytes();
        byte[] sampleNew = "original-bundle-plus".getBytes();
        byte[] sample = diff(sampleOld, sampleNew);
        expectFail(() -> apply(sampleNew, sample), "wrong original");
        byte[] badMagic = sample.clone();
        badMagic[0] = 'X';
        expectFail(() -> apply(sampleOld, badMagic), "bad magic");
        byte[] badVersion = sample.clone();
        badVersion[4] = 9;
        expectFail(() -> apply(sampleOld, badVersion), "bad version");
        byte[] badHash = sample.clone();
        badHash[21] ^= 1;
        expectFail(() -> apply(sampleOld, badHash), "bad old hash");
        byte[] badNewHash = sample.clone();
        badNewHash[53] ^= 1;
        expectFail(() -> apply(sampleOld, badNewHash), "bad new hash");
        byte[] truncated = Arrays.copyOf(sample, sample.length / 2);
        expectFail(() -> apply(sampleOld, truncated), "truncated");
        System.out.println("SELFTEST_OK delta1MB=" + delta.length);
    }

    private static byte[] mutate(byte[] oldBytes, java.util.Random random) {
        byte[] out = Arrays.copyOf(oldBytes, Math.max(0, oldBytes.length + random.nextInt(50) - 10));
        int flips = random.nextInt(8);
        for (int i = 0; i < flips && out.length > 0; i++) out[random.nextInt(out.length)] = (byte) random.nextInt(256);
        if (random.nextInt(5) == 0 && out.length > 4) {
            int at = random.nextInt(out.length - 3);
            out[at] = 'Q';
            out[at + 1] = 'Z';
        }
        return out;
    }

    private static void round(byte[] oldBytes, byte[] newBytes) {
        byte[] delta = diff(oldBytes, newBytes);
        byte[] got = apply(oldBytes, delta);
        if (!Arrays.equals(got, newBytes)) throw new Failure("round trip mismatch old=" + oldBytes.length + " new=" + newBytes.length);
    }

    private static void expectFail(Runnable action, String label) {
        try {
            action.run();
        } catch (Failure e) {
            return;
        }
        throw new Failure("expected failure: " + label);
    }

    private static final class Failure extends RuntimeException {
        Failure(String message) { super(message); }
    }
}
