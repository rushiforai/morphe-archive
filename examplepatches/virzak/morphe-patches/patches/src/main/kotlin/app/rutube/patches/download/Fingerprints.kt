package app.rutube.patches.download

import app.morphe.patcher.Fingerprint

/**
 * Where the client side download eligibility checks live.
 *
 * The classes inside are minified but the package is not, and each check has a
 * distinct signature, so the package plus the signature is enough to identify them
 * without depending on names that change between builds.
 */
private const val DOWNLOAD_CHECKS = "ru/rutube/player/downloadmanager/domain/downloadchecks/"

/**
 * The uploader restriction check.
 *
 * In 31.14.2 this is `downloadchecks/n;->a(ZZLru/rutube/player/downloadmanager/j;Ljava/lang/String;)`.
 * It returns its own first argument, and on the blocked path shows a message and
 * reports a `pop_up_upload_restriction` analytics event. Nothing here is asked of the
 * server, so the flag is only advisory to the client.
 */
object DownloadAllowedByAuthorFingerprint : Fingerprint(
    definingClass = DOWNLOAD_CHECKS,
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(
        "Z",
        "Z",
        "Lru/rutube/player/downloadmanager/j;",
        "Ljava/lang/String;",
    ),
)

/**
 * The video length check.
 *
 * In 31.14.2 this is `downloadchecks/o;->a(Ljava/lang/Integer;Z)`, which compares the
 * duration against a hardcoded 21600 seconds - six hours - and refuses anything
 * longer. The limit is a literal in the method, not a value from the API.
 */
object DownloadAllowedByDurationFingerprint : Fingerprint(
    definingClass = DOWNLOAD_CHECKS,
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(
        "Ljava/lang/Integer;",
        "Z",
    ),
)
