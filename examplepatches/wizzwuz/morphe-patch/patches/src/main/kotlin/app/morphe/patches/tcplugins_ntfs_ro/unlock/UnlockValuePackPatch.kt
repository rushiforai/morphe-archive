/*
 * Unlock Value Pack / full access for com.paragon.tcplugins_ntfs_ro
 * (Paragon Microsoft exFAT/NTFS for USB by Paragon Software plugin).
 *
 * Targets identified from the decompiled source provided by the user:
 * - p3.i.j()Z: purchase-status validity; always true => purchases/value-pack
 *   treated as valid (covers FREE/PURCHASED checks used by trial/purchase gates).
 * - q3.h.a(Landroid/content/Context;)I: APK signature integrity check; always
 *   returns 0 so patching the APK does not trip the embedded fingerprint check.
 *
 * This is Morphe-patcher-style Kotlin patch source. It must be compiled into a
 * .mpp patch bundle with a Morphe patches build toolchain (see README.md).
 *
 * Fingerprints are based on decompiled Java structure; if they do not resolve
 * on your target APK version, adjust definingClass/name/filters against smali.
 */
package app.morphe.patches.tcplugins_ntfs_ro.unlock

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patches.tcplugins_ntfs_ro.unlock.Constants
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockValuePackPatch = bytecodePatch(
    name = "Unlock value pack",
    description = "Unlocks value pack",
) {
    compatibleWith(Constants.COMPATIBILITY_NTFS_RO)

    execute {
        // 1) p3.i.j()Z -> always true
        PurchaseStatusValidFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 2) q3.h.a(Context)I -> always 0 (valid)
        SignatureIntegrityFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
