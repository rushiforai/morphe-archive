/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.ads.timelineEntryHook

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideRecommendationItemsPatch =
    bytecodePatch(
        name = "Hide recommendation items",
        description = "Adds options to hide recommendation items such as \"Who to follow\" and \"Today's news\" in timeline, search, and replies.",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(timelineEntryHookPatch, settingsPatch)
        execute {
            // Pinned posts by followers.
            enableSettings("hideRevistPinnedPost")

            // Communities to join.
            enableSettings("hideCommToJoin")

            // Creators to subscribe.
            enableSettings("hideCreatorsToSub")

            // Detailed posts.
            enableSettings("hideDetailedPost")

            // Premium prompt.
            enableSettings("hidePremiumPrompt")

            // Revisit bookmarks.
            enableSettings("hideRevistBookmark")

            // Today's news.
            enableSettings("hideTodaysNews")

            // Top people in search.
            enableSettings("hideTopPeopleSearch")

            // Who to follow.
            enableSettings("hideWhoToFollow")
        }
    }
