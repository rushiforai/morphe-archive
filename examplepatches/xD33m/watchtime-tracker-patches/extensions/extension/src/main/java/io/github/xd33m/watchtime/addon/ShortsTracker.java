package io.github.xd33m.watchtime.addon;

/**
 * Decides from Morphe's time events when a Short plays and what to report. No Android code, so it is tested on the
 * JVM; times are monotonic milliseconds of the caller.
 * <p>
 * Morphe's time listener fires about once per second while a Short plays and not at all while it is paused, and the
 * play-state listener never fires for Shorts (spike, 2026-11-26). So a Short plays while time events arrive for it in
 * the Shorts player, and stops when they stay away for {@link #STOP_AFTER_MS}. Not thread-safe: main thread only.
 */
public final class ShortsTracker {
    /** A playing Short is reported again this often; the app closes it after 30 s without a report. */
    public static final long BEAT_INTERVAL_MS = 10_000;
    /** No time event for longer than this: the Short is paused. */
    public static final long STOP_AFTER_MS = 2_000;

    private boolean dead;
    private String playingId;
    private long lastVideoTimeMs;
    private long lastRefreshMs;
    private long lastReportMs;
    /** The id last played, and whether it last started again without its time moving (see onTime). */
    private String lastId;
    private boolean resumedWithoutProgress;

    /**
     * One time event. {@code shortsOpen} and {@code noneOrHidden} are the Shorts player's state and whether the player
     * type is NONE or HIDDEN; only then is {@code videoId} a playing Short (and not a feed preview or a regular video).
     *
     * @return the report to send, or null.
     */
    public Report onTime(long nowMs, long videoTimeMs, boolean shortsOpen, boolean noneOrHidden, String videoId) {
        if (dead) return null;
        boolean eligible = shortsOpen && noneOrHidden && videoId != null && !videoId.isEmpty();
        if (!eligible) return stop();
        if (!videoId.equals(playingId)) {
            // A new Short, or the same one resumed: the first event after a pause may repeat the paused time. A Short
            // that keeps sending its old time (stuck, buffering) may start again so only once until its time moves.
            boolean sameTime = videoId.equals(lastId) && videoTimeMs == lastVideoTimeMs;
            if (sameTime && resumedWithoutProgress) return null;
            resumedWithoutProgress = sameTime;
            lastId = videoId;
            playingId = videoId;
            lastVideoTimeMs = videoTimeMs;
            lastRefreshMs = nowMs;
            lastReportMs = nowMs;
            return Report.playing(videoId);
        }
        if (videoTimeMs == lastVideoTimeMs) return null; // a repeated event proves nothing
        lastVideoTimeMs = videoTimeMs; // forwards, or back to the start when the Short loops
        resumedWithoutProgress = false;
        lastRefreshMs = nowMs;
        if (nowMs - lastReportMs < BEAT_INTERVAL_MS) return null;
        lastReportMs = nowMs;
        return Report.playing(videoId);
    }

    /** Called about once per second while {@link #isPlaying()}; reports the pause once time events stayed away. */
    public Report onWatchdog(long nowMs) {
        if (dead || playingId == null) return null;
        return nowMs - lastRefreshMs > STOP_AFTER_MS ? stop() : null;
    }

    public boolean isPlaying() {
        return !dead && playingId != null;
    }

    /** The app said it does not want reports, or a report failed: nothing more is reported in this process. */
    public void stopForever() {
        dead = true;
        playingId = null;
    }

    private Report stop() {
        if (playingId == null) return null;
        playingId = null;
        return Report.stopped();
    }
}
