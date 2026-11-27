package io.github.xd33m.watchtime.addon;

import android.content.ContentProviderClient;
import android.content.Context;
import android.os.Bundle;
import android.os.DeadObjectException;

/**
 * Sends one {@link Report} to the Watchtime Tracker app's provider (protocol v1) and returns whether the app wants
 * more. Blocking binder call: never on the main thread. Sends nothing but the fields below.
 * <p>
 * The connection is unstable on purpose: with a stable one, Android kills YouTube when the app's process dies while
 * the connection is held (an app update or restart in the middle of a Short). An unstable one only throws.
 */
final class ReportSender {
    private static final String AUTHORITY = "io.github.xd33m.watchtimetracker.gaps";

    private final Context context;

    ReportSender(Context appContext) {
        this.context = appContext;
    }

    /**
     * False when the app answered "not wanted", is not installed, or the call failed. True when the app's process died
     * during the call: it restarts on the next report, and a restart must not silence the add-on.
     */
    boolean send(Report report) {
        ContentProviderClient client = null;
        try {
            client = context.getContentResolver().acquireUnstableContentProviderClient(AUTHORITY);
            if (client == null) return false; // not installed (or not visible)
            Bundle extras = new Bundle();
            extras.putInt("v", 1);
            extras.putString("kind", "shorts");
            extras.putString("state", report.state);
            if (report.contentId != null) extras.putString("contentId", report.contentId);
            Bundle reply = client.call("report", null, extras);
            return reply != null && reply.getBoolean("wanted", false);
        } catch (DeadObjectException e) {
            return true;
        } catch (Throwable t) {
            return false;
        } finally {
            if (client != null) {
                try {
                    client.close();
                } catch (Throwable ignored) {
                    // nothing to do
                }
            }
        }
    }
}
