/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.settings

import app.rex.patches.instagram.utils.Constants.ACTIVITY_SETTINGS_STATUS_CLASS
import app.rex.patches.instagram.utils.Constants.HOOK_FLAGS_DESCRIPTOR
import app.morphe.patcher.Fingerprint

internal object HookFlagsLoadFingerprint : Fingerprint(
    definingClass = HOOK_FLAGS_DESCRIPTOR,
    name = "load",
)

internal object SettingsStatusLoadFingerprint : Fingerprint(
    definingClass = ACTIVITY_SETTINGS_STATUS_CLASS,
    name = "load",
)
// ----------------------

internal object MainFeedFragmentOnCreateFingerprint : Fingerprint(
    name = "onCreate",
    strings = listOf("MainFeedFragment.onCreate"),
)

internal object IgFragmentActivityOnCreate : Fingerprint(
    name = "onCreate",
    definingClass = "Lcom/instagram/base/activity/IgFragmentActivity;",
)

internal object IgFragmentActivityOnResume : Fingerprint(
    name = "onResume",
    definingClass = "Lcom/instagram/base/activity/IgFragmentActivity;",
    parameters = emptyList(),
    returnType = "V",
)
