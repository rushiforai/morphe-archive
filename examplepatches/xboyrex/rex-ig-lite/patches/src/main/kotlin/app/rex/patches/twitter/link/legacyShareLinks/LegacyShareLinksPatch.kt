/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.link.legacyShareLinks

import app.rex.patches.twitter.link.handlemodernsharesheetlinks.handleModernShareSheetLinks
import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.patch.patch

@Suppress("unused")
val legacyShareLinksPatch =
    patch(
        name = "Legacy share links",
        description = "Brings back username on post share links. Works post 11.4x.xx",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch, handleModernShareSheetLinks)
        execute {

            enableSettings("legacyShareLink")
        }
    }
