/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.timeline.tweetinfo

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePromoteButton =
    bytecodePatch(
        name = "Hide promote button",
        description = "Hides promote button under self posts",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch, tweetInfoHook)

        execute {
            enableSettings("hidePromoteButton")
        }
    }
