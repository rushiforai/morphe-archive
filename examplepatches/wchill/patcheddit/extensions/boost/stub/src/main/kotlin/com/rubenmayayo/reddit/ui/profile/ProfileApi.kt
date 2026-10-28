/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.profile

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class UserActivity protected constructor(stub: Unit) : app.morphe.extension.boost.api.DrawerActivity(Unit) {
    @JvmField var tabTitles: Array<String> = boostApiStub()
    @JvmField var tabRoutes: Array<String> = boostApiStub()
    @JvmField var username: String = boostApiStub()
    @JvmField var tabCount: Byte = boostApiStub()
}
