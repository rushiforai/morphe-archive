package app.template.patches.helium

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val TITANIUM_PACKAGE_NAME = "io.github.jqssun.helium"

/**
 * Titanium releases whose APK passed the compat check (scripts/compat).
 * .github/workflows/compat-check.yml appends new versions through a pull request.
 */
internal val TITANIUM_VERSIONS = listOf(
    "155.0.8059.79",
    "156.0.8078.47",
    "156.0.8078.73",
    "156.0.8078.79",
    "157.0.8103.38",
    "157.0.8103.50",
    "157.0.8103.78",
)

internal fun titaniumCompatibility() = Compatibility(
    name = "Titanium Browser",
    packageName = TITANIUM_PACKAGE_NAME,
    apkFileType = ApkFileType.APK,
    targets = TITANIUM_VERSIONS.map { AppTarget(version = it) },
)
