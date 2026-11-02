/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.shareMenu.nativeTranslator

import app.rex.patches.twitter.entity.entityGenerator
import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.misc.shareMenu.browseObject.browseObjectPatch
import app.rex.patches.twitter.misc.shareMenu.hooks.*
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.versionCheckPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val nativeTranslatorModePatch =
    bytecodePatch(
        name = "Native translator",
        description = "Requires X 11.0.0-release.0 or higher.",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch, entityGenerator, versionCheckPatch, shareMenuButtonOnClickHook, browseObjectPatch)

        execute {
            val actionName = "Translate"
            val prefFunctionName = "enableNativeTranslator"
            val stringId = "translate_tweet_show"
            val iconId = "ic_vector_sparkle"
            val statusFunctionName = "nativeTranslator"
            shareMenuButtonInjection(actionName, prefFunctionName, stringId, iconId, statusFunctionName)
        }
    }
