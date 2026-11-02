/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.link.cleartrackingparams

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

// https://github.com/FrozenAlex/revanced-patches-new
internal object AddSessionTokenFingerprint : Fingerprint(
    parameters =
        listOf(
            "Ljava/lang/String;",
            "L",
            "Ljava/lang/String;",
        ),
    returnType = "Ljava/lang/String;",
    strings =
        listOf(
            "<this>",
            "shareParam",
            "sessionToken",
        ),
)

@Suppress("unused")
val clearTrackingParamsPatch =
    bytecodePatch(
        name = "Clear tracking params",
        description = "Removes tracking parameters when sharing links",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch)

        execute {

            AddSessionTokenFingerprint.method.addInstruction(0, "return-object p0")

            enableSettings("cleartrackingparams")
        }
    }
