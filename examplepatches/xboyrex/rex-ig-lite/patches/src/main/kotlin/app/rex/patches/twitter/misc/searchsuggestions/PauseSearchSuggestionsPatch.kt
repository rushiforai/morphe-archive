/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.searchsuggestions

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.Constants.PREF_DESCRIPTOR
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private object SearchDbInsertFingerprint : Fingerprint(
    strings =
        listOf(
            "search_queries",
            "findSearchQuery: ",
            "LOWER(query)=LOWER(?) AND LOWER(name)=LOWER(?) AND type=? AND latitude=? AND longitude=?",
        ),
)

@Suppress("unused")
val pauseSearchSuggestion =
    bytecodePatch(
        name = "Pause search suggestions",
        description = "Search suggestions will not be saved locally",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch)

        execute {

            SearchDbInsertFingerprint.method.apply {

                val firstInstruction = getInstruction(0)

                addInstructionsWithLabels(
                    0,
                    """
                    invoke-static {}, $PREF_DESCRIPTOR;->pauseSearchSuggestions()Z
                    move-result v0
                    if-eqz v0, :cond_1212
                    return-void
                    """.trimIndent(),
                    ExternalLabel("cond_1212", firstInstruction),
                )

                enableSettings("pauseSearchSuggestions")
            }
        }
    }
