package app.template.patches.joplin.fontswap

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

private const val NS = "http://schemas.android.com/apk/res/android"
private const val SETTINGS = "app.fontism.extension.joplin.JoplinFontSettingsActivity"
private const val PROVIDER = "app.fontism.extension.joplin.JoplinFontBridgeProvider"

internal val joplinFontSettingsResourcesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0)
                ?: throw PatchException("Joplin application element not found")
            val provider = manifest.createElement("provider").apply {
                setAttributeNS(NS, "android:name", PROVIDER)
                setAttributeNS(NS, "android:authorities", "net.cozic.joplin.morphe.font")
                setAttributeNS(NS, "android:exported", "false")
                setAttributeNS(NS, "android:initOrder", "100")
            }
            application.appendChild(provider)
            val activity = manifest.createElement("activity").apply {
                setAttributeNS(NS, "android:name", SETTINGS)
                setAttributeNS(NS, "android:exported", "true")
                setAttributeNS(NS, "android:label", "Joplin font")
                setAttributeNS(NS, "android:theme", "@android:style/Theme.Material.NoActionBar")
            }
            val filter = manifest.createElement("intent-filter")
            filter.appendChild(manifest.createElement("action").apply { setAttributeNS(NS, "android:name", "android.intent.action.VIEW") })
            filter.appendChild(manifest.createElement("category").apply { setAttributeNS(NS, "android:name", "android.intent.category.DEFAULT") })
            filter.appendChild(manifest.createElement("data").apply {
                setAttributeNS(NS, "android:scheme", "joplin-font")
                setAttributeNS(NS, "android:host", "settings")
            })
            activity.appendChild(filter)
            application.appendChild(activity)
        }
    }
}
