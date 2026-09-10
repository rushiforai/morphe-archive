package io.github.yannsoliman.patches.keepcool

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val KEEPCOOL_COMPATIBILITY = Compatibility(
    name = "Keepcool",
    packageName = "fr.keepcool.memberapp",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = "1.8.21"))
)
