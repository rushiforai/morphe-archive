package app.rutube.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * RuTube.
     *
     * Confirmed against ru.rutube.app 31.14.2-rustore pulled from a device:
     * a single base.apk (no splits), 6 dex files, no Flutter/React Native.
     */
    val COMPATIBILITY_RUTUBE = Compatibility(
        name = "RuTube",
        packageName = "ru.rutube.app",
        apkFileType = ApkFileType.APK,
        // Approximate RUTUBE brand violet; adjust to the exact launcher icon background.
        appIconColor = 0x7B2FF7,
        targets = listOf(
            // The version these patches are developed against. Note RuTube is not on
            // apkmirror.com or uptodown.com and the site only links app stores, so the
            // practical way to obtain this exact apk is to install from RuStore and pull
            // it off the device:
            //   adb shell pm path ru.rutube.app && adb pull <path>
            AppTarget(
                version = "31.14.2-rustore",
            ),
            // Newer builds are expected to work while the ad SDK keeps its shape.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
