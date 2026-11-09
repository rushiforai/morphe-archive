package app.brokenn.patches.jiohotstar.screenshot

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val enableScreenshotPatch = bytecodePatch(
    name = "Enable screenshots",
    description = "Allows screenshots and screen recording."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        UseSecureViewFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        ComposeFlagSecureFingerprint.method.addInstructions(0, """
            return-void
        """)
    }
}
