/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.google.android.material.appbar

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class AppBarLayout protected constructor(stub: Unit) : android.widget.LinearLayout(boostApiStub<android.content.Context>()), androidx.coordinatorlayout.widget.CoordinatorLayout.AttachedBehavior {
    interface BaseOnOffsetChangedListener {
    }
    interface OnOffsetChangedListener : com.google.android.material.appbar.AppBarLayout.BaseOnOffsetChangedListener {
    }
}
