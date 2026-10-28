/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.messages

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class MessagesActivity protected constructor(stub: Unit) : app.morphe.extension.boost.api.DrawerActivity(Unit), app.morphe.extension.boost.api.MessagesView, com.rubenmayayo.reddit.ui.messages.fragment.ContributionListFragment.Listener {
}
