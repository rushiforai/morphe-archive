package app.whythishome.patches.shealth

import app.whythishome.patches.shared.Constants.COMPATIBILITY_SHEALTH
import app.morphe.patcher.patch.bytecodePatch

/**
 * Shows the Health Data Sharing tile in My Page on non-Samsung Android phones.
 *
 * This only bypasses the local presentation gate. It does not bypass Samsung
 * Account, country, database-readiness, or server-side invitation checks.
 */
@Suppress("unused")
val showHealthSharingOnNonSamsungPatch = bytecodePatch(
    name = "Show Health Data Sharing on non-Samsung devices",
    description = "Makes the Health Data Sharing tile visible in My Page on non-Samsung Android devices.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SHEALTH)

    execute {
        // Keep this fail-soft because the class is obfuscated and older Health
        // releases may not contain the same My Page gate.
        // h() returns primitive boolean (Z); return true to pass the
        // manufacturer gate. Using return-object here causes VerifyError.
        stubBooleanReturnIfPresent(HealthSharingIsSamsungDeviceFingerprint, value = true)
    }
}
