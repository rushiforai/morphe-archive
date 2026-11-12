package app.template.patches.notesnook

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val NOTESNOOK_PACKAGE_NAME = "com.streetwriters.notesnook"

/**
 * Notesnook releases whose APK passed the compat check (scripts/compat).
 * .github/workflows/compat-check.yml appends new versions through a pull request.
 */
internal val NOTESNOOK_VERSIONS = listOf(
    "3.4.14",
    "3.4.15",
)

internal val NOTESNOOK_COMPATIBILITY = Compatibility(
    name = "Notesnook",
    packageName = NOTESNOOK_PACKAGE_NAME,
    apkFileType = ApkFileType.APK,
    targets = NOTESNOOK_VERSIONS.map { AppTarget(version = it) },
)
