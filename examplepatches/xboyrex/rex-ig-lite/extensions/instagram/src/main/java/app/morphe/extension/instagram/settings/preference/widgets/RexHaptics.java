/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.content.Context;
import android.os.Build;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.os.VibratorManager;
import android.view.HapticFeedbackConstants;
import android.view.View;

import app.morphe.extension.shared.Utils;

public final class RexHaptics {

    private RexHaptics() {
    }

    public static void tap(View view) {
        if (view != null) {
            try {
                if (view.performHapticFeedback(
                        HapticFeedbackConstants.KEYBOARD_TAP,
                        HapticFeedbackConstants.FLAG_IGNORE_GLOBAL_SETTING
                                | HapticFeedbackConstants.FLAG_IGNORE_VIEW_SETTING)) {
                    return;
                }
            } catch (Throwable ignored) {
            }
            vibrate(view.getContext(), 12L, 100);
        } else {
            vibrate(Utils.getContext(), 12L, 100);
        }
    }

    public static void tap(Context context) {
        vibrate(context != null ? context : Utils.getContext(), 12L, 100);
    }

    public static void toggle(View view) {
        if (view != null) {
            try {
                int constant = Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1
                        ? HapticFeedbackConstants.TEXT_HANDLE_MOVE
                        : HapticFeedbackConstants.CLOCK_TICK;
                if (view.performHapticFeedback(
                        constant,
                        HapticFeedbackConstants.FLAG_IGNORE_GLOBAL_SETTING
                                | HapticFeedbackConstants.FLAG_IGNORE_VIEW_SETTING)) {
                    return;
                }
            } catch (Throwable ignored) {
            }
            vibrate(view.getContext(), 15L, 140);
        } else {
            vibrate(Utils.getContext(), 15L, 140);
        }
    }

    public static void toggle(Context context) {
        vibrate(context != null ? context : Utils.getContext(), 15L, 140);
    }

    public static void longPress(View view) {
        if (view != null) {
            try {
                view.performHapticFeedback(
                        HapticFeedbackConstants.LONG_PRESS,
                        HapticFeedbackConstants.FLAG_IGNORE_GLOBAL_SETTING
                                | HapticFeedbackConstants.FLAG_IGNORE_VIEW_SETTING);
            } catch (Throwable ignored) {
            }
            vibrate(view.getContext(), 28L, 210);
        } else {
            vibrate(Utils.getContext(), 28L, 210);
        }
    }

    public static void longPress(Context context) {
        vibrate(context != null ? context : Utils.getContext(), 28L, 210);
    }

    @SuppressWarnings("deprecation")
    private static void vibrate(Context context, long durationMs, int amplitude) {
        try {
            Context ctx = context != null ? context : Utils.getContext();
            if (ctx == null) return;
            Vibrator vibrator = null;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                VibratorManager vm = (VibratorManager) ctx.getSystemService(Context.VIBRATOR_MANAGER_SERVICE);
                if (vm != null) {
                    vibrator = vm.getDefaultVibrator();
                }
            }
            if (vibrator == null) {
                vibrator = (Vibrator) ctx.getSystemService(Context.VIBRATOR_SERVICE);
            }
            if (vibrator == null || !vibrator.hasVibrator()) return;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                vibrator.vibrate(VibrationEffect.createOneShot(durationMs, Math.min(255, Math.max(1, amplitude))));
            } else {
                vibrator.vibrate(durationMs);
            }
        } catch (Throwable ignored) {
        }
    }
}
