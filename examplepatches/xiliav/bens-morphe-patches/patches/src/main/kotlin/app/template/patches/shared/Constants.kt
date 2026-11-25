package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val TRANSIT_COMPATIBILITY = Compatibility(
        name = "Transit",
        packageName = "com.thetransitapp.droid",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00B2A9,
        targets = listOf(
            AppTarget(version = "6.3.7", versionCode = 5128316, minSdk = 32)
        )
    )

    val CITIZEN_COMPATIBILITY = Compatibility(
        name = "Citizen",
        packageName = "sp0n.citizen",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0066FF,
        targets = listOf(
            AppTarget(version = "0.1320.0", versionCode = 1153)
        )
    )
}
