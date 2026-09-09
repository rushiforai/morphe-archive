package com.zeldrisho.threads.patches.misc.packagename

import org.w3c.dom.Document
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

/**
 * Parse an XML string into a DOM Document for testing.
 */
private fun parseManifest(xml: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
    .parse(ByteArrayInputStream(xml.toByteArray()))

/**
 * Generate a test manifest with providers, permissions, and custom attributes.
 */
private fun manifest(
    packageName: String = "com.instagram.barcelona",
    extra: String = "",
): Document = parseManifest(
    """<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="$packageName">
      <uses-permission android:name="android.permission.INTERNET"/>
      <permission android:name="com.instagram.barcelona.permission.MY_PERM"/>
      <uses-permission android:name="com.instagram.barcelona.permission.MY_PERM"/>
      <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
      <application><activity android:name="com.instagram.barcelona.mainactivity.BarcelonaActivity"/></application>
      <provider android:authorities="com.instagram.barcelona.fileprovider"/>
      <provider android:authorities="com.google.firebase.MESSAGING"/>
      $extra
    </manifest>""",
)

/**
 * Extract all values of a given attribute from all elements with a given tag name.
 */
private fun attr(doc: Document, tag: String, attr: String): List<String> {
    val nodes = doc.getElementsByTagName(tag)
    return (0 until nodes.length).map {
        (nodes.item(it) as org.w3c.dom.Element).getAttribute(attr)
    }
}

/**
 * Unit tests for package name validation and manifest rewriting logic.
 */
class PackageRewriteTest {
    @Test fun rewritesEachAuthorityIndependently() {
        val doc = manifest(
            extra = """
            <provider android:authorities="third.party;com.instagram.barcelona.files;com.instagram.barcelona.cache"/>
            <provider android:authorities="com.instagram.barcelona.files;third.party"/>
        """,
        )
        rewritePackage(doc, "example.clone")
        assertEquals(
            listOf("third.party;example.clone.files;example.clone.cache", "example.clone.files;third.party"),
            attr(doc, "provider", "android:authorities").takeLast(2),
        )
    }

    @Test fun preservesResourceReferencesAndUnrelatedAuthorities() {
        val doc = manifest(
            extra = """
            <provider android:authorities="@string/provider_authority"/>
            <provider android:authorities="com.instagram.barcelonax.files;.relative;third.party"/>
            <provider android:authorities=""/>
            <provider/>
        """,
        )
        rewritePackage(doc, "example.clone")
        assertEquals(
            listOf("@string/provider_authority", "com.instagram.barcelonax.files;.relative;third.party", "", ""),
            attr(doc, "provider", "android:authorities").takeLast(4),
        )
        val providers = doc.getElementsByTagName("provider")
        assertFalse(
            (providers.item(providers.length - 1) as org.w3c.dom.Element)
                .hasAttribute("android:authorities"),
        )
    }

    @Test fun replacesOnlyTheLeadingPackageInAnAuthority() {
        val doc = manifest(
            extra = """
            <provider android:authorities="com.instagram.barcelona.files.com.instagram.barcelona.backup"/>
        """,
        )
        rewritePackage(doc, "example.clone")
        assertEquals(
            "example.clone.files.com.instagram.barcelona.backup",
            attr(doc, "provider", "android:authorities").last(),
        )
    }

    @Test fun rewritesAuthorityEqualToOriginalPackage() {
        val doc = manifest(
            extra = """
            <provider android:authorities="com.instagram.barcelona"/>
            <provider android:authorities="com.instagram.barcelona;com.instagram.barcelona.files"/>
        """,
        )
        rewritePackage(doc, "example.clone")
        assertEquals(
            listOf("example.clone", "example.clone;example.clone.files"),
            attr(doc, "provider", "android:authorities").takeLast(2),
        )
    }

    @Test fun rewritesCustomPermissionsForShorterPackageName() {
        val newPackage = "com.instagram"
        assertTrue(isValidPackageName(newPackage))
        val doc = manifest()
        rewritePackage(doc, newPackage)

        assertEquals(
            listOf("com.instagram.permission.MY_PERM"),
            attr(doc, "permission", "android:name"),
        )
        assertEquals(
            listOf(
                "android.permission.INTERNET",
                "com.instagram.permission.MY_PERM",
                "com.google.android.gms.permission.AD_ID",
            ),
            attr(doc, "uses-permission", "android:name"),
        )
    }

    /**
     * Verify that valid Android package names are accepted.
     */
    @Test fun validNamesAccepted() {
        assertTrue(isValidPackageName("com.instagram.barcelona.morphe"))
        assertTrue(isValidPackageName("a.b"))
    }

    /**
     * Verify that invalid Android package names are rejected.
     */
    @Test fun invalidNamesRejected() {
        assertFalse(isValidPackageName(null))
        assertFalse(isValidPackageName("SingleSegment"))
        assertFalse(isValidPackageName("1com.bad.name"))
        assertFalse(isValidPackageName("Com.Upper.Start"))
        assertFalse(isValidPackageName(""))
    }

    /**
     * Verify that package rewriting updates the manifest package, provider authorities, and custom permissions.
     */
    @Test fun rewritesPackageProvidersAndCustomPermissions() {
        val doc = manifest()
        rewritePackage(doc, "com.instagram.barcelona.morphe")
        assertEquals("com.instagram.barcelona.morphe", doc.documentElement.getAttribute("package"))
        assertTrue(
            attr(doc, "provider", "android:authorities")
                .contains("com.instagram.barcelona.morphe.fileprovider"),
        )
        assertTrue(
            attr(doc, "provider", "android:authorities")
                .contains("com.google.firebase.MESSAGING"),
        )
        val perms = attr(doc, "permission", "android:name") +
            attr(doc, "uses-permission", "android:name")
        assertTrue(perms.contains("com.instagram.barcelona.morphe.permission.MY_PERM"))
        assertFalse(perms.any { it.startsWith("com.instagram.barcelona.permission.") })
        // third-party / system permissions untouched
        assertTrue(perms.contains("android.permission.INTERNET"))
        assertTrue(perms.contains("com.google.android.gms.permission.AD_ID"))
    }
}
