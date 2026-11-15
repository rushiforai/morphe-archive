/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.decoder

import app.rex.patches.instagram.utils.Constants.EDIT_MEDIA_INFO_FRAGMENT_CLASS
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference

const val MEDIA_CLASS_NAME = "Lcom/instagram/feed/media/Media;"

const val MEDIAEXT_CLASS_NAME = "Lcom/instagram/feed/media/MediaExtKt;"

const val USER_MODEL_CLASS_NAME = "Lcom/instagram/user/model/User;"

var MEDIA_ADD_INFO_CLASS_NAME: String = "Ljava/lang/Object;"
    private set

var CURRENT_MEDIA_FIELD: FieldReference =
    ImmutableFieldReference("Ljava/lang/Object;", "A00", "I")
    private set

var COMMENT_BUTTON_CLASS: String = "Ljava/lang/Object;"
    private set

val decoderEntity =
    patch(
        description = "This patch is used hold class and field names that are commonly used",
    ) {
        execute {
            runCatching {
            runCatching {
                val match452 = EditMediaInfoGetCurrentMediaIdFingerprint.matchOrNull()
                if (match452 != null) {
                    CURRENT_MEDIA_FIELD = match452.instructionMatches[2].fieldReference
                    MEDIA_ADD_INFO_CLASS_NAME = CURRENT_MEDIA_FIELD.definingClass
                } else {
                    val method453 = EditMediaInfoNoArgCurrentMediaIdFingerprint.methodOrNull
                    val directIgetIndex = method453?.indexOfFirstInstruction(Opcode.IGET) ?: -1
                    if (method453 != null && directIgetIndex >= 0) {
                        CURRENT_MEDIA_FIELD = method453.getInstruction(directIgetIndex).getReference<FieldReference>()!!
                        MEDIA_ADD_INFO_CLASS_NAME = CURRENT_MEDIA_FIELD.definingClass
                    } else {
                        val accessor = mutableClassDefBy(EDIT_MEDIA_INFO_FRAGMENT_CLASS).methods.firstOrNull { method ->
                            method.returnType == "Ljava/lang/String;" &&
                                method.parameterTypes.size == 1 &&
                                method.parameterTypes[0].toString() == EDIT_MEDIA_INFO_FRAGMENT_CLASS &&
                                method.indexOfFirstInstruction(Opcode.IGET) >= 0
                        }
                        if (accessor != null) {
                            val accessorIgetIndex = accessor.indexOfFirstInstruction(Opcode.IGET)
                            CURRENT_MEDIA_FIELD = accessor.getInstruction(accessorIgetIndex).getReference<FieldReference>()!!
                            MEDIA_ADD_INFO_CLASS_NAME = CURRENT_MEDIA_FIELD.definingClass
                        }
                    }
                }
            }

            runCatching {
                COMMENT_BUTTON_CLASS = CommentButtonOnClickFingerprint.originalMethod.parameterTypes[0].toString()
            }
        
            }
        }
    }
