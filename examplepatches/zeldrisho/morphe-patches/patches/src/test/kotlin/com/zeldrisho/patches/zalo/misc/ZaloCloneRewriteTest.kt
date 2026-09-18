package com.zeldrisho.patches.zalo.misc

import org.w3c.dom.Document
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

private fun manifest(): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
    ByteArrayInputStream(
        """
        <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.zing.zalo">
          <permission android:name="com.zing.zalo.permission.LOCAL"/>
          <uses-permission android:name="zing.zalo.permission.ZALO_SERVICE"/>
          <application android:label="Zalo">
            <activity android:name="com.zing.zalo.ui.ZaloLauncherActivity"/>
          </application>
          <provider android:authorities="com.zing.zalo.files;third.party" android:permission="zing.zalo.permission.ZALO_SERVICE"/>
        </manifest>
        """.trimIndent().toByteArray(),
    ),
)

class ZaloCloneRewriteTest {
    @Test fun validatesPackageNames() {
        assertTrue(isValidZaloPackageName("com.zing.zalo.clone"))
        assertFalse(isValidZaloPackageName("Com.bad"))
        assertFalse(isValidZaloPackageName("com"))
    }

    /** Verifies that only provider URIs owned by Zalo are rewritten. */
    @Test fun rewritesPackageOwnedProviderUrisOnly() {
        assertEquals(
            "content://com.zing.zalo.clone.db.preferencesprovider",
            rewriteZaloProviderUri(
                "content://com.zing.zalo.db.preferencesprovider",
                "com.zing.zalo.clone",
            ),
        )
        assertEquals(
            "content://third.party.provider",
            rewriteZaloProviderUri("content://third.party.provider", "com.zing.zalo.clone"),
        )
    }

    @Test fun rewritesOwnedManifestIdentitiesOnly() {
        val document = manifest()
        rewriteZaloPackage(document, "com.zing.zalo.clone")
        assertEquals("com.zing.zalo.clone", document.documentElement.getAttribute("package"))
        assertEquals(
            "com.zing.zalo.clone.files;third.party",
            document.getElementsByTagName("provider").item(0).attributes
                .getNamedItem("android:authorities").nodeValue,
        )
        assertEquals(
            "com.zing.zalo.clone.permission.ZALO_SERVICE",
            document.getElementsByTagName("provider").item(0).attributes
                .getNamedItem("android:permission").nodeValue,
        )
    }

    @Test fun rewritesApplicationAndLauncherLabels() {
        val document = manifest()
        applyZaloAppName(document, "Zalo cloned")
        assertEquals(
            "Zalo cloned",
            document.getElementsByTagName("application").item(0)
                .attributes.getNamedItem("android:label").nodeValue,
        )
        assertEquals(
            "Zalo cloned",
            document.getElementsByTagName("activity").item(0)
                .attributes.getNamedItem("android:label").nodeValue,
        )
    }
}
