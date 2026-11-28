package app.gboardnet.patches.networkguard

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.listDecodableFiles
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.util.logging.Logger

// Approach (preference entry in res/xml/settings*.xml with an <intent> to an activity added to
// the manifest) is adapted from jasonwu1994/Gboard-patches (GPLv3).

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val EXTENSION_JAVA_PACKAGE = "app.gboardnet.extension"
internal const val SETTINGS_ACTIVITY_CLASS = "$EXTENSION_JAVA_PACKAGE.NetworkGuardSettingsActivity"
internal const val INIT_PROVIDER_CLASS = "$EXTENSION_JAVA_PACKAGE.NetworkGuardInitProvider"
private const val ENTRY_KEY = "gboardnet_network_guard_entry"
private const val ENTRY_TITLE = "Network access"
private const val ENTRY_SUMMARY = "Block internet access except for allowed hosts"
private const val FALLBACK_PREFERENCE_TAG = "androidx.preference.Preference"

private val SETTINGS_XML_CANDIDATES = listOf(
    "res/xml/settings.xml",
    "res/xml/settings_legacy.xml",
)

internal fun addSettingsEntry() {
    val logger = Logger.getLogger("NetworkGuardPatch")

    val packageName = document("AndroidManifest.xml").use { manifest ->
        registerComponents(manifest)
    }

    val available = runCatching { listDecodableFiles("res/xml/**").toSet() }.getOrDefault(emptySet())
    var added = 0
    SETTINGS_XML_CANDIDATES.forEach { path ->
        val result = runCatching {
            document(path).use { addPreference(it, packageName) }
        }
        if (result.isSuccess) {
            added++
            logger.info("Network guard: added settings entry to $path")
        } else if (path in available) {
            throw PatchException("Network guard: could not edit $path", result.exceptionOrNull())
        }
    }
    if (added == 0) {
        throw PatchException(
            "Network guard: Gboard settings XML (" + SETTINGS_XML_CANDIDATES.joinToString() + ") not found, " +
                "so the 'Network access' settings entry cannot be added.",
        )
    }
}

/** Adds the settings activity and the init provider. Returns the manifest package name. */
private fun registerComponents(manifest: Document): String {
    val root = manifest.documentElement
    val packageName = root.getAttribute("package")
    val application = root.children("application").firstOrNull()
        ?: error("No <application> in AndroidManifest.xml")

    application.findOrCreate(manifest, "activity", SETTINGS_ACTIVITY_CLASS).apply {
        setAndroid("exported", "false")
        setAndroid("label", ENTRY_TITLE)
        setAndroid("excludeFromRecents", "false")
    }

    application.findOrCreate(manifest, "provider", INIT_PROVIDER_CLASS).apply {
        setAndroid("authorities", "$packageName.gboardnet_network_guard")
        setAndroid("exported", "false")
        // Gboard runs before the device is unlocked; initialise the guard there too.
        setAndroid("directBootAware", "true")
        setAndroid("initOrder", "1000")
    }

    return packageName
}

private fun addPreference(document: Document, packageName: String) {
    val root = document.documentElement
    val all = root.descendants()

    if (all.any { it.android("key") == ENTRY_KEY }) return

    // Reuse the tag Gboard uses for its own top level entries so the row is styled like the others.
    val tag = all.firstOrNull { it.tagName.endsWith(".HeaderPreference") }?.tagName
        ?: FALLBACK_PREFERENCE_TAG

    val entry = document.createElement(tag).apply {
        setAndroid("key", ENTRY_KEY)
        setAndroid("title", ENTRY_TITLE)
        setAndroid("summary", ENTRY_SUMMARY)
        setAndroid("persistent", "false")
        setAndroid("selectable", "true")
        appendChild(
            document.createElement("intent").apply {
                setAndroid("action", "android.intent.action.MAIN")
                setAndroid("targetPackage", packageName)
                setAndroid("targetClass", SETTINGS_ACTIVITY_CLASS)
            },
        )
    }

    // Copy the icon of a sibling entry, if any, so the row lines up with the others.
    all.firstOrNull { it.tagName == tag && !it.android("icon").isNullOrBlank() }
        ?.android("icon")?.let { entry.setAndroid("icon", it) }

    val lastCategory = root.children().lastOrNull { it.tagName.endsWith("PreferenceCategory") }
    val footer = root.children().firstOrNull { it.tagName.endsWith("FooterPreference") }
    when {
        lastCategory != null -> lastCategory.appendChild(entry)
        footer != null -> root.insertBefore(entry, footer)
        else -> root.appendChild(entry)
    }
}

// region DOM helpers

private fun Element.children(tag: String? = null): List<Element> {
    val result = mutableListOf<Element>()
    val nodes = childNodes
    for (i in 0 until nodes.length) {
        val node = nodes.item(i)
        if (node is Element && (tag == null || node.tagName == tag)) result += node
    }
    return result
}

private fun Element.descendants(): List<Element> =
    children().flatMap { listOf(it) + it.descendants() }

private fun Element.android(name: String): String? =
    getAttributeNS(ANDROID_NS, name).takeIf { it.isNotBlank() }
        ?: getAttribute("android:$name").takeIf { it.isNotBlank() }

private fun Element.setAndroid(name: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$name", value)
}

private fun Element.findOrCreate(document: Document, tag: String, className: String): Element =
    children(tag).firstOrNull { it.android("name") == className }
        ?: document.createElement(tag).also {
            it.setAndroid("name", className)
            appendChild(it)
        }

// endregion
