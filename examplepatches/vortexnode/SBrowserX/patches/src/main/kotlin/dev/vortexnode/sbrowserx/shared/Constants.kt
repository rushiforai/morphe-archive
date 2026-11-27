package dev.vortexnode.sbrowserx.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
    const val SBROWSER_PACKAGE_NAME = "com.sec.android.app.sbrowser"
    const val SBROWSER_DEFAULT_PATCHED_PACKAGE_NAME = "sbrowserx.com.sec.android.app.sbrowser"
    const val SBROWSER_DEFAULT_APP_NAME = "SBrowserX"
    const val SBROWSER_TARGET_VERSION = "31.0.2.41"
    const val SBROWSER_OFFICIAL_SIGNATURE =
        "34df0e7a9f1cf1892e45c056b4973cd81ccf148a4050d11aea4ac5a65f900a42"

    const val BITWARDEN_PACKAGE_NAME = "com.x8bit.bitwarden"

    val COMPATIBILITY_SBROWSER = Compatibility(
        name = "Samsung Internet",
        packageName = SBROWSER_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x6250FF,
        signatures = setOf(SBROWSER_OFFICIAL_SIGNATURE),
        targets = listOf(
            AppTarget(
                version = SBROWSER_TARGET_VERSION,
                isExperimental = false,
            ),
        ),
    )

    val COMPATIBILITY_BITWARDEN = Compatibility(
        name = "Bitwarden",
        packageName = BITWARDEN_PACKAGE_NAME,
        appIconColor = 0x175DDC,
    )
}
