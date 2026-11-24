package app.brokenn.patches.jiohotstar.premium

import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.patch.bytecodePatch
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val premiumUnlockPatch = bytecodePatch(
    name = "Premium unlock",
    description = "Unlocks premium UI features, removes subscription nudges, and enables downloads."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        IsSubscribedFingerprint.method.returnEarly(true)

        IsPremiumFingerprint.method.returnEarly(false)

        SubscriptionNudgeFingerprint.method.returnEarly()
    }
}
