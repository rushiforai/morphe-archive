package app.morphe.extension.reddit.patches;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import app.morphe.extension.reddit.nsfw.DrawerRowCloner;
import app.morphe.extension.reddit.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

/**
 * Adds an "NSFW" row to the navigation drawer, directly under Reddit's own Popular row,
 * and toggles NSFW mode when it is tapped.
 *
 * <p>The row is a clone of the Popular row with its title swapped, built by
 * {@link DrawerRowCloner} without naming the row class, which is obfuscated and renamed every
 * release.
 *
 * <p>How far the injection got is logged rather than shown. The row has no channel of its own
 * when it fails to appear - it simply is not there - so the log line is the only account of which
 * stage gave up.
 *
 * <p>Note on why this toggles a filter instead of opening a mature feed: Reddit's
 * {@code FeedType} and {@code ListingType} both carry a MATURE entry, but the app ships no mature
 * feed screen while every other feed has one, so there is nothing to navigate to.
 */
@SuppressWarnings("unused")
public final class NsfwDrawerRow {

    /**
     * Reddit's own strings naming the Popular drawer row, most likely first. More than one,
     * because the resource was not necessarily called this in older app versions.
     */
    private static final String[] POPULAR_LABEL_KEYS = {
            "popular_feed_label",
            "popular_app_bar_title",
            "label_popular",
    };

    /** The string resource Morphe adds for this row. */
    private static final String NSFW_LABEL_KEY = "morphe_nsfw_feed_mode_row_title";

    /**
     * Stable adapter id for the added row. Deliberately far from Reddit's own ids, which count
     * down from zero, so it cannot collide with one.
     */
    private static final long ROW_UNIQUE_ID = Long.MIN_VALUE + 0x4E53_5730L;

    private static final int UNRESOLVED = -1;

    private static volatile int popularTitleId = UNRESOLVED;
    private static volatile int nsfwTitleId = UNRESOLVED;

    /** How far the row injection got, for the log. */
    private static volatile String rowDiagnostic = "row hook never ran";

    private NsfwDrawerRow() {
    }

    /**
     * @return If this patch was included during patching.
     */
    public static boolean isPatchIncluded() {
        return false;  // Modified during patching.
    }

    /**
     * Injection point. Appends the NSFW row to the drawer section holding the Popular row.
     *
     * @param items One drawer section's items.
     * @return The same items, with the NSFW row appended if this section was the Popular one.
     */
    public static Collection<?> addNsfwRow(Collection<?> items) {
        try {
            if (items == null || items.isEmpty()) {
                setDiagnostic("hook ran, sections all empty");
                return items;
            }

            int popularId = popularTitleId();
            if (popularId == 0) {
                setDiagnostic("no Popular string resource");
                return items;
            }

            int nsfwId = nsfwTitleId();
            if (nsfwId == 0) {
                setDiagnostic("Morphe row string missing");
                return items;
            }

            for (Object item : items) {
                if (!DrawerRowCloner.hasIntField(item, popularId)) {
                    continue;
                }

                // This is the Popular row, so from here any failure is worth naming: the row
                // class is the thing that would have changed.
                Object row = DrawerRowCloner.cloneWithTitle(item, popularId, nsfwId, ROW_UNIQUE_ID);
                if (row == null) {
                    setDiagnostic("cannot clone " + item.getClass().getName());
                    return items;
                }

                rowDiagnostic = "row added";
                Logger.printDebug(() -> "NSFW mode: added drawer row after Popular");

                List<Object> augmented = new ArrayList<>(items.size() + 1);
                augmented.addAll(items);
                augmented.add(row);
                return augmented;
            }

            setDiagnostic("hook ran, no Popular row in any section");
        } catch (Exception ex) {
            setDiagnostic("failed: " + ex);
            Logger.printException(() -> "addNsfwRow failure", ex);
        }

        return items;
    }

    /**
     * Injection point. Handles a drawer action before the app routes it.
     *
     * <p>The router receives an action carrying a row index rather than the row itself, and reads
     * the row out of one of the presenter's own lists. Both the action's index field and that
     * list are obfuscated, so rather than naming either, this tries every list the presenter
     * holds and only acts when the row at that index carries the NSFW row's own title resource
     * id. A wrong list therefore does nothing instead of hijacking someone else's tap.
     *
     * @param presenter The drawer presenter.
     * @param action    The action being routed.
     * @return Whether this was a tap on the NSFW row, and has been handled.
     */
    public static boolean onDrawerActionDispatched(Object presenter, Object action) {
        try {

            int nsfwId = nsfwTitleId();
            if (presenter == null || action == null || nsfwId == 0) {
                return false;
            }

            int index = firstIntField(action);
            if (index < 0) {
                return false;
            }

            for (Field field : presenter.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())
                        || !List.class.isAssignableFrom(field.getType())) {
                    continue;
                }

                field.setAccessible(true);
                Object value = field.get(presenter);
                if (!(value instanceof List)) {
                    continue;
                }

                List<?> rows = (List<?>) value;
                if (index >= rows.size()) {
                    continue;
                }

                if (DrawerRowCloner.hasIntField(rows.get(index), nsfwId)) {
                    return onDrawerRowClicked(rows.get(index));
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "onDrawerActionDispatched failure", ex);
        }

        return false;
    }

    /**
     * @return The first int field's value, or -1 if there is none.
     */
    private static int firstIntField(Object object) {
        try {
            for (Field field : object.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType() != int.class) {
                    continue;
                }
                field.setAccessible(true);
                return field.getInt(object);
            }
        } catch (Exception ex) {
            Logger.printException(() -> "firstIntField failure", ex);
        }
        return -1;
    }

    /**
     * Injection point. Handles a tap on a drawer row.
     *
     * @param row The row that was tapped.
     * @return Whether this was the NSFW row, and the tap has been handled.
     */
    public static boolean onDrawerRowClicked(Object row) {
        try {
            int nsfwId = nsfwTitleId();
            if (nsfwId == 0 || !DrawerRowCloner.hasIntField(row, nsfwId)) {
                return false;
            }

            boolean enabled = !Settings.NSFW_FEED_MODE.get();
            Settings.NSFW_FEED_MODE.save(enabled);

            Utils.showToastShort(enabled ? "NSFW mode on" : "NSFW mode off");
            NsfwFeedRefresher.refreshHomeFeed();

            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "onDrawerRowClicked failure", ex);
            return false;
        }
    }

    /**
     * Records how far the injection got, without overwriting a success from an earlier drawer
     * build, and logs it.
     */
    private static void setDiagnostic(String message) {
        if (!"row added".equals(rowDiagnostic)) {
            rowDiagnostic = message;
            Logger.printInfo(() -> "NSFW drawer row: " + message);
        }
    }

    private static int popularTitleId() {
        int id = popularTitleId;
        if (id == UNRESOLVED) {
            id = 0;
            for (String key : POPULAR_LABEL_KEYS) {
                int candidate = ResourceUtils.getStringIdentifier(key);
                if (candidate != 0) {
                    id = candidate;
                    break;
                }
            }
            popularTitleId = id;
        }
        return id;
    }

    private static int nsfwTitleId() {
        int id = nsfwTitleId;
        if (id == UNRESOLVED) {
            id = ResourceUtils.getStringIdentifier(NSFW_LABEL_KEY);
            nsfwTitleId = id;
        }
        return id;
    }
}
