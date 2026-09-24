package app.rutube.patches.backgroundplayback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.rutube.patches.shared.Constants.COMPATIBILITY_RUTUBE

@Suppress("unused")
val enableBackgroundPlaybackPatch = bytecodePatch(
    name = "Enable background playback",
    description = "Allows playback to continue when the app is not in the foreground, " +
        "which is otherwise only available with a paid subscription.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_RUTUBE)

    execute {
        // Report background playback as available.
        //
        // This is the narrow counterpart to "Unlock subscription features": rather
        // than telling the whole app the account is subscribed, it forces only this
        // one availability check. That covers both conditions the method tests - the
        // user setting and the subscription flag - so it does not depend on being
        // signed in or on toggling anything in the app's settings.
        //
        // If playback still stops when backgrounded after this, the enforcement is
        // not client side and no patch here will change it.
        BackgroundPlaybackAvailableFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
