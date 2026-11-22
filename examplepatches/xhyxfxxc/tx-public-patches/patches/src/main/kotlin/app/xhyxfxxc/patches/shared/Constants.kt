package app.xhyxfxxc.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SEND_ANYWHERE = Compatibility(
        name = "Send Anywhere",
        packageName = "com.estmob.android.sendanywhere",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xE53935,
        targets = listOf(
            AppTarget(version = "23.3.3")
        )
    )
}
