/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients.sync.syncforreddit.api

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

internal object GetAuthorizationStringFingerprint : Fingerprint(
    // This is evaluated after replaceStringPatch, so the modified string is used for matching.
    strings = listOf("https://www.reddit.com/api/v1/authorize.compact?client_id=Q43fSpTe8LckEg&response_type=code&state=")
)

internal object GetBearerTokenFingerprint : Fingerprint(
    classFingerprint = GetAuthorizationStringFingerprint,
    strings = listOf("Basic ")
)

internal object GetUserAgentFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    filters = listOf(string("android:com.laurencedawson.reddit_sync", StringComparisonType.STARTS_WITH))
)

internal object ImgurImageAPIFingerprint : Fingerprint(
    strings = listOf("https://imgur-apiv3.p.rapidapi.com/3/image")
)

internal object GetRedirectUriFingerprint : Fingerprint(
    strings = listOf("http://redditsync/auth")
)
