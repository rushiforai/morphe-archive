/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.reelResponseItem

import app.rex.patches.instagram.entity.decoder.USER_MODEL_CLASS_NAME
import app.rex.patches.instagram.entity.decoder.decoderEntity
import app.rex.utils.changeFirstString
import app.rex.utils.methodExtractor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch

val reelResponseItemEntity =
    bytecodePatch(
        description = "This patch is used for decoding obfuscated code of ReelResponseItem class",
    ) {
        dependsOn(decoderEntity)
        execute {

            ReelResponseItemFingerprint.apply {
                val classFields = classDef.fields

                val reelTypeFieldName = classFields.first { it.type == ReelTypeEnumInitFingerprint.classDef.type }.name
                GetReelTypeExtensionFingerprint.changeFirstString(reelTypeFieldName)

                val userFieldName = classFields.first { it.type == USER_MODEL_CLASS_NAME }.name
                GetUserDataExtensionFingerprint.changeFirstString(userFieldName)
            }

            ReelResponseItemIntfMapperFingerprint.apply {
                val mediaCountStrIndex = stringMatches[1].index

                method.apply {
                    val mediaCountMethodName = getInstruction(mediaCountStrIndex + 1).methodExtractor().name
                    GetMediaCountExtensionFingerprint.changeFirstString(mediaCountMethodName)
                }
            }
        }
    }
