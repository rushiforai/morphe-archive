package app.template.patches.orca

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Orca releases the patch was verified against. Discovery stays structural;
 * .github/workflows/compat-check.yml appends new versions through a pull request.
 */
internal val ORCA_VERSIONS = listOf(
    "0.0.68",
)

internal val ORCA_COMPATIBILITY = Compatibility(
    packageName = "dev.orca.app",
    name = "Orca",
    apkFileType = ApkFileType.APK,
    targets = ORCA_VERSIONS.map { AppTarget(version = it) },
)
