/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.afollestad.materialdialogs

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class DialogBase protected constructor(stub: Unit) : android.app.Dialog(boostApiStub<android.content.Context>()), android.content.DialogInterface.OnShowListener {
}

abstract class MaterialDialog protected constructor(stub: Unit) : com.afollestad.materialdialogs.DialogBase(Unit), android.view.View.OnClickListener {
    open class Builder protected constructor(stub: Unit) {
        constructor(p0: android.content.Context?) : this(Unit) { boostApiStub<Unit>() }
        fun customView(p0: android.view.View?, p1: Boolean): Unit = boostApiStub()
        fun show(): com.afollestad.materialdialogs.MaterialDialog? = boostApiStub()
        fun title(p0: Int): Unit = boostApiStub()
    }
    interface DialogActionCallback {
    }
}
