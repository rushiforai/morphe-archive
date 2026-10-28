/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package androidx.recyclerview.widget

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class RecyclerView protected constructor(stub: Unit) : android.view.ViewGroup(boostApiStub<android.content.Context>()), app.morphe.extension.boost.api.NestedScrollingChild {
    abstract class Adapter protected constructor(stub: Unit) {
        fun notifyDataSetChanged(): Unit = boostApiStub()
    }
    abstract class ViewHolder protected constructor(stub: Unit) {
        @JvmField val itemView: android.view.View = boostApiStub()
    }
}
