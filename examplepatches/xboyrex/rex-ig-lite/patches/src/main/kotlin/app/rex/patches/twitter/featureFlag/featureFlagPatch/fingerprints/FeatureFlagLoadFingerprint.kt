/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.featureFlag.featureFlagPatch.fingerprints

import app.morphe.patcher.Fingerprint

internal object FeatureFlagLoadFingerprint : Fingerprint(
    definingClass = "Lapp/morphe/extension/twitter/patches/FeatureSwitchPatch;",
    name = "load",
)
