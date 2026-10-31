package app.blitzermorph.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /**
     * Google Maps compatibility for the BlitzerMorph patch.
     * Targets the same version as bearinmind patches (26.36.04.973607363)
     * so both patch sets can be applied simultaneously to stock Google Maps.
     */
    val COMPATIBILITY_GOOGLE_MAPS = Compatibility(
        name = "Google Maps",
        packageName = "com.google.android.apps.maps",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "26.36.04.973607363")
        )
    )
}