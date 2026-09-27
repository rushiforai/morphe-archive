package com.zeldrisho.patches.zalo.microg

import app.morphe.patcher.patch.resourcePatch
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO
import org.w3c.dom.Element

/** Injects package visibility and signature metadata, without duplicating existing entries. */
internal fun injectMicroGManifest(doc: org.w3c.dom.Document) {
    val manifest = doc.documentElement
    val app = doc.getElementsByTagName("application").item(0) as Element
    val queries = (0 until manifest.childNodes.length)
        .map { manifest.childNodes.item(it) }
        .filterIsInstance<Element>()
        .firstOrNull { it.tagName == "queries" }
        ?: doc.createElement("queries").also { manifest.appendChild(it) }
    if ((0 until queries.childNodes.length).none { index ->
            val node = queries.childNodes.item(index) as? Element
            node?.tagName == "package" && node.getAttribute("android:name") == MICROG_PACKAGE
        }
    ) {
        queries.appendChild(
            doc.createElement("package").apply { setAttribute("android:name", MICROG_PACKAGE) },
        )
    }
    if ((0 until app.childNodes.length).none { index ->
            val node = app.childNodes.item(index) as? Element
            node?.tagName == "meta-data" &&
                node.getAttribute("android:name") == "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE"
        }
    ) {
        app.appendChild(
            doc.createElement("meta-data").apply {
                setAttribute("android:name", "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE")
                setAttribute("android:value", STOCK_VNG_CERT_HEX)
            },
        )
    }
}

/** Injects microG certificate metadata and package visibility into the manifest. */
val zaloMicroGManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        document("AndroidManifest.xml").use(::injectMicroGManifest)
    }
}
