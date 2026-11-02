/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.links.sanitizeShareLinks

import app.rex.patches.instagram.links.shareLinks.shareLinksPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val sanitizeShareLinksPatch =
    bytecodePatch(
        name = "Sanitize share links",
    ) {

        dependsOn(shareLinksPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            enableSettings("sanitizeShareLinks")
        }
    }
