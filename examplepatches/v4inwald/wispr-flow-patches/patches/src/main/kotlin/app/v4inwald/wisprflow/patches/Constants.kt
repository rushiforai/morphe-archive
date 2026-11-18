/*
 * Copyright (C) 2026 V4inwald
 *
 * This file is part of wispr-flow-patches, GPL-3.0.
 */

package app.v4inwald.wisprflow.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** What both patches declare: one app, one version, one input format. */
internal object Constants {
    val COMPATIBILITY_WISPR_FLOW = Compatibility(
        name = "Wispr Flow",
        packageName = "com.wispr.flowapp",
        description = "Dictation app that inserts text with an accessibility service.",
        // The input is the XAPK the app is distributed as: its base APK declares
        // android:requiredSplitTypes and cannot be installed alone.
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1F1F1F,
        signatures = setOf("0f0f93d294c479ccd0ddce1bad232af5640c1faaa468612869c2208d7714c432"),
        targets = listOf(AppTarget(version = "2.8.7", minSdk = 33)),
    )
}
