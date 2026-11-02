/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.directMessage.downloadVoiceMessagePatch

import app.rex.patches.instagram.entity.messageInfoEntity.messageInfoEntity
import app.rex.patches.instagram.misc.directMessage.saveAllMessages.saveAllMessagesPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val downloadVoiceMessagePatch =
    bytecodePatch(
        name = "Download voice message",
        description = "Enables ability to download voice messages",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(messageInfoEntity, saveAllMessagesPatch)
        execute {
            enableSettings("downloadVoiceMessage")
        }
    }
