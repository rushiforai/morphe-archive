package dev.vortexnode.sbrowserx.extension;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.Signature;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

public final class SBrowserXCrxInstaller {
    private static final String TAG = "SBrowserXCrx";
    // Chrome 145 prodversion ensures modern MV3 extensions (including Bitwarden) return HTTP 200 CRX3
    private static final String CWS_CRX_URL =
            "https://clients2.google.com/service/update2/crx?response=redirect&prodversion=145.0.0.0&acceptformat=crx2,crx3&x=id%3D";

    public static final String[][] RECOMMENDED_EXTENSIONS = new String[][] {
            {"ddkjiahejlhfcafbddmgiahcphecmpfh", "uBlock Origin Lite"},
            {"mnjggcdmjocbbbhaepdhchncahnbgone", "SponsorBlock for YouTube"},
            {"dnioaagdjgpcokckfpokpndoblenmfcg", "VOT — Voice Over Translation"},
            {"meojnmfhjkahlfcecpdcdgjclcilmaij", "All Fingerprint Defender"},
            {"bgnkhhnnamicmpeenaelnjfhikgbkllg", "AdGuard AdBlocker"},
            {"nngceckbapebfimnlniiiahkandclblb", "Bitwarden Password Manager"}
    };

    public interface Callback {
        void onResult(boolean success, String message);
    }

    private SBrowserXCrxInstaller() {}

    public static void installFromUri(Context context, Uri uri, Callback callback) {
        new Thread(() -> {
            try {
                byte[] raw;
                try (InputStream is = context.getContentResolver().openInputStream(uri)) {
                    if (is == null) throw new IllegalStateException("Cannot open selected file");
                    raw = readAll(is);
                }
                if (raw.length < 16) throw new IllegalArgumentException("File is too small");

                String extId;
                byte[] crxBytes;
                if (raw[0] == 'C' && raw[1] == 'r' && raw[2] == '2' && raw[3] == '4') {
                    extId = extractCrxId(raw);
                    crxBytes = raw;
                } else if (raw[0] == 'P' && raw[1] == 'K') {
                    byte[] normalizedZip = normalizeExtensionZip(raw);
                    CrxBuildResult built = buildSignedCrx3(normalizedZip);
                    extId = built.extId;
                    crxBytes = built.crxBytes;
                } else {
                    throw new IllegalArgumentException("Unsupported file format (expected .crx or .zip)");
                }

                File outFile = saveCrxToCache(context, extId, crxBytes);
                launchNativeInstall(extId, outFile.getAbsolutePath(), callback);
            } catch (Throwable t) {
                Log.e(TAG, "installFromUri failed", t);
                postResult(callback, false, t.getMessage() != null ? t.getMessage() : t.getClass().getSimpleName());
            }
        }).start();
    }

    public static void installFromChromeWebStore(Context context, List<String> extIds, Callback callback) {
        new Thread(() -> {
            int okCount = 0;
            String lastError = null;
            for (int i = 0; i < extIds.size(); i++) {
                String extId = extIds.get(i);
                try {
                    File outFile = downloadFromCwsToFile(context, extId);
                    boolean launched = launchNativeInstallSync(extId, outFile.getAbsolutePath());
                    if (launched) {
                        okCount++;
                        // Pace sequential installs slightly so Terrace's CRX installer doesn't drop overlapping requests
                        if (i + 1 < extIds.size()) {
                            try { Thread.sleep(650L); } catch (InterruptedException ignored) {}
                        }
                    } else {
                        lastError = SBrowserXStrings.get(SBrowserXStrings.EXT_ENGINE_NOT_READY);
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "Failed downloading/installing " + extId, t);
                    lastError = t.getMessage();
                }
            }
            if (okCount > 0) {
                postResult(callback, true, okCount + "/" + extIds.size());
            } else {
                postResult(callback, false, lastError != null ? lastError : "Installation failed");
            }
        }).start();
    }

    private static File downloadFromCwsToFile(Context context, String extId) throws Exception {
        String urlStr = CWS_CRX_URL + extId + "%26uc";
        HttpURLConnection conn = null;
        for (int redirect = 0; redirect < 6; redirect++) {
            URL url = new URL(urlStr);
            conn = (HttpURLConnection) url.openConnection();
            conn.setInstanceFollowRedirects(false);
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(60000);
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36");
            int code = conn.getResponseCode();
            if (code == 301 || code == 302 || code == 303 || code == 307 || code == 308) {
                String loc = conn.getHeaderField("Location");
                conn.disconnect();
                if (loc == null) throw new IllegalStateException("Empty redirect");
                urlStr = loc;
                continue;
            }
            if (code != 200) {
                conn.disconnect();
                throw new IllegalStateException("HTTP " + code + " for " + extId);
            }
            File dir = new File(context.getCacheDir(), "sbrowserx_crx");
            if (!dir.exists()) dir.mkdirs();
            File out = new File(dir, extId + ".crx");
            byte[] header = new byte[4];
            int headerRead = 0;
            try (InputStream is = conn.getInputStream();
                 FileOutputStream fos = new FileOutputStream(out)) {
                byte[] buf = new byte[16384];
                int n;
                while ((n = is.read(buf)) != -1) {
                    if (headerRead < 4) {
                        int toCopy = Math.min(4 - headerRead, n);
                        System.arraycopy(buf, 0, header, headerRead, toCopy);
                        headerRead += toCopy;
                    }
                    fos.write(buf, 0, n);
                }
            } finally {
                conn.disconnect();
            }
            if (headerRead < 4 || header[0] != 'C' || header[1] != 'r' || header[2] != '2' || header[3] != '4') {
                out.delete();
                throw new IllegalStateException("Invalid CRX payload for " + extId);
            }
            return out;
        }
        throw new IllegalStateException("Too many redirects for " + extId);
    }

    private static void launchNativeInstall(String extId, String filePath, Callback callback) {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                boolean ok = invokeTerraceInstall(extId, filePath);
                if (ok) {
                    callback.onResult(true, extId);
                } else {
                    callback.onResult(false, SBrowserXStrings.get(SBrowserXStrings.EXT_ENGINE_NOT_READY));
                }
            } catch (Throwable t) {
                Log.e(TAG, "launchNativeInstall failed", t);
                callback.onResult(false, t.getMessage());
            }
        });
    }

    private static boolean launchNativeInstallSync(String extId, String filePath) {
        final boolean[] res = new boolean[1];
        final Object lock = new Object();
        new Handler(Looper.getMainLooper()).post(() -> {
            synchronized (lock) {
                try {
                    res[0] = invokeTerraceInstall(extId, filePath);
                } catch (Throwable t) {
                    Log.e(TAG, "invokeTerraceInstall error", t);
                    res[0] = false;
                }
                lock.notifyAll();
            }
        });
        synchronized (lock) {
            try {
                lock.wait(8000);
            } catch (InterruptedException ignored) {}
        }
        return res[0];
    }

    private static boolean invokeTerraceInstall(String extId, String filePath) throws Exception {
        Class<?> loaderClass = Class.forName("com.sec.terrace.browser.extensions.TerraceExtensionsLoader");
        Object instance = loaderClass.getMethod("getInstance").invoke(null);
        Boolean initialized = (Boolean) loaderClass.getMethod("initialized").invoke(instance);
        if (initialized == null || !initialized) {
            return false;
        }
        Method launch = loaderClass.getMethod("launchInstallCrx", String.class, String.class);
        Boolean ok = (Boolean) launch.invoke(instance, extId, filePath);
        return ok != null && ok;
    }

    private static File saveCrxToCache(Context context, String extId, byte[] bytes) throws Exception {
        File dir = new File(context.getCacheDir(), "sbrowserx_crx");
        if (!dir.exists()) dir.mkdirs();
        File out = new File(dir, extId + ".crx");
        try (FileOutputStream fos = new FileOutputStream(out)) {
            fos.write(bytes);
        }
        return out;
    }

    private static String extractCrxId(byte[] crx) throws Exception {
        ByteBuffer bb = ByteBuffer.wrap(crx).order(ByteOrder.LITTLE_ENDIAN);
        bb.position(4);
        int version = bb.getInt();
        if (version == 2 && crx.length > 16) {
            int pubKeyLen = bb.getInt();
            bb.getInt();
            if (pubKeyLen > 0 && 16 + pubKeyLen <= crx.length) {
                byte[] pubKey = new byte[pubKeyLen];
                System.arraycopy(crx, 16, pubKey, 0, pubKeyLen);
                return sha256ToExtId(pubKey);
            }
        } else if (version == 3 && crx.length > 12) {
            int headerLen = bb.getInt();
            if (headerLen > 0 && 12 + headerLen <= crx.length) {
                byte[] crxIdBytes = parseCrx3IdFromHeader(crx, 12, headerLen);
                if (crxIdBytes != null && crxIdBytes.length == 16) {
                    return bytes16ToExtId(crxIdBytes);
                }
            }
        }
        return sha256ToExtId(crx);
    }

    private static byte[] parseCrx3IdFromHeader(byte[] data, int offset, int len) {
        int end = offset + len;
        int pos = offset;
        while (pos < end) {
            long[] tagRes = readVarint(data, pos, end);
            if (tagRes == null) break;
            long tag = tagRes[0];
            pos = (int) tagRes[1];
            int fieldNum = (int) (tag >>> 3);
            int wireType = (int) (tag & 0x7);
            if (wireType == 2) {
                long[] lenRes = readVarint(data, pos, end);
                if (lenRes == null) break;
                int fLen = (int) lenRes[0];
                pos = (int) lenRes[1];
                if (fieldNum == 10000 && pos + fLen <= end) {
                    return parseField1Bytes(data, pos, fLen);
                }
                pos += fLen;
            } else if (wireType == 0) {
                long[] skip = readVarint(data, pos, end);
                if (skip == null) break;
                pos = (int) skip[1];
            } else if (wireType == 1) {
                pos += 8;
            } else if (wireType == 5) {
                pos += 4;
            } else {
                break;
            }
        }
        return null;
    }

    private static byte[] parseField1Bytes(byte[] data, int offset, int len) {
        int end = offset + len;
        int pos = offset;
        while (pos < end) {
            long[] tagRes = readVarint(data, pos, end);
            if (tagRes == null) break;
            long tag = tagRes[0];
            pos = (int) tagRes[1];
            int fieldNum = (int) (tag >>> 3);
            int wireType = (int) (tag & 0x7);
            if (wireType == 2) {
                long[] lenRes = readVarint(data, pos, end);
                if (lenRes == null) break;
                int fLen = (int) lenRes[0];
                pos = (int) lenRes[1];
                if (fieldNum == 1 && fLen == 16 && pos + 16 <= end) {
                    byte[] out = new byte[16];
                    System.arraycopy(data, pos, out, 0, 16);
                    return out;
                }
                pos += fLen;
            } else {
                break;
            }
        }
        return null;
    }

    private static long[] readVarint(byte[] data, int pos, int end) {
        long result = 0;
        int shift = 0;
        while (pos < end && shift < 64) {
            int b = data[pos++] & 0xFF;
            result |= (long) (b & 0x7F) << shift;
            if ((b & 0x80) == 0) return new long[] {result, pos};
            shift += 7;
        }
        return null;
    }

    private static byte[] normalizeExtensionZip(byte[] zipBytes) throws Exception {
        String manifestPath = null;
        try (ZipInputStream zis = new ZipInputStream(new ByteArrayInputStream(zipBytes))) {
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                String name = entry.getName();
                if (!entry.isDirectory() && (name.equals("manifest.json") || name.endsWith("/manifest.json"))) {
                    if (manifestPath == null || name.length() < manifestPath.length()) {
                        manifestPath = name;
                    }
                }
            }
        }
        if (manifestPath == null) {
            throw new IllegalArgumentException("ZIP does not contain manifest.json");
        }
        if (manifestPath.equals("manifest.json")) {
            return zipBytes;
        }
        String prefix = manifestPath.substring(0, manifestPath.length() - "manifest.json".length());
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        try (ZipInputStream zis = new ZipInputStream(new ByteArrayInputStream(zipBytes));
             ZipOutputStream zos = new ZipOutputStream(bos)) {
            ZipEntry entry;
            byte[] buf = new byte[8192];
            while ((entry = zis.getNextEntry()) != null) {
                String name = entry.getName();
                if (!name.startsWith(prefix)) continue;
                String stripped = name.substring(prefix.length());
                if (stripped.isEmpty()) continue;
                ZipEntry outEntry = new ZipEntry(stripped);
                zos.putNextEntry(outEntry);
                if (!entry.isDirectory()) {
                    int n;
                    while ((n = zis.read(buf)) != -1) {
                        zos.write(buf, 0, n);
                    }
                }
                zos.closeEntry();
            }
        }
        return bos.toByteArray();
    }

    private static final class CrxBuildResult {
        final String extId;
        final byte[] crxBytes;
        CrxBuildResult(String extId, byte[] crxBytes) {
            this.extId = extId;
            this.crxBytes = crxBytes;
        }
    }

    private static CrxBuildResult buildSignedCrx3(byte[] zipBytes) throws Exception {
        KeyPairGenerator kpg = KeyPairGenerator.getInstance("RSA");
        kpg.initialize(2048);
        KeyPair kp = kpg.generateKeyPair();
        byte[] pubKey = kp.getPublic().getEncoded();

        byte[] sha256 = MessageDigest.getInstance("SHA-256").digest(pubKey);
        byte[] crxId16 = new byte[16];
        System.arraycopy(sha256, 0, crxId16, 0, 16);
        String extId = bytes16ToExtId(crxId16);

        byte[] signedHeaderData = pbBytesField(1, crxId16);

        Signature sig = Signature.getInstance("SHA256withRSA");
        sig.initSign(kp.getPrivate());
        sig.update("CRX3 SignedData\u0000".getBytes(StandardCharsets.US_ASCII));
        byte[] lenLe = ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(signedHeaderData.length).array();
        sig.update(lenLe);
        sig.update(signedHeaderData);
        sig.update(zipBytes);
        byte[] sigBytes = sig.sign();

        ByteArrayOutputStream proof = new ByteArrayOutputStream();
        proof.write(pbBytesField(1, pubKey));
        proof.write(pbBytesField(2, sigBytes));

        ByteArrayOutputStream header = new ByteArrayOutputStream();
        header.write(pbBytesField(2, proof.toByteArray()));
        header.write(pbBytesField(10000, signedHeaderData));
        byte[] headerBytes = header.toByteArray();

        ByteArrayOutputStream crx = new ByteArrayOutputStream(12 + headerBytes.length + zipBytes.length);
        crx.write(new byte[] {'C', 'r', '2', '4'});
        crx.write(ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(3).array());
        crx.write(ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(headerBytes.length).array());
        crx.write(headerBytes);
        crx.write(zipBytes);
        return new CrxBuildResult(extId, crx.toByteArray());
    }

    private static byte[] pbBytesField(int fieldNum, byte[] payload) {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        writeVarint(bos, ((long) fieldNum << 3) | 2L);
        writeVarint(bos, payload.length);
        bos.write(payload, 0, payload.length);
        return bos.toByteArray();
    }

    private static void writeVarint(ByteArrayOutputStream bos, long value) {
        long v = value;
        while ((v & ~0x7FL) != 0) {
            bos.write((int) ((v & 0x7F) | 0x80));
            v >>>= 7;
        }
        bos.write((int) v);
    }

    private static String sha256ToExtId(byte[] input) throws Exception {
        byte[] sha = MessageDigest.getInstance("SHA-256").digest(input);
        byte[] first16 = new byte[16];
        System.arraycopy(sha, 0, first16, 0, 16);
        return bytes16ToExtId(first16);
    }

    private static String bytes16ToExtId(byte[] bytes16) {
        StringBuilder sb = new StringBuilder(32);
        for (byte b : bytes16) {
            int hi = (b >>> 4) & 0x0F;
            int lo = b & 0x0F;
            sb.append((char) ('a' + hi));
            sb.append((char) ('a' + lo));
        }
        return sb.toString();
    }

    private static byte[] readAll(InputStream is) throws Exception {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        byte[] buf = new byte[16384];
        int n;
        while ((n = is.read(buf)) != -1) {
            bos.write(buf, 0, n);
        }
        return bos.toByteArray();
    }

    private static void postResult(Callback cb, boolean ok, String msg) {
        new Handler(Looper.getMainLooper()).post(() -> cb.onResult(ok, msg));
    }
}
