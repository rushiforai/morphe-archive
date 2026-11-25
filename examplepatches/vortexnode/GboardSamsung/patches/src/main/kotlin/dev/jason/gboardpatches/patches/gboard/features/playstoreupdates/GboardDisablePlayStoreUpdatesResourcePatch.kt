package dev.jason.gboardpatches.patches.gboard.features.playstoreupdates

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import org.w3c.dom.Document

internal const val MAX_PLAY_STORE_BLOCK_VERSION_CODE = Int.MAX_VALUE

internal val gboardDisablePlayStoreUpdatesResourcePatch = resourcePatch(
    description =
        "Set android:versionCode to the maximum allowed integer (2147483647) in AndroidManifest.xml " +
            "so Google Play Store stops offering updates for the installed package."
) {
    finalize {
        document("AndroidManifest.xml").use { manifest ->
            applyDisablePlayStoreUpdatesToManifest(manifest)
        }
    }
}

internal fun applyDisablePlayStoreUpdatesToManifest(manifestDocument: Document) {
    val manifest = manifestDocument.documentElement
        ?: error("AndroidManifest.xml is missing its root manifest element")
    check(manifest.tagName == "manifest") {
        "Expected root <manifest> element, found <${manifest.tagName}>"
    }
    manifest.setAttributeNS(
        ANDROID_NS,
        "android:versionCode",
        MAX_PLAY_STORE_BLOCK_VERSION_CODE.toString(),
    )
}
