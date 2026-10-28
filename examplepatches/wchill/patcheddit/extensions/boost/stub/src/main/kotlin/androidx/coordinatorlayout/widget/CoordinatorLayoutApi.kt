/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package androidx.coordinatorlayout.widget

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class CoordinatorLayout protected constructor(stub: Unit) : android.view.ViewGroup(boostApiStub<android.content.Context>()), androidx.core.view.NestedScrollingParent2, androidx.core.view.NestedScrollingParent3 {
    interface AttachedBehavior {
    }
    abstract class Behavior protected constructor(stub: Unit) {
    }
    abstract class LayoutParams protected constructor(stub: Unit) : android.view.ViewGroup.MarginLayoutParams(0, 0) {
        @JvmField var mBehavior: androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior? = boostApiStub()
        fun setBehavior(p0: androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior?): Unit = boostApiStub()
    }
}
