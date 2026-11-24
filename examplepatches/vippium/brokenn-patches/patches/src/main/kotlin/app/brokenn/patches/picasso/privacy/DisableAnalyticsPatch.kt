package app.brokenn.patches.picasso.privacy

import app.brokenn.patches.picasso.shared.Constants.COMPATIBILITY_PICASSO
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// Firebase reads both switches before it queues anything, so they turn collection off
// at the source without touching login, which runs on Firebase Auth.
private val FIREBASE_SWITCHES = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
)

@Suppress("unused")
val disableAnalyticsPatch = resourcePatch(
    name = "Disable analytics",
    description = "Turns off Firebase Analytics collection and Crashlytics reporting.",
) {
    compatibleWith(COMPATIBILITY_PICASSO)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.documentElement
                .getElementsByTagName("application").item(0) as? Element
                ?: throw IllegalStateException("No <application> in manifest")

            val existing = application.getElementsByTagName("meta-data")
            for (index in 0 until existing.length) {
                val meta = existing.item(index) as? Element ?: continue
                val name = meta.getAttribute("android:name")
                val value = FIREBASE_SWITCHES[name] ?: continue
                meta.setAttribute("android:value", value)
            }

            val declared = (0 until application.getElementsByTagName("meta-data").length)
                .mapNotNull { application.getElementsByTagName("meta-data").item(it) as? Element }
                .map { it.getAttribute("android:name") }
                .toSet()

            for ((name, value) in FIREBASE_SWITCHES) {
                if (name in declared) continue
                val meta = manifest.createElement("meta-data")
                meta.setAttribute("android:name", name)
                meta.setAttribute("android:value", value)
                application.appendChild(meta)
            }
        }
    }
}
