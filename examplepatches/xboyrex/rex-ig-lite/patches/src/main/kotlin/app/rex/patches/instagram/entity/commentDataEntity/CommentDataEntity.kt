/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.commentDataEntity

import app.rex.patches.instagram.entity.decoder.MEDIA_CLASS_NAME
import app.rex.patches.instagram.entity.decoder.USER_MODEL_CLASS_NAME
import app.rex.patches.instagram.entity.decoder.decoderEntity
import app.rex.patches.instagram.misc.comment.copyComment.CopyTextChatButtonToStringFingerprint
import app.rex.utils.changeFirstString
import app.rex.utils.changeStringAt
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

var CHAT_CONTEXT_BUTTON_SUPER_CLASS: String = "Ljava/lang/Object;"
    private set

val commentDataEntity =
    patch(
        description = "This patch is used for decoding obfuscated code of comment data",
    ) {
        dependsOn(decoderEntity)

        execute {
            runCatching {
            runCatching {
                CHAT_CONTEXT_BUTTON_SUPER_CLASS = CopyTextChatButtonToStringFingerprint.originalClassDef.superclass.toString()
            }

            runCatching {
                CommentShareClickFingerprint.let {
                    val textField = it.method.getInstruction(it.instructionMatches.last().index - 1).getReference<FieldReference>()!!
                    GetTextExtension.changeFirstString(textField.name)
                }
            }

            runCatching {
                val commentObject = RandomGetCommentObjectMediaFingerprint.originalMethod.returnType
                val commentMediaHelperClass = RandomGetCommentObjectMediaFingerprint.instructionMatches.first().methodReference.definingClass

                val commentGifObject = CommentGifConverterFingerprint.originalMethod.returnType
                CommentGifConverterFingerprint.instructionMatches.let {
                    GetGifCreatorNameMediaExtension.changeFirstString(it[6].fieldReference.name)
                    GetWebpUrlMediaExtension.changeFirstString(it[4].fieldReference.name)
                    GetGifUrlMediaExtension.changeFirstString(it[3].fieldReference.name)
                    GetGifTagMediaExtension.changeFirstString(it[0].fieldReference.name)
                }

                val commentObjectFields = classDefBy(commentObject).fields
                commentObjectFields.firstOrNull { it.type == commentMediaHelperClass }?.let {
                    GetImageMediaExtension.changeFirstString(it.name)
                }
                commentObjectFields.firstOrNull { it.type == commentGifObject }?.let {
                    GetGifMediaExtension.changeFirstString(it.name)
                }
                commentObjectFields.firstOrNull { it.type == USER_MODEL_CLASS_NAME }?.let {
                    GetCommentUserDataExtension.changeFirstString(it.name)
                }
                classDefBy(commentMediaHelperClass).fields.firstOrNull { it.type == MEDIA_CLASS_NAME }?.let {
                    GetImageMediaExtension.changeStringAt(1, it.name)
                }
            }
        
            }
        }
    }
