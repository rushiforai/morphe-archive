/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.google.android.material.badge

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

open class BadgeDrawable protected constructor(stub: Unit) : android.graphics.drawable.Drawable(), com.google.android.material.internal.TextDrawableHelper.TextDrawableDelegate {
    constructor(p0: android.content.Context?, p1: com.google.android.material.badge.BadgeState.State?) : this(Unit) { boostApiStub<Unit>() }
    @JvmField val textDrawableHelper: com.google.android.material.internal.TextDrawableHelper = boostApiStub()
    @JvmField val state: com.google.android.material.badge.BadgeState = boostApiStub()
    override fun draw(p0: android.graphics.Canvas): Unit = boostApiStub()
    fun getCustomBadgeParent(): android.widget.FrameLayout? = boostApiStub()
    override fun getOpacity(): Int = boostApiStub()
    fun refreshNumberGeometry(): Unit = boostApiStub()
    fun refreshNumberRendering(): Unit = boostApiStub()
    override fun setAlpha(p0: Int): Unit = boostApiStub()
    override fun setColorFilter(p0: android.graphics.ColorFilter?): Unit = boostApiStub()
}

abstract class BadgeState protected constructor(stub: Unit) {
    @JvmField val overridingState: com.google.android.material.badge.BadgeState.State = boostApiStub()
    @JvmField val currentState: com.google.android.material.badge.BadgeState.State = boostApiStub()
    fun hasNumber(): Boolean = boostApiStub()
    abstract class State protected constructor(stub: Unit) : android.os.Parcelable {
        @JvmField var number: Int = boostApiStub()
        @JvmField var visible: Boolean? = boostApiStub()
    }
}
