package com.zeldrisho.patches.threads.misc.branding

import com.zeldrisho.patches.shared.resources.rewriteAppLabel
import org.w3c.dom.Document

const val LAUNCHER_ACTIVITY = "com.instagram.barcelona.mainactivity.BarcelonaActivity"

/**
 * Sets the Threads application label and, when present, its launcher activity label.
 *
 * @throws IllegalStateException when the manifest has no `<application>` element.
 */
fun applyAppName(document: Document, newName: String, launcherActivity: String = LAUNCHER_ACTIVITY) {
    rewriteAppLabel(document, newName, launcherActivity)
}
