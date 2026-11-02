/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.shareMenu.nativeShareImage

import app.rex.patches.twitter.entity.entityGenerator
import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.misc.shareMenu.browseObject.browseObjectPatch
import app.rex.patches.twitter.misc.shareMenu.hooks.shareMenuButtonInjection
import app.rex.patches.twitter.misc.shareMenu.hooks.shareMenuButtonOnClickHook
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.versionCheckPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val nativeShareImagePatch =
    bytecodePatch(
        name = "Share Tweet as Image",
        description = "Share tweets as rendered image. Requires X 11.0.0-release.0 or higher.",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch, entityGenerator, versionCheckPatch, shareMenuButtonOnClickHook, browseObjectPatch)

        execute {
            val actionName = "ShareImage"
            val prefFunctionName = "enableShareImage"
            val stringId = "rex_share_image_title"
            val iconId = "ic_vector_share"
            val statusFunctionName = "shareImage"

            shareMenuButtonInjection(
                actionName,
                prefFunctionName,
                stringId,
                iconId,
                statusFunctionName,
            )
        }
    }
