package app.variablenine.nudge.core;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;

import java.util.Collection;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * The reminders of this app: a {@link TaskBook} kept in the app's private storage,
 * plus change notifications.
 *
 * <p>Everything runs in the app's main process (the notification listener and the
 * provider are declared without a process of their own), so plain SharedPreferences
 * is a safe home for the data.
 */
public final class TaskStore {

    /** Where a change came from. Decides whether it has to be passed on to other apps. */
    public static final int FROM_USER = 0;
    public static final int FROM_NOTIFICATION = 1;
    public static final int FROM_SIBLING = 2;
    public static final int FROM_HOUSEKEEPING = 3;

    public interface Listener {
        /** Always called on the main thread. */
        void onTasksChanged(int origin);
    }

    private static final String FILE = "app.variablenine.nudge.tasks";
    private static final String KEY_BOOK = "book";

    private static TaskStore instance;

    private final SharedPreferences prefs;
    private final TaskBook book = new TaskBook();
    private final CopyOnWriteArrayList<Listener> listeners = new CopyOnWriteArrayList<>();
    private final Handler main = new Handler(Looper.getMainLooper());

    public static synchronized TaskStore get(Context context) {
        if (instance == null) instance = new TaskStore(context.getApplicationContext());
        return instance;
    }

    private TaskStore(Context app) {
        prefs = app.getSharedPreferences(FILE, Context.MODE_PRIVATE);
        book.load(prefs.getString(KEY_BOOK, null));
        if (book.prune(System.currentTimeMillis())) save();
    }

    // region changes

    public boolean ingest(String sourcePkg, String source, String text, long eventTime, int origin) {
        return changed(book.ingest(sourcePkg, source, text, eventTime), origin);
    }

    public boolean act(String id, int newState, long until) {
        return changed(book.act(id, newState, until, System.currentTimeMillis()), FROM_USER);
    }

    public boolean merge(Collection<Task> remote) {
        return changed(book.merge(remote), FROM_SIBLING);
    }

    public void prune() {
        changed(book.prune(System.currentTimeMillis()), FROM_HOUSEKEEPING);
    }

    private boolean changed(boolean didChange, final int origin) {
        if (!didChange) return false;
        save();
        main.post(() -> {
            for (Listener l : listeners) {
                try {
                    l.onTasksChanged(origin);
                } catch (Throwable t) {
                    Log.w("listener failed", t);
                }
            }
        });
        return true;
    }

    /**
     * Synchronized so that reading the book and handing it to storage is one step. Two
     * threads saving at once could otherwise store the older of two snapshots last.
     */
    private synchronized void save() {
        prefs.edit().putString(KEY_BOOK, book.toJson()).apply();
    }

    // endregion

    // region queries

    public Task get(String id) {
        return book.get(id);
    }

    public List<Task> current(long now, long fadeMillis) {
        return book.current(now, fadeMillis);
    }

    public List<Task> faded(long now, long fadeMillis) {
        return book.faded(now, fadeMillis);
    }

    public List<Task> sleeping(long now) {
        return book.sleeping(now);
    }

    public List<Task> recentlyClosed(long now, long window) {
        return book.recentlyClosed(now, window);
    }

    public List<Task> snapshot() {
        return book.snapshot();
    }

    public long nextWake(long now) {
        return book.nextWake(now);
    }

    public String exportJson() {
        return book.toJson();
    }

    // endregion

    public void addListener(Listener l) {
        listeners.addIfAbsent(l);
    }

    public void removeListener(Listener l) {
        listeners.remove(l);
    }
}
