package app.waylo.patches.podcastaddict

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_PODCAST_ADDICT = Compatibility(
        name = "Podcast Addict",
        packageName = "com.bambuna.podcastaddict",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF4511E,
        targets = listOf(
            // Versions the patch has been tested against. Newest first, so Morphe suggests it.
            AppTarget(
                version = "2026.14" // build 21833
            ),
            AppTarget(
                version = "2026.7" // build 21719
            ),
            // The fingerprints avoid obfuscated names, so later versions are expected to work.
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
