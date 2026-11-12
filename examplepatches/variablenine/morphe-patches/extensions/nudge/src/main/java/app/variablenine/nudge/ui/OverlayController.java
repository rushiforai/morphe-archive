package app.variablenine.nudge.ui;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.variablenine.nudge.Nudge;
import app.variablenine.nudge.core.Log;
import app.variablenine.nudge.core.Prefs;
import app.variablenine.nudge.core.Task;
import app.variablenine.nudge.core.TaskBook;
import app.variablenine.nudge.core.TaskStore;
import app.variablenine.nudge.core.TimeText;

/**
 * Decides what the reminder tab shows on each screen of the host app, and when it is
 * allowed to ask for a moment of attention.
 *
 * <p>The rules, which follow what is known about reminders that keep working:
 * <ul>
 * <li>The tab is there exactly while something is waiting. Seeing it always means
 * something; not seeing it means nothing is waiting.</li>
 * <li>At rest it does not move. It briefly extends into a line of text when the app is
 * opened, when a reminder arrives, and every so often after that, and never more often
 * than the user chose.</li>
 * <li>It gets out of the way for fullscreen video, picture-in-picture and typing.</li>
 * <li>A reminder that has waited longer says so in words. It does not get louder.</li>
 * </ul>
 *
 * <p>Every callback from the system is wrapped: whatever goes wrong in here stays in here.
 */
public final class OverlayController
        implements Application.ActivityLifecycleCallbacks, NudgeLayer.Host, TaskStore.Listener {

    private static final long GAP_GENTLE = 15 * TaskBook.MINUTE;
    private static final long GAP_REGULAR = 8 * TaskBook.MINUTE;
    /** Several reminders arriving together get one cue, not one each. */
    private static final long ARRIVAL_GAP = 20_000L;
    private static final long CUE_HOLD = 5_000L;
    private static final long CUE_HOLD_LONG = 7_000L;
    private static final long BACKGROUND_GRACE = 2_000L;

    private static final int WHY_OPENED = 0;
    private static final int WHY_TIMER = 1;
    private static final int WHY_ARRIVED = 2;

    /** What became of a wish to cue. */
    private static final int CUE_SHOWN = 0;
    /** Not possible right now (fullscreen, a panel is open, the app is not in front). Worth retrying. */
    private static final int CUE_BLOCKED = 1;
    /** Not wanted (cues are off or quiet, or one was shown too recently). */
    private static final int CUE_SKIPPED = 2;

    private static volatile OverlayController instance;

    private final Application app;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Map<Activity, NudgeLayer> layers = new HashMap<>();
    private WeakReference<Activity> resumed = new WeakReference<>(null);
    private int startedCount;
    private volatile boolean foreground;
    private boolean listening;

    private Dialog dialog;
    private Activity dialogOwner;

    /** Reminders that were on screen at the last look, to notice the ones that are new. */
    private final Set<String> knownIds = new HashSet<>();
    private final Set<String> askedCheckIns = new HashSet<>();
    private boolean idsKnown;
    private boolean wasObstructed;
    private boolean refreshPosted;

    private long lastCueAt;
    private long lastArrivalCueAt;
    private int cueRound;
    private boolean cueShowing;
    /** A reminder arrived while no cue could be shown. It gets its cue at the next chance. */
    private boolean pendingArrival;

    /** A short confirmation shown in the tab after an action, e.g. "Done. Nice." with undo. */
    private Task undoTask;
    private boolean confirming;
    /** The screen the confirmation is shown on. A tap is an undo there and nowhere else. */
    private Activity confirmOwner;

    private final Runnable refreshRunnable = () -> Ui.safely(this::refresh);
    private final Runnable retractRunnable = () -> Ui.safely(this::endCue);
    private final Runnable endConfirmRunnable = () -> Ui.safely(this::endConfirmation);
    private final Runnable timerRunnable = () -> Ui.safely(this::onTimer);
    private final Runnable backgroundRunnable = () -> Ui.safely(this::enterBackground);

    private OverlayController(Application app) {
        this.app = app;
    }

    // region entry points

    /** Called once at process start. Registers for screen changes and does nothing else. */
    public static void install(Application app) {
        if (instance != null) return;
        OverlayController c = new OverlayController(app);
        instance = c;
        app.registerActivityLifecycleCallbacks(c);
    }

    /** Something outside changed (notification access granted, for example). Safe from any thread. */
    public static void refreshAll() {
        OverlayController c = instance;
        if (c != null) c.postRefresh();
    }

    static OverlayController get() {
        return instance;
    }

    /** Whether a screen of the app is in front. Safe from any thread. */
    public static boolean isInForeground() {
        OverlayController c = instance;
        return c != null && c.foreground;
    }

    private void postRefresh() {
        if (refreshPosted) return;
        refreshPosted = true;
        handler.post(() -> {
            refreshPosted = false;
            Ui.safely(this::refresh);
        });
    }

    // endregion

    // region screens coming and going

    @Override
    public void onActivityStarted(Activity activity) {
        try {
            startedCount++;
            handler.removeCallbacks(backgroundRunnable);
        } catch (Throwable t) {
            Log.w("started failed", t);
        }
    }

    @Override
    public void onActivityResumed(final Activity activity) {
        try {
            resumed = new WeakReference<>(activity);
            if (!eligible(activity)) return;
            attach(activity);
            // After the current frame, so that opening the app is never held up by this.
            handler.post(() -> Ui.safely(() -> {
                if (!foreground) {
                    foreground = true;
                    Nudge.onForeground(app);
                }
                if (!listening) {
                    listening = true;
                    TaskStore.get(app).addListener(this);
                }
                refresh();
                closeSetupIfConnected();
                cueOnReturn();
                scheduleTimer();
            }));
        } catch (Throwable t) {
            Log.w("resumed failed", t);
        }
    }

    @Override
    public void onActivityPaused(Activity activity) {
        try {
            if (resumed.get() == activity) resumed = new WeakReference<>(null);
            handler.removeCallbacks(timerRunnable);
            handler.removeCallbacks(retractRunnable);
            cueShowing = false;
            // An acknowledgement belongs to the screen it was shown on and ends with it.
            if (confirming && confirmOwner == activity) endConfirmation();
            NudgeLayer layer = layers.get(activity);
            if (layer != null) layer.tab.reset();
        } catch (Throwable t) {
            Log.w("paused failed", t);
        }
    }

    @Override
    public void onActivityStopped(Activity activity) {
        try {
            startedCount = Math.max(0, startedCount - 1);
            if (startedCount == 0) {
                // A rotation stops one screen just before starting the next. Wait and see.
                handler.removeCallbacks(backgroundRunnable);
                handler.postDelayed(backgroundRunnable, BACKGROUND_GRACE);
            }
        } catch (Throwable t) {
            Log.w("stopped failed", t);
        }
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        try {
            if (dialogOwner == activity) closeDialog();
            NudgeLayer layer = layers.remove(activity);
            if (layer != null) {
                ViewParent parent = layer.getParent();
                if (parent instanceof ViewGroup) ((ViewGroup) parent).removeView(layer);
            }
        } catch (Throwable t) {
            Log.w("destroyed failed", t);
        }
    }

    @Override
    public void onActivityCreated(Activity activity, Bundle state) {
    }

    @Override
    public void onActivitySaveInstanceState(Activity activity, Bundle state) {
    }

    private void enterBackground() {
        if (startedCount > 0 || !foreground) return;
        foreground = false;
        Nudge.onBackground(app);
    }

    /** Dialog-style and already closing screens get no tab. */
    private static boolean eligible(Activity activity) {
        if (activity == null || activity.isFinishing()) return false;
        Window window = activity.getWindow();
        return window != null && !window.isFloating();
    }

    private NudgeLayer attach(Activity activity) {
        ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
        NudgeLayer layer = layers.get(activity);
        if (layer == null) {
            layer = new NudgeLayer(activity, this);
            layers.put(activity, layer);
        }
        ViewParent parent = layer.getParent();
        if (parent != decor) {
            if (parent instanceof ViewGroup) ((ViewGroup) parent).removeView(layer);
            decor.addView(layer);
        } else if (decor.indexOfChild(layer) != decor.getChildCount() - 1) {
            // The app added something after us. The tab has to stay on top to be reachable.
            layer.bringToFront();
        }
        return layer;
    }

    // endregion

    // region what the tab shows

    @Override
    public void onTasksChanged(int origin) {
        refresh();
    }

    @Override
    public void onSurroundingsChanged(Activity activity) {
        // Called in the middle of a layout pass, where changing views is not allowed.
        postRefresh();
    }

    private void refresh() {
        long now = System.currentTimeMillis();
        Prefs prefs = Prefs.get(app);
        TaskStore store = TaskStore.get(app);
        List<Task> current = store.current(now, prefs.fadeMillis());
        boolean setup = current.isEmpty() && Nudge.needsSetup(app, now);

        boolean arrived = false;
        Set<String> ids = new HashSet<>();
        for (Task t : current) {
            ids.add(t.id);
            if (idsKnown && !knownIds.contains(t.id)) arrived = true;
            if (t.needsCheckIn(now) && askedCheckIns.add(t.id)) arrived = true;
            if (!t.needsCheckIn(now)) askedCheckIns.remove(t.id);
        }
        knownIds.clear();
        knownIds.addAll(ids);
        idsKnown = true;

        Activity front = resumed.get();
        for (Map.Entry<Activity, NudgeLayer> entry : layers.entrySet()) {
            NudgeLayer layer = entry.getValue();
            boolean obstructed = layer.obstructed();
            boolean confirmingHere = confirming && entry.getKey() == confirmOwner;
            boolean show = (confirmingHere || !current.isEmpty() || setup) && !obstructed;
            TabView tab = layer.tab;
            if (!confirmingHere) {
                if (setup) {
                    tab.setMark(TabView.MARK_PLUS, 0);
                    tab.setContentDescription("Set up Duet reminders");
                } else if (!current.isEmpty()) {
                    Task top = current.get(0);
                    int mark = top.needsCheckIn(now) ? TabView.MARK_QUESTION
                            : top.isInProgress(now) ? TabView.MARK_RING : TabView.MARK_DOT;
                    tab.setMark(mark, current.size());
                    tab.setContentDescription(describe(current, now));
                }
            }
            int visibility = show ? View.VISIBLE : View.GONE;
            if (tab.getVisibility() != visibility) {
                tab.setVisibility(visibility);
                if (!show) tab.reset();
            }
            if (entry.getKey() == front) {
                if (wasObstructed && !obstructed) {
                    // Leaving fullscreen is a natural pause, and a good moment to be seen.
                    handler.post(() -> Ui.safely(this::cueOnReturn));
                }
                wasObstructed = obstructed;
            }
        }

        if (cueShowing && current.isEmpty() && !setup) endCue();
        // A reminder that arrives during fullscreen video, or while the app is not in
        // front, must not lose its moment: it is remembered and shown at the next chance.
        if (arrived && maybeCue(WHY_ARRIVED) == CUE_BLOCKED) pendingArrival = true;
        if (current.isEmpty()) pendingArrival = false;

        // Come back when the next snooze or "on it" timer runs out.
        handler.removeCallbacks(refreshRunnable);
        long next = store.nextWake(now);
        if (next != Long.MAX_VALUE && front != null) {
            handler.postDelayed(refreshRunnable, Math.max(1_000L, next - now + 500L));
        }
    }

    private static String describe(List<Task> current, long now) {
        Task top = current.get(0);
        String lead = current.size() == 1 ? "1 reminder. " : current.size() + " reminders. Latest: ";
        return lead + top.text + ", " + TimeText.ago(now - top.anchor());
    }

    // endregion

    // region asking for attention

    private void scheduleTimer() {
        handler.removeCallbacks(timerRunnable);
        int cues = Prefs.get(app).cues();
        if (cues == Prefs.CUES_OFF) return;
        handler.postDelayed(timerRunnable, cues == Prefs.CUES_REGULAR ? GAP_REGULAR : GAP_GENTLE);
    }

    private void onTimer() {
        if (resumed.get() == null) return;
        maybeCue(WHY_TIMER);
        scheduleTimer();
    }

    /** The app is in front again, or fullscreen ended: show what was missed, or the usual cue. */
    private void cueOnReturn() {
        if (pendingArrival) {
            int result = maybeCue(WHY_ARRIVED);
            if (result != CUE_BLOCKED) pendingArrival = false;
            if (result == CUE_SHOWN) return;
        }
        maybeCue(WHY_OPENED);
    }

    /** The settings changed how often to cue. */
    void settingsChanged() {
        if (resumed.get() != null) scheduleTimer();
        postRefresh();
    }

    private int maybeCue(int why) {
        Activity activity = resumed.get();
        if (activity == null || confirming || cueShowing || isDialogShowing()) return CUE_BLOCKED;
        NudgeLayer layer = layers.get(activity);
        if (layer == null || layer.tab.getVisibility() != View.VISIBLE) return CUE_BLOCKED;

        Prefs prefs = Prefs.get(app);
        long now = System.currentTimeMillis();
        int cues = prefs.cues();
        if (cues == Prefs.CUES_OFF || now < prefs.pausedUntil()) return CUE_SKIPPED;

        long tick = SystemClock.elapsedRealtime();
        if (why == WHY_ARRIVED) {
            if (lastArrivalCueAt != 0 && tick - lastArrivalCueAt < ARRIVAL_GAP) return CUE_SKIPPED;
        } else {
            long gap = cues == Prefs.CUES_REGULAR ? GAP_REGULAR : GAP_GENTLE;
            // The timer fires exactly one gap after it was set; allow for scheduling slack.
            if (lastCueAt != 0 && tick - lastCueAt < gap - 5_000L) return CUE_SKIPPED;
        }

        List<Task> current = TaskStore.get(app).current(now, prefs.fadeMillis());
        String line;
        String sub;
        if (current.isEmpty()) {
            if (!Nudge.needsSetup(app, now)) return CUE_SKIPPED;
            line = "Reminders from Duet can wait here";
            sub = "Tap to set up";
        } else {
            Task top = current.get(0);
            String age = TimeText.ago(now - top.anchor());
            if (top.needsCheckIn(now)) {
                line = "How did it go?";
                sub = top.text;
            } else if (top.isInProgress(now)) {
                line = top.text;
                sub = "On it · checking back " + TimeText.in(top.until - now);
            } else {
                line = top.text;
                sub = subLine(top, age, now, prefs);
            }
        }

        lastCueAt = tick;
        if (why == WHY_ARRIVED) lastArrivalCueAt = tick;
        cueShowing = true;
        TabView tab = layer.tab;
        tab.setLines(line, sub);
        tab.extend();
        tab.breathe();
        handler.removeCallbacks(retractRunnable);
        handler.postDelayed(retractRunnable, tab.isLineCut() ? CUE_HOLD_LONG : CUE_HOLD);
        return CUE_SHOWN;
    }

    /**
     * The second line changes from cue to cue. A reminder that looks identical every time
     * turns into wallpaper. The wording stays neutral: it states, it does not scold.
     */
    private String subLine(Task top, String age, long now, Prefs prefs) {
        boolean old = now - top.anchor() > TaskBook.DAY;
        if (old && now - prefs.lastStillRelevant() > 20 * TaskBook.HOUR) {
            prefs.setLastStillRelevant(now);
            return "Still want this one? · " + age;
        }
        switch (cueRound++ % 3) {
            case 1:
                return "Still on your list · " + age;
            case 2:
                return "When you're ready · " + age;
            default:
                return top.source.isEmpty() ? age : top.source + " · " + age;
        }
    }

    private void endCue() {
        handler.removeCallbacks(retractRunnable);
        if (!cueShowing) return;
        cueShowing = false;
        Activity activity = resumed.get();
        NudgeLayer layer = activity == null ? null : layers.get(activity);
        if (layer != null && !confirming) layer.tab.retract();
    }

    /** The user just dealt with the reminders, so there is no reason to cue for a while. */
    void noteInteraction() {
        lastCueAt = SystemClock.elapsedRealtime();
    }

    // endregion

    // region confirmation after an action

    /**
     * Shows a short acknowledgement in the tab.
     *
     * @param undo if not null, tapping the tab while the acknowledgement shows reopens this reminder
     */
    void confirm(Activity activity, String line, String sub, int mark, Task undo, long millis) {
        noteInteraction();
        endCue();
        NudgeLayer layer = activity == null ? null : layers.get(activity);
        if (layer == null || layer.obstructed()) return;
        confirming = true;
        confirmOwner = activity;
        undoTask = undo;
        TabView tab = layer.tab;
        tab.setMark(mark, 0);
        tab.setLines(line, sub);
        tab.setContentDescription(undo == null ? line : line + " Tap to undo.");
        tab.setVisibility(View.VISIBLE);
        tab.extend();
        tab.breathe();
        handler.removeCallbacks(endConfirmRunnable);
        handler.postDelayed(endConfirmRunnable, millis);
    }

    private void endConfirmation() {
        handler.removeCallbacks(endConfirmRunnable);
        if (!confirming) return;
        confirming = false;
        confirmOwner = null;
        undoTask = null;
        for (NudgeLayer layer : layers.values()) layer.tab.retract();
        refresh();
        if (pendingArrival && maybeCue(WHY_ARRIVED) != CUE_BLOCKED) pendingArrival = false;
    }

    void haptic(View view) {
        try {
            if (view != null && Prefs.get(app).haptics()) {
                view.performHapticFeedback(HapticFeedbackConstants.CONTEXT_CLICK);
            }
        } catch (Throwable t) {
            Log.w("haptic failed", t);
        }
    }

    // endregion

    // region taps and dialogs

    @Override
    public void onTabTapped(Activity activity) {
        if (confirming) {
            boolean here = activity == confirmOwner;
            Task undo = undoTask;
            endConfirmation();
            if (here) {
                if (undo != null) Nudge.reopen(app, undo);
                return;
            }
        }
        endCue();
        noteInteraction();
        long now = System.currentTimeMillis();
        boolean hasTasks = !TaskStore.get(app).current(now, Prefs.get(app).fadeMillis()).isEmpty();
        show(activity, new CardDialog(activity, this, hasTasks ? CardDialog.FOCUS : CardDialog.SETUP));
    }

    void openSettings(Activity activity) {
        show(activity, new SettingsDialog(activity, this));
    }

    void openSetup(Activity activity) {
        show(activity, new CardDialog(activity, this, CardDialog.SETUP));
    }

    private void show(Activity activity, Dialog next) {
        closeDialog();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        dialog = next;
        dialogOwner = activity;
        next.setOnDismissListener(d -> {
            if (dialog == d) {
                dialog = null;
                dialogOwner = null;
            }
        });
        next.show();
    }

    void closeDialog() {
        Dialog d = dialog;
        dialog = null;
        dialogOwner = null;
        try {
            if (d != null && d.isShowing()) d.dismiss();
        } catch (Throwable t) {
            // The window may already be gone with its screen.
            Log.w("dismiss failed", t);
        }
    }

    private boolean isDialogShowing() {
        return dialog != null && dialog.isShowing();
    }

    /** Coming back from the system settings with access granted: no need to keep the guide open. */
    private void closeSetupIfConnected() {
        if (!(dialog instanceof CardDialog) || !((CardDialog) dialog).isSetup()) return;
        if (!Nudge.hasNotificationAccess(app)) return;
        Activity owner = dialogOwner;
        closeDialog();
        confirm(owner, "Connected", "Reminders from Duet will wait here", TabView.MARK_CHECK, null, 4_000L);
    }

    // endregion
}
