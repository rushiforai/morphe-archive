/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.google.android.material.shape

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class MaterialShapeDrawable protected constructor(stub: Unit) : android.graphics.drawable.Drawable(), com.google.android.material.shape.Shapeable {
    @JvmField var drawableState: com.google.android.material.shape.MaterialShapeDrawable.MaterialShapeDrawableState = boostApiStub()
    abstract class MaterialShapeDrawableState protected constructor(stub: Unit) : android.graphics.drawable.Drawable.ConstantState() {
        @JvmField var fillColor: android.content.res.ColorStateList = boostApiStub()
    }
}

interface Shapeable {
}
