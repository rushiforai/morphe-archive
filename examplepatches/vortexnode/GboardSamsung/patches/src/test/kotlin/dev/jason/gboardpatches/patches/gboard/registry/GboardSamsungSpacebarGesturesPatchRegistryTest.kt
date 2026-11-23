package dev.jason.gboardpatches.patches.gboard.registry

import dev.jason.gboardpatches.patches.gboard.features.spacebargesture.gboardSpacebarGestureBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.spacebargesture.gboardSpacebarGestureResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.spacebargesture.gboardSpacebarGestureSoftKeyPatch
import dev.jason.gboardpatches.patches.gboard.features.swipedismiss.gboardSwipeDismissBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.swipedismiss.gboardSwipeDismissFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.shared.GboardKeyboardViewHolderTouchFeature
import dev.jason.gboardpatches.patches.gboard.shared.GboardKeyboardViewHolderTouchSelectionStore
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardTargetAdmission
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardSamsungSpacebarGesturesPatchRegistryTest {
    @Test
    fun samsungSpacebarGesturesIsAnIndependentDefaultEnabledPublicPatch() {
        assertEquals("Samsung Spacebar Gestures", gboardSamsungSpacebarGesturesPatch.name)
        assertTrue(gboardSamsungSpacebarGesturesPatch.default)
        assertTrue(
            gboardSamsungSpacebarGesturesPatch.description.orEmpty().contains(
                "Enable Samsung-style spacebar gestures",
            ),
        )
        assertSame(
            gboardSamsungSpacebarGesturesPatch,
            GboardPublishedPatchCatalog.morpheRegistrations.single {
                it.name == "Samsung Spacebar Gestures"
            },
        )
        assertEquals(
            setOf(
                "samsung_spacebar_gestures.dispatch",
                "samsung_spacebar_gestures.soft_key",
            ),
            GboardTargetAdmission.admittedContributionIdsByFeature["samsung_spacebar_gestures"],
        )
    }

    @Test
    fun samsungSpacebarGesturesHasZeroDependencyOnSwipeDismiss() {
        val deps = gboardSamsungSpacebarGesturesPatch.dependencies
        assertTrue(deps.any { it === gboardSpacebarGestureBytecodePatch })
        assertTrue(deps.any { it === gboardSpacebarGestureResourcePatch })
        assertTrue(deps.any { it === gboardSpacebarGestureSoftKeyPatch })
        assertFalse(deps.any { it === gboardSwipeDismissPatch })
        assertFalse(deps.any { it === gboardSwipeDismissBytecodePatch })
        assertFalse(deps.any { it === gboardSwipeDismissFeatureMarkerPatch })
    }

    @Test
    fun spacebarResourcePatchIsOwnedByOnlyOnePublicPatchAcrossCatalog() {
        val owners = GboardPublishedPatchCatalog.morpheRegistrations.filter { patch ->
            patch.dependencies.any { dep -> dep === gboardSpacebarGestureResourcePatch }
        }
        assertEquals(listOf(gboardSamsungSpacebarGesturesPatch), owners)
    }

    @Test
    fun keyboardViewHolderTouchSelectionStoreIsolatesIndependentAndCombinedSelections() {
        val store = GboardKeyboardViewHolderTouchSelectionStore<Any>()
        val spacebarOnlyContext = Any()
        val swipeDismissOnlyContext = Any()
        val bothEnabledContext = Any()

        store.add(spacebarOnlyContext, GboardKeyboardViewHolderTouchFeature.SAMSUNG_SPACEBAR_GESTURES)
        store.add(swipeDismissOnlyContext, GboardKeyboardViewHolderTouchFeature.SWIPE_DISMISS)
        store.add(bothEnabledContext, GboardKeyboardViewHolderTouchFeature.SWIPE_DISMISS)
        store.add(bothEnabledContext, GboardKeyboardViewHolderTouchFeature.SAMSUNG_SPACEBAR_GESTURES)
        store.add(bothEnabledContext, GboardKeyboardViewHolderTouchFeature.SAMSUNG_SPACEBAR_GESTURES)

        assertEquals(
            setOf(GboardKeyboardViewHolderTouchFeature.SAMSUNG_SPACEBAR_GESTURES),
            store.take(spacebarOnlyContext),
        )
        assertEquals(
            setOf(GboardKeyboardViewHolderTouchFeature.SWIPE_DISMISS),
            store.take(swipeDismissOnlyContext),
        )
        assertEquals(
            setOf(
                GboardKeyboardViewHolderTouchFeature.SWIPE_DISMISS,
                GboardKeyboardViewHolderTouchFeature.SAMSUNG_SPACEBAR_GESTURES,
            ),
            store.take(bothEnabledContext),
        )
        assertEquals(emptySet<GboardKeyboardViewHolderTouchFeature>(), store.take(bothEnabledContext))
    }
}
