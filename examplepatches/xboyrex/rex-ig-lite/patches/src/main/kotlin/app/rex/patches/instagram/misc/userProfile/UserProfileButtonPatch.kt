/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.userProfile

import app.rex.patches.instagram.entity.profileinfo.ProfileUserInfoViewBinderFingerprint
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

val userProfileButtonPatch =
    patch(
        description = "This patch is adds support for adding buttons on user profile.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            runCatching {
            ProfileUserInfoViewBinderFingerprint.method.apply {
                val moveResObj = ProfileUserInfoViewBinderFingerprint.instructionMatches.last().index
                addInstructions(
                    moveResObj + 1,
                    """
                    invoke-static/range {p1 .. p2}, ${PATCHES_DESCRIPTOR}/userprofile/UserProfileButton;->addButtons(Landroid/view/ViewGroup;Ljava/lang/Object;)V
                    """.trimIndent(),
                )
            }
        
            }
        }
    }
