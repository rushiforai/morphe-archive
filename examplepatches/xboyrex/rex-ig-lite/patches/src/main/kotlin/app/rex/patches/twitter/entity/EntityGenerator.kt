/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.entity

import app.rex.patches.twitter.entity.extMedia.extMediaEntityPatch
import app.rex.patches.twitter.entity.tweet.tweetEntityPatch
import app.rex.patches.twitter.entity.tweetInfo.tweetInfoEntityPatch
import app.morphe.patcher.patch.bytecodePatch

val entityGenerator =
    bytecodePatch(
        description = "Reflect entity patch generator",
    ) {
        dependsOn(tweetEntityPatch, tweetInfoEntityPatch, extMediaEntityPatch)
    }
