/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.utils

import app.rex.patches.twitter.featureFlag.featureFlagPatch.fingerprints.FeatureFlagLoadFingerprint
import app.rex.patches.twitter.misc.settings.SettingsStatusLoadFingerprint
import app.rex.patches.twitter.utils.Constants.FSTS_DESCRIPTOR
import app.rex.patches.twitter.utils.Constants.SSTS_DESCRIPTOR
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext

context(patchContext: BytecodePatchContext)
fun enableSettings(functionName: String) {
    SettingsStatusLoadFingerprint.method.addInstruction(
        0,
        "$SSTS_DESCRIPTOR->$functionName()V",
    )
}

context(patchContext: BytecodePatchContext)
fun flagSettings(functionName: String) {
    FeatureFlagLoadFingerprint.method.addInstruction(
        0,
        "$FSTS_DESCRIPTOR->$functionName()V",
    )
}
