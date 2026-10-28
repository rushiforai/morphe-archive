/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.fragments.imagemodel

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class ImageModelFragment protected constructor(stub: Unit) : androidx.fragment.app.Fragment(Unit) {
    @JvmField var imageModel: com.rubenmayayo.reddit.models.generic.ImageModel = boostApiStub()
}
