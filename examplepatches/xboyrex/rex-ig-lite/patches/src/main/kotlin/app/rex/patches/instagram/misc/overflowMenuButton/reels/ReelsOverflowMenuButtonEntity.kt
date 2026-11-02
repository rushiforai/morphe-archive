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
import app.rex.utils.methodExtractor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val reelsOverflowMenuButtonEntity =
    bytecodePatch(
        description = "Entity class for reels overflow menu button",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        execute {
            FeedReplaceAudioDialogHelperFingerprint.method.apply {
                val strIndex = FeedReplaceAudioDialogHelperFingerprint.stringMatches[0].index
                val addingReelButtonMethodCallIndex = indexOfFirstInstruction(strIndex, Opcode.INVOKE_DIRECT_RANGE) + 1

                val addingReelButtonMethodName = getInstruction(addingReelButtonMethodCallIndex).methodExtractor().name
                AddReelButtonExtensionFingerprint.changeFirstString(addingReelButtonMethodName)
            }
        }
    }
