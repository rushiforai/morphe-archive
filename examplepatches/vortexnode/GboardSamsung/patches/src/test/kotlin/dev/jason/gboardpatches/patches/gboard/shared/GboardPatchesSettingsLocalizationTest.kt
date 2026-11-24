package dev.jason.gboardpatches.patches.gboard.shared

import java.io.StringReader
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Test
import org.w3c.dom.Element
import org.xml.sax.InputSource

class GboardPatchesSettingsLocalizationTest {
    @Test
    fun upsertsLocalizedEntryTitleIdempotently() {
        val builder = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }.newDocumentBuilder()
        val doc = builder.parse(InputSource(StringReader("<resources><string name=\"other\">Other</string></resources>")))

        upsertStringResource(doc, PATCHES_SETTINGS_ENTRY_TITLE_RESOURCE, "Патчи")
        upsertStringResource(doc, PATCHES_SETTINGS_ENTRY_TITLE_RESOURCE, "Патчи")

        val strings = doc.getElementsByTagName("string")
        assertEquals(2, strings.length)
        val entry = strings.item(1) as Element
        assertEquals(PATCHES_SETTINGS_ENTRY_TITLE_RESOURCE, entry.getAttribute("name"))
        assertEquals("Патчи", entry.textContent)
    }

    @Test
    fun applyGboardPatchesSettingsUsesLocalizedTitleResourceWhenProvided() {
        val builder = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }.newDocumentBuilder()
        val manifest = builder.parse(
            InputSource(
                StringReader(
                    "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\" package=\"com.example.gboard\"><application/></manifest>",
                ),
            ),
        )
        val settingsXml = "<PreferenceScreen xmlns:android=\"http://schemas.android.com/apk/res/android\"/>"
        val settings = listOf(
            builder.parse(InputSource(StringReader(settingsXml))),
            builder.parse(InputSource(StringReader(settingsXml))),
        )

        applyGboardPatchesSettings(manifest, settings, entryTitle = PATCHES_SETTINGS_ENTRY_TITLE_REF)

        settings.forEach { doc ->
            val pref = doc.getElementsByTagName(
                "com.google.android.libraries.inputmethod.settings.widget.HeaderPreference",
            ).item(0) as Element
            assertEquals(
                PATCHES_SETTINGS_ENTRY_TITLE_REF,
                pref.getAttributeNS("http://schemas.android.com/apk/res/android", "title"),
            )
        }
    }
}
