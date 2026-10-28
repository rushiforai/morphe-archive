/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package androidx.lifecycle.viewmodel

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class CreationExtras protected constructor(stub: Unit) {
}

abstract class MutableCreationExtras protected constructor(stub: Unit) : androidx.lifecycle.viewmodel.CreationExtras(Unit) {
}
