package io.github.xd33m.watchtime.addon;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.youtube.addon.AddOnApi;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.ShortsPlayerState;

/**
 * The add-on's entry point: the patch adds a call to {@link #register()} to Morphe's {@code AddOnManager}. It feeds
 * Morphe's time events to a {@link ShortsTracker} and sends the reports off the main thread. A watchdog runs only
 * while a Short plays. Any failure stops reporting for this process; YouTube itself is never affected.
 */
@SuppressWarnings("unused")
public final class WatchtimeAddOn {
    private static final long WATCHDOG_PERIOD_MS = 1_000;

    private static boolean registered;
    private static final ShortsTracker tracker = new ShortsTracker();
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final ExecutorService io = Executors.newSingleThreadExecutor();
    private static ReportSender sender;
    private static boolean watchdogPosted;

    private static final Runnable watchdog = new Runnable() {
        @Override
        public void run() {
            watchdogPosted = false;
            try {
                send(tracker.onWatchdog(SystemClock.elapsedRealtime()));
                schedule();
            } catch (Throwable t) {
                tracker.stopForever();
            }
        }
    };

    /** Called by Morphe's add-on manager on the main thread when the first hook fires. */
    public static void register() {
        if (registered) return;
        registered = true;
        try {
            AddOnApi.addVideoTimeListener(WatchtimeAddOn::onTime);
        } catch (Throwable t) {
            tracker.stopForever();
        }
    }

    private static void onTime(long videoTimeMs) {
        try {
            PlayerType type = PlayerType.getCurrent();
            send(tracker.onTime(
                    SystemClock.elapsedRealtime(),
                    videoTimeMs,
                    ShortsPlayerState.isOpen(),
                    type != null && type.isNoneOrHidden(),
                    VideoInformation.getVideoId()));
            schedule();
        } catch (Throwable t) {
            tracker.stopForever();
        }
    }

    /** Keeps the watchdog posted exactly while a Short plays. Main thread. */
    private static void schedule() {
        if (tracker.isPlaying() && !watchdogPosted) {
            watchdogPosted = true;
            main.postDelayed(watchdog, WATCHDOG_PERIOD_MS);
        }
    }

    /** Main thread; the binder call runs on the single IO thread. */
    private static void send(Report report) throws ReflectiveOperationException {
        if (report == null) return;
        if (sender == null) sender = new ReportSender(appContext());
        ReportSender s = sender;
        io.execute(() -> {
            if (!s.send(report)) main.post(tracker::stopForever);
        });
    }

    /**
     * Morphe's {@code Utils.getContext()} (public static, checked at patch time). Called by reflection so the stub
     * module needs no Android types.
     */
    private static Context appContext() throws ReflectiveOperationException {
        Object context = Class.forName("app.morphe.extension.shared.Utils").getMethod("getContext").invoke(null);
        return ((Context) context).getApplicationContext();
    }

    private WatchtimeAddOn() {
    }
}
