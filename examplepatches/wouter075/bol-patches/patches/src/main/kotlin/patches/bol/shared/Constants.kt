package patches.bol.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_BOL = Compatibility(
        name = "bol",
        packageName = "com.bol.shop",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x0000A4,
        signatures = setOf(
            "d33783d8b827ba6d59f8937a9f4081e19baba769effdfb5beef72b70166a2ae3"
        ),
        targets = listOf(
            AppTarget(
                version = "2026.22.1",
                minSdk = 29
            )
        )
    )
}
