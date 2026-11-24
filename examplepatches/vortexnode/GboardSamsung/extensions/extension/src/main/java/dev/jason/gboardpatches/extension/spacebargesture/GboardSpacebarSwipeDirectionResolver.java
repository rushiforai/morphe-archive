package dev.jason.gboardpatches.extension.spacebargesture;

/**
 * Pure-JVM resolver that maps a physical horizontal spacebar swipe ({@code dx > 0} left-to-right
 * or {@code dx < 0} right-to-left) to a logical language step ({@code +1} next or {@code -1}
 * previous) according to the active swipe mode:
 * <ul>
 *   <li>{@link GboardSpacebarGestureSettings#SWIPE_MODE_SAMSUNG} (and default/none fallback):
 *       strictly anchored directions — right-to-left ({@code dx < 0}) advances to the next
 *       language ({@code +1}), left-to-right ({@code dx > 0}) returns to the previous language
 *       ({@code -1}).</li>
 *   <li>{@link GboardSpacebarGestureSettings#SWIPE_MODE_GBOARD}: same directional step on
 *       Gboard's true MRU language order.</li>
 *   <li>{@link GboardSpacebarGestureSettings#SWIPE_MODE_FREE}: first swipe in either direction
 *       advances to the next language ({@code +1}) and remembers that direction for
 *       {@value #FREE_DIRECTION_RESET_MS} ms; subsequent swipes in the same direction keep going
 *       forward ({@code +1}), while swiping the opposite direction steps back ({@code -1}).</li>
 * </ul>
 */
public final class GboardSpacebarSwipeDirectionResolver {
    public static final long FREE_DIRECTION_RESET_MS = 5_000L;

    private int freeAnchorPhysicalDir;
    private long lastFreeSwipeTimeMs = -1L;
    private String lastFreeEditorSignature;

    public synchronized int resolveStep(
            String mode,
            GboardSpacebarGestureState.LanguageDirection rawSwipe,
            long nowMs,
            String editorSignature) {
        if (rawSwipe == null || rawSwipe == GboardSpacebarGestureState.LanguageDirection.NONE) {
            return 0;
        }
        // In GboardSpacebarGestureState, dx > 0 (left-to-right) emits NEXT,
        // and dx < 0 (right-to-left) emits PREVIOUS.
        int physicalDir = rawSwipe == GboardSpacebarGestureState.LanguageDirection.NEXT ? +1 : -1;

        if (!GboardSpacebarGestureSettings.SWIPE_MODE_FREE.equals(mode)) {
            resetLocked();
            // Right-to-left (dx < 0, physicalDir == -1) -> NEXT (+1)
            // Left-to-right (dx > 0, physicalDir == +1) -> PREVIOUS (-1)
            return physicalDir < 0 ? +1 : -1;
        }

        boolean expired = freeAnchorPhysicalDir == 0
                || lastFreeSwipeTimeMs < 0L
                || nowMs < lastFreeSwipeTimeMs
                || (nowMs - lastFreeSwipeTimeMs) > FREE_DIRECTION_RESET_MS
                || !equalsNullable(lastFreeEditorSignature, editorSignature);

        if (expired) {
            freeAnchorPhysicalDir = physicalDir;
            lastFreeSwipeTimeMs = nowMs;
            lastFreeEditorSignature = editorSignature;
            return +1;
        }

        lastFreeSwipeTimeMs = nowMs;
        return physicalDir == freeAnchorPhysicalDir ? +1 : -1;
    }

    public synchronized void reset() {
        resetLocked();
    }

    private void resetLocked() {
        freeAnchorPhysicalDir = 0;
        lastFreeSwipeTimeMs = -1L;
        lastFreeEditorSignature = null;
    }

    private static boolean equalsNullable(String first, String second) {
        return first == null ? second == null : first.equals(second);
    }
}
