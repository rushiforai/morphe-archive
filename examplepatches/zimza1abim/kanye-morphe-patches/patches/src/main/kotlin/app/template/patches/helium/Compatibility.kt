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
    "157.0.8103.78",
    "158.0.8127.42",
    "158.0.8127.92",
)

internal fun titaniumCompatibility() = Compatibility(
    name = "Titanium Browser",
    packageName = TITANIUM_PACKAGE_NAME,
    apkFileType = ApkFileType.APK,
    targets = TITANIUM_VERSIONS.map { AppTarget(version = it) },
)
