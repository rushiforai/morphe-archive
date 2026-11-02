/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.settings

import app.rex.patches.twitter.utils.is_11_82_or_greater
import app.rex.patches.twitter.utils.versionCheckPatch
import app.morphe.patcher.patch.bytecodePatch

internal val checkCompatibilityPatch = bytecodePatch(
    description = "Checks compatibility"
) {
    dependsOn(versionCheckPatch)

    execute {
        if (!is_11_82_or_greater) {
            return@execute
        }

        ApplicationFingerprint.matchOrNull()?.let {
            throw RuntimeException(
                "\n\n#####################################\n\n" +
                        "Unsupported APK is used." +
                        "\n\nPlease use a ripped APK or a compatibility shim layer patch.\n\n" +
                        "#####################################\n\n"
            )
        }
    }
}
