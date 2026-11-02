/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patches.all.misc.extension.ExtensionHook

internal val twitterInitHook =
    ExtensionHook(
        fingerprint =
            Fingerprint(
                name = "onCreate",
                custom = { _, classDef ->
                    classDef.superclass!!.contains("Landroid/app/Application;")
                },
            ),
    )
