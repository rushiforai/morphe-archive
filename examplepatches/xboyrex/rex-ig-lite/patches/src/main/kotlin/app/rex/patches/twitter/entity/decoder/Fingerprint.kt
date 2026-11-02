/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.entity.decoder

import app.morphe.patcher.Fingerprint

object TimelineItemDebugDialogInfoBuilderFingerprint : Fingerprint(
    strings = listOf("Tweet Info"),
)

object ContextualTweetPermaLinkBuilderFingerprint : Fingerprint(
    strings = listOf("https://x.com/%1\$s/status/%2\$d"),
)
