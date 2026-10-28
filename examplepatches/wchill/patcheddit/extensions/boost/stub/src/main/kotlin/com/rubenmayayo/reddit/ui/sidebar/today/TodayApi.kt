/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.sidebar.today

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class TrendingTodayFragment protected constructor(stub: Unit) : androidx.fragment.app.Fragment(Unit) {
    @JvmField var viewModel: app.morphe.extension.boost.api.TrendingTodayViewModel = boostApiStub()
    open class ReloadTask protected constructor(stub: Unit) : java.lang.Runnable {
        constructor(p0: com.rubenmayayo.reddit.ui.sidebar.today.TrendingTodayFragment?) : this(Unit) { boostApiStub<Unit>() }
        override fun run(): Unit = boostApiStub()
    }
}
