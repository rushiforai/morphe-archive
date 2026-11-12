package app.variablenine.nudge;

import android.app.Application;
import android.app.NotificationManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.provider.Settings;
import android.service.notification.NotificationListenerService;

import app.variablenine.nudge.core.Log;
import app.variablenine.nudge.core.Prefs;
import app.variablenine.nudge.core.Task;
import app.variablenine.nudge.core.TaskIds;
import app.variablenine.nudge.core.TaskStore;
import app.variablenine.nudge.ui.OverlayController;

/**
 * Front door of the reminder spot: start-up, and the handful of actions the rest of
 * the code needs. The user interface talks to this class and to
 * {@link TaskStore}/{@link Prefs}, and to nothing else.
 */
public final class Nudge {

    /** How long "on it" waits before asking how it went. */
    public static final long ON_IT_CHECK_IN = 20 * 60_000L;

    private static volatile boolean started;
    private static volatile boolean wired;

    private Nudge() {
    }

    // region start-up

    /**
     * Called once per process, before the host app's own code runs. Has to be cheap: no
     * disk access, no threads, nothing that could slow the app's launch.
     */
    static synchronized void start(Context context) {
        if (started || context == null) return;
        Context appContext = context.getApplicationContext();
        Application application = appContext instanceof Application ? (Application) appContext
                : context instanceof Application ? (Application) context : null;
        if (application == null) return;
        started = true;
        OverlayController.install(application);
    }

    /**
     * Connects the parts that react to changes. Deferred until something actually needs
     * the reminders (a screen is shown, a notification arrives), so that app launch
     * does not pay for it.
     */
    public static void wire(Context context) {
        if (wired) return;
        synchronized (Nudge.class) {
            if (wired) return;
            wired = true;
        }
        final Context app = context.getApplicationContext();
        TaskStore.get(app).addListener(origin -> {
            if (origin == TaskStore.FROM_USER) {
                SiblingSync.pushToAll(app);
            } else if (origin == TaskStore.FROM_NOTIFICATION) {
                SiblingSync.pushToFeedTargets(app);
            }
        });
    }

    // endregion

    // region what the user can do with a reminder

    public static void done(Context context, Task task) {
        close(context, task, Task.DONE);
    }

    /** Drop a reminder without doing it. No judgement, it just goes away. */
    public static void skip(Context context, Task task) {
        close(context, task, Task.SKIPPED);
    }

    private static void close(Context context, Task task, int state) {
        if (task == null) return;
        TaskStore.get(context).act(task.id, state, 0);
        if (Prefs.get(context).clearNotification()) {
            NudgeListenerService listener = NudgeListenerService.connected();
            if (listener != null) listener.clearNotificationOf(task.id);
        }
    }

    public static void snooze(Context context, Task task, long until) {
        if (task != null) TaskStore.get(context).act(task.id, Task.SNOOZED, until);
    }

    /** "On it": stop asking, and check back after {@link #ON_IT_CHECK_IN}. */
    public static void onIt(Context context, Task task) {
        if (task == null) return;
        TaskStore.get(context).act(task.id, Task.DOING, System.currentTimeMillis() + ON_IT_CHECK_IN);
    }

    /** Undo for done, skip and snooze. */
    public static void reopen(Context context, Task task) {
        if (task != null) TaskStore.get(context).act(task.id, Task.OPEN, 0);
    }

    public static void addManual(Context context, String text) {
        add(context, Task.PKG_MANUAL, "", text);
    }

    public static void addSample(Context context) {
        add(context, Task.PKG_SAMPLE, "Sample", "This is what a reminder looks like. Tap Done to clear it.");
    }

    private static void add(Context context, String pkg, String sender, String text) {
        TaskStore store = TaskStore.get(context);
        store.ingest(pkg, sender, text, System.currentTimeMillis(), TaskStore.FROM_USER);
        // Asked for by hand, so it has to appear, even if the same words were finished a
        // moment ago (which for a notification would mean "the same one again").
        Task task = store.get(TaskIds.of(pkg, text));
        if (task != null && task.isClosed()) store.act(task.id, Task.OPEN, 0);
    }

    // endregion

    // region notification access

    public static ComponentName listenerComponent(Context context) {
        return new ComponentName(context, NudgeListenerService.class);
    }

    public static boolean hasNotificationAccess(Context context) {
        ComponentName component = listenerComponent(context);
        try {
            if (Build.VERSION.SDK_INT >= 27) {
                NotificationManager nm =
                        (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
                if (nm != null) return nm.isNotificationListenerAccessGranted(component);
            }
        } catch (Throwable t) {
            Log.w("access check failed", t);
        }
        try {
            String enabled = Settings.Secure.getString(context.getContentResolver(),
                    "enabled_notification_listeners");
            if (enabled == null) return false;
            for (String flat : enabled.split(":")) {
                if (component.equals(ComponentName.unflattenFromString(flat))) return true;
            }
        } catch (Throwable t) {
            Log.w("access check failed", t);
        }
        return false;
    }

    /** The system screen where the user grants notification access, as directly as this Android version allows. */
    public static Intent accessSettingsIntent(Context context) {
        Intent intent;
        if (Build.VERSION.SDK_INT >= 30) {
            intent = new Intent(Settings.ACTION_NOTIFICATION_LISTENER_DETAIL_SETTINGS);
            intent.putExtra(Settings.EXTRA_NOTIFICATION_LISTENER_COMPONENT_NAME,
                    listenerComponent(context).flattenToString());
        } else {
            intent = new Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS);
        }
        return intent;
    }

    /** The plain list of apps with notification access, for when the direct screen is unavailable. */
    public static Intent accessListIntent() {
        return new Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS);
    }

    /**
     * True when reminders cannot reach this app yet: it has no notification access, no
     * other patched app is passing reminders on, and the user has not said "not now".
     */
    public static boolean needsSetup(Context context, long now) {
        Prefs prefs = Prefs.get(context);
        if (now < prefs.setupDismissedUntil()) return false;
        if (prefs.fedBySibling()) return false;
        return !hasNotificationAccess(context);
    }

    /** True when reminders reach this app one way or another. */
    public static boolean isConnected(Context context) {
        return hasNotificationAccess(context) || Prefs.get(context).fedBySibling();
    }

    static void onListenerChanged(Context context) {
        wire(context);
        OverlayController.refreshAll();
        // Tell the other patched apps right away: once one app can hear the reminders,
        // the others no longer need to ask for access themselves.
        if (NudgeListenerService.connected() != null) SiblingSync.pushToAll(context);
    }

    // endregion

    // region coming and going

    /** The app came to the front. Called by the overlay, on the main thread. */
    public static void onForeground(Context context) {
        wire(context);
        try {
            if (Build.VERSION.SDK_INT >= 24 && NudgeListenerService.connected() == null
                    && hasNotificationAccess(context)) {
                // Either "only while open" unbound it earlier, or the system dropped the
                // connection. Asking again is harmless when it is already on its way.
                NotificationListenerService.requestRebind(listenerComponent(context));
            }
        } catch (Throwable t) {
            Log.w("rebind failed", t);
        }
        SiblingSync.onForeground(context);
        TaskStore.get(context).prune();
    }

    /** The app left the screen. */
    public static void onBackground(Context context) {
        try {
            if (Build.VERSION.SDK_INT >= 24 && Prefs.get(context).onlyWhileOpen()) {
                NudgeListenerService listener = NudgeListenerService.connected();
                if (listener != null) listener.requestUnbind();
            }
        } catch (Throwable t) {
            Log.w("unbind failed", t);
        }
    }

    // endregion
}
