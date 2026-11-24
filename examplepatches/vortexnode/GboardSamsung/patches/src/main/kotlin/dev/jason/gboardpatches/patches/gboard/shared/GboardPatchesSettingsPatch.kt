package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.PublicXmlManager
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Document
import org.w3c.dom.Element

internal val gboardPatchesSettingsPatch = resourcePatch(
    description = "在 Gboard 設定底部加入 Patches 入口。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardPatchesPreviewAssetsPatch
    )

    finalize {
        applyPatchesSettingsPatch()
        applyGboardSpellCheckerLabel()
    }
}

context(context: ResourcePatchContext)
private fun applyPatchesSettingsPatch() = with(context) {
    ensureLocalizedPatchesEntryTitleResources()
    document("AndroidManifest.xml").use { manifestDocument ->
        document(GBOARD_SETTINGS_XML_PATHS[0]).use { settingsDocument ->
            document(GBOARD_SETTINGS_XML_PATHS[1]).use { legacySettingsDocument ->
                applyGboardPatchesSettings(
                    manifestDocument = manifestDocument,
                    settingsDocuments = listOf(settingsDocument, legacySettingsDocument),
                    entryTitle = PATCHES_SETTINGS_ENTRY_TITLE_REF,
                )
            }
        }
    }
}

context(context: ResourcePatchContext)
private fun ensureLocalizedPatchesEntryTitleResources() = with(context) {
    runCatching { decode(VALUES_STRINGS_PATH) }
    runCatching { decode(VALUES_RU_STRINGS_PATH) }

    document(VALUES_STRINGS_PATH).use { defaultStrings ->
        upsertStringResource(
            document = defaultStrings,
            name = PATCHES_SETTINGS_ENTRY_TITLE_RESOURCE,
            value = PATCHES_SETTINGS_ENTRY_TITLE,
        )
    }

    val ruStringsFile = this[VALUES_RU_STRINGS_PATH, false]
    if (!ruStringsFile.isFile) {
        val parent = ruStringsFile.parentFile
        check(parent != null && (parent.isDirectory || parent.mkdirs())) {
            "Could not create resource directory for ${ruStringsFile.path}"
        }
        ruStringsFile.writeText(EMPTY_RESOURCES_XML, Charsets.UTF_8)
    }
    document(VALUES_RU_STRINGS_PATH).use { ruStrings ->
        upsertStringResource(
            document = ruStrings,
            name = PATCHES_SETTINGS_ENTRY_TITLE_RESOURCE,
            value = PATCHES_SETTINGS_ENTRY_TITLE_RU,
        )
    }

    PublicXmlManager(this["res/values/public.xml"]).use { publicIds ->
        publicIds.createPublicId("string", PATCHES_SETTINGS_ENTRY_TITLE_RESOURCE)
    }
}

internal fun upsertStringResource(
    document: Document,
    name: String,
    value: String,
) {
    val resources = document.documentElement
    check(resources != null && resources.tagName == "resources") {
        "Expected <resources> root element in strings.xml"
    }
    val existing = resources.childElements("string").firstOrNull { element ->
        element.getAttribute("name") == name
    }
    val stringElement = existing ?: document.createElement("string").also { created ->
        created.setAttribute("name", name)
        resources.appendChild(created)
    }
    stringElement.textContent = value
}

internal fun applyGboardPatchesSettings(
    manifestDocument: Document,
    settingsDocuments: List<Document>,
    entryTitle: String = PATCHES_SETTINGS_ENTRY_TITLE,
) {
    require(settingsDocuments.size == GBOARD_SETTINGS_XML_PATHS.size) {
        "Expected both Gboard settings documents"
    }

    val manifest = manifestDocument.documentElement
    val application = manifest.childElements("application").firstOrNull()
        ?: error("Could not find application element in AndroidManifest.xml")
    val packageName = manifest.getAttribute("package")

    val activity = application.childElements("activity").firstOrNull {
        it.getAttributeNS(ANDROID_NS, "name") == GBOARD_PATCHES_SETTINGS_ACTIVITY_CLASS ||
            it.getAttribute("android:name") == GBOARD_PATCHES_SETTINGS_ACTIVITY_CLASS
    } ?: manifestDocument.createElement("activity").also { createdActivity ->
        application.appendChild(createdActivity)
    }

    activity.setAndroidAttribute("name", GBOARD_PATCHES_SETTINGS_ACTIVITY_CLASS)
    if (activity.androidAttribute("exported").isNullOrBlank()) {
        activity.setAndroidAttribute("exported", "false")
    }

    val provider = application.childElements("provider").firstOrNull {
        it.getAttributeNS(ANDROID_NS, "name") == GBOARD_PATCHES_SETTINGS_PROVIDER_CLASS ||
            it.getAttribute("android:name") == GBOARD_PATCHES_SETTINGS_PROVIDER_CLASS
    } ?: manifestDocument.createElement("provider").also { createdProvider ->
        application.appendChild(createdProvider)
    }

    provider.setAndroidAttribute("name", GBOARD_PATCHES_SETTINGS_PROVIDER_CLASS)
    provider.setAndroidAttribute(
        "authorities",
        packageName + GBOARD_PATCHES_SETTINGS_PROVIDER_AUTHORITY_SUFFIX,
    )
    provider.setAndroidAttribute("exported", "false")

    settingsDocuments.forEach { document ->
        val root = document.documentElement
        val candidateEntries = root.childElements().flatMap { parent ->
            if (parent.tagName == "androidx.preference.PreferenceCategory") {
                parent.childElements()
            } else {
                sequenceOf(parent)
            }
        }.toList()
        val footerPreference = root.childElements().firstOrNull {
            it.tagName == "com.android.settingslib.widget.FooterPreference"
        }
        val targetCategory = root.childElements("androidx.preference.PreferenceCategory").lastOrNull()
        val rateUsPreference = candidateEntries.firstOrNull {
            it.tagName == RATE_US_PREFERENCE_TAG
        }
        val iconValue = rateUsPreference?.androidAttribute("icon")
        val existingEntry = candidateEntries.firstOrNull {
            it.androidAttribute("key") == PATCHES_SETTINGS_ENTRY_KEY
        }
        val patchesEntry = existingEntry?.takeIf { it.tagName == HEADER_PREFERENCE_TAG }
            ?: document.createElement(HEADER_PREFERENCE_TAG).also { createdPreference ->
                if (existingEntry != null) {
                    existingEntry.parentNode.replaceChild(createdPreference, existingEntry)
                } else if (targetCategory != null) {
                    targetCategory.appendChild(createdPreference)
                } else if (footerPreference != null) {
                    root.insertBefore(createdPreference, footerPreference)
                } else {
                    root.appendChild(createdPreference)
                }
            }

        patchesEntry.setAndroidAttribute("persistent", "false")
        patchesEntry.setAndroidAttribute("title", entryTitle)
        patchesEntry.setAndroidAttribute("selectable", "true")
        patchesEntry.setAndroidAttribute("key", PATCHES_SETTINGS_ENTRY_KEY)
        patchesEntry.removeAndroidAttribute("summary")
        if (!iconValue.isNullOrBlank()) {
            patchesEntry.setAndroidAttribute("icon", iconValue)
        }

        val intent = patchesEntry.childElements("intent").firstOrNull()
            ?: document.createElement("intent").also { createdIntent ->
                patchesEntry.appendChild(createdIntent)
            }
        intent.setAndroidAttribute("action", "android.intent.action.MAIN")
        intent.setAndroidAttribute("targetPackage", packageName)
        intent.setAndroidAttribute("targetClass", GBOARD_PATCHES_SETTINGS_ACTIVITY_CLASS)

        if (targetCategory != null && patchesEntry.parentNode != targetCategory) {
            patchesEntry.parentNode?.removeChild(patchesEntry)
            targetCategory.appendChild(patchesEntry)
        } else if (targetCategory == null && footerPreference != null &&
            patchesEntry.parentNode != root
        ) {
            patchesEntry.parentNode?.removeChild(patchesEntry)
            root.insertBefore(patchesEntry, footerPreference)
        }
    }
}

private fun Element.androidAttribute(localName: String): String? {
    val namespaced = getAttributeNS(ANDROID_NS, localName)
    if (namespaced.isNotBlank()) {
        return namespaced
    }
    return getAttribute("android:$localName").takeIf { it.isNotBlank() }
}

private fun Element.removeAndroidAttribute(localName: String) {
    removeAttributeNS(ANDROID_NS, localName)
    removeAttribute("android:$localName")
}

private fun Element.setAndroidAttribute(localName: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$localName", value)
}

internal const val GBOARD_PATCHES_SETTINGS_ACTIVITY_CLASS =
    "dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsActivity"
internal const val GBOARD_PATCHES_SETTINGS_PROVIDER_CLASS =
    "dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsProvider"
internal const val GBOARD_PATCHES_SETTINGS_PROVIDER_AUTHORITY_SUFFIX = ".gboard_patches"
private const val PATCHES_SETTINGS_ENTRY_KEY = "gboard_patches_entry"
private const val PATCHES_SETTINGS_ENTRY_TITLE = "Patches"
private const val PATCHES_SETTINGS_ENTRY_TITLE_RU = "Патчи"
internal const val PATCHES_SETTINGS_ENTRY_TITLE_RESOURCE = "gboard_patches_settings_entry_title"
internal const val PATCHES_SETTINGS_ENTRY_TITLE_REF = "@string/$PATCHES_SETTINGS_ENTRY_TITLE_RESOURCE"
private const val VALUES_STRINGS_PATH = "res/values/strings.xml"
private const val VALUES_RU_STRINGS_PATH = "res/values-ru/strings.xml"
private const val EMPTY_RESOURCES_XML =
    "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources/>\n"
private const val HEADER_PREFERENCE_TAG =
    "com.google.android.libraries.inputmethod.settings.widget.HeaderPreference"
private const val RATE_US_PREFERENCE_TAG =
    "com.google.android.libraries.inputmethod.rateus.RateUsPreference"
internal val GBOARD_SETTINGS_XML_PATHS = listOf(
    "res/xml/settings.xml",
    "res/xml/settings_legacy.xml",
)
