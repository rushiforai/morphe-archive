package app.template.patches.adm

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object AdmConstants {
    val COMPATIBILITY_ADM = Compatibility(
        name = "Advanced Download Manager",
        packageName = "com.dv.adm",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1976D2,
        targets = listOf(
            AppTarget(
                version = "14.0.43"
            )
        )
    )
}
