/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.overflowMenuButton.reels

import app.rex.patches.instagram.misc.overflowMenuButton.posts.AddReelButtonExtensionFingerprint
import app.rex.patches.instagram.misc.overflowMenuButton.posts.FeedReplaceAudioDialogHelperFingerprint
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.utils.changeFirstString
import app.morphe.patcher.patch.patch

@Suppress("unused")
val reelsOverflowMenuButtonEntity =
    patch(
        description = "Entity class for reels overflow menu button",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        execute {
            runCatching {
            AddReelButtonExtensionFingerprint.changeFirstString(
                FeedReplaceAudioDialogHelperFingerprint.instructionMatches.last().methodReference.name,
            )
        
            }
        }
    }
