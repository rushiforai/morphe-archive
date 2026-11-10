package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_MetService = Compatibility(
        name = "MetService", // App name as it appears in the Android launcher.
        packageName = "com.metservice.kryten",
        apkFileType = ApkFileType.APK, // Preferred or recommended file type.
        appIconColor = 0xFF0045, // Icon color in Morphe Manager. Usually the same color as the icon background.
        targets = listOf(
            // "version = null" means the patch works with the latest app target
            // and is expected to work with all future app targets.
            //
            // It is highly recommended to always include the exact app version you used to develop
            // your patches so users have a version 100% confirmed as working.
            //
            // It is highly preferred to use app versions that are
            // available on apkmirror.com or uptodown.com, as Morphe web-search will
            // redirect users to these sites. If an app version is not available
            // on ApkMirror or UpToDown, then the user is sent to Google search. 
            AppTarget(
                version = "2.35.1"
            ), 
            AppTarget(
                version = "2.35.0"
            ), 
            AppTarget(
                version = "2.34.1"
            ), 
            AppTarget(
                version = "2.33.0"
            )
        )
    )

    val COMPATIBILITY_Stellarium = Compatibility(
        name = "Stellarium", // App name as it appears in the Android launcher.
        packageName = "com.noctuasoftware.stellarium_free",
        apkFileType = ApkFileType.XAPK, // Preferred or recommended file type.
        appIconColor = 0x0B1D3A, // Icon color in Morphe Manager. Usually the same color as the icon background.
        targets = listOf(
            // The patch finds the native license checks by symbol name and verifies what
            // they do instead of matching their bytes, so it keeps working with releases
            // that were not built for. Every release whose library was inspected and
            // patched is listed here as a target of its own, in both builds where
            // APKPure published both: 1.16.7 and 1.16.8 ship an arm64-v8a and an
            // armeabi-v7a XAPK under the same version code, 1.16.5 was published for
            // armeabi-v7a and 1.16.3 for arm64-v8a only. The patch rewrites whichever
            // library the XAPK holds, and every copy if it holds more than one.
            //
            // Releases after 1.16.8 are not listed. Pinning the releases that were
            // tested keeps the manager's "Unsupported Version" dialog in the way for
            // the ones that were not, instead of promising support that was never
            // verified. Add each release that was tested as a target of its own.
            AppTarget(
                version = "1.16.8",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 11205,
                    SupportedAbi.ARMEABI_V7A to 11205
                )
            ),
            AppTarget(
                version = "1.16.7",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 11204,
                    SupportedAbi.ARMEABI_V7A to 11204
                )
            ),
            AppTarget(
                version = "1.16.5",
                versionCodes = mapOf(SupportedAbi.ARMEABI_V7A to 11202)
            ),
            AppTarget(
                version = "1.16.3",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 11200)
            )
        )
    )
}
