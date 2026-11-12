package app.template.patches.brave

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val BRAVE_PACKAGE_NAME = "com.brave.browser"

/**
 * Stable Brave releases whose APK passed the compat check (scripts/compat).
 * .github/workflows/compat-check.yml appends new versions through a pull request.
 */
internal val BRAVE_VERSIONS = listOf(
    "1.97.57",
    "1.98.58",
    "1.98.59",
    "1.98.60",
    "1.98.62",
    "1.98.63",
    "1.99.55",
)

internal fun braveCompatibility() = Compatibility(
    name = "Brave Browser",
    packageName = BRAVE_PACKAGE_NAME,
    apkFileType = ApkFileType.APK,
    targets = BRAVE_VERSIONS.map { AppTarget(version = it) },
)
