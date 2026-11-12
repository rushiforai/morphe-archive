package app.variablenine.nudge.core;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * The set of reminders and every rule about how it changes. No Android classes in
 * here on purpose: this is the part that has to be right, so it is kept testable on a
 * plain JVM. {@link TaskStore} adds persistence and change notifications around it.
 *
 * <p>Three things change the book:
 * <ul>
 * <li>{@link #ingest} - a reminder was issued (a notification arrived, or the user typed one)</li>
 * <li>{@link #act} - the user did something with a reminder</li>
 * <li>{@link #merge} - another patched app handed over its copy of the book</li>
 * </ul>
 * All three are written so that two apps which see the same events in a different order
 * end up with the same book.
 */
public final class TaskBook {

    public static final long MINUTE = 60_000L;
    public static final long HOUR = 60 * MINUTE;
    public static final long DAY = 24 * HOUR;

    /** How long a finished reminder is remembered, so that a stale copy cannot revive it. */
    static final long TOMBSTONE_KEEP = 30 * DAY;
    /** An unfinished reminder nobody touched for this long is dropped for good. */
    static final long UNFINISHED_KEEP = 14 * DAY;
    /**
     * A reminder that shows up again this soon after it was closed is taken to be the one
     * that was just closed (apps like to re-post a notification when it is interacted
     * with), not a new request.
     */
    static final long REOPEN_GUARD = 90_000L;
    /** Hard cap, so a misbehaving source can never grow the stored data without bound. */
    static final int MAX_TASKS = 300;

    private final Map<String, Task> tasks = new HashMap<>();

    // region changes

    /**
     * Records that a reminder was issued at {@code eventTime}.
     *
     * @return true if the book changed
     */
    public synchronized boolean ingest(String sourcePkg, String source, String rawText, long eventTime) {
        String text = TaskIds.clean(rawText);
        if (text.isEmpty()) return false;
        String pkg = sourcePkg == null ? "" : sourcePkg;
        String label = source == null ? "" : TaskIds.clean(source);
        String id = TaskIds.of(pkg, text);

        Task old = tasks.get(id);
        if (old == null) {
            tasks.put(id, new Task(id, text, label, pkg, eventTime, eventTime, eventTime,
                    Task.OPEN, 0, 1));
            return true;
        }
        if (eventTime <= old.seenAt) {
            // Already accounted for: the system replays notifications whenever the
            // listener reconnects.
            return false;
        }
        if (old.isClosed()) {
            if (eventTime <= old.updatedAt + REOPEN_GUARD) {
                // Issued before (or right as) it was closed, so it is the reminder that
                // was closed. Only remember that it has been seen.
                tasks.put(id, new Task(id, old.text, old.source, pkg, old.createdAt,
                        old.updatedAt, eventTime, old.state, old.until, old.count));
                return true;
            }
            // Asked again after it was finished: a fresh round of the same reminder.
            tasks.put(id, new Task(id, text, label.isEmpty() ? old.source : label, pkg,
                    eventTime, eventTime, eventTime, Task.OPEN, 0, 1));
            return true;
        }
        // Still unfinished and asked again.
        boolean wakes = old.state == Task.SNOOZED && eventTime > old.updatedAt;
        tasks.put(id, new Task(id, old.text, label.isEmpty() ? old.source : label, pkg,
                old.createdAt,
                wakes ? eventTime : old.updatedAt,
                eventTime,
                wakes ? Task.OPEN : old.state,
                wakes ? 0 : old.until,
                old.count + 1));
        return true;
    }

    /**
     * Applies something the user did.
     *
     * @param until for {@link Task#SNOOZED} when it returns, for {@link Task#DOING} when to
     *              check in, otherwise ignored
     * @return true if the book changed
     */
    public synchronized boolean act(String id, int newState, long until, long now) {
        Task old = tasks.get(id);
        if (old == null) return false;
        if (newState < Task.OPEN || newState > Task.SKIPPED) return false;
        long cleanUntil = (newState == Task.SNOOZED || newState == Task.DOING) ? until : 0;
        if (old.state == newState && old.until == cleanUntil) return false;
        // Strictly newer than anything recorded so far, even if the clock was set back.
        long stamp = Math.max(now, old.updatedAt + 1);
        tasks.put(id, old.with(newState, cleanUntil, stamp));
        return true;
    }

    /**
     * Folds in another copy of the book.
     *
     * @return true if the book changed
     */
    public synchronized boolean merge(Collection<Task> remote) {
        if (remote == null) return false;
        boolean changed = false;
        for (Task theirs : remote) {
            if (theirs == null) continue;
            Task ours = tasks.get(theirs.id);
            Task merged = ours == null ? theirs : combine(ours, theirs);
            if (!merged.equals(ours)) {
                tasks.put(merged.id, merged);
                changed = true;
            }
        }
        return changed;
    }

    /**
     * Drops what is no longer worth keeping.
     *
     * @return true if the book changed
     */
    public synchronized boolean prune(long now) {
        boolean changed = false;
        List<Task> all = new ArrayList<>(tasks.values());
        for (Task t : all) {
            long lastTouched = Math.max(t.updatedAt, t.anchor());
            long keep = t.isClosed() ? TOMBSTONE_KEEP : UNFINISHED_KEEP;
            if (now - lastTouched > keep) {
                tasks.remove(t.id);
                changed = true;
            }
        }
        if (tasks.size() > MAX_TASKS) {
            all = new ArrayList<>(tasks.values());
            // Oldest first, finished before unfinished.
            Collections.sort(all, (a, b) -> {
                if (a.isClosed() != b.isClosed()) return a.isClosed() ? -1 : 1;
                return Long.compare(a.updatedAt, b.updatedAt);
            });
            for (int i = 0; i < all.size() && tasks.size() > MAX_TASKS; i++) {
                tasks.remove(all.get(i).id);
                changed = true;
            }
        }
        return changed;
    }

    /** Winner by last-writer-wins, with a total order on ties so both sides agree. */
    static Task combine(Task a, Task b) {
        Task w = compare(a, b) >= 0 ? a : b;
        Task o = w == a ? b : a;
        return new Task(w.id, w.text, w.source.isEmpty() ? o.source : w.source,
                w.sourcePkg.isEmpty() ? o.sourcePkg : w.sourcePkg,
                w.createdAt, w.updatedAt, Math.max(a.seenAt, b.seenAt),
                w.state, w.until, Math.max(a.count, b.count));
    }

    private static int compare(Task a, Task b) {
        int c = Long.compare(a.updatedAt, b.updatedAt);
        if (c != 0) return c;
        c = Integer.compare(a.state, b.state);
        if (c != 0) return c;
        c = Long.compare(a.until, b.until);
        if (c != 0) return c;
        c = Long.compare(a.createdAt, b.createdAt);
        if (c != 0) return c;
        c = a.text.compareTo(b.text);
        if (c != 0) return c;
        return a.source.compareTo(b.source);
    }

    // endregion

    // region queries

    public synchronized Task get(String id) {
        return tasks.get(id);
    }

    /** Everything, tombstones included. */
    public synchronized List<Task> snapshot() {
        return new ArrayList<>(tasks.values());
    }

    /**
     * What should be on screen right now: unfinished, not snoozed, and recent enough.
     * First come reminders whose "on it" timer ran out (they want an answer), then the
     * waiting ones newest first, and last the ones the user is busy with.
     *
     * @param fadeMillis reminders older than this move to {@link #faded}; 0 or less means never
     */
    public synchronized List<Task> current(long now, long fadeMillis) {
        List<Task> out = new ArrayList<>();
        for (Task t : tasks.values()) {
            if (t.isClosed() || t.isSleeping(now) || isFaded(t, now, fadeMillis)) continue;
            out.add(t);
        }
        Collections.sort(out, order(now));
        return out;
    }

    /** Unfinished reminders that have been around so long they no longer ask for attention. */
    public synchronized List<Task> faded(long now, long fadeMillis) {
        List<Task> out = new ArrayList<>();
        for (Task t : tasks.values()) {
            if (t.isClosed() || t.isSleeping(now) || !isFaded(t, now, fadeMillis)) continue;
            out.add(t);
        }
        Collections.sort(out, (a, b) -> Long.compare(b.anchor(), a.anchor()));
        return out;
    }

    /** Snoozed reminders that are not due back yet, soonest first. */
    public synchronized List<Task> sleeping(long now) {
        List<Task> out = new ArrayList<>();
        for (Task t : tasks.values()) {
            if (t.isSleeping(now)) out.add(t);
        }
        Collections.sort(out, (a, b) -> Long.compare(a.until, b.until));
        return out;
    }

    /** Reminders closed within {@code window}, most recently closed first. For undo. */
    public synchronized List<Task> recentlyClosed(long now, long window) {
        List<Task> out = new ArrayList<>();
        for (Task t : tasks.values()) {
            if (t.isClosed() && now - t.updatedAt <= window) out.add(t);
        }
        Collections.sort(out, (a, b) -> Long.compare(b.updatedAt, a.updatedAt));
        return out;
    }

    /**
     * The next moment at which {@link #current} could change without any new event:
     * a snooze or an "on it" timer running out. {@link Long#MAX_VALUE} if there is none.
     */
    public synchronized long nextWake(long now) {
        long next = Long.MAX_VALUE;
        for (Task t : tasks.values()) {
            if ((t.state == Task.SNOOZED || t.state == Task.DOING) && t.until > now) {
                next = Math.min(next, t.until);
            }
        }
        return next;
    }

    public synchronized int size() {
        return tasks.size();
    }

    private static boolean isFaded(Task t, long now, long fadeMillis) {
        return fadeMillis > 0 && now - t.anchor() > fadeMillis;
    }

    private static Comparator<Task> order(long now) {
        return (a, b) -> {
            int ra = rank(a, now), rb = rank(b, now);
            if (ra != rb) return Integer.compare(ra, rb);
            int c = Long.compare(b.anchor(), a.anchor());
            return c != 0 ? c : a.id.compareTo(b.id);
        };
    }

    private static int rank(Task t, long now) {
        if (t.needsCheckIn(now)) return 0;
        if (t.isInProgress(now)) return 2;
        return 1;
    }

    // endregion

    // region persistence format

    public synchronized String toJson() {
        try {
            JSONArray arr = new JSONArray();
            for (Task t : tasks.values()) arr.put(t.toJson());
            JSONObject root = new JSONObject();
            root.put("v", 1);
            root.put("tasks", arr);
            return root.toString();
        } catch (JSONException e) {
            // Only thrown for NaN or infinite numbers, which a task cannot contain.
            throw new IllegalStateException(e);
        }
    }

    /** Parses a book. Unreadable input yields an empty list instead of an exception. */
    public static List<Task> parse(String json) {
        List<Task> out = new ArrayList<>();
        if (json == null || json.isEmpty()) return out;
        try {
            JSONArray arr = new JSONObject(json).optJSONArray("tasks");
            if (arr == null) return out;
            // A book is never bigger than MAX_TASKS; anything larger is not one of ours.
            int n = Math.min(arr.length(), MAX_TASKS * 2);
            for (int i = 0; i < n; i++) {
                Task t = Task.fromJson(arr.optJSONObject(i));
                if (t != null && t.text.length() <= TaskIds.MAX_TEXT) out.add(t);
            }
        } catch (JSONException e) {
            out.clear();
        }
        return out;
    }

    /** Replaces the content with a previously stored book. */
    public synchronized void load(String json) {
        tasks.clear();
        for (Task t : parse(json)) tasks.put(t.id, t);
    }

    // endregion
}
