/*
 * Copyright 2026 warleysr.
 * https://github.com/warleysr/reddit-nsfw-blocker
 *
 * Based on Morphe Patches, Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package io.github.warleysr.nsfwblocker.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_REDDIT = Compatibility(
        name = "Reddit",
        packageName = "com.reddit.frontpage",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4500,
        signatures = setOf(
            "970b91143813b4c9d5f3634f672c9fcaa5621b4efaaedafd6c235cbbb869736f"
        ),
        targets = listOf(
            AppTarget(
                version = "2026.39.0",
                minSdk = 29
            )
        )
    )
}
