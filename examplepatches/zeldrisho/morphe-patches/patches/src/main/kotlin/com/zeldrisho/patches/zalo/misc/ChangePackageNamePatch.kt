package com.zeldrisho.patches.zalo.misc

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

@Suppress("unused")
val changeZaloPackageNamePatch = resourcePatch(
    name = "Change Zalo package name",
    description = "Changes Zalo's package name so a clone can be installed beside stock Zalo. " +
        "WARNING: package- and certificate-bound login, push, sharing, deep links, and backup " +
        "may not work with the renamed application.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    val packageName by stringOption(
        key = "packageName",
        default = "$ORIGINAL_ZALO_PACKAGE.morphe",
        title = "Package name",
        description = "The new application package name (for example com.zing.zalo.morphe).",
        required = true,
    ) { isValidZaloPackageName(it) }

    finalize {
        document("AndroidManifest.xml").use { document ->
            rewriteZaloPackage(document, packageName!!)
        }
    }
}
