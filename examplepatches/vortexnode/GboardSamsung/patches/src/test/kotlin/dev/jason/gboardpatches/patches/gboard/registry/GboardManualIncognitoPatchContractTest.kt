package dev.jason.gboardpatches.patches.gboard.registry

import dev.jason.gboardpatches.patches.gboard.shared.accesspoint.gboardAccessPointContributions1803Patch
import dev.jason.gboardpatches.patches.gboard.features.manualincognito.gboardManualIncognitoFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.manualincognito.gboardManualIncognitoLifecyclePatch
import dev.jason.gboardpatches.patches.gboard.features.manualincognito.gboardManualIncognitoPolicyPatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesSettingsPatch
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardManualIncognitoPatchContractTest {
    @Test
    fun publicPatchOwnsComplete1803PortAndKeepsSettingsMasterOffByDefault() {
        val patch = gboardManualIncognitoModePatch
        assertEquals("Incognito Mode Toggle", patch.name)
        assertEquals(
            "Add an Incognito toggle to the Access Point toolbar and configure clipboard and voice typing availability while Incognito mode is active.\n" +
                "Добавляет переключатель режима инкогнито на панель инструментов и позволяет настроить работу буфера обмена и голосового ввода в этом режиме.",
            patch.description,
        )
        assertTrue(patch.default)
        assertEquals(
            listOf(
                gboardPatchesSettingsPatch,
                gboardManualIncognitoFeatureMarkerPatch,
                gboardManualIncognitoLifecyclePatch,
                gboardManualIncognitoPolicyPatch,
                gboardAccessPointContributions1803Patch,
            ),
            patch.dependencies.toList(),
        )
        assertEquals(
            "18.5.4.993608717-release-arm64-v8a",
            patch.compatibility!!.single().targets.single().version,
        )
    }
}
