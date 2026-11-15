/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/extensions/extension/src/main/java/app/andrewliang/extension/Feedback.java
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for xboyrex (Facebook), 2026.
 * Modified for xboyrex (Instagram), 2026.
 */
package app.morphe.extension.suite.instagram.download;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import app.morphe.extension.suite.shared.Logger;
import app.morphe.extension.suite.shared.diagnostics.DiagnosticCategory;

/**
 * Tells the user what happened.
 *
 * <p>A download takes seconds and happens away from the screen, so without a word from it a tap
 * looks like it did nothing and the user taps again.
 *
 * <p>The text is xboyrex's own, read from {@link app.morphe.extension.suite.shared.L10n} in the
 * phone's language, rather than taken from the app: Meta's apps keep the words for their own menus
 * in a pack they download, not in the resources of the APK, so there is nothing to borrow.
 */
final class Feedback {

    private Feedback() {}

    /** The source a message that couldn't be shown carries in the diagnostic report. */
    private static final String SOURCE = "Feedback";

    /**
     * Shows [text], a toast for each of its lines. Android 12 and newer cut a toast at two lines,
     * so a result with a second line (Save all's "Already saved" one) would lose it. Toasts queue,
     * so the lines follow each other.
     */
    static void show(Context applicationContext, String text, boolean longToast) {
        if (applicationContext == null || text == null) return;

        try {
            new Handler(Looper.getMainLooper()).post(() -> {
                // This is the one place where this patch runs on the thread that draws the app,
                // so it carries its own guard. An exception from here reaches the
                // looper and stops the app.
                try {
                    for (String line : text.split("\n")) {
                        if (line.trim().isEmpty()) continue;
                        Toast.makeText(
                            applicationContext,
                            line,
                            longToast ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT
                        ).show();
                    }
                } catch (Throwable t) {
                    Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "could not show a message", t);
                }
            });
        } catch (Throwable t) {
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "could not reach the main thread", t);
        }
    }
}
