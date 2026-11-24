package dev.jason.gboardpatches.patches.gboard.features.developeroptions

import java.io.StringReader
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Test
import org.w3c.dom.Element
import org.xml.sax.InputSource

class GboardDeveloperOptionsLocalizationTest {
    @Test
    fun replacesDeveloperOptionsTitlesAndSummariesWithLocalizedStringRefs() {
        val xml = """
            <PreferenceScreen xmlns:android="http://schemas.android.com/apk/res/android"
                android:title="@string/title_dev"
                android:key="@string/key_dev">
                <Preference
                    android:persistent="false"
                    android:title="@string/flag_editor"
                    android:key="@string/key_flag_editor"
                    android:fragment="com.google.android.libraries.inputmethod.flag.preference.FlagEditorFragment" />
                <androidx.preference.PreferenceCategory
                    android:title="@string/pk_suggestions"
                    android:key="@string/key_pk_suggestions">
                    <SwitchPreferenceCompat
                        android:persistent="true"
                        android:title="@string/pk_minimized_title"
                        android:key="@string/key_pk_minimized"
                        android:summary="@string/pk_minimized_summary" />
                    <SwitchPreferenceCompat
                        android:persistent="true"
                        android:title="Suggestions while editing a recently autocorrected word shown at the cursor"
                        android:key="@string/key_pk_recent"
                        android:summary="Toggle on = Suggestions while editing a recently autocorrected word are shown on the toolbar and at the cursor&#10;Toggle off = Suggestions while editing a recently autocorrected word are shown on the toolbar" />
                </androidx.preference.PreferenceCategory>
                <androidx.preference.PreferenceCategory android:title="Stylus">
                    <SwitchPreferenceCompat
                        android:persistent="true"
                        android:title="Use low latency library to render strokes"
                        android:key="@string/key_stylus_low_latency" />
                </androidx.preference.PreferenceCategory>
                <androidx.preference.PreferenceCategory android:title="Gen AI text input">
                    <SwitchPreferenceCompat
                        android:persistent="true"
                        android:title="Text Stylization"
                        android:key="@string/key_text_stylization" />
                </androidx.preference.PreferenceCategory>
                <androidx.preference.PreferenceCategory android:title="Crash recovery">
                    <SwitchPreferenceCompat
                        android:persistent="true"
                        android:title="Clean flag when crash recovery is enabled"
                        android:key="crash_recovery_enable_clean_flag" />
                </androidx.preference.PreferenceCategory>
            </PreferenceScreen>
        """.trimIndent()

        val builder = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }.newDocumentBuilder()
        val doc = builder.parse(InputSource(StringReader(xml)))

        applyDeveloperOptionsStringRefs(doc)

        val flagEditor = doc.getElementsByTagName("Preference").item(0) as Element
        assertEquals("@string/gboard_patches_dev_flag_editor", flagEditor.getAttributeNS(NS, "title"))
        assertEquals(
            "com.google.android.libraries.inputmethod.flag.preference.FlagEditorFragment",
            flagEditor.getAttributeNS(NS, "fragment"),
        )
        assertEquals("@string/key_flag_editor", flagEditor.getAttributeNS(NS, "key"))

        val categories = doc.getElementsByTagName("androidx.preference.PreferenceCategory")
        assertEquals("@string/gboard_patches_dev_pk_suggestions", (categories.item(0) as Element).getAttributeNS(NS, "title"))
        assertEquals("@string/gboard_patches_dev_stylus", (categories.item(1) as Element).getAttributeNS(NS, "title"))
        assertEquals("@string/gboard_patches_dev_gen_ai", (categories.item(2) as Element).getAttributeNS(NS, "title"))
        assertEquals("@string/gboard_patches_dev_crash_recovery", (categories.item(3) as Element).getAttributeNS(NS, "title"))

        val switches = doc.getElementsByTagName("SwitchPreferenceCompat")
        val pkFirst = switches.item(0) as Element
        assertEquals("@string/gboard_patches_dev_pk_minimized_title", pkFirst.getAttributeNS(NS, "title"))
        assertEquals("@string/gboard_patches_dev_pk_minimized_summary", pkFirst.getAttributeNS(NS, "summary"))
        assertEquals("@string/key_pk_minimized", pkFirst.getAttributeNS(NS, "key"))

        val pkSecond = switches.item(1) as Element
        assertEquals("@string/gboard_patches_dev_pk_recent_title", pkSecond.getAttributeNS(NS, "title"))
        assertEquals("@string/gboard_patches_dev_pk_recent_summary", pkSecond.getAttributeNS(NS, "summary"))

        val crashSwitch = switches.item(4) as Element
        assertEquals("@string/gboard_patches_dev_clean_flag", crashSwitch.getAttributeNS(NS, "title"))
        assertEquals("crash_recovery_enable_clean_flag", crashSwitch.getAttributeNS(NS, "key"))
    }

    private companion object {
        const val NS = "http://schemas.android.com/apk/res/android"
    }
}
