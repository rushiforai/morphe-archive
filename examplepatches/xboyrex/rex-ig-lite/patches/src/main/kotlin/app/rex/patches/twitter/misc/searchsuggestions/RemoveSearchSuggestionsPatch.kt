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

private object SearchSuggestionFingerprint : Fingerprint(
    definingClass = "/search/provider/",
    returnType = "Ljava/util/Collection;",
    strings =
        listOf(
            "type",
            "query_id",
        ),
)

@Suppress("unused")
val RemoveSearchSuggestions =
    bytecodePatch(
        name = "Remove search suggestions",
        description = "Hide/Remove search suggestion in explore section",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch)

        execute {

            SearchSuggestionFingerprint.method.apply {

                val firstInstruction = getInstruction(0)

                addInstructionsWithLabels(
                    0,
                    """
                    invoke-static {}, $PREF_DESCRIPTOR;->RemoveSearchSuggestions()Z
                    move-result v0
                    if-eqz v0, :cond_1212
                    const v0, 0x0
                    return-object v0
                    """.trimIndent(),
                    ExternalLabel("cond_1212", firstInstruction),
                )

                enableSettings("removeSearchSuggestions")
            }
        }
    }
