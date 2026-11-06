/*
 * Copyright (C) 2026 tsuchinoko <https://github.com/voznyiarsen/bakalari-morphe>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.tsuchinoko.patches.all.misc.ads

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi.ARM64_V8A

object Constants {
    val COMPATIBILITY_BAKALARI =
        Compatibility(
            name = "Bakal\u00e1\u0159i OnLine",
            packageName = "cz.bakalari.mobile",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFF0033,
            targets =
                listOf(
                    AppTarget(
                        version = "4.2.0",
                        versionCodes = null,
                    ),
                    AppTarget(
                        version = "4.3.0",
                        versionCodes = null,
                    ),
                    AppTarget(
                        version = "4.3.1",
                        versionCodes = null,
                    ),
                    AppTarget(
                        version = "4.3.2",
                        versionCodes = null,
                    ),
                ),
        )
}
