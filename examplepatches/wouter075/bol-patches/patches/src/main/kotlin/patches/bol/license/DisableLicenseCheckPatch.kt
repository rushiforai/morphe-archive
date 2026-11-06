package patches.bol.license

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import patches.bol.shared.Constants.COMPATIBILITY_BOL

/**
 * PairIP (Google Play "automatic integrity protection") license client.
 * `LicenseClient.checkLicense(Context)` is called from the Application and from a ContentProvider.
 * On a re-signed APK the check fails and the app shows a "Get this app from Play" paywall and exits.
 */
internal object CheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable Play license check",
    description = "Required for a patched (re-signed) app: skips the Google Play license check that would otherwise close the app.",
) {
    compatibleWith(COMPATIBILITY_BOL)

    execute {
        CheckLicenseFingerprint.method.addInstruction(0, "return-void")
    }
}
