/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package com.rubenmayayo.reddit

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

abstract class FolderActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.activities.ToolbarActivity(Unit), com.afollestad.materialdialogs.folderselector.FolderChooserDialog.FolderSelectCallback {
}

abstract class FolderSAFActivity protected constructor(stub: Unit) : com.rubenmayayo.reddit.ui.activities.ToolbarActivity(Unit) {
}
