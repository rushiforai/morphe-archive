/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.shareMenu.nativeShareMenu

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources

val nativeShareMenuResourcePatch =
    resourcePatch {
        execute {
            copyResources(
                "twitter/misc",
                ResourceGroup(
                    "drawable",
                    "ic_vector_logo_instagram.xml",
                ),
            )
        }
    }
