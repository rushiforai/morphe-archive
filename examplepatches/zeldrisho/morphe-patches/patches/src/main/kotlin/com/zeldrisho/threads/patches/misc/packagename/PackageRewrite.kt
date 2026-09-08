package com.zeldrisho.threads.patches.misc.packagename

import org.w3c.dom.Element

const val ORIGINAL_PACKAGE = "com.instagram.barcelona"

private val PACKAGE_NAME_REGEX = Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")

/**
 * Validates an Android package name format (dot-separated segments, each starting with a lowercase letter).
 * @param name The package name to validate.
 * @return True if the name is a valid Android package identifier, false otherwise.
 */
fun isValidPackageName(name: String?): Boolean =
    name != null && PACKAGE_NAME_REGEX.matches(name)

/**
 * Pure, unit-testable core of [changePackageNamePatch]'s `finalize {}` block.
 * Renames the manifest package, rewrites provider authorities derived from the
 * original package, and renames the app's own custom permissions so a renamed
 * build installs alongside stock without INSTALL_FAILED_DUPLICATE_PERMISSION.
 */
fun rewritePackage(document: org.w3c.dom.Document, newPackage: String) {
    document.documentElement.setAttribute("package", newPackage)

    val providers = document.getElementsByTagName("provider")
    for (i in 0 until providers.length) {
        val provider = providers.item(i) as Element
        val authorities = provider.getAttribute("android:authorities")
        if (authorities.startsWith("$ORIGINAL_PACKAGE.")) {
            provider.setAttribute(
                "android:authorities",
                authorities.replace(ORIGINAL_PACKAGE, newPackage),
            )
        }
    }

    listOf("permission", "uses-permission").forEach { tag ->
        val nodes = document.getElementsByTagName(tag)
        for (i in 0 until nodes.length) {
            val node = nodes.item(i) as Element
            val name = node.getAttribute("android:name")
            if (name.startsWith("$ORIGINAL_PACKAGE.")) {
                node.setAttribute("android:name", name.replaceFirst("$ORIGINAL_PACKAGE.", "$newPackage."))
            }
        }
    }
}
