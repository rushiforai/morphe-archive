/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package app.morphe.extension.boost.api.runtime.androidx.room

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class RoomDatabase protected constructor(stub: Unit) {
    fun assertNotSuspendingTransaction(): Unit = boostApiStub()
    fun beginTransaction(): Unit = boostApiStub()
    fun endTransaction(): Unit = boostApiStub()
    fun setTransactionSuccessful(): Unit = boostApiStub()
}

abstract class SharedSQLiteStatement protected constructor(stub: Unit) {
}
