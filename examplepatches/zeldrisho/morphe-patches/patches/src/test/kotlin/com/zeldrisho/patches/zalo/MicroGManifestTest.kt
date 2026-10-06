package com.zeldrisho.patches.zalo

import com.zeldrisho.patches.zalo.microg.MICROG_PACKAGE
import com.zeldrisho.patches.zalo.microg.STOCK_VNG_CERT_HEX
import com.zeldrisho.patches.zalo.microg.injectMicroGManifest
import org.w3c.dom.Element
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals

class MicroGManifestTest {
    /** Parses a synthetic manifest XML string into a mutable DOM document. */
    private fun document(xml: String) = DocumentBuilderFactory.newInstance()
        .newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.toByteArray()))

    /** Checks package visibility and both upstream identity metadata values. */
    @Test
    fun injectsPackageVisibilityAndSignatureMetadata() {
        val doc = document(
            """<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application/></manifest>""",
        )

        injectMicroGManifest(doc)

        val pkg = doc.getElementsByTagName("package").item(0) as Element
        assertEquals(MICROG_PACKAGE, pkg.getAttribute("android:name"))
        val metadata = (0 until doc.getElementsByTagName("meta-data").length)
            .map { doc.getElementsByTagName("meta-data").item(it) as Element }
            .associate { it.getAttribute("android:name") to it.getAttribute("android:value") }
        assertEquals("com.zing.zalo", metadata["app.revanced.android.gms.SPOOFED_PACKAGE_NAME"])
        assertEquals(STOCK_VNG_CERT_HEX, metadata["app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE"])
    }

    /** Verifies existing queries and metadata are preserved without duplicate entries. */
    @Test
    fun reusesQueriesAndDoesNotDuplicateExistingEntries() {
        val doc = document(
            """<manifest xmlns:android="http://schemas.android.com/apk/res/android"><queries><package android:name="$MICROG_PACKAGE"/></queries><application>
                <meta-data android:name="app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE" android:value="existing"/>
                <meta-data android:name="app.revanced.android.gms.SPOOFED_PACKAGE_NAME" android:value="existing-name"/>
            </application></manifest>""",
        )

        injectMicroGManifest(doc)

        assertEquals(1, doc.getElementsByTagName("queries").length)
        assertEquals(1, doc.getElementsByTagName("package").length)
        assertEquals(2, doc.getElementsByTagName("meta-data").length)
        val metadata = (0 until doc.getElementsByTagName("meta-data").length)
            .map { doc.getElementsByTagName("meta-data").item(it) as Element }
            .associate { it.getAttribute("android:name") to it.getAttribute("android:value") }
        assertEquals("existing", metadata["app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE"])
        assertEquals("existing-name", metadata["app.revanced.android.gms.SPOOFED_PACKAGE_NAME"])
    }
}
