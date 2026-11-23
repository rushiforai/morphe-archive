package dev.jason.gboardpatches.patches.gboard.registry

import com.google.gson.JsonParser
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardTargetAdmission
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GboardContributionWiringTest {
    @Test
    fun `typed wiring covers every multi-contribution catalog feature`() {
        val catalog = JsonParser.parseString(
            Files.readString(
                Path.of("src/main/resources/gboard/gboard-port-product-catalog.json"),
            ),
        ).asJsonObject
        val expected = catalog.getAsJsonArray("features")
            .map { feature -> feature.asJsonObject }
            .filter { feature -> feature.getAsJsonArray("contributions").size() > 1 }
            .associate { feature ->
                val featureId = feature.get("feature_id").asString
                featureId to GboardTargetAdmission.admittedContributionIdsByFeature
                    .getValue(featureId)
            }

        assertEquals(expected, GboardContributionWiring.registeredContributionIdsByFeature)
    }

    @Test
    fun `independent execution units can be admitted without sibling mutations`() {
        assertEquals(
            setOf("custom_symbols.soft_key"),
            GboardContributionWiring.activeContributionIds(
                "custom_symbols",
                setOf("custom_symbols.soft_key"),
            ),
        )
        assertEquals(
            setOf("long_press_editing_shortcuts.pointer"),
            GboardContributionWiring.activeContributionIds(
                "long_press_editing_shortcuts",
                setOf("long_press_editing_shortcuts.pointer"),
            ),
        )
    }

    @Test
    fun `indivisible shared patch stages fail closed when partially admitted`() {
        assertThrows(IllegalStateException::class.java) {
            GboardContributionWiring.activeContributionIds(
                "rounded_keyboard_panel",
                setOf("rounded_keyboard_panel.admission"),
            )
        }
    }
}
