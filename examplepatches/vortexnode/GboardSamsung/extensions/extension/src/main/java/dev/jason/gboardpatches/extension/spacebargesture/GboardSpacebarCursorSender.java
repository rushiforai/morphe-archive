package dev.jason.gboardpatches.extension.spacebargesture;

import android.os.SystemClock;
import android.text.InputType;
import android.view.InputDevice;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.ExtractedText;
import android.view.inputmethod.ExtractedTextRequest;
import android.view.inputmethod.InputConnection;

/**
 * Safely moves the text cursor in 2D (left/right/up/down) during spacebar long-press cursor mode
 * without triggering Android's touch-mode exit or focus search (which collapses the soft keyboard
 * when raw DPAD key events without {@link KeyEvent#FLAG_KEEP_TOUCH_MODE} hit text boundaries).
 *
 * <p>Strategy:
 * <ol>
 *   <li><strong>Horizontal primary:</strong> Direct {@link InputConnection#setSelection(int, int)}
 *       using {@link InputConnection#getExtractedText(ExtractedTextRequest, int)} for non-RTL
 *       editors, stepping by Unicode code points and stopping cleanly at {@code [0, length]} with
 *       zero {@link KeyEvent}s.</li>
 *   <li><strong>Horizontal fallback:</strong> Boundary-clamped horizontal DPAD
 *       {@code ACTION_DOWN}/{@code ACTION_UP} pairs stamped with
 *       {@link KeyEvent#FLAG_SOFT_KEYBOARD} {@code |} {@link KeyEvent#FLAG_KEEP_TOUCH_MODE}.</li>
 *   <li><strong>Vertical (multi-line editors only):</strong> Gated on multi-line {@link EditorInfo}
 *       flags (with Gboard-style allowlist/blocklist and newline probe fallback) plus start/end
 *       text boundary guards, emitting balanced {@code DPAD_UP}/{@code DPAD_DOWN} pairs with
 *       {@link KeyEvent#FLAG_SOFT_KEYBOARD} {@code |} {@link KeyEvent#FLAG_KEEP_TOUCH_MODE}.</li>
 * </ol>
 */
public final class GboardSpacebarCursorSender {
    static final int CURSOR_KEY_EVENT_FLAGS =
            KeyEvent.FLAG_SOFT_KEYBOARD | KeyEvent.FLAG_KEEP_TOUCH_MODE;
    private static final int VERTICAL_NEWLINE_PROBE_CHARS = 512;
    private static final String PACKAGE_NEXUS_LAUNCHER = "com.google.android.apps.nexuslauncher";
    private static final String PACKAGE_MS_WORD = "com.microsoft.office.word";
    private static final String PACKAGE_MS_POWERPOINT = "com.microsoft.office.powerpoint";

    private GboardSpacebarCursorSender() {
    }

    public static boolean finishComposingText(InputConnection connection) {
        if (connection == null) {
            return false;
        }
        try {
            return connection.finishComposingText();
        } catch (Throwable ignored) {
            return false;
        }
    }

    @FunctionalInterface
    interface KeyActionEmitter {
        boolean emit(int action, int keyCode);
    }

    static final class SelectionSnapshot {
        final CharSequence text;
        final int startOffset;
        final int selectionStart;
        final int selectionEnd;

        SelectionSnapshot(CharSequence text, int startOffset, int selectionStart, int selectionEnd) {
            this.text = text;
            this.startOffset = startOffset;
            this.selectionStart = selectionStart;
            this.selectionEnd = selectionEnd;
        }
    }

    interface CursorEditorAdapter {
        SelectionSnapshot readFullSelection();

        boolean setSelection(int start, int end);

        CharSequence getTextBeforeCursor(int maxChars);

        CharSequence getTextAfterCursor(int maxChars);

        boolean sendDpadKeyEvent(int action, int keyCode, int flags);
    }

    /**
     * Moves the cursor horizontally by {@code signedSteps} (negative = left, positive = right).
     * Never emits vertical DPAD keycodes and never leaves touch mode.
     */
    public static boolean sendHorizontalSteps(InputConnection connection, int signedSteps) {
        if (connection == null || signedSteps == 0) {
            return false;
        }
        return moveHorizontalWithAdapter(new InputConnectionAdapter(connection), signedSteps);
    }

    /**
     * Moves the cursor vertically by {@code signedSteps} (negative = up, positive = down) when
     * the active editor supports multi-line input. Suppresses vertical DPAD in single-line fields
     * and at the absolute start/end of text to prevent focus loss or keyboard collapse.
     */
    public static boolean sendVerticalSteps(
            InputConnection connection, EditorInfo editorInfo, int signedSteps) {
        if (connection == null || signedSteps == 0) {
            return false;
        }
        return moveVerticalWithAdapter(
                new InputConnectionAdapter(connection), editorInfo, signedSteps);
    }

    static boolean moveVerticalWithAdapter(
            CursorEditorAdapter adapter, EditorInfo editorInfo, int signedSteps) {
        if (adapter == null || signedSteps == 0) {
            return false;
        }
        if (!isVerticalCursorAllowed(editorInfo, adapter)) {
            return true;
        }
        boolean moveUp = signedSteps < 0;
        if (isAtVerticalTextBoundary(adapter, moveUp)) {
            // Already at offset 0 (for UP) or end of text (for DOWN): suppress DPAD to avoid focusSearch.
            return true;
        }
        int keyCode = moveUp ? KeyEvent.KEYCODE_DPAD_UP : KeyEvent.KEYCODE_DPAD_DOWN;
        int clampedCount = Math.min(
                Math.abs(signedSteps), GboardSpacebarGestureState.MAX_VERTICAL_STEPS_PER_MOVE);
        return sendVerticalStepCount(
                keyCode,
                clampedCount,
                (action, code) -> adapter.sendDpadKeyEvent(action, code, CURSOR_KEY_EVENT_FLAGS));
    }

    static boolean isVerticalCursorAllowed(EditorInfo editorInfo, CursorEditorAdapter adapter) {
        if (editorInfo != null) {
            String pkg = editorInfo.packageName;
            if (PACKAGE_NEXUS_LAUNCHER.equals(pkg)) {
                return false;
            }
            if (PACKAGE_MS_WORD.equals(pkg) || PACKAGE_MS_POWERPOINT.equals(pkg)) {
                return true;
            }
            int inputType = editorInfo.inputType;
            int inputClass = inputType & InputType.TYPE_MASK_CLASS;
            if (inputClass == InputType.TYPE_CLASS_TEXT) {
                if ((inputType & InputType.TYPE_TEXT_FLAG_MULTI_LINE) != 0
                        || (inputType & InputType.TYPE_TEXT_FLAG_IME_MULTI_LINE) != 0) {
                    return true;
                }
                int variation = inputType & InputType.TYPE_MASK_VARIATION;
                if (variation == InputType.TYPE_TEXT_VARIATION_PASSWORD
                        || variation == InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                        || variation == InputType.TYPE_TEXT_VARIATION_WEB_PASSWORD
                        || variation == InputType.TYPE_TEXT_VARIATION_URI
                        || variation == InputType.TYPE_TEXT_VARIATION_EMAIL_ADDRESS
                        || variation == InputType.TYPE_TEXT_VARIATION_WEB_EMAIL_ADDRESS) {
                    return false;
                }
            } else if (inputClass == InputType.TYPE_CLASS_NUMBER
                    || inputClass == InputType.TYPE_CLASS_PHONE
                    || inputClass == InputType.TYPE_CLASS_DATETIME) {
                return false;
            }
        }
        // Fallback for WebView / custom editors that omit TYPE_TEXT_FLAG_MULTI_LINE:
        // allow vertical movement only if the surrounding text actually contains a newline.
        return hasNewlineAroundCursor(adapter);
    }

    private static boolean hasNewlineAroundCursor(CursorEditorAdapter adapter) {
        if (adapter == null) {
            return false;
        }
        try {
            CharSequence before = adapter.getTextBeforeCursor(VERTICAL_NEWLINE_PROBE_CHARS);
            if (containsNewline(before)) {
                return true;
            }
            CharSequence after = adapter.getTextAfterCursor(VERTICAL_NEWLINE_PROBE_CHARS);
            return containsNewline(after);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean containsNewline(CharSequence text) {
        if (text == null) {
            return false;
        }
        int len = text.length();
        for (int i = 0; i < len; i++) {
            char ch = text.charAt(i);
            if (ch == '\n' || ch == '\r') {
                return true;
            }
        }
        return false;
    }

    private static boolean isAtVerticalTextBoundary(CursorEditorAdapter adapter, boolean moveUp) {
        if (adapter == null) {
            return false;
        }
        try {
            CharSequence adjacent = moveUp
                    ? adapter.getTextBeforeCursor(1)
                    : adapter.getTextAfterCursor(1);
            return adjacent != null && adjacent.length() == 0;
        } catch (Throwable ignored) {
            return false;
        }
    }

    static boolean sendVerticalStepCount(int keyCode, int count, KeyActionEmitter emitter) {
        if (emitter == null || count <= 0) {
            return false;
        }
        if (keyCode != KeyEvent.KEYCODE_DPAD_UP && keyCode != KeyEvent.KEYCODE_DPAD_DOWN) {
            return false;
        }
        int clampedCount = Math.min(count, GboardSpacebarGestureState.MAX_VERTICAL_STEPS_PER_MOVE);
        boolean sentAny = false;
        for (int index = 0; index < clampedCount; index++) {
            if (!sendBalancedKeyEvent(keyCode, emitter)) {
                break;
            }
            sentAny = true;
        }
        return sentAny;
    }

    static boolean moveHorizontalWithAdapter(CursorEditorAdapter adapter, int signedSteps) {
        if (adapter == null || signedSteps == 0) {
            return false;
        }
        int clampedSignedSteps = clampSignedSteps(signedSteps);
        if (clampedSignedSteps == 0) {
            return false;
        }

        // Primary path: direct selection update (impossible to exit touch mode or steal focus).
        Boolean selectionResult = tryMoveViaSelection(adapter, clampedSignedSteps);
        if (selectionResult != null) {
            return selectionResult;
        }

        // Fallback path (WebView, RTL, password/custom editors): boundary-guarded soft-keyboard DPAD.
        return sendBoundaryGuardedDpad(adapter, clampedSignedSteps);
    }

    /**
     * Attempts to move the cursor directly via {@link CursorEditorAdapter#setSelection(int, int)}.
     *
     * @return {@link Boolean#TRUE} if handled (moved or safely clamped at boundary),
     *         {@code null} if the editor does not expose safe full extracted text and should
     *         fall back to boundary-guarded DPAD.
     */
    static Boolean tryMoveViaSelection(CursorEditorAdapter adapter, int signedSteps) {
        if (adapter == null || signedSteps == 0) {
            return null;
        }
        try {
            SelectionSnapshot snapshot = adapter.readFullSelection();
            if (snapshot == null || snapshot.text == null || snapshot.startOffset < 0) {
                return null;
            }
            CharSequence text = snapshot.text;
            int textLength = text.length();
            int selStart = snapshot.selectionStart;
            int selEnd = snapshot.selectionEnd;
            if (selStart < 0 || selEnd < 0 || selStart > textLength || selEnd > textLength) {
                return null;
            }
            if (containsRtlOrBidi(text, selStart, selEnd, signedSteps)) {
                return null;
            }

            int targetLocalOffset =
                    computeTargetSelectionOffset(text, selStart, selEnd, signedSteps);
            if (selStart == selEnd && targetLocalOffset == selStart) {
                // Already at the start (0) or end (textLength) boundary: safe no-op, zero KeyEvents.
                return Boolean.TRUE;
            }

            int absoluteTarget = snapshot.startOffset + targetLocalOffset;
            return adapter.setSelection(absoluteTarget, absoluteTarget)
                    ? Boolean.TRUE
                    : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    static boolean sendBoundaryGuardedDpad(CursorEditorAdapter adapter, int signedSteps) {
        int keyCode = signedSteps < 0
                ? KeyEvent.KEYCODE_DPAD_LEFT
                : KeyEvent.KEYCODE_DPAD_RIGHT;
        int requestedCount = Math.min(Math.abs(signedSteps),
                GboardSpacebarGestureState.MAX_DPAD_STEPS_PER_MOVE);
        int boundedCount = clampStepsToEditorBoundary(adapter, signedSteps < 0, requestedCount);
        if (boundedCount <= 0) {
            // Already at the text boundary: suppress DPAD to prevent ViewRootImpl focusSearch.
            return true;
        }
        return sendHorizontalStepCount(
                keyCode,
                boundedCount,
                (action, code) -> adapter.sendDpadKeyEvent(action, code, CURSOR_KEY_EVENT_FLAGS));
    }

    static int clampStepsToEditorBoundary(
            CursorEditorAdapter adapter, boolean moveLeft, int requestedSteps) {
        if (requestedSteps <= 0) {
            return 0;
        }
        if (adapter == null) {
            return requestedSteps;
        }
        try {
            // Request up to 2 chars per step to cover UTF-16 surrogate pairs (e.g. emoji).
            int probeChars = Math.max(2, requestedSteps * 2);
            CharSequence adjacent = moveLeft
                    ? adapter.getTextBeforeCursor(probeChars)
                    : adapter.getTextAfterCursor(probeChars);
            if (adjacent == null) {
                return requestedSteps;
            }
            if (adjacent.length() == 0) {
                return 0;
            }
            int availableCodePoints = countCodePoints(adjacent);
            return Math.min(requestedSteps, availableCodePoints);
        } catch (Throwable ignored) {
            return requestedSteps;
        }
    }

    static int computeTargetSelectionOffset(
            CharSequence text, int selStart, int selEnd, int signedSteps) {
        int length = text == null ? 0 : text.length();
        int clampedStart = Math.max(0, Math.min(selStart, length));
        int clampedEnd = Math.max(0, Math.min(selEnd, length));
        int remaining = clampSignedSteps(signedSteps);
        if (remaining == 0) {
            return clampedEnd;
        }

        int cursor;
        if (clampedStart != clampedEnd) {
            // Collapse active selection in the direction of movement, consuming one step.
            if (remaining < 0) {
                cursor = Math.min(clampedStart, clampedEnd);
                remaining++;
            } else {
                cursor = Math.max(clampedStart, clampedEnd);
                remaining--;
            }
        } else {
            cursor = clampedStart;
        }

        while (remaining < 0 && cursor > 0) {
            int cp = Character.codePointBefore(text, cursor);
            cursor = Math.max(0, cursor - Character.charCount(cp));
            remaining++;
        }
        while (remaining > 0 && cursor < length) {
            int cp = Character.codePointAt(text, cursor);
            cursor = Math.min(length, cursor + Character.charCount(cp));
            remaining--;
        }
        return cursor;
    }

    static boolean containsRtlOrBidi(
            CharSequence text, int selStart, int selEnd, int signedSteps) {
        if (text == null || text.length() == 0) {
            return false;
        }
        int length = text.length();
        int span = Math.max(8, Math.abs(clampSignedSteps(signedSteps)) * 4);
        int windowStart = Math.max(0, Math.min(selStart, selEnd) - span);
        int windowEnd = Math.min(length, Math.max(selStart, selEnd) + span);
        int index = windowStart;
        while (index < windowEnd) {
            int cp = Character.codePointAt(text, index);
            byte dir = Character.getDirectionality(cp);
            if (dir == Character.DIRECTIONALITY_RIGHT_TO_LEFT
                    || dir == Character.DIRECTIONALITY_RIGHT_TO_LEFT_ARABIC
                    || dir == Character.DIRECTIONALITY_RIGHT_TO_LEFT_EMBEDDING
                    || dir == Character.DIRECTIONALITY_RIGHT_TO_LEFT_OVERRIDE
                    || dir == Character.DIRECTIONALITY_RIGHT_TO_LEFT_ISOLATE
                    || dir == Character.DIRECTIONALITY_FIRST_STRONG_ISOLATE) {
                return true;
            }
            index += Character.charCount(cp);
        }
        return false;
    }

    static int countCodePoints(CharSequence text) {
        if (text == null || text.length() == 0) {
            return 0;
        }
        int count = 0;
        int index = 0;
        int length = text.length();
        while (index < length) {
            int cp = Character.codePointAt(text, index);
            index += Character.charCount(cp);
            count++;
        }
        return count;
    }

    private static int clampSignedSteps(int signedSteps) {
        return Math.max(
                -GboardSpacebarGestureState.MAX_DPAD_STEPS_PER_MOVE,
                Math.min(GboardSpacebarGestureState.MAX_DPAD_STEPS_PER_MOVE, signedSteps));
    }

    static boolean sendHorizontalStepCount(int keyCode, int count, KeyActionEmitter emitter) {
        if (emitter == null || count <= 0) {
            return false;
        }
        if (keyCode != KeyEvent.KEYCODE_DPAD_LEFT && keyCode != KeyEvent.KEYCODE_DPAD_RIGHT) {
            return false;
        }
        int clampedCount = Math.min(count, GboardSpacebarGestureState.MAX_DPAD_STEPS_PER_MOVE);
        boolean sentAny = false;
        for (int index = 0; index < clampedCount; index++) {
            if (!sendBalancedKeyEvent(keyCode, emitter)) {
                break;
            }
            sentAny = true;
        }
        return sentAny;
    }

    static boolean sendBalancedKeyEvent(int keyCode, KeyActionEmitter emitter) {
        boolean downSucceeded = false;
        boolean upAttempted = false;
        try {
            if (!emitter.emit(KeyEvent.ACTION_DOWN, keyCode)) {
                return false;
            }
            downSucceeded = true;
            upAttempted = true;
            return emitter.emit(KeyEvent.ACTION_UP, keyCode);
        } catch (Throwable ignored) {
            return false;
        } finally {
            if (downSucceeded && !upAttempted) {
                try {
                    emitter.emit(KeyEvent.ACTION_UP, keyCode);
                } catch (Throwable ignored) {
                    // Cleanup must never crash keyboard touch handling.
                }
            }
        }
    }

    static KeyEvent createKeyEvent(long time, int action, int keyCode, int flags) {
        return new KeyEvent(
                time,
                time,
                action,
                keyCode,
                0,
                0,
                KeyCharacterMap.VIRTUAL_KEYBOARD,
                0,
                flags,
                InputDevice.SOURCE_KEYBOARD);
    }

    private static final class InputConnectionAdapter implements CursorEditorAdapter {
        private final InputConnection connection;

        InputConnectionAdapter(InputConnection connection) {
            this.connection = connection;
        }

        @Override
        public SelectionSnapshot readFullSelection() {
            ExtractedTextRequest request = new ExtractedTextRequest();
            request.flags = 0;
            ExtractedText extracted = connection.getExtractedText(request, 0);
            if (extracted == null
                    || extracted.text == null
                    || extracted.partialStartOffset >= 0
                    || extracted.startOffset < 0) {
                return null;
            }
            return new SelectionSnapshot(
                    extracted.text,
                    extracted.startOffset,
                    extracted.selectionStart,
                    extracted.selectionEnd);
        }

        @Override
        public boolean setSelection(int start, int end) {
            return connection.setSelection(start, end);
        }

        @Override
        public CharSequence getTextBeforeCursor(int maxChars) {
            return connection.getTextBeforeCursor(maxChars, 0);
        }

        @Override
        public CharSequence getTextAfterCursor(int maxChars) {
            return connection.getTextAfterCursor(maxChars, 0);
        }

        @Override
        public boolean sendDpadKeyEvent(int action, int keyCode, int flags) {
            long now = SystemClock.uptimeMillis();
            return connection.sendKeyEvent(createKeyEvent(now, action, keyCode, flags));
        }
    }
}
