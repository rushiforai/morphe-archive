/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.moreOptionsOnPost

import app.rex.patches.instagram.entity.dialogbox.instagramDialogBoxEntity
import app.rex.patches.instagram.entity.mediadata.mediaDataEntity
import app.rex.patches.instagram.misc.overflowMenuButton.posts.addOverflowMenuButtonAttributes
import app.rex.patches.instagram.misc.overflowMenuButton.posts.debugOverflowButton.debugOverflowMenuButtonPatch
import app.rex.patches.instagram.misc.overflowMenuButton.posts.hookOverflowMenuButton
import app.rex.patches.instagram.misc.overflowMenuButton.reels.hookReelOverflowMenuButton
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val moreOptionsOnPostPatch =
    bytecodePatch(
        name = "More options on post",
        description = "Adds an overflow menu button to get more options on post/reels, like copy description, copy username etc",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(
            settingsPatch,
            mediaDataEntity,
            instagramDialogBoxEntity,
            hookOverflowMenuButton,
            debugOverflowMenuButtonPatch,
            hookReelOverflowMenuButton,
        )
        execute {

            addOverflowMenuButtonAttributes("REX_MORE_POST_OPTION", "morePostOptionOverflowButton")

            enableSettings("moreOptionsOnPost")
        }
    }
