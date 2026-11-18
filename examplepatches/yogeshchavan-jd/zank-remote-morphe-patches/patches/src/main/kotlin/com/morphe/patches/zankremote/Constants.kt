package com.morphe.patches.zankremote

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_ZANK_REMOTE = Compatibility(
        name = "Zank Remote",
        packageName = "zank.remote",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(
                version = "21.0.7",
                minSdk = 29
            )
        )
    )
}
