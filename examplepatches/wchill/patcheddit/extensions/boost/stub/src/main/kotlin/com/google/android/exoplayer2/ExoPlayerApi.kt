/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.google.android.exoplayer2

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class BasePlayer protected constructor(stub: Unit) : com.google.android.exoplayer2.Player {
}

interface Bundleable {
}

abstract class ExoPlayerImpl protected constructor(stub: Unit) : com.google.android.exoplayer2.BasePlayer(Unit) {
    fun prepare(): Unit = boostApiStub()
    fun release(): Unit = boostApiStub()
    fun setMediaSource(p0: com.google.android.exoplayer2.source.BaseMediaSource?): Unit = boostApiStub()
    fun setPlayWhenReady(p0: Boolean): Unit = boostApiStub()
    fun setVolume(p0: Float): Unit = boostApiStub()
    fun getPlaybackState(): Int = boostApiStub()
    fun setRepeatMode(p0: Int): Unit = boostApiStub()
}

abstract class MediaItem protected constructor(stub: Unit) : com.google.android.exoplayer2.Bundleable {
    companion object {
        @JvmStatic fun fromUri(p0: android.net.Uri?): com.google.android.exoplayer2.MediaItem? = boostApiStub()
    }
}

interface Player {
}
