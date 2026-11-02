/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.internalStuffs.whitehatSettings

import app.rex.patches.instagram.misc.hookFlags.hookFlagsPatch
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PREF_CALL_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

internal object AllowUserCertificateCheckFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("debug_allow_user_certs_ttl", "debug_allow_user_certs"),
)

@Suppress("unused")
val allowUserNetworkCertificatePatch =
    bytecodePatch(
        name = "Allow user network certificate",
        description = "Allows user network certificate for whitehat testing",
        default = false,
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(
            settingsPatch,
            hookFlagsPatch,
        )
        execute {

            AllowUserCertificateCheckFingerprint.method.addInstructions(
                0,
                """
                 $PREF_CALL_DESCRIPTOR->allowUserNetworkCertificate()Z
                move-result v0
                return v0
                """.trimIndent(),
            )
            enableSettings("allowUserNetworkCertificate")
        }
    }
