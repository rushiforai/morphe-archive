package app.rutube.patches.subscription

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.rutube.patches.shared.Constants.COMPATIBILITY_RUTUBE

@Suppress("unused")
val unlockSubscriptionFeaturesPatch = bytecodePatch(
    name = "Unlock subscription features",
    description = "Reports the account as subscribed to the app itself, which enables " +
        "features gated behind a paid subscription such as background playback. " +
        "Anything the server enforces is unaffected.",
    // Not enabled by default: this is broader than it looks, see below.
    default = false,
) {
    compatibleWith(COMPATIBILITY_RUTUBE)

    execute {
        // Force the client side subscription flag to true.
        //
        // This is the deliberately wide version. The flag is not specific to any one
        // feature: every caller that asks "is this account subscribed" now gets true,
        // which is what makes background playback available, but also affects any
        // other surface that reads the same state.
        //
        // Two consequences worth knowing:
        //  - UI that is merely gated on this flag will unlock;
        //  - anything the *server* enforces will not, because the backend is not
        //    consulted here. If a feature needs a subscriber-only token, the app will
        //    now offer it and then fail, rather than hiding it.
        //
        // A narrower alternative exists: force only the background playback
        // availability check in
        // ru/rutube/player/plugin/rutube/backgroundplayback/presentation/a0;->i()Z
        HasSubscriptionFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
