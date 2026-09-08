package com.zeldrisho.threads.patches.misc.branding

import org.w3c.dom.Document
import org.w3c.dom.Element

const val LAUNCHER_ACTIVITY = "com.instagram.barcelona.mainactivity.BarcelonaActivity"

/**
 * Pure, unit-testable core of [changeAppNamePatch]'s `execute {}` block.
 * Throws [IllegalStateException] when the manifest has no `<application>` so
 * failures are explicit instead of an NPE inside the patcher.
 */
fun applyAppName(document: Document, newName: String, launcherActivity: String = LAUNCHER_ACTIVITY) {
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
