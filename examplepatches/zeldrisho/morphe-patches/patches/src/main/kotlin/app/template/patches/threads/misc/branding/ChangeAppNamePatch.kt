package app.template.patches.threads.misc.branding

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITY_THREADS

@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Change app name",
    description = "Changes the app name shown in the launcher.",
    default = false,
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
