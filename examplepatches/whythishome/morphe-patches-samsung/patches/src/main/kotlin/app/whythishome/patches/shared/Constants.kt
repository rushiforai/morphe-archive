package app.whythishome.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SHEALTH = Compatibility(
        name = "Samsung Health",
        packageName = "com.sec.android.app.shealth",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1DC9A0,
        targets = listOf(AppTarget(version = "7.00.6.011")),
    )
}
