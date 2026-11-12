package app.variablenine.nudge.core;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * One reminder. Immutable: every change produces a new instance, which keeps the
 * merge logic in {@link TaskBook} easy to reason about.
 *
 * <p>A task is identified by where it came from and what it says ({@link TaskIds}),
 * not by when it arrived. The same reminder issued again is the same task, so marking
 * it done in one patched app can be matched up with the copy in another.
 */
public final class Task {

    /** Waiting to be done. */
    public static final int OPEN = 0;
    /** The user said "on it". {@link #until} is when to ask how it went. */
    public static final int DOING = 1;
    /** Put off by the user. {@link #until} is when it comes back. */
    public static final int SNOOZED = 2;
    /** Finished. Kept for a while as a tombstone so a stale copy cannot bring it back. */
    public static final int DONE = 3;
    /** Dropped without doing it. Also a tombstone. */
    public static final int SKIPPED = 4;

    /** {@link #sourcePkg} of a reminder the user typed in themselves. */
    public static final String PKG_MANUAL = "manual";
    /** {@link #sourcePkg} of the built-in sample reminder. */
    public static final String PKG_SAMPLE = "sample";

    public final String id;
    public final String text;
    /** Label of the sender as the notification showed it (may be empty). */
    public final String source;
    /** Package name of the app that posted the notification, or one of the PKG_ constants. */
    public final String sourcePkg;
    /** When the reminder that opened this task was issued. */
    public final long createdAt;
    /** Last change, used as a last-writer-wins clock when two copies are merged. */
    public final long updatedAt;
    /** Time of the newest occurrence of this reminder that has been seen. */
    public final long seenAt;
    public final int state;
    /** Meaning depends on {@link #state}; 0 when unused. */
    public final long until;
    /** How many times this reminder was issued while it was still unfinished. At least 1. */
    public final int count;

    public Task(String id, String text, String source, String sourcePkg, long createdAt,
                long updatedAt, long seenAt, int state, long until, int count) {
        this.id = id;
        this.text = text;
        this.source = source == null ? "" : source;
        this.sourcePkg = sourcePkg == null ? "" : sourcePkg;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.seenAt = seenAt;
        this.state = state;
        this.until = until;
        this.count = Math.max(1, count);
    }

    public boolean isClosed() {
        return state == DONE || state == SKIPPED;
    }

    /** Snoozed and not yet due back. */
    public boolean isSleeping(long now) {
        return state == SNOOZED && until > now;
    }

    /** The user said "on it" and the check-in time has passed. */
    public boolean needsCheckIn(long now) {
        return state == DOING && until <= now;
    }

    /** The user said "on it" and is presumably still at it. */
    public boolean isInProgress(long now) {
        return state == DOING && until > now;
    }

    /**
     * The moment this task last became relevant: when it was issued or issued again, when
     * a snooze or an "on it" timer ran out, or when the user brought it back, whichever
     * is latest. Ageing is measured from here, so a reminder that is asked again or
     * undone is fresh again and does not slip away among the old ones.
     */
    public long anchor() {
        long latest = Math.max(Math.max(createdAt, until), seenAt);
        return state == OPEN ? Math.max(latest, updatedAt) : latest;
    }

    Task with(int newState, long newUntil, long newUpdatedAt) {
        return new Task(id, text, source, sourcePkg, createdAt, newUpdatedAt, seenAt,
                newState, newUntil, count);
    }

    JSONObject toJson() throws JSONException {
        JSONObject o = new JSONObject();
        o.put("id", id);
        o.put("text", text);
        o.put("src", source);
        o.put("pkg", sourcePkg);
        o.put("c", createdAt);
        o.put("u", updatedAt);
        o.put("seen", seenAt);
        o.put("st", state);
        o.put("un", until);
        o.put("n", count);
        return o;
    }

    /** Returns null when the entry is unusable, so one bad record never loses the rest. */
    static Task fromJson(JSONObject o) {
        if (o == null) return null;
        String id = o.optString("id", "");
        String text = o.optString("text", "");
        int state = o.optInt("st", OPEN);
        if (id.isEmpty() || text.isEmpty() || state < OPEN || state > SKIPPED) return null;
        long created = o.optLong("c", 0);
        long updated = o.optLong("u", created);
        return new Task(id, text, o.optString("src", ""), o.optString("pkg", ""), created,
                updated, o.optLong("seen", created), state, o.optLong("un", 0), o.optInt("n", 1));
    }

    @Override
    public boolean equals(Object other) {
        if (this == other) return true;
        if (!(other instanceof Task)) return false;
        Task t = (Task) other;
        return id.equals(t.id) && text.equals(t.text) && source.equals(t.source)
                && sourcePkg.equals(t.sourcePkg) && createdAt == t.createdAt
                && updatedAt == t.updatedAt && seenAt == t.seenAt && state == t.state
                && until == t.until && count == t.count;
    }

    @Override
    public int hashCode() {
        return id.hashCode() * 31 + (int) (updatedAt ^ (updatedAt >>> 32)) + state;
    }

    @Override
    public String toString() {
        return "Task{" + id + " st=" + state + " u=" + updatedAt + " '" + text + "'}";
    }
}
