package com.zeldrisho.patches.shared.resources

import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Sets the application label and, when present, the matching launcher activity label.
 *
 * @throws IllegalStateException when the manifest has no `<application>` element.
 */
fun rewriteAppLabel(document: Document, newName: String, launcherActivity: String) {
    val application = document.getElementsByTagName("application").item(0) as? Element
        ?: error("AndroidManifest.xml has no <application> element")
    application.setAttribute("android:label", newName)
    val activities = document.getElementsByTagName("activity")
    for (i in 0 until activities.length) {
        val activity = activities.item(i) as Element
        if (activity.getAttribute("android:name") == launcherActivity) {
            activity.setAttribute("android:label", newName)
        }
    }
}
