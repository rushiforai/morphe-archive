package com.zeldrisho.threads.patches.misc.branding

import org.w3c.dom.Document
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

/**
 * Parse an XML string into a DOM Document for testing.
 */
private fun parse(xml: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
    .parse(ByteArrayInputStream(xml.toByteArray()))

/**
 * Generate a minimal test manifest with application and activity labels.
 */
private fun manifest(label: String = "Threads"): Document = parse(
    """<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.instagram.barcelona">
      <application android:label="$label">
        <activity android:name="com.instagram.barcelona.mainactivity.BarcelonaActivity" android:label="$label"/>
        <activity android:name="com.other.Activity" android:label="$label"/>
      </application>
    </manifest>""",
)

/**
 * Unit tests for app name rewriting logic in manifests.
 */
class AppNameRewriteTest {
    /**
     * Verify that applyAppName correctly updates application and launcher activity labels.
     */
    @Test fun setsApplicationAndLauncherLabels() {
        val doc = manifest()
        applyAppName(doc, "Threads Morphe")
        val app = doc.getElementsByTagName("application").item(0) as org.w3c.dom.Element
        assertEquals("Threads Morphe", app.getAttribute("android:label"))
        val activities = doc.getElementsByTagName("activity")
        val launcher = (0 until activities.length)
            .map { activities.item(it) as org.w3c.dom.Element }
            .first { it.getAttribute("android:name") == LAUNCHER_ACTIVITY }
        assertEquals("Threads Morphe", launcher.getAttribute("android:label"))
        val other = (0 until activities.length)
            .map { activities.item(it) as org.w3c.dom.Element }
            .first { it.getAttribute("android:name") == "com.other.Activity" }
        assertEquals("Threads", other.getAttribute("android:label"))
    }

    /**
     * Verify that a manifest without an application element throws an explicit error.
     */
    @Test fun missingApplicationFailsExplicitly() {
        val doc = parse(
            """<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="x"/>""",
        )
        assertFailsWith<IllegalStateException> { applyAppName(doc, "Y") }
    }
}
