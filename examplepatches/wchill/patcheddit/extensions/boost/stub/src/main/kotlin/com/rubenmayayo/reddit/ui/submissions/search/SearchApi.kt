/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.submissions.search

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class SearchSubmissionsActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.submissions.subreddit.SubmissionsActivity(Unit), app.morphe.extension.boost.api.SearchSubmissionsView, com.rubenmayayo.reddit.ui.fragments.ThingFragment.Listener {
}
