/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.google.android.material.navigation

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class NavigationBarItemView protected constructor(stub: Unit) : android.widget.FrameLayout(boostApiStub<android.content.Context>()), com.google.android.material.navigation.NavigationBarMenuItemView {
    @JvmField val icon: android.widget.ImageView = boostApiStub()
    @JvmField var badgeDrawable: com.google.android.material.badge.BadgeDrawable? = boostApiStub()
    open fun setBadge(p0: com.google.android.material.badge.BadgeDrawable?): Unit = boostApiStub()
    open fun setIconTintList(p0: android.content.res.ColorStateList?): Unit = boostApiStub()
}

interface NavigationBarMenuItemView : androidx.appcompat.view.menu.MenuView.ItemView {
}

abstract class NavigationBarMenuView protected constructor(stub: Unit) : android.view.ViewGroup(boostApiStub<android.content.Context>()), androidx.appcompat.view.menu.MenuView {
    @JvmField val badges: android.util.SparseArray<Any?> = boostApiStub()
}

abstract class NavigationBarView protected constructor(stub: Unit) : android.widget.FrameLayout(boostApiStub<android.content.Context>()) {
    @JvmField val menuView: com.google.android.material.navigation.NavigationBarMenuView = boostApiStub()
    open fun getMenu(): android.view.Menu? = boostApiStub()
    open fun getSelectedItemId(): Int = boostApiStub()
    open fun setItemIconTintList(p0: android.content.res.ColorStateList?): Unit = boostApiStub()
    open fun setItemTextColor(p0: android.content.res.ColorStateList?): Unit = boostApiStub()
    open fun setLabelVisibilityMode(p0: Int): Unit = boostApiStub()
}
