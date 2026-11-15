/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.messageInfoEntity

import app.rex.patches.instagram.entity.decoder.MEDIA_CLASS_NAME
import app.rex.utils.changeFirstString
import app.rex.utils.changeStringAt
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.patch

val messageInfoEntity =
    patch(
        description = "This patch is used for decoding obfuscated code of message info",
    ) {
        execute {
            runCatching {
            val voiceMediaField = StellaDirectMessagingServiceAudioRelatedFingerprint.instructionMatches.last().fieldReference
            GetAudioMediaExtension.changeFirstString(voiceMediaField.name)
            GetAudioMediaExtension.changeStringAt(
                1,
                classDefBy(voiceMediaField.type).fields.first { it.type == MEDIA_CLASS_NAME }.name,
            )
        
            }
        }
    }
