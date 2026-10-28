/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.comments

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class CommentsFragment protected constructor(stub: Unit) : app.morphe.extension.boost.api.EffectiveFragment(Unit), app.morphe.extension.boost.api.CommentsView, app.morphe.extension.boost.api.CommentViewHolderListener, com.rubenmayayo.reddit.ui.adapters.LoadMoreViewHolder.Listener, app.morphe.extension.boost.api.SubmissionViewHolderListener {
    interface CommentCallback {
    }
}
