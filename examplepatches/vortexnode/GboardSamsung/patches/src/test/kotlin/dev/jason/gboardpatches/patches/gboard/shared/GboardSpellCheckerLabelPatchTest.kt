package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.resource.PublicXmlManager
import dev.jason.gboardpatches.patches.gboard.features.packagerename.applyGboardApplicationDisplayName
import dev.jason.gboardpatches.patches.gboard.features.packagerename.applyGboardPackageRename
import java.io.ByteArrayInputStream
import java.io.File
import java.io.StringWriter
import java.nio.charset.StandardCharsets
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Document
import org.w3c.dom.Element

class GboardSpellCheckerLabelPatchTest {
    @get:Rule
    val temporaryFolder = TemporaryFolder()

    @Test
    fun `spell checker label renames service and xml metadata without altering spell checker behavior`() {
        val manifest = loadManifest()
        val spellChecker = parse(STOCK_SPELL_CHECKER_XML, namespaceAware = true)
        val resources = stringResources()
        val locales = listOf(
            parse("<resources><string name=\"APKTOOL_RENAMED_0x7f140d63\">Проверка правописания Gboard</string></resources>", true),
            parse("<resources><string name=\"APKTOOL_RENAMED_0x7f140d63\">Gboard spell checker</string></resources>", true),
        )
        val beforeLocales = locales.map(::serialize)
        val applicationLabelBefore = androidAttribute(elements(manifest, "application").single(), "label")
        val settingsActivityBefore = serialize(
            elements(manifest, "activity").single {
                androidAttribute(it, "name") == SPELL_CHECKER_SETTINGS_ACTIVITY
            },
        )
        val subtypeCountBefore = elements(spellChecker, "subtype").size

        assertEquals("spell_checker", resolveSpellCheckerXmlResourceName(manifest))

        applyGboardSpellCheckerLabel(
            manifestDocument = manifest,
            spellCheckerDocuments = listOf(spellChecker),
            labelText = GBOARD_SPELL_CHECKER_LABEL,
            labelResourceDocument = resources,
            otherValueResourceDocuments = locales,
        )

        val service = elements(manifest, "service").single {
            androidAttribute(it, "name") == GBOARD_SPELL_CHECKER_SERVICE_CLASS
        }
        assertEquals(SPELL_CHECKER_LABEL_RESOURCE_REF, androidAttribute(service, "label"))
        assertEquals("true", androidAttribute(service, "exported"))
        assertEquals("android.permission.BIND_TEXT_SERVICE", androidAttribute(service, "permission"))
        assertEquals(
            "android.service.textservice.SpellCheckerService",
            androidAttribute(elements(service, "action").single(), "name"),
        )
        val metadata = elements(service, "meta-data").single()
        assertEquals(SPELL_CHECKER_METADATA_NAME, androidAttribute(metadata, "name"))
        assertEquals("@xml/spell_checker", androidAttribute(metadata, "resource"))

        assertEquals(
            applicationLabelBefore,
            androidAttribute(elements(manifest, "application").single(), "label"),
        )
        assertEquals(
            settingsActivityBefore,
            serialize(
                elements(manifest, "activity").single {
                    androidAttribute(it, "name") == SPELL_CHECKER_SETTINGS_ACTIVITY
                },
            ),
        )

        val spellCheckerRoot = spellChecker.documentElement
        assertEquals(SPELL_CHECKER_LABEL_RESOURCE_REF, androidAttribute(spellCheckerRoot, "label"))
        assertEquals(
            SPELL_CHECKER_SETTINGS_ACTIVITY,
            androidAttribute(spellCheckerRoot, "settingsActivity"),
        )
        assertEquals(subtypeCountBefore, elements(spellChecker, "subtype").size)

        val entry = elements(resources, "string").single {
            it.getAttribute("name") == SPELL_CHECKER_LABEL_RESOURCE
        }
        assertEquals("\"GboardSamsung\"", entry.textContent)
        assertEquals("false", entry.getAttribute("translatable"))
        assertEquals("false", entry.getAttribute("formatted"))
        assertEquals(beforeLocales, locales.map(::serialize))
    }

    @Test
    fun `spell checker label works in namespace unaware documents without duplicate attributes`() {
        val manifest = parse(readFixtureBytes(MANIFEST_FIXTURE), namespaceAware = false)
        val spellChecker = parse(STOCK_SPELL_CHECKER_XML, namespaceAware = false)
        val resources = stringResources()

        applyGboardSpellCheckerLabel(
            manifestDocument = manifest,
            spellCheckerDocuments = listOf(spellChecker),
            labelText = GBOARD_SPELL_CHECKER_LABEL,
            labelResourceDocument = resources,
        )

        val service = elements(manifest, "service").single {
            androidAttribute(it, "name") == GBOARD_SPELL_CHECKER_SERVICE_CLASS
        }
        assertEquals(SPELL_CHECKER_LABEL_RESOURCE_REF, androidAttribute(service, "label"))
        assertEquals(
            1,
            (0 until service.attributes.length).count { idx ->
                val attr = service.attributes.item(idx)
                attr.nodeName == "android:label" ||
                    (attr.namespaceURI == ANDROID_NS && attr.localName == "label")
            },
        )
        val root = spellChecker.documentElement
        assertEquals(SPELL_CHECKER_LABEL_RESOURCE_REF, androidAttribute(root, "label"))
        assertEquals(
            1,
            (0 until root.attributes.length).count { idx ->
                val attr = root.attributes.item(idx)
                attr.nodeName == "android:label" ||
                    (attr.namespaceURI == ANDROID_NS && attr.localName == "label")
            },
        )
    }

    @Test
    fun `spell checker label adds android label when xml root omits it`() {
        val manifest = loadManifest()
        val spellChecker = parse(
            """
            <spell-checker xmlns:android="http://schemas.android.com/apk/res/android"
                android:settingsActivity="com.google.android.apps.inputmethod.latin.spelling.LatinSpellCheckerSettingsActivity">
                <subtype android:label="@string/subtype_en" android:subtypeLocale="en" />
            </spell-checker>
            """.trimIndent(),
            namespaceAware = true,
        )
        val resources = stringResources()

        applyGboardSpellCheckerLabel(
            manifestDocument = manifest,
            spellCheckerDocuments = listOf(spellChecker),
            labelText = GBOARD_SPELL_CHECKER_LABEL,
            labelResourceDocument = resources,
        )

        assertEquals(
            SPELL_CHECKER_LABEL_RESOURCE_REF,
            androidAttribute(spellChecker.documentElement, "label"),
        )
        assertEquals(
            SPELL_CHECKER_SETTINGS_ACTIVITY,
            androidAttribute(spellChecker.documentElement, "settingsActivity"),
        )
    }

    @Test
    fun `spell checker label is idempotent and composes cleanly with package rename and app display name`() {
        val publicFile = temporaryFolder.newFile("public.xml")
        publicFile.writeText(
            """
            <resources package="com.google.android.inputmethod.latin" id="0x7f">
                <public type="string" name="ime_name" id="0x7f140000"/>
                <public type="string" name="other_name" id="0x7f140010"/>
            </resources>
            """.trimIndent(),
        )
        val manifest = loadManifest()
        val settings = loadSettingsDocuments()
        val spellChecker = parse(STOCK_SPELL_CHECKER_XML, namespaceAware = true)
        val resources = stringResources()

        PublicXmlManager(publicFile).use { publicIds ->
            applyGboardPackageRename(manifest, settings)
            applyGboardApplicationDisplayName(manifest, "GboardSamsung", resources, emptyList(), publicIds)
            applyGboardSpellCheckerLabel(
                manifestDocument = manifest,
                spellCheckerDocuments = listOf(spellChecker),
                labelText = GBOARD_SPELL_CHECKER_LABEL,
                labelResourceDocument = resources,
                otherValueResourceDocuments = emptyList(),
                publicIds = publicIds,
            )
            val once = listOf(serialize(manifest), serialize(spellChecker), serialize(resources))

            // Second invocation simulates both gboardPatchesSettingsPatch and gboardPackageRenameResourcePatch running.
            applyGboardSpellCheckerLabel(
                manifestDocument = manifest,
                spellCheckerDocuments = listOf(spellChecker),
                labelText = GBOARD_SPELL_CHECKER_LABEL,
                labelResourceDocument = resources,
                otherValueResourceDocuments = emptyList(),
                publicIds = publicIds,
            )
            assertEquals(once, listOf(serialize(manifest), serialize(spellChecker), serialize(resources)))
        }

        PublicXmlManager(publicFile).use { persisted ->
            assertTrue(persisted.idExists("string", "gboard_patches_app_display_name"))
            assertTrue(persisted.idExists("string", SPELL_CHECKER_LABEL_RESOURCE))
            val ids = persisted.getDefinedIds()
            assertEquals(4, ids.size)
            assertEquals(ids.size, ids.values.toSet().size)
        }
    }

    @Test
    fun `spell checker xml discovery finds default and qualifier directories deterministically`() {
        val apkRoot = temporaryFolder.newFolder("apk")
        val resDir = File(apkRoot, "res").apply { mkdirs() }
        val xmlDir = File(resDir, "xml").apply { mkdirs() }
        val xmlV31Dir = File(resDir, "xml-v31").apply { mkdirs() }
        File(xmlDir, "spell_checker.xml").writeText(STOCK_SPELL_CHECKER_XML)
        File(xmlV31Dir, "spell_checker.xml").writeText(STOCK_SPELL_CHECKER_XML)
        File(xmlDir, "other.xml").writeText("<other/>")

        assertEquals(
            listOf("res/xml-v31/spell_checker.xml", "res/xml/spell_checker.xml"),
            findSpellCheckerXmlRelativePaths(resDir, "spell_checker"),
        )
    }

    @Test
    fun `collisions or malformed inputs are rejected without partial mutation`() {
        val occupiedResources = parse(
            "<resources><string name=\"$SPELL_CHECKER_LABEL_RESOURCE\">Foreign</string></resources>",
            namespaceAware = true,
        )
        assertRejectedWithoutMutation(loadManifest(), parse(STOCK_SPELL_CHECKER_XML, true), occupiedResources)

        val localizedCollision = parse(
            "<resources><string name=\"$SPELL_CHECKER_LABEL_RESOURCE\">Локализовано</string></resources>",
            namespaceAware = true,
        )
        assertRejectedWithoutMutation(
            loadManifest(),
            parse(STOCK_SPELL_CHECKER_XML, true),
            stringResources(),
            listOf(localizedCollision),
        )

        val wrongRootSpellChecker = parse("<not-spell-checker/>", namespaceAware = true)
        assertRejectedWithoutMutation(loadManifest(), wrongRootSpellChecker, stringResources())
    }

    private fun assertRejectedWithoutMutation(
        manifest: Document,
        spellChecker: Document,
        resources: Document,
        others: List<Document> = emptyList(),
    ) {
        val docs = listOf(manifest, spellChecker, resources) + others
        val before = docs.map(::serialize)
        try {
            applyGboardSpellCheckerLabel(
                manifestDocument = manifest,
                spellCheckerDocuments = listOf(spellChecker),
                labelText = GBOARD_SPELL_CHECKER_LABEL,
                labelResourceDocument = resources,
                otherValueResourceDocuments = others,
            )
            fail("Expected IllegalStateException")
        } catch (_: IllegalStateException) {
            assertEquals(before, docs.map(::serialize))
        }
    }

    private fun loadManifest(): Document =
        parse(readFixtureBytes(MANIFEST_FIXTURE), namespaceAware = true)

    private fun loadSettingsDocuments(): List<Document> = listOf(
        parse(readFixtureBytes(SETTINGS_FIXTURE), namespaceAware = true),
        parse(readFixtureBytes(SETTINGS_LEGACY_FIXTURE), namespaceAware = true),
    )

    private fun stringResources(): Document = parse(
        "<resources><string name=\"ime_name\">Gboard</string></resources>",
        namespaceAware = true,
    )

    private fun readFixtureBytes(path: String): ByteArray =
        checkNotNull(javaClass.getResourceAsStream(path)) { "Missing fixture $path" }
            .use { it.readBytes() }

    private fun parse(source: String, namespaceAware: Boolean): Document =
        parse(source.toByteArray(StandardCharsets.UTF_8), namespaceAware)

    private fun parse(bytes: ByteArray, namespaceAware: Boolean): Document =
        DocumentBuilderFactory.newInstance().apply {
            isNamespaceAware = namespaceAware
        }.newDocumentBuilder().parse(ByteArrayInputStream(bytes))

    private fun serialize(node: org.w3c.dom.Node): String {
        val writer = StringWriter()
        TransformerFactory.newInstance().newTransformer().apply {
            setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes")
            setOutputProperty(OutputKeys.INDENT, "no")
        }.transform(DOMSource(node), StreamResult(writer))
        return writer.toString()
    }

    private fun elements(document: Document, tagName: String): List<Element> =
        elements(document.documentElement, tagName)

    private fun elements(root: Element, tagName: String): List<Element> {
        val nodes = root.getElementsByTagName("*")
        val result = ArrayList<Element>()
        if ((root.localName ?: root.tagName.substringAfter(':')) == tagName) {
            result.add(root)
        }
        for (i in 0 until nodes.length) {
            val element = nodes.item(i) as? Element ?: continue
            if ((element.localName ?: element.tagName.substringAfter(':')) == tagName) {
                result.add(element)
            }
        }
        return result
    }

    private fun androidAttribute(element: Element, localName: String): String? =
        element.getAttributeNS(ANDROID_NS, localName).takeIf { it.isNotBlank() }
            ?: element.getAttribute("android:$localName").takeIf { it.isNotBlank() }

    private companion object {
        const val MANIFEST_FIXTURE = "/gboard/18.5.3/packagerename/AndroidManifest.xml"
        const val SETTINGS_FIXTURE = "/gboard/18.5.3/packagerename/settings.xml"
        const val SETTINGS_LEGACY_FIXTURE = "/gboard/18.5.3/packagerename/settings_legacy.xml"
        const val SPELL_CHECKER_SETTINGS_ACTIVITY =
            "com.google.android.apps.inputmethod.latin.spelling.LatinSpellCheckerSettingsActivity"
        val STOCK_SPELL_CHECKER_XML = """
            <?xml version="1.0" encoding="utf-8"?>
            <spell-checker
                xmlns:android="http://schemas.android.com/apk/res/android"
                android:label="@string/APKTOOL_RENAMED_0x7f140d63"
                android:settingsActivity="com.google.android.apps.inputmethod.latin.spelling.LatinSpellCheckerSettingsActivity">
                <subtype android:label="@string/subtype_en" android:subtypeLocale="en" />
                <subtype android:label="@string/subtype_ru" android:subtypeLocale="ru" />
            </spell-checker>
        """.trimIndent()
    }
}
