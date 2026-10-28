/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.google.android.exoplayer2.upstream

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class BaseDataSource protected constructor(stub: Unit) : com.google.android.exoplayer2.upstream.DataSource {
}

interface DataReader {
}

interface DataSource : com.google.android.exoplayer2.upstream.DataReader {
    interface Factory {
    }
}
