/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.comment

import app.rex.patches.instagram.utils.Constants.COMMENT_BUTTON_EXTENSION_CLASS
import app.morphe.patcher.Fingerprint

internal const val HANDLE_COMMENT_BUTTON_EXTENSION_CLASS = "${COMMENT_BUTTON_EXTENSION_CLASS}/HandleCommentButton;"

internal object AddCommentButtonFingerprint : Fingerprint(
    strings = listOf("instagram_share_comment_to_story_entrypoint_impression"),
    custom = { method, _ -> method.returnType in listOf("Ljava/util/List;", "Ljava/util/ArrayList;") },
)
