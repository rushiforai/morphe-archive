package dev.jason.gboardpatches.patches.gboard.features.developeroptions

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.PublicXmlManager
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import dev.jason.gboardpatches.patches.gboard.shared.upsertStringResource
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Document
import org.w3c.dom.Element

internal val gboardDeveloperOptionsFeatureMarkerPatch = resourcePatch(
    description = "標記 Developer options feature 已被打入 target APK"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(DEVELOPER_OPTIONS_FEATURE_MARKER_NAME)
        ensurePackageQueries()
        localizeDeveloperOptionsScreen()
    }
}

context(context: ResourcePatchContext)
private fun ensurePackageQueries() = with(context) {
    document("AndroidManifest.xml").use { document ->
        val manifest = document.documentElement
        val queries = manifest.childElements("queries").firstOrNull()
            ?: document.createElement("queries").also { createdQueries ->
                val application = manifest.childElements("application").firstOrNull()
                if (application == null) {
                    manifest.appendChild(createdQueries)
                } else {
                    manifest.insertBefore(createdQueries, application)
                }
            }

        SUPPORTED_GBOARD_PACKAGES.forEach { packageName ->
            val packageQuery = queries.childElements("package").firstOrNull {
                it.androidAttribute("name") == packageName
            } ?: document.createElement("package").also { createdPackage ->
                queries.appendChild(createdPackage)
            }
            packageQuery.setAndroidAttribute("name", packageName)
        }
    }
}

context(context: ResourcePatchContext)
private fun localizeDeveloperOptionsScreen() = with(context) {
    runCatching { decode(DEVELOPER_XML_PATH) }
    val devXmlFile = this[DEVELOPER_XML_PATH, false]
    if (!devXmlFile.isFile) {
        return@with
    }

    runCatching { decode(VALUES_STRINGS_PATH) }
    runCatching { decode(VALUES_RU_STRINGS_PATH) }

    document(VALUES_STRINGS_PATH).use { defaultStrings ->
        ALL_LOCALIZED_STRINGS.forEach { entry ->
            upsertStringResource(defaultStrings, entry.resName, entry.en)
        }
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
        ALL_LOCALIZED_STRINGS.forEach { entry ->
            upsertStringResource(ruStrings, entry.resName, entry.ru)
        }
    }

    PublicXmlManager(this["res/values/public.xml"]).use { publicIds ->
        ALL_LOCALIZED_STRINGS.forEach { entry ->
            publicIds.createPublicId("string", entry.resName)
        }
    }

    document(DEVELOPER_XML_PATH).use { devDocument ->
        applyDeveloperOptionsStringRefs(devDocument)
    }
}

internal fun applyDeveloperOptionsStringRefs(document: Document) {
    val root = document.documentElement ?: return
    applyStringRefsToElementTree(root)
}

private fun applyStringRefsToElementTree(element: Element) {
    if (element.androidAttribute("fragment") == FLAG_EDITOR_FRAGMENT_CLASS) {
        element.setAndroidAttribute("title", "@string/${STR_FLAG_EDITOR.resName}")
    }

    if (element.tagName == PREFERENCE_CATEGORY_TAG) {
        val children = element.childElements().toList()
        val isPkSuggestionsCategory = children.any { child ->
            child.androidAttribute("title") == STR_PK_RECENT_TITLE.en
        }
        if (isPkSuggestionsCategory) {
            element.setAndroidAttribute("title", "@string/${STR_PK_CATEGORY.resName}")
            children.firstOrNull { child ->
                child.tagName == SWITCH_PREFERENCE_TAG &&
                    child.androidAttribute("title")?.startsWith("@string/") == true
            }?.let { firstPkToggle ->
                firstPkToggle.setAndroidAttribute("title", "@string/${STR_PK_MINIMIZED_TITLE.resName}")
                firstPkToggle.setAndroidAttribute("summary", "@string/${STR_PK_MINIMIZED_SUMMARY.resName}")
            }
        }
    }

    element.androidAttribute("title")?.let { title ->
        TITLE_BY_EN[title]?.let { entry ->
            element.setAndroidAttribute("title", "@string/${entry.resName}")
        }
    }
    element.androidAttribute("summary")?.let { summary ->
        if (summary == PK_RECENT_SUMMARY_RAW_EN) {
            element.setAndroidAttribute("summary", "@string/${STR_PK_RECENT_SUMMARY.resName}")
        }
    }

    for (child in element.childElements()) {
        applyStringRefsToElementTree(child)
    }
}

private fun Element.androidAttribute(localName: String): String? {
    val namespaced = getAttributeNS(ANDROID_NS, localName)
    if (namespaced.isNotBlank()) {
        return namespaced
    }
    return getAttribute("android:$localName").takeIf { it.isNotBlank() }
}

private fun Element.setAndroidAttribute(localName: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$localName", value)
}

private data class LocalizedString(
    val resName: String,
    val en: String,
    val ru: String,
)

private const val DEVELOPER_OPTIONS_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.developer_options"
private const val DEVELOPER_XML_PATH = "res/xml/setting_developer.xml"
private const val VALUES_STRINGS_PATH = "res/values/strings.xml"
private const val VALUES_RU_STRINGS_PATH = "res/values-ru/strings.xml"
private const val EMPTY_RESOURCES_XML =
    "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources/>\n"
private const val FLAG_EDITOR_FRAGMENT_CLASS =
    "com.google.android.libraries.inputmethod.flag.preference.FlagEditorFragment"
private const val PREFERENCE_CATEGORY_TAG = "androidx.preference.PreferenceCategory"
private const val SWITCH_PREFERENCE_TAG = "SwitchPreferenceCompat"

private const val PK_RECENT_SUMMARY_RAW_EN =
    "Toggle on = Suggestions while editing a recently autocorrected word are shown on the toolbar and at the cursor\n" +
        "Toggle off = Suggestions while editing a recently autocorrected word are shown on the toolbar"

private val STR_FLAG_EDITOR = LocalizedString(
    "gboard_patches_dev_flag_editor",
    "Flag Editor",
    "Редактор флагов",
)
private val STR_PK_CATEGORY = LocalizedString(
    "gboard_patches_dev_pk_suggestions",
    "PK Suggestions",
    "Подсказки физической клавиатуры",
)
private val STR_PK_MINIMIZED_TITLE = LocalizedString(
    "gboard_patches_dev_pk_minimized_title",
    "Autocorrect suggestions shown at the cursor when toolbar is minimized",
    "Показывать автоисправление у курсора при свёрнутой панели",
)
private val STR_PK_MINIMIZED_SUMMARY = LocalizedString(
    "gboard_patches_dev_pk_minimized_summary",
    "Toggle on = Autocorrect suggestions are shown on the toolbar and at the cursor when toolbar is minimized\\n" +
        "Toggle off = Autocorrect suggestions are shown on the toolbar",
    "Вкл. = подсказки автоисправления показываются на панели и у курсора при свёрнутой панели\\n" +
        "Выкл. = подсказки автоисправления показываются только на панели",
)
private val STR_PK_RECENT_TITLE = LocalizedString(
    "gboard_patches_dev_pk_recent_title",
    "Suggestions while editing a recently autocorrected word shown at the cursor",
    "Показывать подсказки у курсора при правке исправленного слова",
)
private val STR_PK_RECENT_SUMMARY = LocalizedString(
    "gboard_patches_dev_pk_recent_summary",
    "Toggle on = Suggestions while editing a recently autocorrected word are shown on the toolbar and at the cursor\\n" +
        "Toggle off = Suggestions while editing a recently autocorrected word are shown on the toolbar",
    "Вкл. = подсказки при правке недавно исправленного слова показываются на панели и у курсора\\n" +
        "Выкл. = подсказки при правке недавно исправленного слова показываются только на панели",
)

private val TITLE_LOCALIZED_STRINGS = listOf(
    STR_PK_RECENT_TITLE,
    LocalizedString("gboard_patches_dev_japanese", "Japanese", "Японский"),
    LocalizedString(
        "gboard_patches_dev_mozc_log",
        "Mozc decoder verbose log level",
        "Уровень подробного лога декодера Mozc",
    ),
    LocalizedString("gboard_patches_dev_stylus", "Stylus", "Стилус"),
    LocalizedString(
        "gboard_patches_dev_stylus_low_latency",
        "Use low latency library to render strokes",
        "Отрисовка штрихов с низкой задержкой",
    ),
    LocalizedString(
        "gboard_patches_dev_insert_timeout",
        "Insert mode timeout",
        "Тайм-аут режима вставки",
    ),
    LocalizedString(
        "gboard_patches_dev_scribe_words",
        "Scribe partial commit word number",
        "Количество слов для частичной фиксации Scribe",
    ),
    LocalizedString(
        "gboard_patches_dev_word_delete",
        "Use word level delete when the gesture is longer than X times of line height",
        "Удалять слово целиком при жесте длиннее X высот строки",
    ),
    LocalizedString(
        "gboard_patches_dev_pk_orientation_tooltip",
        "Always show PK toolbar orientation change tooltip",
        "Всегда показывать подсказку смены ориентации панели физ. клавиатуры",
    ),
    LocalizedString(
        "gboard_patches_dev_toolbar_drag_tooltip",
        "Always toolbar dragging tooltip",
        "Всегда показывать подсказку перетаскивания панели",
    ),
    LocalizedString(
        "gboard_patches_dev_gen_ai",
        "Gen AI text input",
        "Генеративный ИИ для текста",
    ),
    LocalizedString(
        "gboard_patches_dev_word_revert",
        "Word-by-word revert",
        "Пословный откат",
    ),
    LocalizedString(
        "gboard_patches_dev_text_stylization",
        "Text Stylization",
        "Стилизация текста",
    ),
    LocalizedString(
        "gboard_patches_dev_crash_recovery",
        "Crash recovery",
        "Восстановление после сбоя",
    ),
    LocalizedString(
        "gboard_patches_dev_clean_flag",
        "Clean flag when crash recovery is enabled",
        "Сбрасывать флаги при восстановлении после сбоя",
    ),
)

private val TITLE_BY_EN = TITLE_LOCALIZED_STRINGS.associateBy { it.en }

private val ALL_LOCALIZED_STRINGS = listOf(
    STR_FLAG_EDITOR,
    STR_PK_CATEGORY,
    STR_PK_MINIMIZED_TITLE,
    STR_PK_MINIMIZED_SUMMARY,
    STR_PK_RECENT_SUMMARY,
) + TITLE_LOCALIZED_STRINGS

private val SUPPORTED_GBOARD_PACKAGES = listOf(
    "com.google.android.inputmethod.latin",
    "gboardsamsung.com.google.android.inputmethod.latin",
    "com.google.android.inputmethod.latin.jason.dev",
    "dev.jason.com.google.android.inputmethod.latin"
)
