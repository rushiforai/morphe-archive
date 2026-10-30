package com.irzak.patches.instagram.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Instagram (com.instagram.android).
     *
     * Confirmed against 453.0.0.57.79 (versionCode 385914546) pulled from a device: a
     * split install (base.apk + split_config.xxhdpi + several ABI/feature splits:
     * executorch, heliumcore, heliumiab, pytorch, spm), so the set is ingested as APKS.
     *
     * Instagram ships a new build roughly every 1-2 weeks and heavily obfuscates its
     * bytecode, so fingerprints are expected to drift. Patches anchor on stable strings
     * and structural shape rather than minified class/method names, and the version-watch
     * workflow (.github/workflows/instagram-version-watch.yml) flags new releases so the
     * pinned target below can be re-validated and bumped promptly.
     *
     * Distributed through Google Play only, so the exact build is obtained from a device:
     *   adb shell pm path com.instagram.android && adb pull <each path>
     */
    val COMPATIBILITY_INSTAGRAM = Compatibility(
        name = "Instagram",
        packageName = "com.instagram.android",
        apkFileType = ApkFileType.APKS,
        // Instagram brand magenta; approximate (the real icon is a gradient).
        appIconColor = 0xE1306C,
        targets = listOf(
            // The version these patches are developed against (versionCode 385914546).
            AppTarget(
                version = "453.0.0.57.79",
            ),
            // Newer builds are allowed but flagged experimental until re-validated.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
