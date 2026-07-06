package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Yandex Navigator — `ru.yandex.yandexnavi`, Play split bundle (`.apks`).
 *
 * SHA-256 signing cert from `apksigner verify --print-certs` on official `base.apk` (OOO Yandex).
 */
object Constants {
    val COMPATIBILITY_YANDEX_NAVIGATOR = Compatibility(
        name = "Yandex Navigator",
        packageName = "ru.yandex.yandexnavi",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0xFFFC3F,
        signatures = setOf(
            "aca405ded8b25cb2e8c6da69425d2b4307d087c1276fc06ad5942731ccc51dba",
        ),
        targets = listOf(
            AppTarget(
                version = "28.6.5",
                minSdk = 26,
                description = "Fingerprinted against base.apk DEX (739172520).",
            ),
        ),
    )
}
