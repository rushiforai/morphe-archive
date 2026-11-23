package dev.jason.gboardpatches.patches.gboard.features.spacebargesture

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.elements
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

internal const val SCRUB_MOVE_HANDLER_CLASS =
    "com.google.android.libraries.inputmethod.motioneventhandler.scrubmove.ScrubMoveMotionEventHandler"
internal const val TRIGGER_FREE_CURSOR_HANDLER_CLASS =
    "com.google.android.libraries.inputmethod.freecursor.TriggerFreeCursorMotionEventHandler"
private const val ACTION_TAG = "action"
private const val MOTION_EVENT_HANDLER_TAG = "motion_event_handler"
private const val LONG_PRESS_TYPE = "LONG_PRESS"
private const val SWITCH_KEYBOARD_KEYCODE = "SWITCH_KEYBOARD"
private const val SWITCH_KEYBOARD_NUMERIC_KEYCODE = "-10004"
private const val SHOW_SYSTEM_IME_PICKER_KEYCODE = "SHOW_SYSTEM_IME_PICKER"
private const val SHOW_SYSTEM_IME_PICKER_NUMERIC_KEYCODE = "-10022"
private const val FREE_CURSOR_DATA = "free_cursor"
private const val SPACE_DATA = "space"

internal val DIRECT_OBFUSCATED_XML_FILES = setOf(
    "IEX.xml",
    "nB0.xml",
    "bsB.xml",
    "tER.xml",
    "kgx.xml",
)

internal val DIRECT_OBFUSCATED_XML_PATHS = listOf(
    "res/IEX.xml",
    "res/nB0.xml",
    "res/bsB.xml",
    "res/tER.xml",
    "res/kgx.xml",
)

internal const val XML_RESOURCE_DECODE_PATTERN = "res/xml*/*.xml"

private val CANDIDATE_TEXT_MARKERS = listOf(
    FREE_CURSOR_DATA,
    SHOW_SYSTEM_IME_PICKER_KEYCODE,
    SHOW_SYSTEM_IME_PICKER_NUMERIC_KEYCODE,
    "ScrubMoveMotionEventHandler",
    "TriggerFreeCursorMotionEventHandler",
)

internal data class SpacebarResourceCleanupResult(
    val removedFreeCursorLongPressActions: Int = 0,
    val removedSpaceImePickerLongPressActions: Int = 0,
    val removedScrubMoveHandlers: Int = 0,
    val removedTriggerFreeCursorHandlers: Int = 0,
) {
    val totalRemoved: Int
        get() = removedFreeCursorLongPressActions +
            removedSpaceImePickerLongPressActions +
            removedScrubMoveHandlers +
            removedTriggerFreeCursorHandlers

    operator fun plus(other: SpacebarResourceCleanupResult): SpacebarResourceCleanupResult =
        SpacebarResourceCleanupResult(
            removedFreeCursorLongPressActions =
                removedFreeCursorLongPressActions + other.removedFreeCursorLongPressActions,
            removedSpaceImePickerLongPressActions =
                removedSpaceImePickerLongPressActions + other.removedSpaceImePickerLongPressActions,
            removedScrubMoveHandlers =
                removedScrubMoveHandlers + other.removedScrubMoveHandlers,
            removedTriggerFreeCursorHandlers =
                removedTriggerFreeCursorHandlers + other.removedTriggerFreeCursorHandlers,
        )
}

/**
 * Removes only the conflicting native spacebar long-press actions and ScrubMove/TriggerFreeCursor
 * handler registrations so the Samsung-like spacebar runtime has deterministic control on the
 * spacebar without disabling ScrubDelete (preference 0x7f14096a) or InlineSuggestionScrubSpace.
 */
internal val gboardSpacebarGestureResourcePatch = resourcePatch(
    description = "Removes conflicting native spacebar long-press FreeCursor/IME picker actions and ScrubMove/TriggerFreeCursor handlers.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        applySpacebarGestureResourcePatch()
    }
}

context(context: ResourcePatchContext)
private fun applySpacebarGestureResourcePatch() = with(context) {
    val resDir = this["res", false]
    cleanupSpacebarGestureResources(
        resDir = resDir,
        decodePattern = { pattern -> decode(pattern) },
        openDocument = { relativePath, block ->
            document(relativePath).use(block)
        },
    )
}

internal fun cleanupSpacebarGestureResources(
    resDir: File,
    decodePattern: (String) -> Unit,
    openDocument: (String, (Document) -> Unit) -> Unit,
): SpacebarResourceCleanupResult {
    // Patcher 2.x decodes XML resources lazily on request:
    // 1. Decode all ARSC-mapped res/xml*/*.xml resources (including APKTOOL_RENAMED_0x7f17xxxx.xml).
    // 2. Also explicitly decode the 5 shortened AAPT2 root paths in case any remain directly in res/.
    runCatching { decodePattern(XML_RESOURCE_DECODE_PATTERN) }
    for (directPath in DIRECT_OBFUSCATED_XML_PATHS) {
        runCatching { decodePattern(directPath) }
    }

    if (!resDir.isDirectory) {
        return SpacebarResourceCleanupResult()
    }
    val apkRoot = resDir.parentFile ?: return SpacebarResourceCleanupResult()
    val candidateFiles = collectCandidateXmlFiles(resDir)
    if (candidateFiles.isEmpty()) {
        return SpacebarResourceCleanupResult()
    }

    val builder = DocumentBuilderFactory.newInstance().apply {
        isNamespaceAware = true
    }.newDocumentBuilder()

    var total = SpacebarResourceCleanupResult()
    for (file in candidateFiles) {
        val text = runCatching { file.readText(Charsets.UTF_8) }.getOrNull() ?: continue
        if (CANDIDATE_TEXT_MARKERS.none { marker -> text.contains(marker) }) {
            continue
        }
        val parsed = runCatching { builder.parse(file) }.getOrNull() ?: continue
        if (!hasConflictingSpacebarNodes(parsed)) {
            continue
        }
        val relativePath = file.toRelativeString(apkRoot).replace(File.separatorChar, '/')
        openDocument(relativePath) { doc ->
            total += applySpacebarGestureResourceCleanup(doc)
        }
    }
    return total
}

private fun collectCandidateXmlFiles(resDir: File): List<File> {
    val entries = resDir.listFiles().orEmpty()
    val xmlDirFiles = entries.asSequence()
        .filter { it.isDirectory && (it.name == "xml" || it.name.startsWith("xml-")) }
        .flatMap { it.listFiles().orEmpty().asSequence() }
        .filter { it.isFile && it.extension.equals("xml", ignoreCase = true) }
    val directObfuscatedFiles = entries.asSequence()
        .filter { it.isFile && it.name in DIRECT_OBFUSCATED_XML_FILES }
    return (xmlDirFiles + directObfuscatedFiles)
        .distinctBy { it.absolutePath }
        .sortedBy { it.path }
        .toList()
}

internal fun hasConflictingSpacebarNodes(document: Document): Boolean {
    val hasConflictingAction = document.getElementsByTagName(ACTION_TAG).elements().any { action ->
        isFreeCursorLongPressAction(action) || isSpaceImePickerLongPressAction(action)
    }
    if (hasConflictingAction) {
        return true
    }
    return document.getElementsByTagName(MOTION_EVENT_HANDLER_TAG).elements().any { handler ->
        isScrubMoveHandler(handler) || isTriggerFreeCursorHandler(handler)
    }
}

internal fun applySpacebarGestureResourceCleanup(document: Document): SpacebarResourceCleanupResult {
    var removedFreeCursorActions = 0
    var removedSpacePickerActions = 0
    var removedScrubMove = 0
    var removedTriggerFreeCursor = 0

    // Materialize live NodeLists before mutating the DOM.
    val actionElements = document.getElementsByTagName(ACTION_TAG).elements().toList()
    for (action in actionElements) {
        when {
            isFreeCursorLongPressAction(action) -> {
                action.parentNode?.removeChild(action)
                removedFreeCursorActions++
            }
            isSpaceImePickerLongPressAction(action) -> {
                action.parentNode?.removeChild(action)
                removedSpacePickerActions++
            }
        }
    }

    val handlerElements = document.getElementsByTagName(MOTION_EVENT_HANDLER_TAG).elements().toList()
    for (handler in handlerElements) {
        when {
            isScrubMoveHandler(handler) -> {
                handler.parentNode?.removeChild(handler)
                removedScrubMove++
            }
            isTriggerFreeCursorHandler(handler) -> {
                handler.parentNode?.removeChild(handler)
                removedTriggerFreeCursor++
            }
        }
    }

    return SpacebarResourceCleanupResult(
        removedFreeCursorLongPressActions = removedFreeCursorActions,
        removedSpaceImePickerLongPressActions = removedSpacePickerActions,
        removedScrubMoveHandlers = removedScrubMove,
        removedTriggerFreeCursorHandlers = removedTriggerFreeCursor,
    )
}

private fun isFreeCursorLongPressAction(element: Element): Boolean {
    if (element.attributeValue("type") != LONG_PRESS_TYPE) {
        return false
    }
    val keycode = element.attributeValue("keycode")
    val matchesKeycode = keycode == SWITCH_KEYBOARD_KEYCODE ||
        keycode == SWITCH_KEYBOARD_NUMERIC_KEYCODE
    return matchesKeycode && element.attributeValue("data") == FREE_CURSOR_DATA
}

private fun isSpaceImePickerLongPressAction(element: Element): Boolean {
    if (element.attributeValue("type") != LONG_PRESS_TYPE) {
        return false
    }
    val keycode = element.attributeValue("keycode")
    val matchesKeycode = keycode == SHOW_SYSTEM_IME_PICKER_KEYCODE ||
        keycode == SHOW_SYSTEM_IME_PICKER_NUMERIC_KEYCODE
    return matchesKeycode && element.attributeValue("data") == SPACE_DATA
}

private fun isScrubMoveHandler(element: Element): Boolean {
    val className = element.attributeValue("class")
    return className == SCRUB_MOVE_HANDLER_CLASS ||
        className.endsWith(".ScrubMoveMotionEventHandler")
}

private fun isTriggerFreeCursorHandler(element: Element): Boolean {
    val className = element.attributeValue("class")
    return className == TRIGGER_FREE_CURSOR_HANDLER_CLASS ||
        className.endsWith(".TriggerFreeCursorMotionEventHandler")
}

private fun Element.attributeValue(localName: String): String {
    getAttribute(localName).takeIf(String::isNotEmpty)?.let { return it.trim() }
    for (index in 0 until attributes.length) {
        val attribute = attributes.item(index)
        if (attribute.localName == localName ||
            attribute.nodeName.substringAfterLast(':') == localName
        ) {
            return attribute.nodeValue.orEmpty().trim()
        }
    }
    return ""
}
