/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.timeline.hideNavbarBadges

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private object setBadgeNumberFingerprint : Fingerprint(
    definingClass = "/BadgeableTabView;",
    name = "setBadgeNumber",
)

@Suppress("unused")
val hideNavBarBadgesPatch =
    bytecodePatch(
        name = "Hide badges from navigation bar icons",
        description = "Hides notification nudges & counts from navigation bar icons",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch)

        execute {
            setBadgeNumberFingerprint.method.apply {
                addInstructions(
                    0,
                    """
                    invoke-static {p1}, ${Constants.PREF_DESCRIPTOR};->navbarBadgeCount(I)I
                    move-result p1
                    """.trimIndent(),
                )
                enableSettings("hideNavbarBadge")
            }
        }
    }
