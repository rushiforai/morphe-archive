package app.template.patches.idm

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object IdmConstants {
    val COMPATIBILITY_IDM = Compatibility(
        name = "IDM - Internet Download Manager",
        packageName = "idm.internet.download.manager",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(
                version = "18.2"
            )
        )
    )
}
