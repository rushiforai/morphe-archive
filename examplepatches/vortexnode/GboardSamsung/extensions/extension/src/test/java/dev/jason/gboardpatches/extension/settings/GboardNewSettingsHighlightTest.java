package dev.jason.gboardpatches.extension.settings;

import org.junit.Assert;
import org.junit.Test;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

public final class GboardNewSettingsHighlightTest {
    private static final GboardNewSettingsHighlight.Item SAMPLE_ITEM =
            new GboardNewSettingsHighlight.Item(
                    "sample_setting_v416",
                    "com.example.SampleFeature",
                    "4.16.0",
                    12345);

    @Test
    public void clampHighlightDaysEnforcesZeroToTenBoundsAndDefaultIsSeven() {
        Assert.assertEquals(7, GboardPatchesSettings.HIGHLIGHT_NEW_SETTINGS_DEFAULT_DAYS);
        Assert.assertEquals(0, GboardPatchesSettings.clampHighlightNewSettingsDays(-5));
        Assert.assertEquals(0, GboardPatchesSettings.clampHighlightNewSettingsDays(0));
        Assert.assertEquals(7, GboardPatchesSettings.clampHighlightNewSettingsDays(7));
        Assert.assertEquals(10, GboardPatchesSettings.clampHighlightNewSettingsDays(10));
        Assert.assertEquals(10, GboardPatchesSettings.clampHighlightNewSettingsDays(14));
    }

    @Test
    public void itemIsHighlightedWithinWindowAndClearsWhenExpiredOrDisabledOrViewed() {
        long day0 = 1_700_000_000_000L;
        Map<String, Long> firstSeen = Map.of("4.16.0", day0);

        // Within 7-day window -> highlighted
        Assert.assertTrue(GboardNewSettingsHighlight.isItemHighlightedInternal(
                SAMPLE_ITEM, 7, Collections.emptySet(), firstSeen,
                day0 + 6L * GboardNewSettingsHighlight.MILLIS_PER_DAY));

        // Exactly at 7-day boundary -> expired
        Assert.assertFalse(GboardNewSettingsHighlight.isItemHighlightedInternal(
                SAMPLE_ITEM, 7, Collections.emptySet(), firstSeen,
                day0 + 7L * GboardNewSettingsHighlight.MILLIS_PER_DAY));

        // Setting days to 0 ("Off") immediately hides dot
        Assert.assertFalse(GboardNewSettingsHighlight.isItemHighlightedInternal(
                SAMPLE_ITEM, 0, Collections.emptySet(), firstSeen, day0 + 1000L));

        // Marking item viewed immediately hides dot
        Assert.assertFalse(GboardNewSettingsHighlight.isItemHighlightedInternal(
                SAMPLE_ITEM, 7, Set.of(SAMPLE_ITEM.id), firstSeen, day0 + 1000L));
    }

    @Test
    public void seenIdsAndVersionTimestampsRoundTripCleanly() {
        Set<String> ids = new LinkedHashSet<>();
        ids.add("a_v416");
        ids.add("b_v416");
        String encodedIds = GboardNewSettingsHighlight.formatSeenIds(ids);
        Assert.assertEquals(ids, GboardNewSettingsHighlight.parseSeenIds(encodedIds));

        Map<String, Long> timestamps = new LinkedHashMap<>();
        timestamps.put("4.16.0", 1_700_000_000_000L);
        timestamps.put("4.17.0", 1_705_000_000_000L);
        String encodedTs = GboardNewSettingsHighlight.formatVersionTimestamps(timestamps);
        Assert.assertEquals(timestamps, GboardNewSettingsHighlight.parseVersionTimestamps(encodedTs));
    }

    @Test
    public void nullContextCallsAreSafeNoOps() {
        Assert.assertFalse(GboardNewSettingsHighlight.hasAnyHighlightedItem(null));
        Assert.assertFalse(GboardNewSettingsHighlight.isItemHighlighted(
                null, GboardNewSettingsHighlight.ITEM_HIGHLIGHT_NEW_SETTINGS));
        Assert.assertFalse(GboardNewSettingsHighlight.isFeatureHighlighted(null, null));
        GboardNewSettingsHighlight.markAllViewed(null);
        GboardNewSettingsHighlight.markItemViewed(null, "test");
        GboardNewSettingsHighlight.markFeatureViewed(null, null);
    }
}
