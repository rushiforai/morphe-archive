package com.zeldrisho.threads.patches.misc.branding

import com.zeldrisho.threads.patches.shared.Constants.COMPATIBILITY_THREADS
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption

@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Change app name",
    description = "Changes the app name shown under the launcher icon. " +
        "Set the desired name in the patch options.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_THREADS)

    val appName by stringOption(
        key = "appName",
        default = "Threads Morphe",
        title = "App name",
        description = "The name shown under the app icon.",
        required = true,
    )

    execute {
        document("AndroidManifest.xml").use { document ->
            applyAppName(document, appName!!)
        }
    }
}
