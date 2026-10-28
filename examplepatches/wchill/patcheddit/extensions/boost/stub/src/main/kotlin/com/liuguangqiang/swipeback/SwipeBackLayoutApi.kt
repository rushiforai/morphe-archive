/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.liuguangqiang.swipeback

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class SwipeBackLayout protected constructor(stub: Unit) : android.view.ViewGroup(boostApiStub<android.content.Context>()) {
    open fun setBackFactor(p0: Float): Unit = boostApiStub()
    open fun setEnableFlingBack(p0: Boolean): Unit = boostApiStub()
}
