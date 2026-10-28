/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.google.android.exoplayer2.ui

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

open class PlayerView protected constructor(stub: Unit) : android.widget.FrameLayout(boostApiStub<android.content.Context>()) {
    constructor(p0: android.content.Context?, p1: android.util.AttributeSet?) : this(Unit) { boostApiStub<Unit>() }
    open fun setPlayer(p0: com.google.android.exoplayer2.Player?): Unit = boostApiStub()
    open fun setResizeMode(p0: Int): Unit = boostApiStub()
    open fun setShutterBackgroundColor(p0: Int): Unit = boostApiStub()
    open fun setUseController(p0: Boolean): Unit = boostApiStub()
}
