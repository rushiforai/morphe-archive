package app.rutube.patches.download

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.rutube.patches.shared.Constants.COMPATIBILITY_RUTUBE

@Suppress("unused")
val liftDownloadRestrictionsPatch = bytecodePatch(
    name = "Lift download restrictions",
    description = "Allows downloading videos the app otherwise refuses, either because " +
        "the uploader disabled downloads or because the video is longer than six hours.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_RUTUBE)

    execute {
        // Both checks decide locally and return a Boolean, so returning true is enough.
        // Neither asks the server, which is what makes this patchable at all - the
        // region gate on some videos looked similar and is not, because that one is
        // decided server side and no client change can affect it.
        //
        // Returning early also skips the message and the analytics event on the
        // blocked path, so nothing reports that a restriction was hit.
        listOf(
            DownloadAllowedByAuthorFingerprint,
            DownloadAllowedByDurationFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    return-object v0
                """,
            )
        }
    }
}
