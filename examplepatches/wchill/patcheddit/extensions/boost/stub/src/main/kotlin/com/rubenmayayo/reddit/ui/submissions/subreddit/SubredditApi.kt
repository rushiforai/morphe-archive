/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.submissions.subreddit

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class MainActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.submissions.subreddit.SubredditBaseActivity(Unit) {
}

abstract class SubmissionsActivity protected constructor(stub: Unit) : app.morphe.extension.boost.api.DrawerActivity(Unit), com.google.android.material.appbar.AppBarLayout.OnOffsetChangedListener {
    @JvmField var subscription: com.rubenmayayo.reddit.models.reddit.SubscriptionViewModel = boostApiStub()
}

abstract class SubredditActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.submissions.subreddit.SubredditBaseActivity(Unit) {
    fun openSubscriptions(): Boolean = boostApiStub()
}

abstract class SubredditBaseActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.submissions.subreddit.SubmissionsActivity(Unit), app.morphe.extension.boost.api.SubredditView, com.rubenmayayo.reddit.ui.fragments.ThingFragment.Listener, com.rubenmayayo.reddit.ui.comments.CommentsFragment.CommentCallback, app.morphe.extension.boost.api.BottomSheetMenu.OnMenuOptionSelected {
}
