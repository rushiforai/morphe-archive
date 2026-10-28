/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package androidx.core.app

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class ActivityCompat protected constructor(stub: Unit) : androidx.core.content.ContextCompat(Unit) {
    interface OnRequestPermissionsResultCallback {
    }
}

abstract class ComponentActivity protected constructor(stub: Unit) : android.app.Activity(), androidx.lifecycle.LifecycleOwner, androidx.core.view.KeyEventDispatcher.Component {
}

interface OnMultiWindowModeChangedProvider {
}

interface OnPictureInPictureModeChangedProvider {
}

abstract class SharedElementCallback protected constructor(stub: Unit) {
}

abstract class TaskStackBuilder protected constructor(stub: Unit) : Iterable<Any?> {
    interface SupportParentable {
    }
}
