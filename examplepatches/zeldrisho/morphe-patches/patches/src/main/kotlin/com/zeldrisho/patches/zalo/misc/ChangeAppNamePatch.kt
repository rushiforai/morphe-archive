package com.zeldrisho.patches.zalo.misc

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

@Suppress("unused")
val changeZaloAppNamePatch = resourcePatch(
    name = "Change Zalo app name",
    description = "Changes the name shown for Zalo under the launcher icon. Set the desired " +
        "name in the patch options.",
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
