package dev.vortexnode.sbrowserx.extension;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;

public final class SBrowserXWebRtcManager {
    private static final String TAG = "SBrowserXProfilePrefs";

    private SBrowserXWebRtcManager() {}

    public static void applyToProfile(Context context) {
        if (context == null) return;
        try {
            String policy = SBrowserXPrefs.getWebRtcPolicy(context);
            boolean antiFingerprint = SBrowserXPrefs.isFingerprintProtectionEnabled(context);
            boolean allowNonProxiedUdp = !SBrowserXPrefs.WEBRTC_DISABLE_NON_PROXIED_UDP.equals(policy);

            File sbrowserDir = context.getDir("sbrowser", Context.MODE_PRIVATE);
            File defaultDir = new File(sbrowserDir, "Default");
            if (!defaultDir.exists()) {
                defaultDir.mkdirs();
            }
            File prefsFile = new File(defaultDir, "Preferences");
            JSONObject root;
            if (prefsFile.isFile()) {
                long len = prefsFile.length();
                if (len == 0) {
                    // Never clobber an in-flight/empty Preferences file during a fast restart
                    Log.w(TAG, "Preferences file is 0 bytes; skipping write to avoid wiping extensions");
                    return;
                }
                String text = readUtf8(prefsFile);
                if (!text.trim().startsWith("{")) {
                    Log.w(TAG, "Preferences file does not look like JSON; skipping write");
                    return;
                }
                root = new JSONObject(text);

                // Dirty-check: if Preferences already has our exact values, DO NOT rewrite the file!
                JSONObject existingWebrtc = root.optJSONObject("webrtc");
                if (existingWebrtc != null
                        && policy.equals(existingWebrtc.optString("ip_handling_policy", ""))
                        && existingWebrtc.has("nonproxied_udp_enabled")
                        && existingWebrtc.optBoolean("nonproxied_udp_enabled") == allowNonProxiedUdp
                        && root.has("enable_block_fingerprinting")
                        && root.optBoolean("enable_block_fingerprinting") == antiFingerprint) {
                    return;
                }
            } else {
                root = new JSONObject();
            }

            JSONObject webrtc = root.optJSONObject("webrtc");
            if (webrtc == null) {
                webrtc = new JSONObject();
                root.put("webrtc", webrtc);
            }
            webrtc.put("ip_handling_policy", policy);
            webrtc.put("nonproxied_udp_enabled", allowNonProxiedUdp);
            root.put("enable_block_fingerprinting", antiFingerprint);

            File tmpFile = new File(defaultDir, "Preferences.sbrowserx.tmp");
            writeUtf8(tmpFile, root.toString());
            if (!tmpFile.renameTo(prefsFile)) {
                writeUtf8(prefsFile, root.toString());
                tmpFile.delete();
            }
            Log.i(TAG, "Applied WebRTC=" + policy + ", antiFingerprint=" + antiFingerprint);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to apply profile prefs", t);
        }
    }

    public static void restartBrowser(Context context) {
        if (context == null) return;
        try {
            Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
            if (launch != null) {
                launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                context.startActivity(launch);
            }
        } catch (Throwable t) {
            Log.e(TAG, "restartBrowser failed", t);
        }
        android.os.Process.killProcess(android.os.Process.myPid());
    }

    private static String readUtf8(File file) throws Exception {
        try (FileInputStream fis = new FileInputStream(file);
             ByteArrayOutputStream bos = new ByteArrayOutputStream()) {
            byte[] buf = new byte[8192];
            int n;
            while ((n = fis.read(buf)) != -1) {
                bos.write(buf, 0, n);
            }
            return bos.toString("UTF-8");
        }
    }

    private static void writeUtf8(File file, String content) throws Exception {
        try (FileOutputStream fos = new FileOutputStream(file)) {
            fos.write(content.getBytes(StandardCharsets.UTF_8));
            fos.getFD().sync();
        }
    }
}
