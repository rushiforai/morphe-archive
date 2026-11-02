/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.comment.copyComment

import app.rex.patches.instagram.entity.commentDataEntity.commentDataEntity
import app.rex.patches.instagram.entity.decoder.decoderEntity
import app.rex.patches.instagram.misc.comment.addButtonAttribute
import app.rex.patches.instagram.misc.comment.addButtonInterface
import app.rex.patches.instagram.misc.comment.addCommentPatch
import app.rex.patches.instagram.misc.comment.commentButtonClickCheckPatch
import app.rex.patches.instagram.misc.comment.nativeChatButtonResources
import app.rex.patches.instagram.misc.comment.debugComment.debugCommentPatch
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

// Thanks to MyInsta.
@Suppress("unused")
val copyCommentPatch =
    bytecodePatch(
        name = "Copy comment",
        description = "Adds a button to copy comments on posts and reels.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(
            settingsPatch,
            addCommentPatch,
            commentButtonClickCheckPatch,
            commentDataEntity,
            decoderEntity,
            debugCommentPatch,
        )
        execute {

            val constructor = CopyTextChatButtonToStringFingerprint.classDef.methods.singleOrNull { it.name == "<init>" }
                ?: throw PatchException("Expected one native copy button constructor")
            val (stringLateral, drawableLateral) = nativeChatButtonResources(constructor)

            addButtonAttribute(
                stringLateral,
                drawableLateral,
                InitCopyButtonExtensionFingerprint,
                InitCopyButtonInitExtensionFingerprint,
            )

            addButtonInterface(InitCopyButtonExtensionFingerprint)

            enableSettings("copyCommentButton")
        }
    }
