package com.zeldrisho.patches.zalo.misc

import org.w3c.dom.Document
import org.w3c.dom.Element

const val ORIGINAL_ZALO_PACKAGE = "com.zing.zalo"
private const val LEGACY_ZALO_PERMISSION_PREFIX = "zing.zalo.permission."
private val PACKAGE_NAME_REGEX = Regex("^[a-z][\\w]*(\\.[a-z][\\w]*)+$")

/** Rewrites a Zalo-owned provider URI for the cloned package. */
fun rewriteZaloProviderUri(uri: String, newPackage: String): String = when (uri) {
    "content://$ORIGINAL_ZALO_PACKAGE.db.preferencesprovider" ->
        "content://$newPackage.db.preferencesprovider"

    "content://$ORIGINAL_ZALO_PACKAGE.provider.InternalProvider" ->
        "content://$newPackage.provider.InternalProvider"

    else -> uri
}

fun isValidZaloPackageName(name: String?): Boolean = name != null && PACKAGE_NAME_REGEX.matches(name)

/** Rewrites only package-owned manifest identities; third-party authorities remain unchanged. */
fun rewriteZaloPackage(document: Document, newPackage: String) {
    document.documentElement.setAttribute("package", newPackage)

    val providers = document.getElementsByTagName("provider")
    for (i in 0 until providers.length) {
        val provider = providers.item(i) as Element
        val authorities = provider.getAttribute("android:authorities")
        val rewritten = authorities.split(';').joinToString(";") { authority ->
            when {
                authority == ORIGINAL_ZALO_PACKAGE -> newPackage

                authority.startsWith("$ORIGINAL_ZALO_PACKAGE.") ->
                    authority.replaceFirst("$ORIGINAL_ZALO_PACKAGE.", "$newPackage.")

                else -> authority
            }
        }
        if (rewritten != authorities) provider.setAttribute("android:authorities", rewritten)
    }

    val ownedPrefix = "$ORIGINAL_ZALO_PACKAGE."
    val permissionNodes = sequenceOf("permission", "uses-permission")
        .flatMap { tag ->
            val nodes = document.getElementsByTagName(tag)
            (0 until nodes.length).asSequence().map { nodes.item(it) as Element }
        }
    permissionNodes.forEach { node ->
        val name = node.getAttribute("android:name")
        when {
            name.startsWith(ownedPrefix) ->
                node.setAttribute("android:name", name.replaceFirst(ownedPrefix, "$newPackage."))

            name.startsWith(LEGACY_ZALO_PERMISSION_PREFIX) ->
                node.setAttribute("android:name", name.replaceFirst(LEGACY_ZALO_PERMISSION_PREFIX, "$newPackage.permission."))
        }
    }

    val elements = document.getElementsByTagName("*")
    for (i in 0 until elements.length) {
        val element = elements.item(i) as Element
        val permission = element.getAttribute("android:permission")
        if (permission.startsWith(LEGACY_ZALO_PERMISSION_PREFIX)) {
            element.setAttribute(
                "android:permission",
                permission.replaceFirst(LEGACY_ZALO_PERMISSION_PREFIX, "$newPackage.permission."),
            )
        }
    }
}
