package com.irzak.patches.toyota.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Toyota (MyToyota / "One App").
     *
     * Confirmed against com.toyota.oneapp 3.6.0 (versionCode 222) pulled from a device:
     * a split install (base.apk + split_config.arm64_v8a + split_config.xxhdpi), 11 dex
     * files, Flutter embedding. The client side security logic this source patches lives
     * entirely in base.apk, so the split set is ingested as APKS.
     *
     * The app is distributed through Google Play only (no apkmirror/uptodown), so the
     * practical way to obtain this exact build is to pull it off a device:
     *   adb shell pm path com.toyota.oneapp && adb pull <each path>
     */
    val COMPATIBILITY_TOYOTA = Compatibility(
        name = "Toyota",
        packageName = "com.toyota.oneapp",
        apkFileType = ApkFileType.APKS,
        // Toyota red; adjust to the exact launcher icon background if needed.
        appIconColor = 0xEB0A1E,
        targets = listOf(
            // The version these patches are developed against (versionCode 222).
            AppTarget(
                version = "3.6.0",
            ),
            // Newer builds are expected to work while the security verdict keeps its
            // shape (a single class aggregating the detectors behind vs/b).
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
