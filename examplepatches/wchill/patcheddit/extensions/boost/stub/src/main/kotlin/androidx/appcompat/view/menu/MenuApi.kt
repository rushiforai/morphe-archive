/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package androidx.appcompat.view.menu

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class MenuBuilder protected constructor(stub: Unit) : androidx.core.internal.view.SupportMenu {
    open fun setCallback(menu: androidx.appcompat.view.menu.MenuBuilder.Callback?): Unit = boostApiStub()
    interface Callback {
        fun onMenuItemSelected(menu: androidx.appcompat.view.menu.MenuBuilder?, item: android.view.MenuItem?): Boolean
        fun onMenuModeChange(menu: androidx.appcompat.view.menu.MenuBuilder?): Unit
    }
}

interface MenuView {
    interface ItemView {
    }
}
