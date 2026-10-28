/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.search

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

internal val searchSubredditActivityOnCreateFingerprint = BoostApi.SearchSubredditActivity.onCreate.fingerprint()

internal val searchGenericActivityOnCreateFingerprint = BoostApi.SearchGenericActivity.onCreate.fingerprint()

internal val searchGenericActivityDefaultGoToFingerprint = BoostApi.SearchGenericActivity.searchGenericActivityDefaultGoTo.fingerprint(
    strings = listOf("random", "randnsfw"),
)
