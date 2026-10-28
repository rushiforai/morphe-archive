/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.search

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class GoToGenericActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.search.SearchAbstractActivity(Unit) {
}

abstract class SearchAbstractActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.activities.ToolbarActivity(Unit), com.rubenmayayo.reddit.ui.adapters.SearchOptionViewHolder.Listener, com.rubenmayayo.reddit.ui.adapters.SearchHeaderViewHolder.Listener {
    @JvmField var searchAdapter: com.rubenmayayo.reddit.ui.search.SearchAbstractActivity.SearchAdapter = boostApiStub()
    @JvmField var searchEditText: android.widget.EditText = boostApiStub()
    abstract class SearchAdapter protected constructor(stub: Unit) : androidx.recyclerview.widget.RecyclerView.Adapter(Unit) {
    }
}

abstract class SearchGenericActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.search.SearchAbstractActivity(Unit) {
}
