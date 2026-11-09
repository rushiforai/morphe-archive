package app.brokenn.patches.jiohotstar.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val premiumUnlockPatch = bytecodePatch(
    name = "Premium unlock",
    description = "Unlocks premium UI features, removes subscription nudges, and enables downloads."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        IsSubscribedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        IsPremiumFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        SubscriptionNudgeFingerprint.method.addInstructions(0, """
            return-void
        """)
    }
}
