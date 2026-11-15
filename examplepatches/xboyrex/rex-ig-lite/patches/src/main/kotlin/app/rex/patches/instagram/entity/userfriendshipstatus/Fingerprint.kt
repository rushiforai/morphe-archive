/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.userfriendshipstatus

import app.rex.patches.instagram.utils.Constants.ENTITY_CLASS
import app.morphe.patcher.Fingerprint

internal const val EXTENSION_CLASS = "$ENTITY_CLASS/UserFriendshipStatus;"

internal object GetMappingsFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "getMappings",
)

internal const val FRIENDSHIP_STATUS_CLASS = "Lcom/instagram/api/schemas/RelationshipInfoDict;"

internal object FriendshipStatusMapperFingerprint : Fingerprint(
    returnType = "Ljava/util/Map;",
    parameters = listOf(FRIENDSHIP_STATUS_CLASS),
    strings = listOf("blocking", "followed_by", "following", "incoming_request"),
)
