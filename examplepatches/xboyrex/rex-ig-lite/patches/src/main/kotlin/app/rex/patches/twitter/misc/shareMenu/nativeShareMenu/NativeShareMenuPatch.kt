/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.shareMenu.nativeShareMenu

import app.rex.patches.twitter.entity.entityGenerator
import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.misc.shareMenu.browseObject.browseObjectPatch
import app.rex.patches.twitter.misc.shareMenu.hooks.shareMenuButtonOnClickHook
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val nativeShareMenuPatch =
    bytecodePatch(
        name = "Custom share menu",
        description = "Overrides existing share menu and adds a new one",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch, nativeShareMenuResourcePatch, entityGenerator, shareMenuButtonOnClickHook, browseObjectPatch)

        execute {

            enableSettings("enableNativeShareMenu")
        }
    }
