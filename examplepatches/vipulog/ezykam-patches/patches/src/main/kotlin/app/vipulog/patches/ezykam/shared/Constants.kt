package app.vipulog.patches.ezykam.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Compatibility configuration for CP ezyKam+ version 4.1.4.
     *
     * - Package: `com.cpplusworld.ezykamp`
     * - File format: Single APK
     * - Launcher brand accent color: Red (`0xF02020`)
     */
    val COMPATIBILITY_EZYKAM_4_1_4 = Compatibility(
        name = "CP ezyKam+",
        packageName = "com.cpplusworld.ezykamp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF02020,
        targets = listOf(
            AppTarget(version = "4.1.4"),
        ),
    )
}
