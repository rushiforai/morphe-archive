package dev.jason.gboardpatches.patches.gboard.shared

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardGestureFamilySelectionStoreTest {
    @Test
    fun `take returns each selected feature once and removes the context`() {
        val store = GboardGestureFamilySelectionStore<Any>()
        val context = Any()
        store.add(context, GboardGestureFamilyFeature.LONG_PRESS_QUICK_ACTIONS)
        store.add(context, GboardGestureFamilyFeature.LONG_PRESS_QUICK_ACTIONS)

        assertEquals(
            listOf(
                GboardGestureFamilyFeature.LONG_PRESS_QUICK_ACTIONS,
            ),
            store.take(context).toList(),
        )
        assertTrue(store.take(context).isEmpty())
    }
}
