package app.brokenn.patches.jiohotstar.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val forceHdr10Patch = bytecodePatch(
    name = "Force HDR10",
    description = "Enables HDR10 and HDR10+ playback on compatible devices."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        IsDolbyVisionSupportedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
