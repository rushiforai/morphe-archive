/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.aa

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

open class User protected constructor(stub: Unit) : com.activeandroid.Model(Unit) {
    constructor() : this(Unit) { boostApiStub<Unit>() }
    @JvmField var accessToken: String? = boostApiStub()
    @JvmField var refreshToken: String? = boostApiStub()
    @JvmField var expirationDate: java.util.Date? = boostApiStub()
    @JvmField var oAuthData: String? = boostApiStub()
    @JvmField var synced: Boolean = boostApiStub()
    @JvmField var name: String = boostApiStub()
}
