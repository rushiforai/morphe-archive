package app.template.patches.zalo.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.resources.stripAdIdPermissions
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO

/**
 * Strips Zalo's advertising-id manifest entries so the Play advertising ID
 * cannot be read.
 *
 * Safe on 26.08.01: every in-app reader fails closed — `ra0/a` falls back to
 * `"unknown"`, `u52/g` and `com/adtima/d` catch the lookup failure, and the
 * companion "Disable Zalo ads" patch reports limit-ad-tracking opted-out
 * without calling the Play API at all. GMS-internal callers are SDK
 * plumbing, not app surfaces. See batch2-evidence.md §2.
 */
@Suppress("unused")
val removeZaloAdIdPatch = resourcePatch(
    name = "Remove AD_ID permission",
    description = "Removes Zalo's advertising ID permissions. Messaging is unaffected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        document("AndroidManifest.xml").use { document ->
            stripAdIdPermissions(document)
        }
    }
}
