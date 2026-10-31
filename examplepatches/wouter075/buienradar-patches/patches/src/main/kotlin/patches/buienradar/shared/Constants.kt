package patches.buienradar.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_BUIENRADAR = Compatibility(
        name = "Buienradar",
        packageName = "com.supportware.Buienradar",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x243C88,
        signatures = setOf(
            "4392d8f67eedd4d2c52370e69911df3ad465d6d6f7d7176cd5f2b4bdefcca9cc"
        ),
        targets = listOf(
            AppTarget(
                version = "7.4.8",
                minSdk = 32
            )
        )
    )
}
