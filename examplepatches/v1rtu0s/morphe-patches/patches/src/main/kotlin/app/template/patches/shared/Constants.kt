package app.blitzermorph.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /**
     * Google Maps compatibility for the BlitzerMorph patch.
     * Injects live mobile speed cameras from Blitzer.de (Atudo API) into Google Maps.
     */
    val COMPATIBILITY_MICROG_MAPS = Compatibility(
            name = "microG Maps",
            packageName = "org.ungoogled.ui",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0x1A73E8,
            targets = listOf(
                AppTarget(version = "26.36.04.973607363")
            )
        )
}