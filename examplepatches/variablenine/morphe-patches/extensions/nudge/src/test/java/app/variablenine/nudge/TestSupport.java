package app.variablenine.nudge;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.os.Looper;

import org.robolectric.Robolectric;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;

import java.lang.reflect.Field;
import java.time.Duration;

import app.variablenine.nudge.core.Prefs;
import app.variablenine.nudge.core.TaskStore;
import app.variablenine.nudge.ui.OverlayController;

/** Shared plumbing for the tests that run the real code on a simulated Android. */
public final class TestSupport {

    public static final String DUET = "com.anthropic.aibo";

    private TestSupport() {
    }

    /**
     * Every test starts from a freshly installed app. The code keeps a few things for the
     * life of the process, which in a test run would leak from one test into the next.
     */
    public static void freshProcess() throws Exception {
        clear(OverlayController.class, "instance");
        clear(TaskStore.class, "instance");
        clear(Prefs.class, "instance");
        setBoolean(Nudge.class, "started", false);
        setBoolean(Nudge.class, "wired", false);
        SiblingSync.setOwnAuthority(null);
    }

    private static void clear(Class<?> owner, String field) throws Exception {
        Field f = owner.getDeclaredField(field);
        f.setAccessible(true);
        f.set(null, null);
    }

    private static void setBoolean(Class<?> owner, String field, boolean value) throws Exception {
        Field f = owner.getDeclaredField(field);
        f.setAccessible(true);
        f.setBoolean(null, value);
    }

    public static Application app() {
        return RuntimeEnvironment.getApplication();
    }

    /** Starts the reminder spot the way the provider does at process start. */
    public static void install() {
        Nudge.start(app());
    }

    public static ActivityController<Activity> launch() {
        ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();
        idle();
        return controller;
    }

    public static void grantNotificationAccess(boolean granted) {
        Context c = app();
        ComponentName listener = Nudge.listenerComponent(c);
        android.app.NotificationManager nm =
                (android.app.NotificationManager) c.getSystemService(Context.NOTIFICATION_SERVICE);
        Shadows.shadowOf(nm).setNotificationListenerAccessGranted(listener, granted);
    }

    /** Runs everything that is waiting on the main thread right now. */
    public static void idle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    /** Lets time pass, running whatever becomes due. */
    public static void advance(long millis) {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(millis));
    }
}
