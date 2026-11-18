package com.morphe.patches.zankremote

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import com.morphe.patches.zankremote.Constants.COMPATIBILITY_ZANK_REMOTE

@Suppress("unused")
val disableSignatureCheckPatch = patch(
    name = "Disable signature check",
    description = "Bypasses PairIP Play Integrity and license checks to allow patched APKs to run."
) {
    compatibleWith(COMPATIBILITY_ZANK_REMOTE)

    execute {
        LicenseCheckFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
