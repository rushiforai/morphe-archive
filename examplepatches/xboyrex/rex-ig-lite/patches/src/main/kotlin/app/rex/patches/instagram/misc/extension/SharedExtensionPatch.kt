/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
*/

package app.rex.patches.instagram.misc.extension

import app.rex.patches.instagram.misc.extension.hooks.instagramInitHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch

val sharedExtensionPatch =
    sharedExtensionPatch(
        listOf("shared", "instagram"),
        instagramInitHook,
    )
