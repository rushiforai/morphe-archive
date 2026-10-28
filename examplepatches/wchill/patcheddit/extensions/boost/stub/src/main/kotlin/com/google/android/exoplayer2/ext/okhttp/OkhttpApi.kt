/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.google.android.exoplayer2.ext.okhttp

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class OkHttpDataSource protected constructor(stub: Unit) : com.google.android.exoplayer2.upstream.BaseDataSource(Unit) {
    open class Factory protected constructor(stub: Unit) : com.google.android.exoplayer2.upstream.DataSource.Factory {
        constructor(p0: okhttp3.OkHttpClient?) : this(Unit) { boostApiStub<Unit>() }
        @JvmField var userAgent: String = boostApiStub()
    }
}
