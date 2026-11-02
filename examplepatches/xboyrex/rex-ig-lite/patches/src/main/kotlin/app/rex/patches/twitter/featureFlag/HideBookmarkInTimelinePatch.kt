/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.featureFlag

import app.rex.patches.twitter.featureFlag.featureFlagPatch.featureFlagPatch
import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.enableSettings
import app.rex.patches.twitter.utils.flagSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideBookmarkInTimelinePatch =
    bytecodePatch(
        name = "Hide bookmark icon in timeline",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(featureFlagPatch, settingsPatch)
        execute {

            flagSettings("bookmarkInTimeline")
            enableSettings("hideInlineBmk")
        }
    }
