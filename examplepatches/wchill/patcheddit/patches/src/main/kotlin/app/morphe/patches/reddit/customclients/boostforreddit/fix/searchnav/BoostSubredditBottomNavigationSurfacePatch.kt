/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (0226c2e).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.searchnav

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.AppCompatibility
import app.morphe.patches.reddit.customclients.ExtensionPatches
import app.morphe.patches.reddit.customclients.boostforreddit.wrapHook
import app.morphe.patches.all.misc.PatchCategory

private const val SUBREDDIT_NAV_EXTENSION =
    "Lapp/morphe/extension/boost/utils/BoostSearchBottomNavigation;"

@Suppress("unused")
val boostSubredditBottomNavigationSurfacePatch = bytecodePatch(
    name = "Stabilize Boost subreddit bottom navigation surface",
    description = "Gives the bottom navigation in subreddits proper contrast and room for gesture navigation.",
    default = true,
) {
    category(PatchCategory.NAVIGATION)
    compatibleWith(*AppCompatibility.Boost)
    dependsOn(ExtensionPatches.Boost)

    execute {
        subredditActivityOnCreateFingerprint.wrapHook(
            after = "invoke-static {p0}, $SUBREDDIT_NAV_EXTENSION->standardizeSubreddit(Landroid/app/Activity;)V",
        )
    }
}
