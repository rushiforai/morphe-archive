/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package androidx.appcompat.app

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class ActionBarDrawerToggle protected constructor(stub: Unit) {
    interface DelegateProvider {
    }
}

abstract class AppCompatActivity protected constructor(stub: Unit) : androidx.fragment.app.FragmentActivity(Unit), androidx.appcompat.app.AppCompatCallback, androidx.core.app.TaskStackBuilder.SupportParentable, androidx.appcompat.app.ActionBarDrawerToggle.DelegateProvider {
}

interface AppCompatCallback {
}

abstract class AppCompatDialogFragment protected constructor(stub: Unit) : androidx.fragment.app.DialogFragment(Unit) {
}
