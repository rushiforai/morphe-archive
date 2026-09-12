package com.zeldrisho.patches.threads.misc.packagename

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.zeldrisho.patches.threads.shared.Constants.COMPATIBILITY_THREADS
import org.w3c.dom.Element

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Changes the app package name so the patched app installs alongside the " +
        "original. Set the desired name in the patch options. WARNING: hardcoded component/provider " +
        "references can break login, content providers, or push. Disable this patch if needed.",
    // Off by default: renaming breaks package+cert-bound flows (web-OAuth/App-Links/Google
    // sign-in, providers, push). Opt in only if you need side-by-side install; see
    // docs/lessons-learned.md (rename risk) and docs/qa-checklist.md §2.
    default = false,
) {
    compatibleWith(COMPATIBILITY_THREADS)

    val packageName by stringOption(
        key = "packageName",
        default = "$ORIGINAL_PACKAGE.morphe",
        title = "Package name",
        description = "The new application package name (e.g. com.instagram.barcelona.morphe).",
        required = true,
    ) {
        // Valid Android package name: dot-separated segments, each starting with a letter.
        isValidPackageName(it)
    }

    finalize {
        document("AndroidManifest.xml").use { document ->
            rewritePackage(
                document,
                packageName!!,
                document.documentElement.getAttribute("package"),
            )
        }
    }
}
