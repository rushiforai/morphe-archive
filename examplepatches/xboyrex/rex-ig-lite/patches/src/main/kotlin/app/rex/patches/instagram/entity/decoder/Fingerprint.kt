/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.decoder

import app.rex.patches.instagram.utils.Constants.EDIT_MEDIA_INFO_FRAGMENT_CLASS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchFirst
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * 452 signature: static/helper taking EDIT_MEDIA_INFO_FRAGMENT_CLASS.
 */
object EditMediaInfoGetCurrentMediaIdFingerprint : Fingerprint(
    definingClass = EDIT_MEDIA_INFO_FRAGMENT_CLASS,
    returnType = "Ljava/lang/String;",
    parameters = listOf(EDIT_MEDIA_INFO_FRAGMENT_CLASS),
    filters = listOf(
        fieldAccess(definingClass = "this", opcode = Opcode.IGET_OBJECT, location = MatchFirst()),
        opcode(Opcode.IF_EQZ, location = MatchAfterImmediately()),
        fieldAccess(type = "I", opcode = Opcode.IGET, location = MatchAfterImmediately()),
        opcode(Opcode.CONST_4, location = MatchAfterImmediately()),
        opcode(Opcode.IF_LTZ, location = MatchAfterImmediately()),
        fieldAccess(definingClass = "this", type = "Ljava/util/List;", opcode = Opcode.IGET_OBJECT, location = MatchAfterImmediately()),
        methodCall(smali = "Ljava/util/List;->size()I", location = MatchAfterImmediately()),
        opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
        opcode(Opcode.IF_GE, location = MatchAfterImmediately()),
        methodCall(
            smali = "Ljava/util/List;->get(I)Ljava/lang/Object;",
            location = MatchAfterImmediately(),
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        checkCast(MEDIA_CLASS_NAME, location = MatchAfterImmediately()),
    ),
)

/**
 * 453+ no-arg current-media getter on EditMediaInfoFragment.
 */
object EditMediaInfoNoArgCurrentMediaIdFingerprint : Fingerprint(
    definingClass = EDIT_MEDIA_INFO_FRAGMENT_CLASS,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

object CommentButtonOnClickFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("select_comment_screen_delete_comments_tap", "comment_share_click"),
)
