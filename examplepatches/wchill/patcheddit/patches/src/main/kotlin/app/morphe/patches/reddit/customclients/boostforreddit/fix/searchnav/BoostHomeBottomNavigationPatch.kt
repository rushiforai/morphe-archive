/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (0226c2e).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.searchnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.AppCompatibility
import app.morphe.patches.reddit.customclients.ExtensionPatches
import app.morphe.patches.reddit.customclients.boostforreddit.wrapHook
import app.morphe.patches.all.misc.PatchCategory

private const val HOME_NAV_EXTENSION_DESCRIPTOR =
    "Lapp/morphe/extension/boost/utils/BoostSearchBottomNavigation;"

@Suppress("unused")
val boostHomeBottomNavigationPatch = bytecodePatch(
    name = "Standardize Boost Home bottom navigation",
    description = "Shows the same five-tab bottom navigation on Home, with Home highlighted.",
    default = true,
) {
    category(PatchCategory.NAVIGATION)
    compatibleWith(*AppCompatibility.Boost)
    dependsOn(ExtensionPatches.Boost)

    execute {
        mainActivityOnResumeFingerprint.wrapHook(
            after = "invoke-static {p0}, $HOME_NAV_EXTENSION_DESCRIPTOR->standardizeHome(Landroid/app/Activity;)V",
        )

        inboxCountUpdateFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static {p0, p1}, $HOME_NAV_EXTENSION_DESCRIPTOR->syncInboxBadge(Landroid/app/Activity;I)V
                """.trimIndent(),
            )
        }
    }
}
