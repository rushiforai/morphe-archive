package dev.jason.gboardpatches.extension.spacebargesture;

import android.view.KeyEvent;

import org.junit.Assert;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public final class GboardSpacebarCursorSenderTest {
    @Test
    public void cursorKeyEventFlagsAlwaysPreserveTouchModeAndSoftKeyboardFlag() {
        int flags = GboardSpacebarCursorSender.CURSOR_KEY_EVENT_FLAGS;
        Assert.assertNotEquals(0, flags & KeyEvent.FLAG_SOFT_KEYBOARD);
        Assert.assertNotEquals(0, flags & KeyEvent.FLAG_KEEP_TOUCH_MODE);
    }

    @Test
    public void primarySetSelectionMovesCursorWithoutEmittingDpadKeyEvents() {
        FakeCursorEditorAdapter editor = new FakeCursorEditorAdapter("Привет мир", 6, 6);

        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(editor, -2));
        Assert.assertEquals(4, editor.selectionStart);
        Assert.assertEquals(4, editor.selectionEnd);
        Assert.assertTrue("Direct setSelection must never emit DPAD KeyEvents",
                editor.dpadEvents.isEmpty());

        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(editor, +3));
        Assert.assertEquals(7, editor.selectionStart);
        Assert.assertEquals(7, editor.selectionEnd);
        Assert.assertTrue(editor.dpadEvents.isEmpty());
    }

    @Test
    public void primarySetSelectionStopsSafelyAtTextBoundariesWithZeroKeyEvents() {
        FakeCursorEditorAdapter atStart = new FakeCursorEditorAdapter("Hello", 0, 0);
        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(atStart, -3));
        Assert.assertEquals(0, atStart.selectionStart);
        Assert.assertEquals(0, atStart.setSelectionCalls);
        Assert.assertTrue(atStart.dpadEvents.isEmpty());

        FakeCursorEditorAdapter atEnd = new FakeCursorEditorAdapter("Hello", 5, 5);
        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(atEnd, +3));
        Assert.assertEquals(5, atEnd.selectionStart);
        Assert.assertEquals(0, atEnd.setSelectionCalls);
        Assert.assertTrue(atEnd.dpadEvents.isEmpty());

        FakeCursorEditorAdapter empty = new FakeCursorEditorAdapter("", 0, 0);
        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(empty, -1));
        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(empty, +1));
        Assert.assertEquals(0, empty.setSelectionCalls);
        Assert.assertTrue(empty.dpadEvents.isEmpty());
    }

    @Test
    public void primarySetSelectionStepsOverEmojiSurrogatePairsAndCollapsesSelection() {
        String text = "a\uD83D\uDE00b"; // "a😀b" -> lengths: a(1), 😀(2), b(1) = 4
        FakeCursorEditorAdapter editor = new FakeCursorEditorAdapter(text, 1, 1);

        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(editor, +1));
        Assert.assertEquals(3, editor.selectionStart); // jumped full surrogate pair

        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(editor, -1));
        Assert.assertEquals(1, editor.selectionStart);

        // Active selection collapse: [1..4] moving left by 1 collapses to 1.
        editor.selectionStart = 1;
        editor.selectionEnd = 4;
        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(editor, -1));
        Assert.assertEquals(1, editor.selectionStart);
        Assert.assertEquals(1, editor.selectionEnd);
    }

    @Test
    public void fallbackDpadClampsAtBoundariesAndStampsKeepTouchModeFlag() {
        FakeCursorEditorAdapter editor = new FakeCursorEditorAdapter("Hi", 1, 1);
        editor.exposeExtractedText = false; // Force Tier-2 DPAD fallback (e.g. WebView/password).

        // Request 4 steps right, but only 1 char ("i") remains -> must clamp to 1 DPAD_RIGHT pair.
        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(editor, +4));
        Assert.assertEquals(2, editor.dpadEvents.size());
        Assert.assertEquals(
                KeyEvent.ACTION_DOWN + ":" + KeyEvent.KEYCODE_DPAD_RIGHT + ":"
                        + GboardSpacebarCursorSender.CURSOR_KEY_EVENT_FLAGS,
                editor.dpadEvents.get(0));
        Assert.assertEquals(
                KeyEvent.ACTION_UP + ":" + KeyEvent.KEYCODE_DPAD_RIGHT + ":"
                        + GboardSpacebarCursorSender.CURSOR_KEY_EVENT_FLAGS,
                editor.dpadEvents.get(1));

        // Now at end (pos 2): requesting more right steps must emit ZERO DPAD events!
        editor.dpadEvents.clear();
        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(editor, +3));
        Assert.assertTrue("Must suppress DPAD at text end to avoid focusSearch/keyboard collapse",
                editor.dpadEvents.isEmpty());

        // Move left to start (pos 0): requesting more left steps must emit ZERO DPAD events!
        editor.selectionStart = 0;
        editor.selectionEnd = 0;
        editor.dpadEvents.clear();
        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(editor, -2));
        Assert.assertTrue("Must suppress DPAD at text start to avoid focusSearch/keyboard collapse",
                editor.dpadEvents.isEmpty());
    }

    @Test
    public void rtlTextDelegatesToBoundaryGuardedTouchModePreservingDpad() {
        FakeCursorEditorAdapter editor = new FakeCursorEditorAdapter("שלום", 2, 2);

        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(editor, +1));
        Assert.assertEquals(0, editor.setSelectionCalls);
        Assert.assertEquals(2, editor.dpadEvents.size());
        Assert.assertTrue(editor.dpadEvents.get(0).endsWith(
                ":" + GboardSpacebarCursorSender.CURSOR_KEY_EVENT_FLAGS));
    }

    @Test
    public void failedSetSelectionFallsBackToBoundaryGuardedDpad() {
        FakeCursorEditorAdapter editor = new FakeCursorEditorAdapter("abc", 1, 1);
        editor.setSelectionSucceeds = false;

        Assert.assertTrue(GboardSpacebarCursorSender.moveHorizontalWithAdapter(editor, +1));
        Assert.assertEquals(1, editor.setSelectionCalls);
        Assert.assertEquals(2, editor.dpadEvents.size());
    }

    @Test
    public void emitsBalancedDownUpPairsStrictlyForHorizontalDpad() {
        List<String> events = new ArrayList<>();
        boolean sent = GboardSpacebarCursorSender.sendHorizontalStepCount(
                KeyEvent.KEYCODE_DPAD_RIGHT, 2, (action, code) -> {
                    events.add(action + ":" + code);
                    return true;
                });

        Assert.assertTrue(sent);
        Assert.assertEquals(
                List.of(
                        KeyEvent.ACTION_DOWN + ":" + KeyEvent.KEYCODE_DPAD_RIGHT,
                        KeyEvent.ACTION_UP + ":" + KeyEvent.KEYCODE_DPAD_RIGHT,
                        KeyEvent.ACTION_DOWN + ":" + KeyEvent.KEYCODE_DPAD_RIGHT,
                        KeyEvent.ACTION_UP + ":" + KeyEvent.KEYCODE_DPAD_RIGHT),
                events);
    }

    @Test
    public void rejectsVerticalDpadKeycodes() {
        List<String> events = new ArrayList<>();
        Assert.assertFalse(GboardSpacebarCursorSender.sendHorizontalStepCount(
                KeyEvent.KEYCODE_DPAD_UP, 1, (action, code) -> {
                    events.add(action + ":" + code);
                    return true;
                }));
        Assert.assertFalse(GboardSpacebarCursorSender.sendHorizontalStepCount(
                KeyEvent.KEYCODE_DPAD_DOWN, 1, (action, code) -> {
                    events.add(action + ":" + code);
                    return true;
                }));
        Assert.assertTrue(events.isEmpty());
    }

    @Test
    public void clampsStepsToMaxDpadStepsPerMove() {
        List<Integer> actions = new ArrayList<>();
        boolean sent = GboardSpacebarCursorSender.sendHorizontalStepCount(
                KeyEvent.KEYCODE_DPAD_LEFT, 50, (action, code) -> {
                    actions.add(action);
                    return true;
                });

        Assert.assertTrue(sent);
        Assert.assertEquals(GboardSpacebarGestureState.MAX_DPAD_STEPS_PER_MOVE * 2, actions.size());
    }

    @Test
    public void failedDownDoesNotEmitOrphanUp() {
        List<Integer> actions = new ArrayList<>();
        boolean sent = GboardSpacebarCursorSender.sendBalancedKeyEvent(
                KeyEvent.KEYCODE_DPAD_LEFT, (action, code) -> {
                    actions.add(action);
                    return false;
                });

        Assert.assertFalse(sent);
        Assert.assertEquals(List.of(KeyEvent.ACTION_DOWN), actions);
    }

    @Test
    public void falseReturningUpDoesNotEmitDuplicateUp() {
        List<Integer> actions = new ArrayList<>();
        boolean sent = GboardSpacebarCursorSender.sendBalancedKeyEvent(
                KeyEvent.KEYCODE_DPAD_RIGHT, (action, code) -> {
                    actions.add(action);
                    return action == KeyEvent.ACTION_DOWN;
                });

        Assert.assertFalse(sent);
        Assert.assertEquals(List.of(KeyEvent.ACTION_DOWN, KeyEvent.ACTION_UP), actions);
    }

    @Test
    public void downThrowingExceptionDoesNotEmitOrphanUp() {
        List<Integer> actions = new ArrayList<>();
        boolean sent = GboardSpacebarCursorSender.sendBalancedKeyEvent(
                KeyEvent.KEYCODE_DPAD_LEFT, (action, code) -> {
                    actions.add(action);
                    throw new RuntimeException("IPC failure");
                });

        Assert.assertFalse(sent);
        Assert.assertEquals(List.of(KeyEvent.ACTION_DOWN), actions);
    }

    private static final class FakeCursorEditorAdapter
            implements GboardSpacebarCursorSender.CursorEditorAdapter {
        final String text;
        int selectionStart;
        int selectionEnd;
        boolean exposeExtractedText = true;
        boolean setSelectionSucceeds = true;
        int setSelectionCalls;
        final List<String> dpadEvents = new ArrayList<>();

        FakeCursorEditorAdapter(String text, int selectionStart, int selectionEnd) {
            this.text = text;
            this.selectionStart = selectionStart;
            this.selectionEnd = selectionEnd;
        }

        @Override
        public GboardSpacebarCursorSender.SelectionSnapshot readFullSelection() {
            if (!exposeExtractedText) {
                return null;
            }
            return new GboardSpacebarCursorSender.SelectionSnapshot(
                    text, 0, selectionStart, selectionEnd);
        }

        @Override
        public boolean setSelection(int start, int end) {
            setSelectionCalls++;
            if (!setSelectionSucceeds) {
                return false;
            }
            selectionStart = start;
            selectionEnd = end;
            return true;
        }

        @Override
        public CharSequence getTextBeforeCursor(int maxChars) {
            int pos = Math.max(0, Math.min(selectionStart, text.length()));
            int from = Math.max(0, pos - maxChars);
            return text.substring(from, pos);
        }

        @Override
        public CharSequence getTextAfterCursor(int maxChars) {
            int pos = Math.max(0, Math.min(selectionEnd, text.length()));
            int to = Math.min(text.length(), pos + maxChars);
            return text.substring(pos, to);
        }

        @Override
        public boolean sendDpadKeyEvent(int action, int keyCode, int flags) {
            dpadEvents.add(action + ":" + keyCode + ":" + flags);
            if (action == KeyEvent.ACTION_UP) {
                if (keyCode == KeyEvent.KEYCODE_DPAD_LEFT && selectionStart > 0) {
                    selectionStart--;
                    selectionEnd = selectionStart;
                } else if (keyCode == KeyEvent.KEYCODE_DPAD_RIGHT
                        && selectionEnd < text.length()) {
                    selectionEnd++;
                    selectionStart = selectionEnd;
                }
            }
            return true;
        }
    }
}
