package com.zeldrisho.patches.zalo.misc

import com.zeldrisho.patches.shared.resources.rewriteAppLabel
import org.w3c.dom.Document

const val ZALO_LAUNCHER_ACTIVITY = "com.zing.zalo.ui.ZaloLauncherActivity"

/**
 * Sets the Zalo application label and, when present, its launcher activity label.
 *
 * @throws IllegalStateException when the manifest has no `<application>` element.
 */
fun applyZaloAppName(
    document: Document,
    newName: String,
    launcherActivity: String = ZALO_LAUNCHER_ACTIVITY,
) {
    rewriteAppLabel(document, newName, launcherActivity)
}
