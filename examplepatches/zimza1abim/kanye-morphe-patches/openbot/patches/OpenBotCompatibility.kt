package app.template.patches.openbot

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * OpenBot releases the patch was verified against. The adapter set under
 * openbot/resources/openbot/adapters is selected by the embedded bundle's hash, so a
 * version added here works without touching the patch code.
 * .github/workflows/compat-check.yml appends new versions through a pull request and
 * scripts/compat/prune_versions.py keeps the three newest.
 */
internal val OPENBOT_VERSIONS = listOf(
    "1.4.13",
)

internal val OPENBOT_COMPATIBILITY = Compatibility(
    name = "OpenBot",
    packageName = "run.openbot.mobile",
    apkFileType = ApkFileType.APK,
    targets = OPENBOT_VERSIONS.map { AppTarget(version = it) },
)
