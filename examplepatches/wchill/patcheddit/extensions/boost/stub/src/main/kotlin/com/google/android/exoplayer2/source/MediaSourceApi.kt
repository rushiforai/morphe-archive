/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.google.android.exoplayer2.source

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class BaseMediaSource protected constructor(stub: Unit) : com.google.android.exoplayer2.source.MediaSource {
}

interface MediaSource {
    interface Factory {
    }
}

abstract class ProgressiveMediaSource protected constructor(stub: Unit) : com.google.android.exoplayer2.source.BaseMediaSource(Unit) {
    open class Factory protected constructor(stub: Unit) : com.google.android.exoplayer2.source.MediaSource.Factory {
        constructor(p0: com.google.android.exoplayer2.upstream.DataSource.Factory?, p1: app.morphe.extension.boost.api.DefaultExtractorsFactory?) : this(Unit) { boostApiStub<Unit>() }
        fun createMediaSource(p0: com.google.android.exoplayer2.MediaItem?): com.google.android.exoplayer2.source.MediaSource? = boostApiStub()
    }
}
