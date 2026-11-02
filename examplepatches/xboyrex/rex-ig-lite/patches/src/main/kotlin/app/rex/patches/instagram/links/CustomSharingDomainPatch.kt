/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.links

import app.rex.patches.instagram.links.shareLinks.shareLinksPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val customSharingDomainPatch =
    bytecodePatch(
        name = "Custom sharing domain",
        description = "Allows for using custom domains when sharing posts, reels and stories.",
    ) {

        dependsOn(shareLinksPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            enableSettings("customSharingDomain")
        }
    }
