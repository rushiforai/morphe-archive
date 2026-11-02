/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.shareMenu.nativeReaderMode

import app.rex.patches.twitter.entity.entityGenerator
import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.misc.shareMenu.browseObject.browseObjectPatch
import app.rex.patches.twitter.misc.shareMenu.hooks.*
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.versionCheckPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val nativeReaderModePatch =
    bytecodePatch(
        name = "Native reader mode",
        description = "Requires X 11.0.0-release.0 or higher.",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(
            nativeReaderModeResourcePatch,
            settingsPatch,
            entityGenerator,
            versionCheckPatch,
            shareMenuButtonOnClickHook,
            browseObjectPatch,
        )

        execute {
            val actionName = "ReaderMode"
            val prefFunctionName = "enableNativeReaderMode"
            val stringId = "rex_title_native_reader_mode"
            val iconId = "ic_vector_book_stroke_on"
            val statusFunctionName = "nativeReaderMode"
            shareMenuButtonInjection(actionName, prefFunctionName, stringId, iconId, statusFunctionName)
        }
    }
