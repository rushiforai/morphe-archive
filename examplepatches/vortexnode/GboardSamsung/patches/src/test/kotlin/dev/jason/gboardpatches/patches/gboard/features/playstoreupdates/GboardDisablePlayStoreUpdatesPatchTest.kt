package dev.jason.gboardpatches.patches.gboard.features.playstoreupdates

import dev.jason.gboardpatches.patches.gboard.registry.gboardDisablePlayStoreUpdatesPatch
import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import java.io.ByteArrayInputStream
import java.nio.charset.StandardCharsets
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertSame
import org.junit.Test

class GboardDisablePlayStoreUpdatesPatchTest {
    @Test
    fun `manifest transform sets versionCode to max int without altering package or versionName`() {
        val xml = """
            <?xml version="1.0" encoding="utf-8"?>
            <manifest xmlns:android="http://schemas.android.com/apk/res/android"
                package="com.google.android.inputmethod.latin"
                android:versionCode="123456"
                android:versionName="18.5.4.993608717-release-arm64-v8a">
                <application android:label="Gboard" />
            </manifest>
        """.trimIndent()
        val factory = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
        val document = factory.newDocumentBuilder().parse(
            ByteArrayInputStream(xml.toByteArray(StandardCharsets.UTF_8)),
        )

        applyDisablePlayStoreUpdatesToManifest(document)

        val root = document.documentElement
        assertEquals(
            Int.MAX_VALUE.toString(),
            root.getAttributeNS(ANDROID_NS, "versionCode"),
        )
        assertEquals("com.google.android.inputmethod.latin", root.getAttribute("package"))
        assertEquals(
            "18.5.4.993608717-release-arm64-v8a",
            root.getAttributeNS(ANDROID_NS, "versionName"),
        )
    }

    @Test
    fun `public patch metadata is opt-in and targets Gboard compatibility`() {
        val patch = gboardDisablePlayStoreUpdatesPatch

        assertEquals("Disable Play Store updates", patch.name)
        assertFalse(patch.default)
        assertEquals(1, patch.dependencies.size)
        assertSame(gboardDisablePlayStoreUpdatesResourcePatch, patch.dependencies.single())
        assertSame(COMPATIBILITY_GBOARD, checkNotNull(patch.compatibility).single())
    }
}
