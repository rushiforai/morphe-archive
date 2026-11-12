package app.template.patches.anytype

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Anytype releases the patch was verified against. Discovery stays structural;
 * .github/workflows/compat-check.yml appends new versions through a pull request.
 */
internal val ANYTYPE_VERSIONS = listOf(
    "0.48.10",
    "0.49.0",
    "0.50.4",
)

internal val ANYTYPE_COMPATIBILITY = Compatibility(
    packageName = "io.anytype.app",
    name = "Anytype",
    apkFileType = ApkFileType.APK,
    targets = ANYTYPE_VERSIONS.map { AppTarget(version = it) },
)
