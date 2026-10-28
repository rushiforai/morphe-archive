/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package androidx.appcompat.widget

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class Toolbar protected constructor(stub: Unit) : android.view.ViewGroup(boostApiStub<android.content.Context>()), androidx.core.view.MenuHost {
    open fun getNavigationIcon(): android.graphics.drawable.Drawable? = boostApiStub()
    open fun getOverflowIcon(): android.graphics.drawable.Drawable? = boostApiStub()
    open fun setNavigationIcon(p0: android.graphics.drawable.Drawable?): Unit = boostApiStub()
    open fun setOverflowIcon(p0: android.graphics.drawable.Drawable?): Unit = boostApiStub()
    open fun setSubtitleTextColor(p0: Int): Unit = boostApiStub()
    open fun setTitleTextColor(p0: Int): Unit = boostApiStub()
}
