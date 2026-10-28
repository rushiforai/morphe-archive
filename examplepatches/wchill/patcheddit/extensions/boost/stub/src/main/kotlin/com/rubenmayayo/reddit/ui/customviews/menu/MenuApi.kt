/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.customviews.menu

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

open class MenuOption protected constructor(stub: Unit) : android.os.Parcelable {
    constructor() : this(Unit) { boostApiStub<Unit>() }
    @JvmField var enabled: Boolean = boostApiStub()
    @JvmField var children: java.util.ArrayList<*>? = boostApiStub()
    @JvmField var divider: Boolean = boostApiStub()
    @JvmField var id: Int = boostApiStub()
    @JvmField var iconResource: Int = boostApiStub()
    @JvmField var titleResource: Int = boostApiStub()
    @JvmField var title: String? = boostApiStub()
    override fun describeContents(): Int = boostApiStub()
    override fun writeToParcel(p0: android.os.Parcel, p1: Int): Unit = boostApiStub()
}
