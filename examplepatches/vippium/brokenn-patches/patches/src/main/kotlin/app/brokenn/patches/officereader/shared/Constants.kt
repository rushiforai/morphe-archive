package app.brokenn.patches.officereader.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_OFFICEREADER = Compatibility(
        name = "Office Reader",
        packageName = "net.sjava.officereader",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(version = "5.0.4")
        )
    )
}
