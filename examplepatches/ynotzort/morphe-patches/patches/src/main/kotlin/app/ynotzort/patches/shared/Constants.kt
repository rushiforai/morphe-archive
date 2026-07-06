package app.ynotzort.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TARGO = Compatibility(
        name = "TARGOBANK",
        packageName = "com.targo_prod.bad",
        // Split APK: base + split_config.arm64_v8a + split_config.xxhdpi
        apkFileType = ApkFileType.APKS,
        // SHA-256 of the original Play-signed cert (apksigner verify --print-certs).
        signatures = setOf(
            "543468cf37c5536717b8950168f7990e7d5bc61ea8dc5b39d8d4ff249f892a4c",
        ),
        targets = listOf(
            AppTarget(version = "V12.68.1"),
        ),
    )
}
