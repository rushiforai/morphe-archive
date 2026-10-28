/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.extension.boost;

import android.util.Log;
import app.morphe.extension.boost.api.BoostFieldNames;

import java.lang.reflect.Field;

/** Removes profile tabs backed by Reddit features that are no longer usable in Boost. */
public final class RemoveObsoleteProfileTabsPatch {
    private static final String LOG_TAG = "MorpheProfileTabs";
    private static final String MARKER =
            "MORPHE_BOOST_REMOVE_OBSOLETE_PROFILE_TABS_V2";

    private RemoveObsoleteProfileTabsPatch() {
    }

    public static void removeObsoleteTabs(Object activity) {
        if (activity == null) {
            return;
        }

        try {
            Class<?> activityClass = activity.getClass();
            Field routesField = activityClass.getField(BoostFieldNames.UserActivityTabRoutes);
            Field titlesField = activityClass.getField(BoostFieldNames.UserActivityTabTitles);
            Field countField = activityClass.getField(BoostFieldNames.UserActivityTabCount);
            if (routesField.getType() != String[].class
                    || titlesField.getType() != String[].class
                    || countField.getType() != byte.class) {
                throw new IllegalStateException("Unexpected Boost 1.14.1 profile tab fields");
            }

            String[] routes = (String[]) routesField.get(activity);
            String[] titles = (String[]) titlesField.get(activity);
            int originalLength = countField.getByte(activity) & 0xff;
            if (routes == null || titles == null
                    || routes.length != originalLength
                    || titles.length != originalLength
                    || !contains(routes, "overview")) {
                throw new IllegalStateException("Boost profile tabs are not initialized consistently");
            }

            // 1.14.0 already removed Gilded; Friends remains on the own-profile page.
            boolean[] remove = new boolean[originalLength];
            int removedCount = 0;
            for (int index = 0; index < routes.length; index++) {
                if ("gilded".equals(routes[index]) ||
                        "friends".equals(routes[index])) {
                    remove[index] = true;
                    removedCount++;
                }
            }

            if (removedCount == 0) {
                return;
            }

            int newLength = originalLength - removedCount;
            String[] filteredRoutes = filter(routes, remove, removedCount);
            String[] filteredTitles = filter(titles, remove, removedCount);
            routesField.set(activity, filteredRoutes);
            titlesField.set(activity, filteredTitles);
            countField.setByte(activity, (byte) newLength);

            Log.d(
                    LOG_TAG,
                    MARKER + " old=" + originalLength
                            + " new=" + newLength
                            + " removed=" + removedCount
            );
        } catch (Throwable throwable) {
            Log.e(LOG_TAG, MARKER + " failed", throwable);
        }
    }

    private static boolean contains(String[] values, String expected) {
        for (String value : values) {
            if (expected.equals(value)) {
                return true;
            }
        }
        return false;
    }

    private static String[] filter(
            String[] values,
            boolean[] remove,
            int removedCount
    ) {
        String[] filtered = new String[values.length - removedCount];
        int target = 0;
        for (int source = 0; source < values.length; source++) {
            if (!remove[source]) {
                filtered[target++] = values[source];
            }
        }
        return filtered;
    }
}
