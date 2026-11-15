/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patches.all.misc.extension.ExtensionHook

internal val twitterInitHook = ExtensionHook(
    // Matches obfuscated Activity in Lcom/snap.stuffing/api/exopackage
    //
    // Could add a second extension hook for the manifest main activity,
    // or use only the main activity as the only hook:
    // Lcom/x/android/main/MainActivity;
    fingerprint = Fingerprint(
        superclass = "Landroid/app/Application;",
        name = "onCreate"
    )
)
