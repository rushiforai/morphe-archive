package app.template.patches.bare

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val BARE_PACKAGE_NAME = "org.barebrowser"

/**
 * Stable Bare releases whose APK passed the compat check (scripts/compat).
 * .github/workflows/compat-check.yml appends new versions through a pull request.
 */
internal val BARE_VERSIONS = listOf(
    "2.0.5",
    "2.0.7",
    "2.0.8",
)

internal fun bareCompatibility() = Compatibility(
    name = "Bare Browser",
    packageName = BARE_PACKAGE_NAME,
    apkFileType = ApkFileType.APK,
    targets = BARE_VERSIONS.map { AppTarget(version = it) },
)
