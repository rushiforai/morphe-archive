/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */
package app.morphe.extension.instagram.patches.navigation;

import app.morphe.extension.instagram.utils.Pref;

@SuppressWarnings("unused")
public final class SwipeCamera {
    private static final String SWIPE_REASON = "swipe";
    private static final float FEED_EPSILON = 0.001f;

    private SwipeCamera() {
    }

    public static float feedBound(String reason, float centre) {
        return isSwipeReason(reason) ? centre : Float.NEGATIVE_INFINITY;
    }

    public static float clampAtFeed(float current, float target, float bound) {
        boolean restingOnFeed = current >= bound - FEED_EPSILON;
        return restingOnFeed && target < bound ? bound : target;
    }

    private static boolean isSwipeReason(String reason) {
        return SWIPE_REASON.equals(reason) && (!Pref.swipeCameraGesture() || Pref.disableSwipeToCreate());
    }

    public static boolean holdFeedRelease(float current, float centre, float velocity) {
        boolean restingOnFeed = Math.abs(current - centre) <= FEED_EPSILON;
        return restingOnFeed && velocity < 0f && (!Pref.swipeCameraGesture() || Pref.disableSwipeToCreate());
    }
}
