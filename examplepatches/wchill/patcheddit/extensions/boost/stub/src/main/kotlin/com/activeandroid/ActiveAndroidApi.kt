/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.activeandroid

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class Model protected constructor(stub: Unit) {
    fun save(): Long? = boostApiStub()
}

abstract class ActiveAndroid protected constructor(stub: Unit) {
    companion object {
        @JvmStatic fun beginTransaction(): Unit = boostApiStub()
        @JvmStatic fun setTransactionSuccessful(): Unit = boostApiStub()
        @JvmStatic fun endTransaction(): Unit = boostApiStub()
    }
}
