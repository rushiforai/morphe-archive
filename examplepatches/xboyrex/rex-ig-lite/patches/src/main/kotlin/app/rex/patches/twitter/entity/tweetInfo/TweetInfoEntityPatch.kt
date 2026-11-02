/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.entity.tweetInfo

import app.rex.utils.changeFirstString
import app.rex.utils.fieldExtractor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch

val tweetInfoEntityPatch =
    bytecodePatch(
        description = "For tweet info entity reflection",
    ) {
        execute {
            TweetInfoObjectFingerprint.apply {
                val langStrIndex = stringMatches[1].index
                method.apply {
                    val fieldName = getInstruction(langStrIndex + 1).fieldExtractor().name
                    TweetLangFingerprint.changeFirstString(fieldName)
                }
            }
        }
    }
