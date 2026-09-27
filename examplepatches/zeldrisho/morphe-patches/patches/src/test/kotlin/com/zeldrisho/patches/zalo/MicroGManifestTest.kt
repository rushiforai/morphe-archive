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

    /** Checks the injected microG package query and stock signature metadata. */
    @Test
    fun injectsPackageVisibilityAndSignatureMetadata() {
        val doc = document(
            """<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application/></manifest>""",
        )

        injectMicroGManifest(doc)

        val pkg = doc.getElementsByTagName("package").item(0) as Element
        assertEquals(MICROG_PACKAGE, pkg.getAttribute("android:name"))
        val metadata = doc.getElementsByTagName("meta-data").item(0) as Element
        assertEquals("app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE", metadata.getAttribute("android:name"))
        assertEquals(STOCK_VNG_CERT_HEX, metadata.getAttribute("android:value"))
    }

    /** Verifies that existing queries and signature metadata are preserved without duplicate entries. */
    @Test
    fun reusesQueriesAndDoesNotDuplicateExistingEntries() {
        val doc = document(
            """<manifest xmlns:android="http://schemas.android.com/apk/res/android"><queries><package android:name="$MICROG_PACKAGE"/></queries><application>
                <meta-data android:name="app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE" android:value="existing"/>
            </application></manifest>""",
        )

        injectMicroGManifest(doc)

        assertEquals(1, doc.getElementsByTagName("queries").length)
        assertEquals(1, doc.getElementsByTagName("package").length)
        assertEquals(1, doc.getElementsByTagName("meta-data").length)
        assertEquals("existing", (doc.getElementsByTagName("meta-data").item(0) as Element).getAttribute("android:value"))
    }
}
