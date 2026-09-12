package com.zeldrisho.patches.zalo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /** Zalo 26.08.01 (versionCode 260801903, APKMirror arm64-v8a) fingerprint target.
     * Obfuscated members (Lvx/s2, Ljt classes, synthetic A6) are pinned to this exact
     * version; re-verify smali per update. See analysis/zalo-26.08.01/notes/. */
    const val TESTED_ZALO_VERSION_CODE = 260801903

    val COMPATIBILITY_ZALO = Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(
            AppTarget(
                version = "26.08.01",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to TESTED_ZALO_VERSION_CODE),
                minSdk = 24,
            ),
        ),
    )
}
