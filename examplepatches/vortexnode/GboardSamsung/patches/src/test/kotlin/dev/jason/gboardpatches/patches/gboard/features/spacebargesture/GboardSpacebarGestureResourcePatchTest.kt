package dev.jason.gboardpatches.patches.gboard.features.spacebargesture

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Document
import java.io.ByteArrayInputStream
import java.io.File
import java.nio.file.Files
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult

class GboardSpacebarGestureResourcePatchTest {
    @Test
    fun removesSpacebarFreeCursorAndImePickerWhilePreservingPressAndGlobePicker() {
        val doc = parseXml(IEX_XML_FIXTURE)

        assertTrue(hasConflictingSpacebarNodes(doc))
        val result = applySpacebarGestureResourceCleanup(doc)

        assertEquals(1, result.removedFreeCursorLongPressActions)
        assertEquals(1, result.removedSpaceImePickerLongPressActions)
        assertEquals(0, result.removedScrubMoveHandlers)
        assertEquals(0, result.removedTriggerFreeCursorHandlers)
        assertFalse(hasConflictingSpacebarNodes(doc))

        val remainingActions = (0 until doc.getElementsByTagName("action").length)
            .map { doc.getElementsByTagName("action").item(it).attributes }
        assertEquals(3, remainingActions.size)
        assertTrue(remainingActions.any {
            it.getNamedItem("type")?.nodeValue == "PRESS" &&
                it.getNamedItem("keycode")?.nodeValue == "SPACE"
        })
        assertTrue(
            remainingActions.any {
                it.getNamedItem("type")?.nodeValue == "PRESS" &&
                    it.getNamedItem("keycode")?.nodeValue == "SWITCH_TO_NEXT_LANGUAGE" &&
                    it.getNamedItem("data")?.nodeValue == "globe"
            },
        )
        assertTrue(
            remainingActions.any {
                it.getNamedItem("type")?.nodeValue == "LONG_PRESS" &&
                    it.getNamedItem("keycode")?.nodeValue == "SHOW_SYSTEM_IME_PICKER" &&
                    it.getNamedItem("data")?.nodeValue == "globe"
            },
        )
    }

    @Test
    fun removesScrubMoveAndTriggerFreeCursorWhilePreservingScrubDeleteAndInlineSuggestionScrub() {
        val doc = parseXml(BSB_XML_FIXTURE)

        assertTrue(hasConflictingSpacebarNodes(doc))
        val result = applySpacebarGestureResourceCleanup(doc)

        assertEquals(0, result.removedFreeCursorLongPressActions)
        assertEquals(0, result.removedSpaceImePickerLongPressActions)
        assertEquals(1, result.removedScrubMoveHandlers)
        assertEquals(1, result.removedTriggerFreeCursorHandlers)
        assertFalse(hasConflictingSpacebarNodes(doc))

        val remainingClasses = (0 until doc.getElementsByTagName("motion_event_handler").length)
            .map {
                doc.getElementsByTagName("motion_event_handler")
                    .item(it)
                    .attributes
                    .getNamedItem("class")
                    .nodeValue
            }
        assertEquals(
            listOf(
                "com.google.android.libraries.inputmethod.motioneventhandler.scrubdelete.ScrubDeleteMotionEventHandler",
                "com.google.android.apps.inputmethod.libs.inlinesuggestion.InlineSuggestionScrubSpaceMotionEventHandler",
            ),
            remainingClasses,
        )
    }

    @Test
    fun doesNotFlagGlobeOnlyImePickerXmlAsConflicting() {
        val doc = parseXml(GLOBE_ONLY_XML_FIXTURE)

        assertFalse(hasConflictingSpacebarNodes(doc))
        val result = applySpacebarGestureResourceCleanup(doc)
        assertEquals(0, result.totalRemoved)
    }

    @Test
    fun lazilyDecodesAndCleansAllFiveObfuscatedRootXmlFiles() {
        val apkRoot = Files.createTempDirectory("gboard-spacebar-direct-xml").toFile()
        try {
            val resDir = File(apkRoot, "res").apply { mkdirs() }
            val lazyArchive = mapOf(
                "res/IEX.xml" to IEX_XML_FIXTURE,
                "res/nB0.xml" to NB0_XML_FIXTURE,
                "res/bsB.xml" to BSB_XML_FIXTURE,
                "res/tER.xml" to TER_XML_FIXTURE,
                "res/kgx.xml" to KGX_XML_FIXTURE,
            )
            val requestedPatterns = mutableListOf<String>()
            val openedDocuments = mutableListOf<String>()

            val result = cleanupSpacebarGestureResources(
                resDir = resDir,
                decodePattern = { pattern ->
                    requestedPatterns += pattern
                    val xml = lazyArchive[pattern]
                    if (xml != null) {
                        File(apkRoot, pattern).apply {
                            parentFile?.mkdirs()
                            writeText(xml, Charsets.UTF_8)
                        }
                    }
                },
                openDocument = { relativePath, block ->
                    openedDocuments += relativePath
                    editXmlFile(File(apkRoot, relativePath), block)
                },
            )

            assertTrue(XML_RESOURCE_DECODE_PATTERN in requestedPatterns)
            assertTrue(requestedPatterns.containsAll(DIRECT_OBFUSCATED_XML_PATHS))
            assertEquals(DIRECT_OBFUSCATED_XML_PATHS.sorted(), openedDocuments.sorted())
            assertEquals(2, result.removedFreeCursorLongPressActions)
            assertEquals(1, result.removedSpaceImePickerLongPressActions)
            assertEquals(1, result.removedScrubMoveHandlers)
            assertEquals(3, result.removedTriggerFreeCursorHandlers)

            for (path in DIRECT_OBFUSCATED_XML_PATHS) {
                val cleanedDoc = parseXml(File(apkRoot, path).readText(Charsets.UTF_8))
                assertFalse("Remaining conflict in $path", hasConflictingSpacebarNodes(cleanedDoc))
            }
            assertTrue(
                File(apkRoot, "res/bsB.xml").readText(Charsets.UTF_8)
                    .contains("ScrubDeleteMotionEventHandler"),
            )
            assertTrue(
                File(apkRoot, "res/kgx.xml").readText(Charsets.UTF_8)
                    .contains("InlineSuggestionScrubSpaceMotionEventHandler"),
            )
        } finally {
            apkRoot.deleteRecursively()
        }
    }

    @Test
    fun lazilyDecodesAndCleansArscRemappedXmlFilesWhenDirectPathsAreAbsent() {
        val apkRoot = Files.createTempDirectory("gboard-spacebar-arsc-xml").toFile()
        try {
            val resDir = File(apkRoot, "res").apply { mkdirs() }
            val remappedArchive = mapOf(
                "res/xml/APKTOOL_RENAMED_0x7f170001.xml" to IEX_XML_FIXTURE,
                "res/xml/APKTOOL_RENAMED_0x7f170002.xml" to NB0_XML_FIXTURE,
                "res/xml/APKTOOL_RENAMED_0x7f170003.xml" to BSB_XML_FIXTURE,
                "res/xml/APKTOOL_RENAMED_0x7f170004.xml" to TER_XML_FIXTURE,
                "res/xml/APKTOOL_RENAMED_0x7f170005.xml" to KGX_XML_FIXTURE,
                "res/xml/APKTOOL_RENAMED_0x7f170006.xml" to GLOBE_ONLY_XML_FIXTURE,
            )
            val openedDocuments = mutableListOf<String>()

            val result = cleanupSpacebarGestureResources(
                resDir = resDir,
                decodePattern = { pattern ->
                    if (pattern == XML_RESOURCE_DECODE_PATTERN) {
                        for ((path, xml) in remappedArchive) {
                            File(apkRoot, path).apply {
                                parentFile?.mkdirs()
                                writeText(xml, Charsets.UTF_8)
                            }
                        }
                    } else {
                        throw IllegalArgumentException("Not a literal decodable path: $pattern")
                    }
                },
                openDocument = { relativePath, block ->
                    openedDocuments += relativePath
                    editXmlFile(File(apkRoot, relativePath), block)
                },
            )

            assertEquals(5, openedDocuments.size)
            assertFalse("res/xml/APKTOOL_RENAMED_0x7f170006.xml" in openedDocuments)
            assertEquals(2, result.removedFreeCursorLongPressActions)
            assertEquals(1, result.removedSpaceImePickerLongPressActions)
            assertEquals(1, result.removedScrubMoveHandlers)
            assertEquals(3, result.removedTriggerFreeCursorHandlers)
        } finally {
            apkRoot.deleteRecursively()
        }
    }

    private fun editXmlFile(file: File, block: (Document) -> Unit) {
        val doc = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder()
            .parse(file)
        block(doc)
        TransformerFactory.newInstance().newTransformer()
            .transform(DOMSource(doc), StreamResult(file))
    }

    private fun parseXml(xml: String): Document =
        DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder()
            .parse(ByteArrayInputStream(xml.toByteArray(Charsets.UTF_8)))

    private companion object {
        val IEX_XML_FIXTURE =
            """
            <framework>
                <softkeys>
                    <softkey id="@id/softkey_space">
                        <action type="PRESS" keycode="SPACE" data=" " />
                        <if enable_free_cursor_by_long_press_space="true" enable_scrub_move="true" free_cursor="true">
                            <action type="LONG_PRESS" keycode="SWITCH_KEYBOARD" data="free_cursor" />
                        </if>
                        <else>
                            <action type="LONG_PRESS" keycode="SHOW_SYSTEM_IME_PICKER" data="space" />
                        </else>
                    </softkey>
                    <softkey id="@id/softkey_globe">
                        <action type="PRESS" keycode="SWITCH_TO_NEXT_LANGUAGE" data="globe" />
                        <action type="LONG_PRESS" keycode="SHOW_SYSTEM_IME_PICKER" data="globe" />
                    </softkey>
                </softkeys>
            </framework>
            """.trimIndent()

        val NB0_XML_FIXTURE =
            """
            <framework>
                <softkeys>
                    <softkey id="@id/softkey_space_alt">
                        <action type="PRESS" keycode="SPACE" data=" " />
                        <if enable_free_cursor_by_long_press_space="true" enable_scrub_move="true" free_cursor="true">
                            <action type="LONG_PRESS" keycode="SWITCH_KEYBOARD" data="free_cursor" />
                        </if>
                    </softkey>
                </softkeys>
            </framework>
            """.trimIndent()

        val BSB_XML_FIXTURE =
            """
            <framework>
                <motion_event_handler
                    class="com.google.android.libraries.inputmethod.motioneventhandler.scrubdelete.ScrubDeleteMotionEventHandler"
                    preference_key="@string/pref_key_enable_gesture_delete" />
                <if free_cursor="false">
                    <motion_event_handler
                        class="com.google.android.libraries.inputmethod.motioneventhandler.scrubmove.ScrubMoveMotionEventHandler"
                        preference_key="@string/pref_key_enable_gesture_cursor_control" />
                </if>
                <else>
                    <motion_event_handler
                        class="com.google.android.libraries.inputmethod.freecursor.TriggerFreeCursorMotionEventHandler"
                        preference_key="@string/pref_key_enable_gesture_cursor_control" />
                </else>
                <motion_event_handler
                    class="com.google.android.apps.inputmethod.libs.inlinesuggestion.InlineSuggestionScrubSpaceMotionEventHandler" />
            </framework>
            """.trimIndent()

        val TER_XML_FIXTURE =
            """
            <framework>
                <if free_cursor="true">
                    <motion_event_handler
                        class="com.google.android.libraries.inputmethod.freecursor.TriggerFreeCursorMotionEventHandler"
                        preference_key="@string/pref_key_enable_gesture_cursor_control" />
                </if>
            </framework>
            """.trimIndent()

        val KGX_XML_FIXTURE =
            """
            <framework>
                <if free_cursor="true">
                    <motion_event_handler
                        class="com.google.android.libraries.inputmethod.freecursor.TriggerFreeCursorMotionEventHandler"
                        preference_key="@string/pref_key_enable_gesture_cursor_control" />
                </if>
                <motion_event_handler
                    class="com.google.android.apps.inputmethod.libs.inlinesuggestion.InlineSuggestionScrubSpaceMotionEventHandler" />
            </framework>
            """.trimIndent()

        val GLOBE_ONLY_XML_FIXTURE =
            """
            <framework>
                <softkey id="@id/softkey_globe">
                    <action type="LONG_PRESS" keycode="SHOW_SYSTEM_IME_PICKER" data="globe" />
                </softkey>
            </framework>
            """.trimIndent()
    }
}
