package com.zeldrisho.patches.threads.misc.packagename

import org.w3c.dom.Element

const val ORIGINAL_PACKAGE = "com.instagram.barcelona"

private val PACKAGE_NAME_REGEX = Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")

/**
 * Validates an Android package name format (dot-separated segments, each starting with a lowercase letter).
 * @param name The package name to validate.
 * @return True if the name is a valid Android package identifier, false otherwise.
 */
fun isValidPackageName(name: String?): Boolean = name != null && PACKAGE_NAME_REGEX.matches(name)

/**
 * Pure, unit-testable core of [changePackageNamePatch]'s `finalize {}` block.
 * Renames the manifest package, rewrites provider authorities derived from the
 * original package, and renames the app's own custom permissions so a renamed
 * build installs alongside stock without INSTALL_FAILED_DUPLICATE_PERMISSION.
 */
fun rewritePackage(
    document: org.w3c.dom.Document,
    newPackage: String,
    originalPackage: String = ORIGINAL_PACKAGE,
) {
    document.documentElement.setAttribute("package", newPackage)

    val providers = document.getElementsByTagName("provider")
    for (i in 0 until providers.length) {
        val provider = providers.item(i) as Element
        val authorities = provider.getAttribute("android:authorities")
        // Each authority is independent. Preserve third-party names and resource
        // references; only rewrite our package prefix, never occurrences in a suffix.
        val rewritten = authorities.split(';').joinToString(";") { authority ->
            if (authority == originalPackage) {
                newPackage
            } else if (authority.startsWith("$originalPackage.")) {
                authority.replaceFirst("$originalPackage.", "$newPackage.")
            } else {
                authority
            }
        }
        if (rewritten != authorities) {
            provider.setAttribute("android:authorities", rewritten)
        }
    }

    listOf("permission", "uses-permission").forEach { tag ->
        val nodes = document.getElementsByTagName(tag)
        for (i in 0 until nodes.length) {
            val node = nodes.item(i) as Element
            val name = node.getAttribute("android:name")
            if (name.startsWith("$originalPackage.")) {
                node.setAttribute("android:name", name.replaceFirst("$originalPackage.", "$newPackage."))
            } else if (name.startsWith("zing.zalo.permission.")) {
                node.setAttribute("android:name", name.replaceFirst("zing.zalo.permission.", "$newPackage.permission."))
            }
        }
    }

    // Zalo's legacy ZALO_SERVICE permission uses a package-like prefix that
    // differs from its application id. Rewrite references as well as its
    // declaration so a renamed copy does not collide with stock Zalo.
    val allElements = document.getElementsByTagName("*")
    for (i in 0 until allElements.length) {
        val element = allElements.item(i) as Element
        val permission = element.getAttribute("android:permission")
        if (permission.startsWith("zing.zalo.permission.")) {
            element.setAttribute(
                "android:permission",
                permission.replaceFirst("zing.zalo.permission.", "$newPackage.permission."),
            )
        }
    }
}
