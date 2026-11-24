package dev.jason.gboardpatches.extension.spacebargesture;

import org.junit.Assert;
import org.junit.Test;

import java.util.Arrays;
import java.util.List;

public final class GboardSpacebarSwipeDirectionResolverTest {
    @Test
    public void samsungModeUsesStrictFixedDirections() {
        GboardSpacebarSwipeDirectionResolver resolver = new GboardSpacebarSwipeDirectionResolver();
        // Right-to-left (GestureState.PREVIOUS, dx < 0) -> NEXT (+1)
        Assert.assertEquals(
                +1,
                resolver.resolveStep(
                        GboardSpacebarGestureSettings.SWIPE_MODE_SAMSUNG,
                        GboardSpacebarGestureState.LanguageDirection.PREVIOUS,
                        1000L,
                        "ed1"));
        // Left-to-right (GestureState.NEXT, dx > 0) -> PREVIOUS (-1)
        Assert.assertEquals(
                -1,
                resolver.resolveStep(
                        GboardSpacebarGestureSettings.SWIPE_MODE_SAMSUNG,
                        GboardSpacebarGestureState.LanguageDirection.NEXT,
                        1200L,
                        "ed1"));
        // Unknown/null mode safely falls back to base Samsung order
        Assert.assertEquals(
                +1,
                resolver.resolveStep(
                        null,
                        GboardSpacebarGestureState.LanguageDirection.PREVIOUS,
                        1400L,
                        "ed1"));
    }

    @Test
    public void freeModeAnchorsFirstSwipeForFiveSecondsAndResetsOnTimeoutOrEditorChange() {
        GboardSpacebarSwipeDirectionResolver resolver = new GboardSpacebarSwipeDirectionResolver();
        // First swipe right (dx > 0 -> NEXT) advances forward (+1) and anchors right
        Assert.assertEquals(
                +1,
                resolver.resolveStep(
                        GboardSpacebarGestureSettings.SWIPE_MODE_FREE,
                        GboardSpacebarGestureState.LanguageDirection.NEXT,
                        1000L,
                        "ed1"));
        // Same direction within 5s keeps going forward (+1)
        Assert.assertEquals(
                +1,
                resolver.resolveStep(
                        GboardSpacebarGestureSettings.SWIPE_MODE_FREE,
                        GboardSpacebarGestureState.LanguageDirection.NEXT,
                        4000L,
                        "ed1"));
        // Opposite direction within 5s steps back (-1)
        Assert.assertEquals(
                -1,
                resolver.resolveStep(
                        GboardSpacebarGestureSettings.SWIPE_MODE_FREE,
                        GboardSpacebarGestureState.LanguageDirection.PREVIOUS,
                        7000L,
                        "ed1"));
        // After > 5000ms pause, left swipe becomes the new forward (+1) anchor
        Assert.assertEquals(
                +1,
                resolver.resolveStep(
                        GboardSpacebarGestureSettings.SWIPE_MODE_FREE,
                        GboardSpacebarGestureState.LanguageDirection.PREVIOUS,
                        12_500L,
                        "ed1"));
        // Changing editor resets anchor immediately so right swipe is again forward (+1)
        Assert.assertEquals(
                +1,
                resolver.resolveStep(
                        GboardSpacebarGestureSettings.SWIPE_MODE_FREE,
                        GboardSpacebarGestureState.LanguageDirection.NEXT,
                        13_000L,
                        "ed2"));
    }

    @Test
    public void fourLanguageStaticAndMruOrderingNeverMixesCoordinates() {
        List<String> staticEntries = Arrays.asList("KK", "EN", "TR", "RU");
        int[] shuffledMru = new int[] {3, 1, 0, 2}; // RU, EN, KK, TR

        // Samsung / Free mode: always preserves static 1->2->3->4 order
        List<String> fixed = GboardSpacebarLanguageNavigator.resolveOrderedEntries(
                staticEntries, shuffledMru, false);
        Assert.assertEquals(Arrays.asList("KK", "EN", "TR", "RU"), fixed);

        // Gboard mode: builds true MRU order matching Lrek.c permutation
        List<String> mru = GboardSpacebarLanguageNavigator.resolveOrderedEntries(
                staticEntries, shuffledMru, true);
        Assert.assertEquals(Arrays.asList("RU", "EN", "KK", "TR"), mru);

        // Invalid/corrupted order array safely falls back to staticEntries
        List<String> fallback = GboardSpacebarLanguageNavigator.resolveOrderedEntries(
                staticEntries, new int[] {0, 0, 1, 2}, true);
        Assert.assertEquals(staticEntries, fallback);
    }
}
