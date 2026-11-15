/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.comment.saveMediaComment

import app.rex.patches.instagram.entity.commentDataEntity.commentDataEntity
import app.rex.patches.instagram.entity.decoder.decoderEntity
import app.rex.patches.instagram.entity.mediadata.mediaDataEntity
import app.rex.patches.instagram.misc.comment.addButtonAttribute
import app.rex.patches.instagram.misc.comment.addButtonInterface
import app.rex.patches.instagram.misc.comment.addCommentPatch
import app.rex.patches.instagram.misc.comment.chatButtonConstructorFingerprint
import app.rex.patches.instagram.misc.comment.commentButtonClickCheckPatch
import app.rex.patches.instagram.misc.comment.debugComment.debugCommentPatch
import app.rex.patches.instagram.misc.comment.nativeChatButtonResources
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.patch.patch

@Suppress("unused")
val saveMediaCommentPatch =
    patch(
        name = "Save media comment",
        description = "Adds a button to save media comments on posts and reels.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(
            settingsPatch,
            addCommentPatch,
            commentButtonClickCheckPatch,
            commentDataEntity,
            mediaDataEntity,
            decoderEntity,
            debugCommentPatch,
        )
        execute {
            runCatching {

            val action = ChatButtonActionsFingerprint.instructionMatches.last().fieldReference
            val (stringLateral, drawableLateral) = nativeChatButtonResources(chatButtonConstructorFingerprint(action))

            addButtonAttribute(
                stringLateral,
                drawableLateral,
                InitSaveMediaButtonExtensionFingerprint,
                InitSaveMediaButtonInitExtensionFingerprint,
            )

            addButtonInterface(InitSaveMediaButtonExtensionFingerprint)

            enableSettings("saveMediaCommentButton")
        
            }
        }
    }
