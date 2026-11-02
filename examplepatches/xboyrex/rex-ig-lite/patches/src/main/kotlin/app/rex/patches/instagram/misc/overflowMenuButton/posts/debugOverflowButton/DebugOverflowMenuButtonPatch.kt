/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.overflowMenuButton.posts.debugOverflowButton

import app.rex.patches.instagram.misc.overflowMenuButton.posts.addOverflowMenuButtonAttributes
import app.rex.patches.instagram.misc.overflowMenuButton.posts.hookOverflowMenuButton
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val debugOverflowMenuButtonPatch =
    bytecodePatch(
        description = "Adds debug overflow menu button",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(hookOverflowMenuButton)
        execute {

            addOverflowMenuButtonAttributes("REX_DEBUG", "debugOverflowButton")
        }
    }
