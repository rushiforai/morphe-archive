package app.template.patches.notesnook.fontswap

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

private const val NS = "http://schemas.android.com/apk/res/android"
private const val RUNTIME = "app.fontism.extension.notesnook"
private const val STYLESHEET =
    """<link id="morphe-font-link" rel="stylesheet" href="https://morphe-font.invalid/notesnook.css"/>"""

/**
 * Registers the startup provider and the font settings screen, and makes the
 * bundled editor pages load the font stylesheet before first paint.
 */
internal val notesnookFontResourcesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val application = manifest.getElementsByTagName("application").item(0)
                ?: throw PatchException("Notesnook application element not found")
            // Device font apps (Samsung FlipFont, Galaxy Store fonts) are invisible
            // to package queries on Android 11+ without this.
            val permissions = manifest.getElementsByTagName("uses-permission")
            val hasQuery = (0 until permissions.length).any {
                (permissions.item(it) as org.w3c.dom.Element).getAttributeNS(NS, "name") ==
                    "android.permission.QUERY_ALL_PACKAGES"
            }
            if (!hasQuery) root.insertBefore(manifest.createElement("uses-permission").apply {
                setAttributeNS(NS, "android:name", "android.permission.QUERY_ALL_PACKAGES")
            }, application)

            application.appendChild(manifest.createElement("provider").apply {
                setAttributeNS(NS, "android:name", "$RUNTIME.NotesnookFontProvider")
                setAttributeNS(NS, "android:authorities", "com.streetwriters.notesnook.morphe.font")
                setAttributeNS(NS, "android:exported", "false")
                setAttributeNS(NS, "android:initOrder", "1000")
            })
            val activity = manifest.createElement("activity").apply {
                setAttributeNS(NS, "android:name", "$RUNTIME.NotesnookFontSettingsActivity")
                setAttributeNS(NS, "android:exported", "true")
                setAttributeNS(NS, "android:label", "Notesnook font")
                setAttributeNS(NS, "android:theme", "@android:style/Theme.Material.NoActionBar")
            }
            fun filter(action: String, category: String?, scheme: String? = null) =
                manifest.createElement("intent-filter").apply {
                    appendChild(manifest.createElement("action").apply { setAttributeNS(NS, "android:name", action) })
                    if (category != null) appendChild(manifest.createElement("category").apply {
                        setAttributeNS(NS, "android:name", category)
                    })
                    if (scheme != null) appendChild(manifest.createElement("data").apply {
                        setAttributeNS(NS, "android:scheme", scheme)
                        setAttributeNS(NS, "android:host", "settings")
                    })
                }
            // Gear icon on Android's App info screen.
            activity.appendChild(filter("android.intent.action.APPLICATION_PREFERENCES", "android.intent.category.DEFAULT"))
            activity.appendChild(filter("android.intent.action.VIEW", "android.intent.category.DEFAULT", "notesnook-font"))
            application.appendChild(activity)
        }

        // Render-blocking stylesheet in <head>: the editor's first paint already
        // uses the selected font (served by NotesnookFontRequests, empty when off).
        listOf("index.html", "plaineditor.html").forEach { name ->
            val page = get("assets/$name")
            if (!page.isFile) {
                if (name == "index.html") throw PatchException("Notesnook editor page assets/$name not found")
                return@forEach
            }
            val html = page.readText()
            if (html.contains("morphe-font-link")) return@forEach
            if (html.split("</head>").size != 2) throw PatchException("Unsupported editor page layout: $name")
            page.writeText(html.replace("</head>", "$STYLESHEET</head>"))
        }
    }
}
