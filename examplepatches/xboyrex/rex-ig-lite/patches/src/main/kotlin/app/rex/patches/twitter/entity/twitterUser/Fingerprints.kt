/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.entity.twitterUser

import app.rex.patches.twitter.utils.Constants.ENTITY_DESCRIPTOR
import app.morphe.patcher.Fingerprint

private const val ENTITY_CLASS = "${ENTITY_DESCRIPTOR}TwitterUser;"
val STRING_LIST =
    listOf(
        ", fastfollowersCount=",
        ", statusesCount=",
        ", mediaCount=",
        ", favoritesCount=",
        ", articlesCount=",
        ", lastUpdated=",
    )

internal object GetStatusCountExtension : Fingerprint(
    definingClass = ENTITY_CLASS,
    name = "getStatusCount",
)

internal object GetMediaCountExtension : Fingerprint(
    definingClass = ENTITY_CLASS,
    name = "getMediaCount",
)

internal object GetLikesCountExtension : Fingerprint(
    definingClass = ENTITY_CLASS,
    name = "getLikesCount",
)

internal object GetArticleCountExtension : Fingerprint(
    definingClass = ENTITY_CLASS,
    name = "getArticleCount",
)

internal object GetFastFollowersCountExtension : Fingerprint(
    definingClass = ENTITY_CLASS,
    name = "getFastFollowersCount",
)

internal object GetLastUpdatedAtExtension : Fingerprint(
    definingClass = ENTITY_CLASS,
    name = "getLastUpdatedAt",
)

object TwitterUserToStringFingerprint : Fingerprint(
    name = "toString",
    strings = STRING_LIST,
)
