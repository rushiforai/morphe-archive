package dev.jason.gboardpatches.patches.gboard.features.appicon

import java.io.StringReader
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.xml.sax.InputSource

class GboardCustomAppIconResourcePatchTest {
    @Test
    fun bundledLightDarkAndLegacyIconsAreValidPngAssets() {
        for (path in listOf(
            "/gboard/appicon/ic_gboardsamsung_light.png",
            "/gboard/appicon/ic_gboardsamsung_dark.png",
            "/gboard/appicon/ic_gboardsamsung_legacy.png",
        )) {
            val bytes = loadBundledIconBytes(path)
            assertTrue("Expected non-empty PNG at $path", bytes.size > 1000)
            assertEquals(0x89.toByte(), bytes[0])
            assertEquals('P'.code.toByte(), bytes[1])
            assertEquals('N'.code.toByte(), bytes[2])
            assertEquals('G'.code.toByte(), bytes[3])
        }
    }

    @Test
    fun manifestPatchReplacesApplicationAndExplicitActivityIcons() {
        val xml = """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.google.android.inputmethod.latin">
                <application android:icon="@mipmap/ic_app" android:roundIcon="@mipmap/ic_app_round">
                    <activity android:name=".MainActivity" android:icon="@mipmap/ic_app"/>
                    <activity android:name=".OtherActivity"/>
                    <activity-alias android:name=".Alias" android:roundIcon="@mipmap/ic_app_round"/>
                </application>
            </manifest>
        """.trimIndent()
        val builder = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }.newDocumentBuilder()
        val doc = builder.parse(InputSource(StringReader(xml)))

        applyCustomAppIconToManifest(doc)

        val app = doc.getElementsByTagName("application").item(0) as org.w3c.dom.Element
        assertEquals(CUSTOM_APP_ICON_MIPMAP_REF, app.getAttributeNS("http://schemas.android.com/apk/res/android", "icon"))
        assertEquals(CUSTOM_APP_ICON_MIPMAP_REF, app.getAttributeNS("http://schemas.android.com/apk/res/android", "roundIcon"))

        val activities = doc.getElementsByTagName("activity")
        val main = activities.item(0) as org.w3c.dom.Element
        val other = activities.item(1) as org.w3c.dom.Element
        assertEquals(CUSTOM_APP_ICON_MIPMAP_REF, main.getAttributeNS("http://schemas.android.com/apk/res/android", "icon"))
        assertEquals("", other.getAttributeNS("http://schemas.android.com/apk/res/android", "icon"))

        val alias = doc.getElementsByTagName("activity-alias").item(0) as org.w3c.dom.Element
        assertEquals(CUSTOM_APP_ICON_MIPMAP_REF, alias.getAttributeNS("http://schemas.android.com/apk/res/android", "roundIcon"))
    }
}
