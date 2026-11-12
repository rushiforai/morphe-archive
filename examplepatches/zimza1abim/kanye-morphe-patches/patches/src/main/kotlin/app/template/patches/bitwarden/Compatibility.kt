package app.template.patches.bitwarden

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** Bitwarden Password Manager releases (GitHub com.x8bit.bitwarden.apk) the patches were verified against. */
internal val BITWARDEN_VERSIONS = listOf(
    "2026.10.1",
)

internal val BITWARDEN_COMPATIBILITY = Compatibility(
    name = "Bitwarden",
    packageName = "com.x8bit.bitwarden",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x175DDC,
    targets = BITWARDEN_VERSIONS.map { AppTarget(version = it) },
)
