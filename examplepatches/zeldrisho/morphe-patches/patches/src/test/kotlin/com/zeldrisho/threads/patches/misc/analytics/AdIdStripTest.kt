package com.zeldrisho.threads.patches.misc.analytics

import org.w3c.dom.Document
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Parse an XML string into a DOM Document for testing.
 */
private fun parse(xml: String): Document =
    DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.toByteArray()))

/**
 * Generate a minimal test manifest with AD_ID permissions.
 */
private fun manifest(): Document = parse(
    """<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.instagram.barcelona">
      <uses-permission android:name="android.permission.INTERNET"/>
      <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
      <uses-permission android:name="android.permission.ACCESS_ADSERVICES_AD_ID"/>
      <uses-permission android:name="android.permission.CAMERA"/>
    </manifest>""",
)

/**
 * Extract all uses-permission names from a manifest Document.
 */
private fun perms(doc: Document): List<String> {
    val nodes = doc.getElementsByTagName("uses-permission")
    return (0 until nodes.length).map {
        (nodes.item(it) as org.w3c.dom.Element).getAttribute("android:name")
    }
}

/**
 * Unit tests for AD_ID permission removal logic.
 */
class AdIdStripTest {
    /**
     * Verify that only AD_ID permissions are removed while other permissions remain intact.
     */
    @Test fun removesOnlyAdIdPermissions() {
        val doc = manifest()
        assertEquals(2, stripAdIdPermissions(doc))
        val remaining = perms(doc)
        assertEquals(listOf("android.permission.INTERNET", "android.permission.CAMERA"), remaining)
    }

    /**
     * Verify that a manifest without AD_ID permissions is left unchanged.
     */
    @Test fun noMatchIsNoOp() {
        val doc = parse(
            """<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="x">
              <uses-permission android:name="android.permission.INTERNET"/>
            </manifest>""",
        )
        assertEquals(0, stripAdIdPermissions(doc))
        assertTrue(perms(doc).contains("android.permission.INTERNET"))
    }
}
