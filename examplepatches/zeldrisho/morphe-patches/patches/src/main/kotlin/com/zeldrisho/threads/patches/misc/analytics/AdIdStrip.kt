package com.zeldrisho.threads.patches.misc.analytics

import org.w3c.dom.Document
import org.w3c.dom.Element

val AD_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
)

/**
 * Pure, unit-testable core of [removeAdIdPatch]'s `execute {}` block.
 * @return number of `<uses-permission>` nodes removed.
 */
fun stripAdIdPermissions(document: Document, targets: Set<String> = AD_ID_PERMISSIONS): Int {
    val permissionNodes = document.getElementsByTagName("uses-permission")
    val toRemove = ArrayList<Element>()
    for (i in 0 until permissionNodes.length) {
        val element = permissionNodes.item(i) as Element
        if (element.getAttribute("android:name") in targets) {
            toRemove.add(element)
        }
    }
    toRemove.forEach { it.parentNode.removeChild(it) }
    return toRemove.size
}
