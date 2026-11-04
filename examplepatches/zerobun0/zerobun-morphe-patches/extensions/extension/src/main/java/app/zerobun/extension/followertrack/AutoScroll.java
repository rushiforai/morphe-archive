/*
 * Zerobun Morphe patches - GPLv3.
 *
 * Scrolls a follower/following list to its end by itself. New in v2.
 *
 * The user's question was whether they really have to scroll each list by hand:
 * "do i rlly hav to go to the follow and followes of a users toget the data? or u
 * can auto do it? as long as i choose the username". This is the answer - you open
 * the list and this walks it to the end.
 *
 * WHY IT IS WRITTEN THIS WAY
 * --------------------------
 * It finds the list by walking the activity's own view tree for the widest, tallest
 * scrollable view, and drives it through the public RecyclerView/AbsListView APIs by
 * reflection. It therefore depends on NOTHING Instagram owns: no fingerprints, no
 * obfuscated class names, no field offsets. That matters because every other hook in
 * this patch is pinned to an app build, and this one is not - it should survive
 * Instagram updates that break the rest.
 *
 * PACING IS A FEATURE, NOT A LIMITATION
 * -------------------------------------
 * The whole point of capturing from the official app is to look like ordinary use.
 * Flinging a list from top to bottom as fast as the UI allows does not, and this
 * account is already under a restriction earned by exactly that kind of excess
 * (CLAUDE.md 21C). So each step moves roughly one screen, waits a randomised
 * human-ish interval, and stops early when the list stops growing.
 *
 * It also STOPS rather than fighting: if the list stops yielding new rows, or the
 * screen changes, or the user touches anything, auto-scroll ends and manual scrolling
 * continues to work exactly as before. Degrading to manual is always acceptable;
 * hammering the app is not.
 */

package app.zerobun.extension.followertrack;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Random;

@SuppressWarnings("unused")
public final class AutoScroll {

    private static final String TAG = Uploader.TAG;
    private static final Handler UI = new Handler(Looper.getMainLooper());
    private static final Random RANDOM = new Random();

    /** Consecutive steps that may add no new row before the list is treated as ended. */
    private static final int STALL_LIMIT = 4;
    /** Hard ceiling, so a misbehaving list cannot scroll forever. */
    private static final int MAX_STEPS = 900;
    private static final int MIN_PAUSE_MS = 650;
    private static final int MAX_PAUSE_MS = 1500;

    private static WeakReference<View> listRef = new WeakReference<>(null);
    private static boolean running = false;
    private static int steps = 0;
    private static int stalled = 0;
    private static int lastCount = -1;

    private AutoScroll() {}

    public static boolean isRunning() {
        return running;
    }

    /** Begins auto-scrolling the list currently on screen. Safe to call twice. */
    public static void start(Activity activity) {
        if (running || activity == null) return;
        View list = findScrollable(activity.findViewById(android.R.id.content), 0);
        if (list == null) {
            Log.w(TAG, "auto-scroll: no scrollable list found; manual scrolling still works");
            return;
        }
        listRef = new WeakReference<>(list);
        running = true;
        steps = 0;
        stalled = 0;
        lastCount = -1;
        Log.i(TAG, "auto-scroll: starting on " + list.getClass().getName());
        UI.postDelayed(AutoScroll::step, pause());

        // Any touch means the person has taken over. Stop immediately rather than
        // wrestling them for control of the list.
        list.setOnTouchListener((v, e) -> {
            stop("you took over");
            v.setOnTouchListener(null);
            return false;
        });
    }

    public static void stop(String why) {
        if (!running) return;
        running = false;
        Log.i(TAG, "auto-scroll: stopped (" + why + ") after " + steps + " steps");
    }

    private static int pause() {
        return MIN_PAUSE_MS + RANDOM.nextInt(Math.max(1, MAX_PAUSE_MS - MIN_PAUSE_MS));
    }

    private static void step() {
        if (!running) return;
        View list = listRef.get();
        if (list == null || !list.isAttachedToWindow() || !list.isShown()) {
            stop("the list went away");
            return;
        }
        if (++steps > MAX_STEPS) {
            stop("step ceiling reached");
            return;
        }

        // Has the capture actually grown? Status is fed by the row hook, so this is
        // the real "are we still learning anything" signal rather than a scroll
        // position, which keeps moving even when the list has stopped loading.
        int captured = Status.getCaptured();
        if (captured == lastCount) {
            if (++stalled >= STALL_LIMIT) {
                // Reaching the end is the SUCCESS case: tell Status, which only
                // claims completeness if the count agrees with the profile's own.
                Status.markComplete();
                FollowerTrackHook.onListEnded();
                stop("reached the end of the list");
                return;
            }
        } else {
            stalled = 0;
            lastCount = captured;
        }

        // Re-read the total each step. Instagram often renders the count only after
        // the first page has loaded, so a capture that started with no denominator
        // can still acquire one - which is what lets it be verified at the end.
        if (Status.getExpected() <= 0) {
            int found = ListInspector.expectedCount(list, Status.getCategory());
            if (found > 0) Status.setExpected(found);
        }

        // Stop as soon as the profile's own count is satisfied, rather than scrolling
        // past it for no reason.
        int want = Status.getExpected();
        if (want > 0 && captured >= want) {
            Status.markComplete();
            FollowerTrackHook.onListEnded();
            stop("captured the whole list");
            return;
        }

        scrollOneScreen(list);
        UI.postDelayed(AutoScroll::step, pause());
    }

    /** One screen's worth, through whichever public API this list offers. */
    private static void scrollOneScreen(View list) {
        int distance = Math.max(200, (int) (list.getHeight() * 0.85f));
        try {
            // RecyclerView and NestedScrollView both have smoothScrollBy(int, int).
            Method smooth = findMethod(list.getClass(), "smoothScrollBy",
                    int.class, int.class);
            if (smooth != null) {
                smooth.invoke(list, 0, distance);
                return;
            }
            // AbsListView / ListView.
            Method byOffset = findMethod(list.getClass(), "smoothScrollByOffset", int.class);
            if (byOffset != null) {
                byOffset.invoke(list, 6);
                return;
            }
        } catch (Exception e) {
            Log.w(TAG, "auto-scroll: scroll call failed", e);
        }
        // Last resort, and still a public API.
        list.scrollBy(0, distance);
    }

    private static Method findMethod(Class<?> type, String name, Class<?>... args) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                Method m = c.getMethod(name, args);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) {
                // keep walking up
            }
        }
        return null;
    }

    /**
     * The biggest vertically-scrollable view on screen.
     *
     * Chosen by size rather than by class name so it keeps working when Instagram
     * swaps its list implementation, which it does. A follower dialog's list is
     * always the dominant scrollable area while it is open.
     */
    private static View findScrollable(View view, int depth) {
        if (view == null || depth > 25) return null;
        View best = null;
        int bestArea = 0;
        if (isScrollableList(view)) {
            best = view;
            bestArea = view.getWidth() * view.getHeight();
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findScrollable(group.getChildAt(i), depth + 1);
                if (found == null) continue;
                int area = found.getWidth() * found.getHeight();
                if (area > bestArea) {
                    best = found;
                    bestArea = area;
                }
            }
        }
        return best;
    }

    private static boolean isScrollableList(View view) {
        if (!view.isShown() || view.getHeight() < 200) return false;
        for (Class<?> c = view.getClass(); c != null; c = c.getSuperclass()) {
            String name = c.getName();
            if (name.equals("androidx.recyclerview.widget.RecyclerView")
                    || name.equals("android.widget.AbsListView")
                    || name.equals("android.widget.ListView")
                    || name.equals("androidx.core.widget.NestedScrollView")) {
                return true;
            }
        }
        return false;
    }
}
