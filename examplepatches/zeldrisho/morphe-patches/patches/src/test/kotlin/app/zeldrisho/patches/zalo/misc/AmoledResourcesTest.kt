package app.zeldrisho.patches.zalo.misc

import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import org.w3c.dom.Element

class AmoledResourcesTest {
    private fun document(layer: String = "@color/ng95") = DocumentBuilderFactory.newInstance()
        .newDocumentBuilder().parse(ByteArrayInputStream("""
            <resources>
              <style name="BaseThemeDefault.Dark">
                <item name="bgCSC_Background">@color/ng95</item>
                <item name="layer_background">$layer</item>
              </style>
              <style name="BaseThemeDefault.Light">
                <item name="tTimestamp_Unread">@color/ng95</item>
              </style>
            </resources>
        """.trimIndent().toByteArray()))

    @Test fun onlyDarkSurfaceItemsChange() {
        val document = document()
        blackenDesignSystemDarkSurfaces(document)
        val items = document.getElementsByTagName("item")
        assertEquals("#ff000000", (items.item(0) as Element).textContent)
        assertEquals("#ff000000", (items.item(1) as Element).textContent)
        assertEquals("@color/ng95", (items.item(2) as Element).textContent)
    }

    @Test fun changedSurfaceFailsBeforeMutation() {
        val document = document("@color/other")
        assertFailsWith<IllegalStateException> { blackenDesignSystemDarkSurfaces(document) }
        assertEquals("@color/ng95", document.getElementsByTagName("item").item(0).textContent)
    }
}
