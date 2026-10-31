package app.template.patches.threads.misc.analytics

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.resources.stripAdIdPermissions
import app.template.patches.shared.Constants.COMPATIBILITY_THREADS

/**
 * Advertising-id permissions to strip so no component (the Play Services measurement SDK, Meta ad
 * SDKs) can read the device advertising id.
 *
 * Note: Threads uses Meta's own analytics stack (analytics2 / OneFabric / IG uploadscheduler), not
 * Firebase Analytics, so there is no boolean manifest flag to flip — this patch only removes the
 * AD_ID permissions. Core Meta telemetry is not disabled here (doing so reliably is high-risk and
 * out of scope).
 */
@Suppress("unused")
val removeAdIdPatch = resourcePatch(
    name = "Remove AD_ID permission",
    description = "Removes advertising ID permissions. Meta's own analytics are unaffected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_THREADS)

    execute {
        document("AndroidManifest.xml").use { document ->
            stripAdIdPermissions(document)
        }
    }
}
