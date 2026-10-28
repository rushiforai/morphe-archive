/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.work.trending

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class TrendingWorker protected constructor(stub: Unit) : androidx.work.Worker(Unit) {
    companion object {
        @JvmStatic fun schedule(p0: android.content.Context?, p1: Int): Unit = boostApiStub()
    }
}
