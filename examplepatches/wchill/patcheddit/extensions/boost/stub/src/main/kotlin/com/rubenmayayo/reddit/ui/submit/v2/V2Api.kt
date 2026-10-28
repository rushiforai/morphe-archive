/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.submit.v2

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class SubmitAbsctractFragment protected constructor(stub: Unit) : app.morphe.extension.boost.api.EffectiveFragment(Unit), app.morphe.extension.boost.api.SubmitView {
}

abstract class SubmitGifvFragment protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.submit.v2.SubmitVideoFragment(Unit) {
    abstract class ProgressListener protected constructor(stub: Unit) : app.morphe.extension.boost.api.ProgressRequestBody.ProgressListener {
        override fun onProgress(p0: Int): Unit = boostApiStub()
    }
    abstract class UploadListener protected constructor(stub: Unit) : app.morphe.extension.boost.api.MediaUploaderListener {
        override fun onFailure(p0: String?): Unit = boostApiStub()
        override fun onSuccess(p0: String?): Unit = boostApiStub()
        override fun onImageUploaded(p0: com.rubenmayayo.reddit.models.imgur.ImageResponse.UploadedImage?): Unit = boostApiStub()
    }
}

abstract class SubmitVideoFragment protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.submit.v2.SubmitAbsctractFragment(Unit) {
}
