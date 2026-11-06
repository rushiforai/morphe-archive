package app.quetta.patches

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val QUERY_ALL_PACKAGES = "android.permission.QUERY_ALL_PACKAGES"
private const val CLEARTEXT = "cleartextTrafficPermitted"

/** Resolve the manifest's networkSecurityConfig reference to a decoded resource path. */
private fun networkSecurityConfigPath(document: Document): String? {
    val application = document.getElementsByTagName("application").item(0) as? Element ?: return null
    val reference = application.getAttribute("android:networkSecurityConfig")
    if (!reference.startsWith("@xml/")) return null
    return "res/xml/${reference.removePrefix("@xml/").removeSuffix(".xml")}.xml"
}

/** Flip every explicit cleartext permission below [tag], including domain-specific overrides. */
private fun disableCleartext(document: Document, tag: String): Int {
    val nodes = document.getElementsByTagName(tag)
    var flipped = 0
    for (index in 0 until nodes.length) {
        val element = nodes.item(index) as? Element ?: continue
        if (element.getAttribute(CLEARTEXT).equals("true", ignoreCase = true)) {
            element.setAttribute(CLEARTEXT, "false")
            flipped++
        }
    }
    return flipped
}

/** Drop every trust anchor that accepts user-installed certificates, at any depth. */
private fun dropUserTrustAnchors(document: Document): Int {
    val nodes = document.getElementsByTagName("certificates")
    val targets = mutableListOf<Element>()
    for (index in 0 until nodes.length) {
        val anchor = nodes.item(index) as? Element ?: continue
        if (anchor.getAttribute("src").equals("user", ignoreCase = true)) targets += anchor
    }
    targets.forEach { it.parentNode?.removeChild(it) }
    return targets.size
}

@Suppress("unused")
val quettaNetworkSecurityPatch = resourcePatch(
    name = "Harden network security config",
    description = "Disables cleartext traffic in base and domain configurations and drops trust in " +
        "user-installed CAs.",
    default = false
) {
    compatibleWith(COMPATIBILITY_QUETTA, COMPATIBILITY_QUETTA_OFFICIAL)

    execute {
        var path: String? = null
        document("AndroidManifest.xml").use { path = networkSecurityConfigPath(it) }
        val configPath = path ?: throw PatchException("no android:networkSecurityConfig in the manifest")

        document(configPath).use { document ->
            val disabled = disableCleartext(document, "base-config") + disableCleartext(document, "domain-config")
            val anchors = dropUserTrustAnchors(document)
            if (disabled == 0 && anchors == 0) {
                println("$configPath already hardened, nothing to change")
            }
        }
    }
}

@Suppress("unused")
val quettaRemoveQueryAllPackagesPatch = resourcePatch(
    name = "Remove QUERY_ALL_PACKAGES",
    description = "Drops android.permission.QUERY_ALL_PACKAGES from the manifest. " +
        "May degrade installed-app detection.",
    default = false
) {
    compatibleWith(COMPATIBILITY_QUETTA, COMPATIBILITY_QUETTA_OFFICIAL)

    execute {
        document("AndroidManifest.xml").use { document ->
            val nodes = document.getElementsByTagName("uses-permission")
            val targets = mutableListOf<Element>()
            for (index in 0 until nodes.length) {
                val node = nodes.item(index) as? Element ?: continue
                if (node.getAttribute("android:name") == QUERY_ALL_PACKAGES) targets += node
            }
            if (targets.isEmpty()) throw PatchException("$QUERY_ALL_PACKAGES not declared")
            targets.forEach { it.parentNode?.removeChild(it) }
        }
    }
}
