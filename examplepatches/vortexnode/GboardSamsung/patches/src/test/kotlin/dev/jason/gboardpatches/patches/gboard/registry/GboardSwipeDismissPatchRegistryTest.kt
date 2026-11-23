package dev.jason.gboardpatches.patches.gboard.registry

import dev.jason.gboardpatches.patches.gboard.features.spacebargesture.gboardSpacebarGestureBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.spacebargesture.gboardSpacebarGestureResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.swipedismiss.gboardSwipeDismissBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.swipedismiss.gboardSwipeDismissFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardTargetAdmission
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardSwipeDismissPatchRegistryTest {
    @Test
    fun swipeDismissIsAnIndependentDefaultEnabledPublicPatch() {
        assertEquals("Swipe Down to Dismiss Keyboard", gboardSwipeDismissPatch.name)
        assertTrue(gboardSwipeDismissPatch.default)
        assertTrue(
            gboardSwipeDismissPatch.description.orEmpty().contains(
                "Свайп вниз от строки подсказок или панели инструментов для закрытия клавиатуры.",
            ),
        )
        assertTrue(
            gboardSwipeDismissPatch.description.orEmpty().contains(
                "Swipe down from the suggestions or toolbar to close the keyboard.",
            ),
        )
        assertEquals(
            setOf("swipe_down_to_dismiss_keyboard.dispatch"),
            GboardTargetAdmission.admittedContributionIdsByFeature["swipe_down_to_dismiss_keyboard"],
        )
    }

    @Test
    fun swipeDismissDoesNotDependOnSamsungSpacebarGesturesOrItsResources() {
        val deps = gboardSwipeDismissPatch.dependencies
        assertTrue(deps.any { it === gboardSwipeDismissFeatureMarkerPatch })
        assertTrue(deps.any { it === gboardSwipeDismissBytecodePatch })
        assertFalse(deps.any { it === gboardSpacebarGestureResourcePatch })
        assertFalse(deps.any { it === gboardSpacebarGestureBytecodePatch })
        assertFalse(deps.any { it === gboardSamsungSpacebarGesturesPatch })
    }
}
