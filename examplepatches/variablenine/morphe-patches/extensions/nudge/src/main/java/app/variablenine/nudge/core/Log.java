package app.variablenine.nudge.core;

/**
 * Logging that can never take the host app down and never prints reminder text.
 */
public final class Log {

    private static final String TAG = "DuetNudge";

    private Log() {
    }

    public static void d(String message) {
        try {
            android.util.Log.d(TAG, message);
        } catch (Throwable ignored) {
            // Not on a device (unit tests): nothing to log to.
        }
    }

    public static void w(String message, Throwable t) {
        try {
            android.util.Log.w(TAG, message, t);
        } catch (Throwable ignored) {
            // See above.
        }
    }
}
