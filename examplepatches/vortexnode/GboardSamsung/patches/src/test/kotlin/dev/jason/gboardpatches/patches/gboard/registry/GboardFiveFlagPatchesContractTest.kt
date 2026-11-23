package dev.jason.gboardpatches.patches.gboard.registry

import dev.jason.gboardpatches.patches.gboard.features.accesspointsmenu.gboardAccessPointsMenuFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.accesspointsmenu.gboardAccessPointsMenuFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.accesspointsmenu.gboardAccessPointsMenu1853Patch
import dev.jason.gboardpatches.patches.gboard.features.emojisize.gboardEmojiSizeFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.emojisize.gboardEmojiSizeFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.splitkeyboard.gboardSplitKeyboardFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.splitkeyboard.gboardSplitKeyboardAccessPointPatch
import dev.jason.gboardpatches.patches.gboard.features.splitkeyboard.gboardSplitKeyboardModePatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesSettingsPatch
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardFiveFlagPatchesContractTest {
    @Test
    fun activeFlagPatchesRemainIndependentAndExact1854Only() {
        val expectedDependencies = mapOf(
            gboardEmojiSizePatch to listOf(
                gboardPatchesSettingsPatch,
                gboardEmojiSizeFeatureMarkerPatch,
                gboardEmojiSizeFlagValuePatch,
            ),
            gboardAccessPointsMenuStylePatch to listOf(
                gboardPatchesSettingsPatch,
                gboardAccessPointsMenuFeatureMarkerPatch,
                gboardAccessPointsMenuFlagValuePatch,
                gboardAccessPointsMenu1853Patch,
            ),
            gboardSplitKeyboardPatch to listOf(
                gboardPatchesSettingsPatch,
                gboardSplitKeyboardFeatureMarkerPatch,
                gboardSplitKeyboardAccessPointPatch,
                gboardSplitKeyboardModePatch,
            ),
        )

        assertEquals(
            listOf(
                "Change emoji size",
                "Access Points menu style",
                "Enable split keyboard",
            ).toSet(),
            expectedDependencies.keys.map { it.name }.toSet(),
        )
        expectedDependencies.forEach { (patch, dependencies) ->
            assertTrue(patch.default)
            assertEquals(dependencies, patch.dependencies.toList())
            assertEquals(
                "18.5.4.993608717-release-arm64-v8a",
                patch.compatibility!!.single().targets.single().version,
            )
        }
    }

    @Test
    fun generatedCatalogContainsExactlyOneRowForEachFeature() {
        val names = GboardPublishedPatchCatalog.morpheRegistrations.map { it.name }
        listOf(
            "Change emoji size",
            "Access Points menu style",
            "Enable split keyboard",
        ).forEach { expected ->
            assertEquals(1, names.count { it == expected })
        }
    }

    @Test
    fun splitKeyboardInstallsItsAccessPointAndModePatchesWithoutPromotionFlagOverride() {
        val registry = Files.readString(Path.of(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                "GboardPatchRegistry.kt",
        ))
        val splitKeyboardBlock = registry.substringAfter("val gboardSplitKeyboardPatch")
            .substringBefore("val gboardRoundedKeyboardPanelPatch")

        assertTrue(splitKeyboardBlock.contains("gboardSplitKeyboardAccessPointPatch"))
        assertTrue(splitKeyboardBlock.contains("gboardSplitKeyboardModePatch"))
        assertTrue(!splitKeyboardBlock.contains("gboardSplitKeyboardFlagValuePatch"))
    }
}
