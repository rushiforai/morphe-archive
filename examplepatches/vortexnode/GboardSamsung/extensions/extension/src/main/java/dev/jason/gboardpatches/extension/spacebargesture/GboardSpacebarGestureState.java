package dev.jason.gboardpatches.extension.spacebargesture;

/**
 * Pure JVM state machine for Samsung-style spacebar gestures:
 * tap (space), horizontal swipe before long-press (NEXT/PREVIOUS language),
 * and hold (~300 ms) + 2D drag (left/right/up/down cursor control).
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
    public static final float VERTICAL_CURSOR_STEP_DP = 22f;
    public static final int MAX_DPAD_STEPS_PER_MOVE = 6;
    public static final int MAX_VERTICAL_STEPS_PER_MOVE = 2;

    private static final float ACCEL_MIN_SPEED_DP_PER_MS = 0.35f;
    private static final float ACCEL_MAX_SPEED_DP_PER_MS = 1.50f;
    private static final float ACCEL_MAX_MULTIPLIER = 2.25f;

    private static final float VERTICAL_ACCEL_MIN_SPEED_DP_PER_MS = 0.60f;
    private static final float VERTICAL_ACCEL_MAX_SPEED_DP_PER_MS = 2.00f;
    private static final float VERTICAL_ACCEL_MAX_MULTIPLIER = 1.50f;

    public static final class MoveResult {
        public static final MoveResult NOT_CONSUMED =
                new MoveResult(false, false, LanguageDirection.NONE, 0, 0);
        public static final MoveResult CONSUMED_NO_OP =
                new MoveResult(true, false, LanguageDirection.NONE, 0, 0);

        public final boolean consumed;
        public final boolean sendCancel;
        public final LanguageDirection languageDirection;
        public final int dpadSteps;
        public final int verticalDpadSteps;

        public MoveResult(boolean consumed, boolean sendCancel,
                LanguageDirection languageDirection, int dpadSteps) {
            this(consumed, sendCancel, languageDirection, dpadSteps, 0);
        }

        public MoveResult(boolean consumed, boolean sendCancel,
                LanguageDirection languageDirection, int dpadSteps, int verticalDpadSteps) {
            this.consumed = consumed;
            this.sendCancel = sendCancel;
            this.languageDirection = languageDirection;
            this.dpadSteps = dpadSteps;
            this.verticalDpadSteps = verticalDpadSteps;
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
    private float verticalCursorAccumulatorDp;

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
                verticalCursorAccumulatorDp = 0f;
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
                return new MoveResult(true, true, direction, 0, 0);
            }

            if (absDy >= swipeThreshold && absDy >= absDx * VERTICAL_ABORT_RATIO) {
                reset();
                return MoveResult.NOT_CONSUMED;
            }

            return MoveResult.NOT_CONSUMED;
        }

        // state == State.CURSOR_MODE: Samsung-style axis-dominant 2D cursor translation.
        float deltaX = rawX - lastX;
        float deltaY = rawY - lastY;
        long dtMs = eventTime > lastEventTime ? (eventTime - lastEventTime) : 0L;
        lastX = rawX;
        lastY = rawY;
        lastEventTime = eventTime;

        if (deltaX == 0f && deltaY == 0f) {
            return MoveResult.CONSUMED_NO_OP;
        }

        if (Math.abs(deltaX) >= Math.abs(deltaY)) {
            float deltaDpX = deltaX / safeDensity;
            if ((cursorAccumulatorDp > 0f && deltaDpX < 0f)
                    || (cursorAccumulatorDp < 0f && deltaDpX > 0f)) {
                cursorAccumulatorDp = 0f;
            }
            float multiplier = computeAccelerationMultiplier(Math.abs(deltaDpX), dtMs);
            cursorAccumulatorDp += deltaDpX * multiplier;

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
            // Clear cross-axis accumulator on step to prevent diagonal line-jump drift.
            verticalCursorAccumulatorDp = 0f;
            return new MoveResult(true, false, LanguageDirection.NONE, clampedSteps, 0);
        }

        float deltaDpY = deltaY / safeDensity;
        if ((verticalCursorAccumulatorDp > 0f && deltaDpY < 0f)
                || (verticalCursorAccumulatorDp < 0f && deltaDpY > 0f)) {
            verticalCursorAccumulatorDp = 0f;
        }
        float vMultiplier = computeVerticalAccelerationMultiplier(Math.abs(deltaDpY), dtMs);
        verticalCursorAccumulatorDp += deltaDpY * vMultiplier;

        int rawVerticalSteps = (int) (verticalCursorAccumulatorDp / VERTICAL_CURSOR_STEP_DP);
        if (rawVerticalSteps == 0) {
            return MoveResult.CONSUMED_NO_OP;
        }

        int clampedVerticalSteps = Math.max(-MAX_VERTICAL_STEPS_PER_MOVE,
                Math.min(MAX_VERTICAL_STEPS_PER_MOVE, rawVerticalSteps));
        if (clampedVerticalSteps != rawVerticalSteps) {
            verticalCursorAccumulatorDp = 0f;
        } else {
            verticalCursorAccumulatorDp -= clampedVerticalSteps * VERTICAL_CURSOR_STEP_DP;
        }
        // Clear cross-axis accumulator on step to prevent diagonal horizontal drift.
        cursorAccumulatorDp = 0f;
        return new MoveResult(true, false, LanguageDirection.NONE, 0, clampedVerticalSteps);
    }

    public LongPressResult onLongPressTimeout() {
        if (state != State.SPACE_TRACKING) {
            return LongPressResult.NOT_ACTIVATED;
        }
        state = State.CURSOR_MODE;
        cursorAccumulatorDp = 0f;
        verticalCursorAccumulatorDp = 0f;
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
            verticalCursorAccumulatorDp = 0f;
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
        verticalCursorAccumulatorDp = 0f;
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

    static float computeVerticalAccelerationMultiplier(float absDeltaDp, long dtMs) {
        if (absDeltaDp <= 0f || dtMs < 1L || dtMs > 200L) {
            return 1.0f;
        }
        float speedDpPerMs = absDeltaDp / (float) dtMs;
        if (speedDpPerMs <= VERTICAL_ACCEL_MIN_SPEED_DP_PER_MS) {
            return 1.0f;
        }
        if (speedDpPerMs >= VERTICAL_ACCEL_MAX_SPEED_DP_PER_MS) {
            return VERTICAL_ACCEL_MAX_MULTIPLIER;
        }
        float fraction = (speedDpPerMs - VERTICAL_ACCEL_MIN_SPEED_DP_PER_MS)
                / (VERTICAL_ACCEL_MAX_SPEED_DP_PER_MS - VERTICAL_ACCEL_MIN_SPEED_DP_PER_MS);
        return 1.0f + fraction * (VERTICAL_ACCEL_MAX_MULTIPLIER - 1.0f);
    }
}
