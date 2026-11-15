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
import app.rex.patches.instagram.misc.comment.chatButtonConstructorFingerprint
import app.rex.patches.instagram.misc.comment.commentButtonClickCheckPatch
import app.rex.patches.instagram.misc.comment.debugComment.debugCommentPatch
import app.rex.patches.instagram.misc.comment.nativeChatButtonResources
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.registersUsed

// Thanks to MyInsta.
@Suppress("unused")
val copyCommentPatch =
    patch(
        name = "Copy comment",
        description = "Adds buttons to copy comments and their authors' usernames on posts and reels.",
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
            runCatching { enableSettings("copyCommentButton") }
            runCatching {

            val (stringLateral, drawableLateral) = nativeChatButtonResources(
                chatButtonConstructorFingerprint(CopyTextChatButtonToStringFingerprint.originalClassDef.type),
            )

            addButtonAttribute(
                stringLateral,
                drawableLateral,
                InitCopyButtonExtensionFingerprint,
                InitCopyButtonInitExtensionFingerprint,
            )

            addButtonInterface(InitCopyButtonExtensionFingerprint)

            val stringClass = addButtonAttribute(
                stringLateral,
                drawableLateral,
                CopyUsernameButtonExtensionFingerprint,
                InitCopyUsernameButtonExtensionFingerprint,
                stringIdMethod = "$COPY_USERNAME_BUTTON_EXTENSION_CLASS->getLabelResourceId()I",
            )
            addButtonInterface(CopyUsernameButtonExtensionFingerprint)

            commentButtonLabelFingerprint(stringClass).let {
                val getString = it.instructionMatches.last()
                val registers = getString.instruction.registersUsed
                val invoke = if (registers.all { it <= 15 }) {
                    "invoke-static {v${registers[0]}, v${registers[1]}}"
                } else {
                    "invoke-static/range {v${registers[0]} .. v${registers[1]}}"
                }
                it.method.replaceInstruction(
                    getString.index,
                    "$invoke, $COPY_USERNAME_BUTTON_EXTENSION_CLASS->getLabel(Landroid/content/Context;I)Ljava/lang/String;",
                )
            }

                        }
        }
    }
