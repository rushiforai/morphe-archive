package app.warreth.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * ScreenZen is distributed as a split APK bundle (base + config splits),
     * which is what APKPure ships as an XAPK.
     */
    val COMPATIBILITY_SCREENZEN = Compatibility(
        name = "ScreenZen",
        packageName = "com.screenzen",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x10133C,
        targets = listOf(
            // Version this patch was developed and verified against.
            AppTarget(
                version = "2.9.4"
            )
        )
    )
}
