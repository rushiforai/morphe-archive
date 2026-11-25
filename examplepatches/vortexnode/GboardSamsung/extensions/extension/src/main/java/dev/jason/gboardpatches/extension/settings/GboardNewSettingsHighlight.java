package dev.jason.gboardpatches.extension.settings;

import android.content.Context;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import dev.jason.gboardpatches.extension.R;

/**
 * Tracks newly added settings and options so a Morphe-style teal dot appears next to unread items
 * and their parent groups until the user opens that specific setting, taps "Mark all settings as
 * viewed", or the configured highlight window (0..10 days, default 7) expires.
 */
public final class GboardNewSettingsHighlight {
    static final long MILLIS_PER_DAY = 24L * 60L * 60L * 1000L;

    public static final String ITEM_HIGHLIGHT_NEW_SETTINGS = "highlight_new_settings_v416";
    public static final String ITEM_DISABLE_VOICE_BEEP = "disable_voice_beep_v417";
    public static final String ITEM_CLIPBOARD_CLEAR_ALL = "clipboard_clear_all_v417";
    public static final String ITEM_AMOLED_BLACK = "amoled_black_v417";
    public static final String ITEM_DISABLE_ENTER_ONE_HANDED = "disable_enter_one_handed_v417";

    public static final class Item {
        public final String id;
        public final String featureClassName;
        public final String introducedVersion;
        public final int rowTitleResId;

        public Item(String id, String featureClassName, String introducedVersion, int rowTitleResId) {
            this.id = id;
            this.featureClassName = featureClassName;
            this.introducedVersion = introducedVersion;
            this.rowTitleResId = rowTitleResId;
        }
    }

    private static final List<Item> ITEMS = Collections.unmodifiableList(List.of(
            new Item(
                    ITEM_HIGHLIGHT_NEW_SETTINGS,
                    GboardMoreSettingsGroupFeature.class.getName(),
                    "4.16.0",
                    R.string.gboard_patches_highlight_new_settings_title),
            new Item(
                    ITEM_DISABLE_VOICE_BEEP,
                    "dev.jason.gboardpatches.extension.advancedvoice.GboardAdvancedVoiceSettingsFeature",
                    "4.17.0",
                    R.string.gboard_patches_advanced_voice_disable_beep_title),
            new Item(
                    ITEM_CLIPBOARD_CLEAR_ALL,
                    "dev.jason.gboardpatches.extension.clipboard.GboardClipboardSettingsFeature",
                    "4.17.0",
                    R.string.gboard_patches_clipboard_clear_all_button_title),
            new Item(
                    ITEM_AMOLED_BLACK,
                    "dev.jason.gboardpatches.extension.frostedglass.GboardFrostedGlassSettingsFeature",
                    "4.17.0",
                    R.string.gboard_patches_amoled_black_title),
            new Item(
                    ITEM_DISABLE_ENTER_ONE_HANDED,
                    "dev.jason.gboardpatches.extension.longpressquickactions.GboardLongPressQuickActionsSettingsFeature",
                    "4.17.0",
                    R.string.gboard_patches_long_press_quick_actions_disable_enter_one_handed_title)
    ));

    private GboardNewSettingsHighlight() {
    }

    public static List<Item> getRegisteredItems() {
        return ITEMS;
    }

    public static void ensureVersionFirstSeenRecorded(Context context) {
        ensureVersionFirstSeenRecorded(context, System.currentTimeMillis());
    }

    static void ensureVersionFirstSeenRecorded(Context context, long nowMs) {
        if (context == null || ITEMS.isEmpty()) {
            return;
        }
        Map<String, Long> timestamps =
                parseVersionTimestamps(GboardPatchesSettings.getNewSettingsVersionTimestampsRaw(context));
        boolean changed = false;
        for (Item item : ITEMS) {
            if (!timestamps.containsKey(item.introducedVersion)) {
                timestamps.put(item.introducedVersion, nowMs);
                changed = true;
            }
        }
        if (changed) {
            GboardPatchesSettings.setNewSettingsVersionTimestampsRaw(
                    context, formatVersionTimestamps(timestamps));
        }
    }

    public static boolean hasAnyHighlightedItem(Context context) {
        return hasAnyHighlightedItem(context, System.currentTimeMillis());
    }

    static boolean hasAnyHighlightedItem(Context context, long nowMs) {
        if (context == null) {
            return false;
        }
        int days = GboardPatchesSettings.getHighlightNewSettingsDays(context);
        if (days <= 0) {
            return false;
        }
        Set<String> seenIds = parseSeenIds(GboardPatchesSettings.getNewSettingsSeenIdsRaw(context));
        Map<String, Long> timestamps =
                parseVersionTimestamps(GboardPatchesSettings.getNewSettingsVersionTimestampsRaw(context));
        for (Item item : ITEMS) {
            if (isItemHighlightedInternal(item, days, seenIds, timestamps, nowMs)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isItemHighlighted(Context context, String itemId) {
        return isItemHighlighted(context, itemId, System.currentTimeMillis());
    }

    static boolean isItemHighlighted(Context context, String itemId, long nowMs) {
        if (context == null || itemId == null || itemId.isEmpty()) {
            return false;
        }
        int days = GboardPatchesSettings.getHighlightNewSettingsDays(context);
        if (days <= 0) {
            return false;
        }
        Set<String> seenIds = parseSeenIds(GboardPatchesSettings.getNewSettingsSeenIdsRaw(context));
        Map<String, Long> timestamps =
                parseVersionTimestamps(GboardPatchesSettings.getNewSettingsVersionTimestampsRaw(context));
        for (Item item : ITEMS) {
            if (itemId.equals(item.id)) {
                return isItemHighlightedInternal(item, days, seenIds, timestamps, nowMs);
            }
        }
        return false;
    }

    public static boolean isFeatureHighlighted(
            Context context, GboardPatchesSettingsContract.Feature feature) {
        return isFeatureHighlighted(context, feature, System.currentTimeMillis());
    }

    static boolean isFeatureHighlighted(
            Context context, GboardPatchesSettingsContract.Feature feature, long nowMs) {
        if (context == null || feature == null) {
            return false;
        }
        int days = GboardPatchesSettings.getHighlightNewSettingsDays(context);
        if (days <= 0) {
            return false;
        }
        Set<String> seenIds = parseSeenIds(GboardPatchesSettings.getNewSettingsSeenIdsRaw(context));
        Map<String, Long> timestamps =
                parseVersionTimestamps(GboardPatchesSettings.getNewSettingsVersionTimestampsRaw(context));
        return isFeatureHighlightedRecursive(feature, days, seenIds, timestamps, nowMs);
    }

    private static boolean isFeatureHighlightedRecursive(
            GboardPatchesSettingsContract.Feature feature,
            int days,
            Set<String> seenIds,
            Map<String, Long> timestamps,
            long nowMs) {
        String className = feature.getClass().getName();
        for (Item item : ITEMS) {
            if (className.equals(item.featureClassName)
                    && isItemHighlightedInternal(item, days, seenIds, timestamps, nowMs)) {
                return true;
            }
        }
        List<GboardPatchesSettingsContract.Feature> children = feature.getNavigationChildren();
        if (children != null) {
            for (GboardPatchesSettingsContract.Feature child : children) {
                if (child != null
                        && isFeatureHighlightedRecursive(child, days, seenIds, timestamps, nowMs)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static void markItemViewed(Context context, String itemId) {
        if (context == null || itemId == null || itemId.isEmpty()) {
            return;
        }
        Set<String> seenIds = parseSeenIds(GboardPatchesSettings.getNewSettingsSeenIdsRaw(context));
        if (seenIds.add(itemId)) {
            GboardPatchesSettings.setNewSettingsSeenIdsRaw(context, formatSeenIds(seenIds));
        }
    }

    public static void markFeatureViewed(
            Context context, GboardPatchesSettingsContract.Feature feature) {
        if (context == null || feature == null) {
            return;
        }
        String className = feature.getClass().getName();
        Set<String> seenIds = parseSeenIds(GboardPatchesSettings.getNewSettingsSeenIdsRaw(context));
        boolean changed = false;
        for (Item item : ITEMS) {
            // Only auto-clear page-level items (rowTitleResId == 0) when opening the feature page.
            // Row-specific items on group screens clear only when that specific setting is opened.
            if (className.equals(item.featureClassName) && item.rowTitleResId == 0) {
                if (seenIds.add(item.id)) {
                    changed = true;
                }
            }
        }
        if (changed) {
            GboardPatchesSettings.setNewSettingsSeenIdsRaw(context, formatSeenIds(seenIds));
        }
    }

    public static void markAllViewed(Context context) {
        if (context == null) {
            return;
        }
        Set<String> seenIds = parseSeenIds(GboardPatchesSettings.getNewSettingsSeenIdsRaw(context));
        boolean changed = false;
        for (Item item : ITEMS) {
            if (seenIds.add(item.id)) {
                changed = true;
            }
        }
        if (changed) {
            GboardPatchesSettings.setNewSettingsSeenIdsRaw(context, formatSeenIds(seenIds));
        }
    }

    static boolean isItemHighlightedInternal(
            Item item,
            int highlightDays,
            Set<String> seenIds,
            Map<String, Long> versionFirstSeenMs,
            long nowMs) {
        if (item == null || highlightDays <= 0) {
            return false;
        }
        if (seenIds != null && seenIds.contains(item.id)) {
            return false;
        }
        if (versionFirstSeenMs == null || !versionFirstSeenMs.containsKey(item.introducedVersion)) {
            return true;
        }
        long firstSeen = versionFirstSeenMs.get(item.introducedVersion);
        long windowMs = (long) highlightDays * MILLIS_PER_DAY;
        return nowMs < firstSeen || (nowMs - firstSeen) < windowMs;
    }

    static Set<String> parseSeenIds(String raw) {
        Set<String> result = new LinkedHashSet<>();
        if (raw == null || raw.isEmpty()) {
            return result;
        }
        String[] parts = raw.split(",");
        for (String part : parts) {
            String trimmed = part.trim();
            if (!trimmed.isEmpty()) {
                result.add(trimmed);
            }
        }
        return result;
    }

    static String formatSeenIds(Set<String> ids) {
        if (ids == null || ids.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (String id : ids) {
            if (id == null || id.isEmpty()) {
                continue;
            }
            if (sb.length() > 0) {
                sb.append(',');
            }
            sb.append(id);
        }
        return sb.toString();
    }

    static Map<String, Long> parseVersionTimestamps(String raw) {
        Map<String, Long> result = new LinkedHashMap<>();
        if (raw == null || raw.isEmpty()) {
            return result;
        }
        String[] entries = raw.split(";");
        for (String entry : entries) {
            int eq = entry.indexOf('=');
            if (eq <= 0 || eq >= entry.length() - 1) {
                continue;
            }
            String version = entry.substring(0, eq).trim();
            String tsText = entry.substring(eq + 1).trim();
            if (version.isEmpty()) {
                continue;
            }
            try {
                result.put(version, Long.parseLong(tsText));
            } catch (NumberFormatException ignored) {
                // Ignore malformed stored timestamps.
            }
        }
        return result;
    }

    static String formatVersionTimestamps(Map<String, Long> timestamps) {
        if (timestamps == null || timestamps.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, Long> entry : timestamps.entrySet()) {
            if (entry.getKey() == null || entry.getValue() == null) {
                continue;
            }
            if (sb.length() > 0) {
                sb.append(';');
            }
            sb.append(entry.getKey()).append('=').append(entry.getValue());
        }
        return sb.toString();
    }
}
