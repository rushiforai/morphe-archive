package app.morphe.extension.youtube.patches.catlock;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;

import app.morphe.extension.shared.Logger;

/**
 * Cat Lock: a full-window, transparent overlay that swallows every touch so a cat playing with
 * the phone can't accidentally swipe the video away, pause it, or navigate off — while the video
 * keeps playing underneath. The overlay is dismissed only by the {@link AlternatingTapUnlock}
 * gesture (quickly tapping alternating opposite sides of the screen).
 *
 * <p>The overlay is added to the Activity's decor view, so it covers the whole app UI. It stays
 * fully transparent (birds stay visible) apart from a small unlock hint that fades out and
 * reappears on each touch. It also keeps the screen awake while locked.
 */
public final class CatLockOverlay {

    @Nullable
    private static WeakReference<ViewGroup> rootRef;
    @Nullable
    private static View overlay;

    public static boolean isLocked() {
        return overlay != null;
    }

    /** Engage the lock. {@code anchor} is any view currently attached to the player Activity. */
    public static void engage(View anchor) {
        try {
            if (isLocked()) return;
            Activity activity = getActivity(anchor.getContext());
            if (activity == null) {
                Logger.printException(() -> "Cat lock: could not resolve Activity");
                return;
            }
            ViewGroup root = (ViewGroup) activity.getWindow().getDecorView();
            LockView v = new LockView(activity);
            root.addView(v, new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.MATCH_PARENT,
                    FrameLayout.LayoutParams.MATCH_PARENT));
            v.setKeepScreenOn(true);
            v.bringToFront();
            overlay = v;
            rootRef = new WeakReference<>(root);
            Logger.printDebug(() -> "Cat lock engaged");
        } catch (Exception ex) {
            Logger.printException(() -> "Cat lock engage failure", ex);
        }
    }

    static void disengage() {
        try {
            ViewGroup root = rootRef != null ? rootRef.get() : null;
            if (root != null && overlay != null) {
                root.removeView(overlay);
            }
            Logger.printDebug(() -> "Cat lock disengaged");
        } catch (Exception ex) {
            Logger.printException(() -> "Cat lock disengage failure", ex);
        } finally {
            overlay = null;
            rootRef = null;
        }
    }

    @Nullable
    private static Activity getActivity(Context c) {
        while (c instanceof ContextWrapper) {
            if (c instanceof Activity) return (Activity) c;
            c = ((ContextWrapper) c).getBaseContext();
        }
        return null;
    }

    @SuppressLint({"ViewConstructor", "SetTextI18n"})
    private static final class LockView extends FrameLayout {
        private final AlternatingTapUnlock unlock = new AlternatingTapUnlock();
        private final TextView hint;

        LockView(Context ctx) {
            super(ctx);
            setClickable(true);
            setFocusable(true);
            setBackgroundColor(Color.TRANSPARENT);

            hint = new TextView(ctx);
            hint.setText("🐾 Cat lock on — tap opposite sides quickly to unlock");
            hint.setTextColor(0xEEFFFFFF);
            hint.setTextSize(12f);
            hint.setPadding(28, 14, 28, 14);
            hint.setBackgroundColor(0x88000000);
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.WRAP_CONTENT,
                    FrameLayout.LayoutParams.WRAP_CONTENT,
                    Gravity.TOP | Gravity.CENTER_HORIZONTAL);
            lp.topMargin = 96;
            addView(hint, lp);
            flashHint(null);
        }

        private void flashHint(@Nullable String text) {
            if (text != null) hint.setText(text);
            hint.animate().cancel();
            hint.setAlpha(1f);
            hint.animate().alpha(0f).setStartDelay(2500).setDuration(800).start();
        }

        @Override
        public boolean onInterceptTouchEvent(MotionEvent ev) {
            return true; // never let children/underlying views handle touches
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            final int action = event.getActionMasked();
            // ACTION_POINTER_DOWN matters: tapping alternately with two thumbs usually
            // overlaps touches, so the second thumb arrives as a POINTER_DOWN of the
            // same gesture rather than a fresh ACTION_DOWN. Only counting ACTION_DOWN
            // made two-thumb unlocking nearly impossible.
            if (action == MotionEvent.ACTION_DOWN || action == MotionEvent.ACTION_POINTER_DOWN) {
                float x = event.getX(event.getActionIndex());
                boolean unlocked = unlock.onTap(SystemClock.uptimeMillis(), x, getWidth());
                int streak = unlock.currentStreak();
                if (unlocked) {
                    performHapticFeedback(android.view.HapticFeedbackConstants.LONG_PRESS);
                    disengage();
                } else if (streak >= 2) {
                    // Visible + haptic progress so a human can tell taps are registering.
                    performHapticFeedback(android.view.HapticFeedbackConstants.KEYBOARD_TAP);
                    flashHint("🐾 " + streak + "/6");
                } else {
                    flashHint("🐾 Cat lock on — tap opposite sides quickly to unlock");
                }
            }
            return true; // consume everything so YouTube never sees the touch
        }
    }
}
