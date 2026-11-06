package app.vipulog.extension.ezykam;

import android.os.Handler;
import android.os.Looper;
import android.widget.TextView;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

@SuppressWarnings("unused")
public final class PlaybackSpeedHook {

    private static final String SPEED_ENUM_CLASS_NAME =
            "com.thingclips.smart.ipc.panel.api.playback.bean.PlayVideoSpeed$Speed";

    /**
     * Delay in milliseconds between intermediate speed commands to give camera
     * hardware sufficient time to transition without dropping subsequent requests.
     */
    private static final long STEP_INTERVAL_MS = 300L;

    private static Class<?> cachedSpeedEnumClass;

    private PlaybackSpeedHook() {}

    /**
     * Intercepts playback speed selection from the UI dialog and schedules intermediate
     * stepping commands when jumping between speeds that exceed a 2x factor.
     */
    public static void selectSpeed(Object speedListener, Object playbackPresenter, String selectedLabel) {
        if (speedListener == null || selectedLabel == null) {
            return;
        }

        Class<?> enumClass = resolveSpeedEnumClass();
        if (enumClass == null) {
            return;
        }

        int targetMode = parseSpeedModeFromLabel(selectedLabel);
        if (targetMode < 0) {
            return;
        }

        Object targetToken = resolveSpeedEnumToken(enumClass, targetMode);
        Method listenerMethod = resolveListenerCallbackMethod(speedListener, enumClass);
        if (targetToken == null || listenerMethod == null) {
            return;
        }

        int currentMode = resolveCurrentPlaybackMode(playbackPresenter);
        List<Integer> intermediateSteps = calculateSteppedModes(currentMode, targetMode);

        if (intermediateSteps.isEmpty()) {
            invokeListenerCallback(listenerMethod, speedListener, targetToken);
            return;
        }

        Handler mainHandler = new Handler(Looper.getMainLooper());
        long scheduledDelayMs = 0L;

        for (int stepMode : intermediateSteps) {
            Object stepToken = resolveSpeedEnumToken(enumClass, stepMode);
            if (stepToken != null) {
                scheduleStepTransition(mainHandler, listenerMethod, speedListener, stepToken, scheduledDelayMs);
                scheduledDelayMs += STEP_INTERVAL_MS;
            }
        }

        scheduleStepTransition(mainHandler, listenerMethod, speedListener, targetToken, scheduledDelayMs);
    }

    /**
     * Updates one or two TextView elements with the current playback speed text.
     */
    public static void updateSpeedText(Object speedInfo, TextView primaryView, TextView secondaryView) {
        String formattedSpeed = formatSpeedIndicatorText(speedInfo);
        if (formattedSpeed == null) {
            return;
        }

        if (primaryView != null) {
            primaryView.setText(formattedSpeed);
        }
        if (secondaryView != null) {
            secondaryView.setText(formattedSpeed);
        }
    }

    /**
     * Updates a single TextView element with the current playback speed text.
     */
    public static void updateSpeedText(Object speedInfo, TextView primaryView) {
        updateSpeedText(speedInfo, primaryView, null);
    }

    /**
     * Calculates intermediate speed modes required for smooth transitions.
     * Camera firmware rejects direct jumps exceeding a factor of two.
     */
    private static List<Integer> calculateSteppedModes(int currentMode, int targetMode) {
        if (currentMode == targetMode || currentMode < 0) {
            return Collections.emptyList();
        }

        List<Integer> steps = new ArrayList<>();

        if (currentMode == 1 && targetMode == 7) {
            // 1.0X -> 4.0X: transition through 2.0X
            steps.add(3);
        } else if (currentMode == 0 && targetMode == 7) {
            // 0.5X -> 4.0X: transition through 1.0X then 2.0X
            steps.add(1);
            steps.add(3);
        } else if (currentMode == 7 && targetMode == 1) {
            // 4.0X -> 1.0X: transition through 2.0X
            steps.add(3);
        } else if (currentMode == 7 && targetMode == 0) {
            // 4.0X -> 0.5X: transition through 2.0X then 1.0X
            steps.add(3);
            steps.add(1);
        }

        return steps;
    }

    private static int parseSpeedModeFromLabel(String label) {
        String normalized = label.trim().toUpperCase(Locale.US);
        if ("0.5 X".equals(normalized) || "0.5X".equals(normalized)) {
            return 0;
        }
        if ("1 X".equals(normalized) || "1X".equals(normalized)) {
            return 1;
        }
        if ("2 X".equals(normalized) || "2X".equals(normalized)) {
            return 3;
        }
        if ("4 X".equals(normalized) || "4X".equals(normalized)) {
            return 7;
        }
        return -1;
    }

    private static String tokenNameForMode(int mode) {
        switch (mode) {
            case 0:
                return "THING_SPEED_05TIMES";
            case 1:
                return "THING_SPEED_10TIMES";
            case 3:
                return "THING_SPEED_20TIMES";
            case 7:
                return "THING_SPEED_40TIMES";
            default:
                return null;
        }
    }

    private static Object resolveSpeedEnumToken(Class<?> enumClass, int mode) {
        String tokenName = tokenNameForMode(mode);
        if (tokenName == null) {
            return null;
        }

        try {
            return Enum.valueOf(enumClass.asSubclass(Enum.class), tokenName);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String formatSpeedIndicatorText(Object speedInfo) {
        if (speedInfo == null) {
            return null;
        }

        try {
            Method getSpeedMethod = speedInfo.getClass().getMethod("getSpeed");
            Object speedToken = getSpeedMethod.invoke(speedInfo);
            if (!(speedToken instanceof Enum)) {
                return null;
            }

            String tokenName = ((Enum<?>) speedToken).name();
            switch (tokenName) {
                case "THING_SPEED_05TIMES":
                    return "0.5X";
                case "THING_SPEED_10TIMES":
                    return "1X";
                case "THING_SPEED_20TIMES":
                    return "2X";
                case "THING_SPEED_40TIMES":
                    return "4X";
                default:
                    return null;
            }
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void scheduleStepTransition(
            Handler handler,
            final Method listenerMethod,
            final Object listener,
            final Object speedToken,
            long delayMs
    ) {
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                invokeListenerCallback(listenerMethod, listener, speedToken);
            }
        }, delayMs);
    }

    private static void invokeListenerCallback(Method listenerMethod, Object listener, Object speedToken) {
        try {
            listenerMethod.invoke(listener, speedToken);
        } catch (Throwable ignored) {}
    }

    private static Method resolveListenerCallbackMethod(Object listener, Class<?> enumClass) {
        try {
            return listener.getClass().getMethod("a", enumClass);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static int resolveCurrentPlaybackMode(Object presenter) {
        if (presenter == null) {
            return -1;
        }

        try {
            Object modeValue = presenter.getClass().getMethod("currentPlayBackSpeed").invoke(presenter);
            return (modeValue instanceof Integer) ? (Integer) modeValue : -1;
        } catch (Throwable ignored) {
            return -1;
        }
    }

    private static synchronized Class<?> resolveSpeedEnumClass() {
        if (cachedSpeedEnumClass == null) {
            try {
                cachedSpeedEnumClass = Class.forName(SPEED_ENUM_CLASS_NAME);
            } catch (Throwable ignored) {
                return null;
            }
        }
        return cachedSpeedEnumClass;
    }
}
