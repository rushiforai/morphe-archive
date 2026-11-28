package app.gboardnet.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val GBOARD_PACKAGE = "com.google.android.inputmethod.latin"

    val COMPATIBILITY_GBOARD = Compatibility(
        name = "Gboard",
        packageName = GBOARD_PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        // Google's Gboard signing certificates (v3.0 signer, and the rotated v3.1 signer).
        signatures = setOf(
            "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83",
            "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053",
        ),
        targets = listOf(
            // Version the patch was developed and tested against (APKMirror arm64-v8a nodpi APK, Nov 2026).
            // Gboard's version name includes the ABI suffix.
            AppTarget(version = "18.6.10.1002251336-release-arm64-v8a"),
            // The patch hooks framework / Cronet APIs, not obfuscated Gboard code,
            // so other versions are expected to work too.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
