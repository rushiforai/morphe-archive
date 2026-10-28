/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.extension.boost.debug;

import android.app.Application;
import android.content.Context;
import android.util.Log;

import java.io.File;
import java.io.IOException;

import app.morphe.extension.boost.utils.LoggingUtils;

/**
 * @noinspection unused
 */
public class ExceptionHook {
    private static final String TAG = "MorpheExceptionLog";
    private static final ThreadLocal<Boolean> RECORDING = new ThreadLocal<>();
    private static volatile Application application;
    private static ExceptionLogStore store;

    public static void initialize(Application context) {
        application = context;
    }

    public static void handleException(Throwable error, String context) {
        if (Boolean.TRUE.equals(RECORDING.get())) {
            Log.e(TAG, "Recursive exception logging was suppressed.");
            return;
        }
        RECORDING.set(true);
        try {
            getLogStore(application).append(error, context);
        } catch (IOException | SecurityException | IllegalStateException failure) {
            Log.e(TAG, "Could not write the private exception log.", failure);
        } finally {
            RECORDING.remove();
        }
    }

    public static void handleException(Throwable error) {
        handleException(error, "Boost error");
    }

    public static synchronized ExceptionLogStore getLogStore(Context context) throws IOException {
        if (context == null) throw new IOException("Boost's application context is not initialized.");
        if (store == null) {
            File privateDirectory = context.getNoBackupFilesDir();
            if (privateDirectory == null) throw new IOException("Private app storage is unavailable.");
            store = new ExceptionLogStore(new File(privateDirectory, "morphe-exceptions"));
        }
        return store;
    }

    public static void log(String s, Object[] objs) {
        LoggingUtils.logInfo(
                true,
                () -> String.format(s, objs)
        );
    }
}
