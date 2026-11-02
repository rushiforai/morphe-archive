/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.shareMenu.externalDownloader

import app.rex.patches.twitter.entity.entityGenerator
import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.misc.shareMenu.browseObject.browseObjectPatch
import app.rex.patches.twitter.misc.shareMenu.hooks.shareMenuButtonInjection
import app.rex.patches.twitter.misc.shareMenu.hooks.shareMenuButtonOnClickHook
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val externalDownloaderPatch =
    bytecodePatch(
        name = "Support external downloader",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch, entityGenerator, shareMenuButtonOnClickHook, browseObjectPatch)

        execute {
            val actionName = "ExternalDownload"
            val prefFunctionName = "enableExternalDownloader"
            val stringId = "rex_pref_external_downloader_text"
            val iconId = "ic_vector_incoming"
            val statusFunctionName = "externalDownloader"
            shareMenuButtonInjection(actionName, prefFunctionName, stringId, iconId, statusFunctionName)
        }
    }
