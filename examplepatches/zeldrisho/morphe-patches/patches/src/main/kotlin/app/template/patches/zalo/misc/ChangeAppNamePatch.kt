package app.template.patches.zalo.misc

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO

@Suppress("unused")
val changeZaloAppNamePatch = resourcePatch(
    name = "Change Zalo app name",
    description = "Changes the app name shown in the launcher.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    val appName by stringOption(
        key = "appName",
        default = "Zalo Morphe",
        title = "App name",
        description = "The name shown under the app icon.",
        required = true,
    )

    execute {
        document("AndroidManifest.xml").use { document ->
            applyZaloAppName(document, appName!!)
        }
    }
}
