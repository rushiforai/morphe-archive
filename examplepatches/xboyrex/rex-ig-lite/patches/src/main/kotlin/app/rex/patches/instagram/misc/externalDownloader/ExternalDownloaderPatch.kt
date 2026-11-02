/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.externalDownloader

import app.rex.patches.instagram.entity.mediadata.mediaDataEntity
import app.rex.patches.instagram.misc.overflowMenuButton.posts.addOverflowMenuButtonAttributes
import app.rex.patches.instagram.misc.overflowMenuButton.posts.debugOverflowButton.debugOverflowMenuButtonPatch
import app.rex.patches.instagram.misc.overflowMenuButton.posts.hookOverflowMenuButton
import app.rex.patches.instagram.misc.overflowMenuButton.reels.hookReelOverflowMenuButton
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val externalDownloaderPatch =
    bytecodePatch(
        name = "External downloader",
        description = "Adds support to share post links directly to external downloader",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(settingsPatch, mediaDataEntity, hookOverflowMenuButton, debugOverflowMenuButtonPatch, hookReelOverflowMenuButton)
        execute {

            addOverflowMenuButtonAttributes("REX_EXTERNAL_DOWNLOADER", "externalDownloaderOverflowButton")

            enableSettings("downloadWithExternalDownloader")
        }
    }
