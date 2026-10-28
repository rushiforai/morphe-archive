/*
 * Copyright 2026 wchill.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.misc.settings

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.all.misc.PatchCategory
import app.morphe.patches.all.misc.resources.addResourcesPatch
import app.morphe.patches.reddit.customclients.AppCompatibility
import app.morphe.util.ResourceGroup

@Suppress("unused")
val oauthTokensPatch = resourcePatch(
    name = "Import and export OAuth tokens",
    description = "Adds an editable JSON field in Morphe settings to view or replace Reddit account tokens.",
    default = true,
) {
    category(PatchCategory.LOGIN)
    dependsOn(
        boostMorpheSettingsPatch,
        addResourcesPatch(
            "boost",
            ResourceGroup("xml", "morphe_boost_oauth_tokens.xml", "morphe_boost_oauth_entry.xml"),
            ResourceGroup("layout", "morphe_boost_oauth_editor.xml"),
        ),
    )
    compatibleWith(*AppCompatibility.Boost)

    execute {
        addBoostSettings("morphe_boost_oauth_entry")
    }
}
