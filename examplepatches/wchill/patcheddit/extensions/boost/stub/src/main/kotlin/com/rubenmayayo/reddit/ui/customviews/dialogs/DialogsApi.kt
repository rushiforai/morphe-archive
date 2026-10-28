/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.customviews.dialogs

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

open class UserSelectorView protected constructor(stub: Unit) : android.widget.LinearLayout(boostApiStub<android.content.Context>()) {
    constructor(context: android.content.Context?, p1: Boolean) : this(Unit) { boostApiStub<Unit>() }
    open fun setCallback(callback: com.rubenmayayo.reddit.ui.customviews.dialogs.UserSelectorView.Callback?): Unit = boostApiStub()
    interface Callback {
        fun onAddAccount(): Unit
        fun onAccountSelected(user: com.rubenmayayo.reddit.aa.User?, index: Int): Unit
    }
}
