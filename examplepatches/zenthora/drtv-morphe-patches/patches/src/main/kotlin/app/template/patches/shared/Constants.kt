package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY_DRTV = Compatibility(
        name = "DRTV",
        packageName = "dk.dr.tvplayer",
        description = "DRTV Android TV streaming app by Danmarks Radio.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x121212,
        signatures = setOf("0f5de4c316dc42f22ed62dd9b442b19902005e005c169cf146180a03998d3743"),
        formFactor = FormFactor.TV,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true,
            ),
            AppTarget(
                version = "4.39.0",
            ),
        ),
    )
}
