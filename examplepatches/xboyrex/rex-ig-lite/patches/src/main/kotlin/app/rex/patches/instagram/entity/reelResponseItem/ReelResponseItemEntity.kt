/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.reelResponseItem

import app.rex.patches.instagram.entity.decoder.USER_MODEL_CLASS_NAME
import app.rex.patches.instagram.entity.decoder.decoderEntity
import app.rex.utils.changeFirstString
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.patch

val reelResponseItemEntity =
    patch(
        description = "This patch is used for decoding obfuscated code of ReelResponseItem class",
    ) {
        dependsOn(decoderEntity)
        execute {
            runCatching {
            val classFields = classDefBy("Lcom/instagram/model/reels/ReelResponseItem;").fields

            val reelTypeFieldName = classFields.first { it.type == ReelTypeEnumInitFingerprint.originalClassDef.type }.name
            GetReelTypeExtensionFingerprint.changeFirstString(reelTypeFieldName)

            val userFieldName = classFields.first { it.type == USER_MODEL_CLASS_NAME }.name
            GetUserDataExtensionFingerprint.changeFirstString(userFieldName)

            GetMediaCountExtensionFingerprint.changeFirstString(
                ReelResponseItemIntfMapperFingerprint.instructionMatches.last().methodReference.name,
            )
        
            }
        }
    }
