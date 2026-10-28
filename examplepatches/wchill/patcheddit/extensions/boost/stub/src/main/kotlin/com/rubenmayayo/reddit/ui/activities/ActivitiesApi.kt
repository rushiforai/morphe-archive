/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit.ui.activities

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class BaseActivity protected constructor(stub: Unit) : androidx.appcompat.app.AppCompatActivity(Unit), app.morphe.extension.boost.api.BottomSheetPro.ProResultListener {
    open fun openProfile(p0: String?): Unit = boostApiStub()
}

abstract class BillingActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.activities.BaseActivity(Unit) {
}

abstract class BillingProActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.activities.BaseActivity(Unit) {
}

abstract class ImageActivity protected constructor(stub: Unit) : app.morphe.extension.boost.api.BaseImageActivity(Unit) {
}

abstract class LicensesActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.activities.ToolbarActivity(Unit) {
}

abstract class MediaActivity protected constructor(stub: Unit) : app.morphe.extension.boost.api.MediaBaseActivity(Unit), app.morphe.extension.boost.api.BottomSheetMenu.OnMenuOptionSelected {
}

abstract class MediaImageActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.activities.MediaActivity(Unit) {
}

abstract class ToolbarActivity protected constructor(stub: Unit) : app.morphe.extension.boost.api.BackActivity(Unit) {
}
