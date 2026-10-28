/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.customviews

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class FormattingBar protected constructor(stub: Unit) : android.widget.LinearLayout(boostApiStub<android.content.Context>()) {
    @JvmField var editor: android.widget.EditText = boostApiStub()
    @JvmField var attachmentCallback: com.rubenmayayo.reddit.ui.customviews.FormattingBar.AttachmentCallback? = boostApiStub()
    interface AttachmentCallback {
        fun attachCamera(): Unit
        fun attachGallery(): Unit
    }
}
