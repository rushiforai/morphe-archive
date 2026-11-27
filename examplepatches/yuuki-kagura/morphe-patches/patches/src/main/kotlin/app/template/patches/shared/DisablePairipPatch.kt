package app.template.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * PairIP is a Google Play Integrity based license wrapper used by this developer's apps.
 * The manifest points `<application android:name>` at `com.pairip.application.Application`,
 * which is re-parented to the real app class, and a `LicenseContentProvider` verifies the
 * installer signature on every process start. A re-signed (patched) APK fails that check:
 * the app shows a "Something went wrong" dialog or shuts itself down.
 *
 * `LicenseClient.checkLicense(Context)` is the single entry point used by the provider,
 * so returning immediately disables the whole verification chain.
 */
object CheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val disablePairipLicenseCheckPatch = patch(
    name = "Disable PairIP license check",
    description = "Disables the PairIP installer signature verification that runs on " +
        "startup and otherwise blocks the app after it has been re-signed.",
    // Universal patch (no compatibleWith): must not be enabled by default.
    default = false,
) {
    execute {
        CheckLicenseFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
