package dev.jason.gboardpatches.extension.spacebargesture;

/**
 * Pure JVM state machine for Samsung-style spacebar gestures:
 * tap (space), horizontal swipe before long-press (NEXT/PREVIOUS language),
 * and hold (~300 ms) + horizontal drag (cursor control).
 */
public final class GboardSpacebarGestureState {
    public enum State {
        IDLE,
        SPACE_TRACKING,
        LANGUAGE_SWIPE_CONSUMED,
        CURSOR_MODE,
        /**
         * Gesture was aborted after a synthetic {@code ACTION_CANCEL} was already dispatched to
         * {@code SoftKeyboardView}. Continues consuming remaining events until {@code ACTION_UP}
         * or {@code ACTION_CANCEL} so orphaned touch events never leak into the keyboard.
         */
        CONSUMED_DRAIN
    }

    public enum LanguageDirection {
        NONE,
        NEXT,
        PREVIOUS
    }

    public static final long LONG_PRESS_TIMEOUT_MS = 300L;
    public static final float MIN_SWIPE_SLOP_DP = 16f;
    public static final float HORIZONTAL_DOMINANCE_RATIO = 1.25f;
    public static final float VERTICAL_ABORT_RATIO = 1.5f;
    public static final float CURSOR_STEP_DP = 10f;
    public static final int MAX_DPAD_STEPS_PER_MOVE = 6;

    private static final float ACCEL_MIN_SPEED_DP_PER_MS = 0.35f;
    private static final float ACCEL_MAX_SPEED_DP_PER_MS = 1.50f;
    private static final float ACCEL_MAX_MULTIPLIER = 2.25f;

    public static final class MoveResult {
        public static final MoveResult NOT_CONSUMED =
                new MoveResult(false, false, LanguageDirection.NONE, 0);
        public static final MoveResult CONSUMED_NO_OP =
                new MoveResult(true, false, LanguageDirection.NONE, 0);

        public final boolean consumed;
        public final boolean sendCancel;
        public final LanguageDirection languageDirection;
        public final int dpadSteps;

        public MoveResult(boolean consumed, boolean sendCancel,
                LanguageDirection languageDirection, int dpadSteps) {
            this.consumed = consumed;
            this.sendCancel = sendCancel;
            this.languageDirection = languageDirection;
            this.dpadSteps = dpadSteps;
        }
    }

    public static final class LongPressResult {
        public static final LongPressResult NOT_ACTIVATED =
                new LongPressResult(false, false, false);
        public static final LongPressResult ACTIVATED =
                new LongPressResult(true, true, true);

        public final boolean activated;
        public final boolean sendCancel;
        public final boolean finishComposing;

        public LongPressResult(boolean activated, boolean sendCancel, boolean finishComposing) {
            this.activated = activated;
            this.sendCancel = sendCancel;
            this.finishComposing = finishComposing;
        }
    }

    private State state = State.IDLE;
    private int activePointerId = -1;
    private float downX;
    private float downY;
    private float lastX;
    private float lastY;
    private long lastEventTime;
    private float cursorAccumulatorDp;

    public State getState() {
        return state;
    }

    public int getActivePointerId() {
        return activePointerId;
    }

    public boolean isConsumingStream() {
        return state == State.LANGUAGE_SWIPE_CONSUMED
                || state == State.CURSOR_MODE
                || state == State.CONSUMED_DRAIN;
    }

    public void beginSpaceTracking(int pointerId, float rawX, float rawY, long downTime) {
        reset();
        if (pointerId < 0) {
            return;
        }
        state = State.SPACE_TRACKING;
        activePointerId = pointerId;
        downX = rawX;
        downY = rawY;
        lastX = rawX;
        lastY = rawY;
        lastEventTime = downTime;
    }

    public MoveResult onMove(int pointerId, float rawX, float rawY, float density,
            float touchSlop, long eventTime) {
        return onMove(pointerId, rawX, rawY, density, touchSlop, eventTime, true);
    }

    public MoveResult onMove(int pointerId, float rawX, float rawY, float density,
            float touchSlop, long eventTime, boolean languageSwipeEnabled) {
        if (state == State.IDLE) {
            return MoveResult.NOT_CONSUMED;
        }
        if (state == State.CONSUMED_DRAIN) {
            lastX = rawX;
            lastY = rawY;
            lastEventTime = eventTime;
            return MoveResult.CONSUMED_NO_OP;
        }
        if (pointerId != activePointerId) {
            if (isConsumingStream()) {
                state = State.CONSUMED_DRAIN;
                cursorAccumulatorDp = 0f;
                return MoveResult.CONSUMED_NO_OP;
            }
            reset();
            return MoveResult.NOT_CONSUMED;
        }

        if (state == State.LANGUAGE_SWIPE_CONSUMED) {
            lastX = rawX;
            lastY = rawY;
            lastEventTime = eventTime;
            return MoveResult.CONSUMED_NO_OP;
        }

        float safeDensity = density > 0f ? density : 1f;

        if (state == State.SPACE_TRACKING) {
            lastX = rawX;
            lastY = rawY;
            lastEventTime = eventTime;

            float dx = rawX - downX;
            float dy = rawY - downY;
            float absDx = Math.abs(dx);
            float absDy = Math.abs(dy);
            float swipeThreshold = Math.max(Math.max(touchSlop, 0f), MIN_SWIPE_SLOP_DP * safeDensity);

            if (absDx >= swipeThreshold && absDx >= absDy * HORIZONTAL_DOMINANCE_RATIO) {
                if (!languageSwipeEnabled) {
                    reset();
                    return MoveResult.NOT_CONSUMED;
                }
                state = State.LANGUAGE_SWIPE_CONSUMED;
                LanguageDirection direction = dx > 0f
                        ? LanguageDirection.NEXT
                        : LanguageDirection.PREVIOUS;
                return new MoveResult(true, true, direction, 0);
            }

            if (absDy >= swipeThreshold && absDy >= absDx * VERTICAL_ABORT_RATIO) {
                reset();
                return MoveResult.NOT_CONSUMED;
            }

            return MoveResult.NOT_CONSUMED;
        }

        // state == State.CURSOR_MODE: strictly horizontal cursor step translation.
        float deltaX = rawX - lastX;
        long dtMs = eventTime > lastEventTime ? (eventTime - lastEventTime) : 0L;
        lastX = rawX;
        lastY = rawY;
        lastEventTime = eventTime;

        if (deltaX == 0f) {
            return MoveResult.CONSUMED_NO_OP;
        }

        float deltaDp = deltaX / safeDensity;
        // Clear residual accumulator on direction reversal for crisp responsiveness.
        if ((cursorAccumulatorDp > 0f && deltaDp < 0f)
                || (cursorAccumulatorDp < 0f && deltaDp > 0f)) {
            cursorAccumulatorDp = 0f;
        }

        float multiplier = computeAccelerationMultiplier(Math.abs(deltaDp), dtMs);
        cursorAccumulatorDp += deltaDp * multiplier;

        int rawSteps = (int) (cursorAccumulatorDp / CURSOR_STEP_DP);
        if (rawSteps == 0) {
            return MoveResult.CONSUMED_NO_OP;
        }

        int clampedSteps = Math.max(-MAX_DPAD_STEPS_PER_MOVE,
                Math.min(MAX_DPAD_STEPS_PER_MOVE, rawSteps));
        if (clampedSteps != rawSteps) {
            cursorAccumulatorDp = 0f;
        } else {
            cursorAccumulatorDp -= clampedSteps * CURSOR_STEP_DP;
        }

        return new MoveResult(true, false, LanguageDirection.NONE, clampedSteps);
    }

    public LongPressResult onLongPressTimeout() {
        if (state != State.SPACE_TRACKING) {
            return LongPressResult.NOT_ACTIVATED;
        }
        state = State.CURSOR_MODE;
        cursorAccumulatorDp = 0f;
        return LongPressResult.ACTIVATED;
    }

    /**
     * Multi-touch aborts single-pointer gesture recognition:
     * <ul>
     *   <li>Before synthetic {@code ACTION_CANCEL} ({@code SPACE_TRACKING}/{@code IDLE}):
     *       resets to {@code IDLE} and returns {@code false} so normal multi-touch typing continues.</li>
     *   <li>After synthetic {@code ACTION_CANCEL} ({@code CURSOR_MODE}/{@code LANGUAGE_SWIPE_CONSUMED}):
     *       transitions to {@code CONSUMED_DRAIN} and returns {@code true} so orphaned tail events
     *       do not leak into {@code SoftKeyboardView}.</li>
     * </ul>
     */
    public boolean onPointerDown() {
        return abortConsumedStream();
    }

    /**
     * Stops active gesture actions without leaking orphaned touch events if this gesture already
     * owns the cancelled stream.
     *
     * @return {@code true} if the current event must stay consumed in {@code CONSUMED_DRAIN},
     *         {@code false} if the gesture had not cancelled the underlying view and reset to {@code IDLE}.
     */
    public boolean abortConsumedStream() {
        if (isConsumingStream()) {
            state = State.CONSUMED_DRAIN;
            cursorAccumulatorDp = 0f;
            return true;
        }
        reset();
        return false;
    }

    /**
     * Finalizes the active gesture on ACTION_UP or ACTION_CANCEL.
     *
     * @return {@code true} if the terminal event must be consumed (swipe, cursor mode, or drain),
     *         {@code false} for a normal space tap or idle state.
     */
    public boolean onUpOrCancel() {
        boolean consumed = isConsumingStream();
        reset();
        return consumed;
    }

    public void reset() {
        state = State.IDLE;
        activePointerId = -1;
        downX = 0f;
        downY = 0f;
        lastX = 0f;
        lastY = 0f;
        lastEventTime = 0L;
        cursorAccumulatorDp = 0f;
    }

    static float computeAccelerationMultiplier(float absDeltaDp, long dtMs) {
        if (absDeltaDp <= 0f || dtMs < 1L || dtMs > 200L) {
            return 1.0f;
        }
        float speedDpPerMs = absDeltaDp / (float) dtMs;
        if (speedDpPerMs <= ACCEL_MIN_SPEED_DP_PER_MS) {
            return 1.0f;
        }
        if (speedDpPerMs >= ACCEL_MAX_SPEED_DP_PER_MS) {
            return ACCEL_MAX_MULTIPLIER;
        }
        float fraction = (speedDpPerMs - ACCEL_MIN_SPEED_DP_PER_MS)
                / (ACCEL_MAX_SPEED_DP_PER_MS - ACCEL_MIN_SPEED_DP_PER_MS);
        return 1.0f + fraction * (ACCEL_MAX_MULTIPLIER - 1.0f);
    }
}
