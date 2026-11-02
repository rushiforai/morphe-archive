/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.shareMenu.browseObject

import app.rex.patches.twitter.entity.entityGenerator
import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.misc.shareMenu.hooks.shareMenuButtonInjection
import app.rex.patches.twitter.misc.shareMenu.hooks.shareMenuButtonOnClickHook
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.versionCheckPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val browseObjectPatch =
    bytecodePatch(
        description = "Adds an option to browse the tweet object in the share menu.",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch, entityGenerator, versionCheckPatch, shareMenuButtonOnClickHook)

        execute {
            val actionName = "BrowseObject"
            val prefFunctionName = "rexDebug"
            val stringId = "rex_debug"
            val iconId = "ic_vector_flask_stroke"
            val statusFunctionName = "browseObject"
            shareMenuButtonInjection(actionName, prefFunctionName, stringId, iconId, statusFunctionName)
        }
    }
