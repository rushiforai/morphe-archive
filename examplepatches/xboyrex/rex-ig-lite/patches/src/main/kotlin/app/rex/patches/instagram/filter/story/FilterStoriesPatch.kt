/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.filter.story

import app.rex.patches.instagram.entity.reelResponseItem.reelResponseItemEntity
import app.rex.patches.instagram.entity.userdata.userDataEntity
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// Heavily based on @brosssh work.
// https://github.com/brosssh/instagram-morphe-patches-library/blob/dev/patch-library/src/main/kotlin/app/morphe/library/instagram/patches/FilterStoriesListPatch.kt

@Suppress("unused")
val filterStoriesPatch =
    bytecodePatch(
        name = "Filter stories",
        description = "Filter stories to hide based on different categories",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(settingsPatch, reelResponseItemEntity, userDataEntity)
        execute {

            PopulateStoryTrayFingerprint.matchAll(1..1).single().method.apply {
                // The JSON parser is shared with profile highlights. Filter only the story tray
                // after decoding, including cached responses, tail loads and the Following tray.
                addInstructions(
                    0,
                    """
                    invoke-static/range {p5 .. p5}, $PATCHES_DESCRIPTOR/filter/story/FilterStory;->filter(Ljava/util/List;)Ljava/util/List;
                    move-result-object p5
                    """.trimIndent(),
                )
                enableSettings("storyFilters")
            }
        }
    }
