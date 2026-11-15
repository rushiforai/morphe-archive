/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.media;

/**
 * Where Tap to play holds starts ({@link TapToPlay}): everywhere, everywhere but the Reels viewer,
 * or only there. Reels shown in the feed play in the feed, so they go with the feed.
 */
public enum TapToPlayScope {
    EVERYWHERE,
    OUTSIDE_REELS,
    ONLY_REELS;

    /** Whether this choice holds a start in the Reels viewer, [reels], or anywhere else. */
    public boolean covers(boolean reels) {
        switch (this) {
            case OUTSIDE_REELS:
                return !reels;
            case ONLY_REELS:
                return reels;
            default:
                return true;
        }
    }
}
