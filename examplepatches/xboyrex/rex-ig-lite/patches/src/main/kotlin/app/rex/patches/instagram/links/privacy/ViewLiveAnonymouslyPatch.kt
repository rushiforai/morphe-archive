/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.links.privacy

import app.rex.patches.instagram.links.interceptUriPatch
import app.rex.patches.instagram.misc.actionBar.chatActionBarButton.chatActionBarButtonPatch
import app.rex.patches.instagram.misc.actionBar.inboxActionBarButton.inboxActionBarButtonPatch
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val viewLiveAnonymouslyPatch =
    bytecodePatch(
        name = "View live anonymously",
        default = false,
    ) {
        dependsOn(settingsPatch, interceptUriPatch, chatActionBarButtonPatch, inboxActionBarButtonPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            enableSettings("viewLiveAnonymously")
        }
    }
