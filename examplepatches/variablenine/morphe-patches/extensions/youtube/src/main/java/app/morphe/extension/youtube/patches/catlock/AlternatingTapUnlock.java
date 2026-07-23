package app.morphe.extension.youtube.patches.catlock;

/**
 * Pure, Android-free recognizer for the Cat Lock unlock gesture: quickly tapping
 * <b>alternating opposite sides</b> of the screen (left, right, left, right, ...).
 *
 * <p>Chosen because it is extremely unlikely for a cat pawing at the screen to produce a clean,
 * fast run of alternating left/right taps, yet a human can do it easily with two thumbs. Taps in
 * the middle dead zone are ignored (they neither advance nor reset the streak), so a paw resting
 * mid-screen doesn't interfere. A same-side tap or too-slow tap resets the streak.
 *
 * <p>No Android dependencies — unit-testable in isolation (see {@code AlternatingTapUnlockSelfTest}).
 */
public final class AlternatingTapUnlock {

    public enum Side { LEFT, RIGHT, MIDDLE }

    private final int requiredTaps;      // consecutive alternating taps needed to unlock
    private final long maxIntervalMs;    // max gap between consecutive alternating taps
    private final float leftMaxFraction; // x < width*leftMaxFraction  => LEFT
    private final float rightMinFraction;// x > width*rightMinFraction => RIGHT

    private Side lastSide;
    private long lastTimeMs;
    private int streak;

    public AlternatingTapUnlock() {
        this(6, 700L, 0.40f, 0.60f);
    }

    public AlternatingTapUnlock(int requiredTaps, long maxIntervalMs,
                                float leftMaxFraction, float rightMinFraction) {
        this.requiredTaps = Math.max(2, requiredTaps);
        this.maxIntervalMs = maxIntervalMs;
        this.leftMaxFraction = leftMaxFraction;
        this.rightMinFraction = rightMinFraction;
    }

    /** Classify a touch x-coordinate into a side, given the view width. */
    public Side sideForX(float x, float width) {
        if (width <= 0) return Side.MIDDLE;
        float f = x / width;
        if (f < leftMaxFraction) return Side.LEFT;
        if (f > rightMinFraction) return Side.RIGHT;
        return Side.MIDDLE;
    }

    /** Convenience: feed a raw tap; returns true if this tap completed the unlock gesture. */
    public boolean onTap(long timeMs, float x, float width) {
        return onTap(timeMs, sideForX(x, width));
    }

    /**
     * Feed one tap.
     *
     * @return true if the unlock gesture just completed (and the recognizer has reset).
     */
    public boolean onTap(long timeMs, Side side) {
        if (side == Side.MIDDLE) {
            return false; // dead zone: ignore entirely
        }

        if (lastSide == null) {
            streak = 1;
            lastSide = side;
            lastTimeMs = timeMs;
            return false;
        }

        boolean opposite = side != lastSide;
        boolean inTime = (timeMs - lastTimeMs) <= maxIntervalMs;

        if (opposite && inTime) {
            streak++;
        } else {
            streak = 1; // same side or too slow: restart the run at this tap
        }

        lastSide = side;
        lastTimeMs = timeMs;

        if (streak >= requiredTaps) {
            reset();
            return true;
        }
        return false;
    }

    /** Forget any in-progress gesture (e.g. when the overlay is (re)shown). */
    public void reset() {
        lastSide = null;
        lastTimeMs = 0;
        streak = 0;
    }

    /** For diagnostics/tests. */
    public int currentStreak() {
        return streak;
    }
}
