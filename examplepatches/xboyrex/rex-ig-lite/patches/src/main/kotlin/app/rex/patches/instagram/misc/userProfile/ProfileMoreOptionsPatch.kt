/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.userProfile

import app.rex.patches.instagram.entity.dialogbox.instagramDialogBoxEntity
import app.rex.patches.instagram.entity.userdata.userDataEntity
import app.rex.patches.instagram.misc.actionBar.userProfileActionBarButton.userProfileActionBarButtonPatch
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val profileMoreOptionsPatch =
    bytecodePatch(
        name = "More options on profile",
        description = "Adds a new button to handle user related data like copy handle, download profile picture etc",
    ) {
        dependsOn(settingsPatch, userProfileButtonPatch, userProfileActionBarButtonPatch, userDataEntity, instagramDialogBoxEntity)

        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            enableSettings("moreOptionsOnProfile")
        }
    }
