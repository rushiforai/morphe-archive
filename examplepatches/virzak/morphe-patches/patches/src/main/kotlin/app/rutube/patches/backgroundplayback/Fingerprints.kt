package app.rutube.patches.backgroundplayback

import app.morphe.patcher.Fingerprint

/**
 * The background playback availability check.
 *
 * In 31.14.2 this is
 * `ru/rutube/player/plugin/rutube/backgroundplayback/presentation/a0;->i()Z`, which
 * combines *two* conditions and is the reason forcing the subscription flag alone was
 * not enough:
 *
 *  1. a use case reading a boolean out of a preferences object (the user facing
 *     setting), and
 *  2. the account's subscription flag, read from a state flow.
 *
 * The class name is minified but the package is not, so the package is the anchor.
 * It is the only method in that package returning a boolean and taking no arguments,
 * which is what makes the match unique without needing instruction filters.
 */
object BackgroundPlaybackAvailableFingerprint : Fingerprint(
    definingClass = "ru/rutube/player/plugin/rutube/backgroundplayback/presentation/",
    returnType = "Z",
    parameters = emptyList(),
)
