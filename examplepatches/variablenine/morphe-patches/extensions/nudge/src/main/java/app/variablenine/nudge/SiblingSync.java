package app.variablenine.nudge;

import android.content.ContentProviderClient;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.os.Bundle;
import android.os.SystemClock;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

import app.variablenine.nudge.core.Log;
import app.variablenine.nudge.core.Prefs;
import app.variablenine.nudge.core.TaskBook;
import app.variablenine.nudge.core.TaskStore;

/**
 * Keeps the reminders of the patched apps on one phone in step, so that a reminder
 * finished in one app is finished in the others, and so that notification access only
 * has to be granted to one of them.
 *
 * <p>The apps talk through their {@link NudgeProvider}. Reminder text only ever goes
 * to an app that is signed with the same key as this one, which is the case for apps
 * patched on the same phone, and is checked on both ends of every exchange.
 */
final class SiblingSync {

    /**
     * Every authority a patched app can have: the package name of the app, as it is
     * after patching, plus {@link #AUTHORITY_SUFFIX}. Must match what the patches write
     * into the manifests (ReminderSpot.kt), including the {@code <queries>} entries
     * that make these visible to each other.
     */
    static final String AUTHORITY_SUFFIX = ".duetnudge";
    static final String[] AUTHORITIES = {
            "app.morphe.android.youtube" + AUTHORITY_SUFFIX,
            "com.google.android.youtube" + AUTHORITY_SUFFIX,
            "com.reddit.frontpage" + AUTHORITY_SUFFIX,
            "com.reddit.frontpage.morphe" + AUTHORITY_SUFFIX,
    };

    static final String METHOD_SYNC = "sync";
    static final String KEY_BOOK = "book";
    static final String KEY_HAS_ACCESS = "has_access";
    static final String KEY_FROM = "from";

    /**
     * Normally an occasional catch-up is enough: changes are pushed as they happen. Every
     * exchange can start the other app in the background, so it is not done lightly.
     */
    private static final long CATCH_UP_EVERY = 30 * TaskBook.MINUTE;
    /** When this app has no access of its own and lives off a sibling, ask more often. */
    private static final long CATCH_UP_EVERY_WHEN_FED = TaskBook.MINUTE;

    private static final ExecutorService worker = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "DuetNudgeSync");
        t.setDaemon(true);
        return t;
    });
    private static final AtomicBoolean pendingAll = new AtomicBoolean();
    private static final AtomicBoolean pendingFeed = new AtomicBoolean();

    private static volatile String ownAuthority;
    private static volatile long lastCatchUp;

    private SiblingSync() {
    }

    static void setOwnAuthority(String authority) {
        ownAuthority = authority;
    }

    static String ownAuthority() {
        return ownAuthority;
    }

    // region answering a sibling

    /**
     * Handles a sync request. The caller has already been verified by {@link NudgeProvider}.
     *
     * @param callerUid uid of the app that is asking
     */
    static Bundle serve(Context context, Bundle extras, int callerUid) {
        TaskStore store = TaskStore.get(context);
        boolean ownAccess = Nudge.hasNotificationAccess(context);
        if (extras != null) {
            store.merge(TaskBook.parse(extras.getString(KEY_BOOK)));
            String from = extras.getString(KEY_FROM);
            if (isSiblingAuthority(from) && ownsAuthority(context, from, callerUid)) {
                boolean theirAccess = extras.getBoolean(KEY_HAS_ACCESS, false);
                Prefs prefs = Prefs.get(context);
                prefs.setFeedTarget(from, !theirAccess);
                if (theirAccess) prefs.setFedBySibling(true);
            }
        }
        Bundle reply = new Bundle();
        reply.putString(KEY_BOOK, store.exportJson());
        reply.putBoolean(KEY_HAS_ACCESS, ownAccess);
        return reply;
    }

    // endregion

    // region asking the siblings

    /** The user changed something: tell every sibling. */
    static void pushToAll(Context context) {
        if (pendingAll.compareAndSet(false, true)) run(context, false);
    }

    /** A notification was captured: tell the siblings that cannot capture it themselves. */
    static void pushToFeedTargets(Context context) {
        if (Prefs.get(context).feedTargets().isEmpty()) return;
        if (pendingFeed.compareAndSet(false, true)) run(context, true);
    }

    /** The app came to the front: catch up if it has been a while. */
    static void onForeground(Context context) {
        boolean fed = !Nudge.hasNotificationAccess(context) && Prefs.get(context).fedBySibling();
        long every = fed ? CATCH_UP_EVERY_WHEN_FED : CATCH_UP_EVERY;
        long now = SystemClock.elapsedRealtime();
        if (lastCatchUp != 0 && now - lastCatchUp < every) return;
        lastCatchUp = now;
        pushToAll(context);
    }

    private static void run(Context context, final boolean feedTargetsOnly) {
        final Context app = context.getApplicationContext();
        worker.execute(() -> {
            try {
                // Let a burst of changes settle into one exchange.
                Thread.sleep(350);
            } catch (InterruptedException ignored) {
                Thread.currentThread().interrupt();
            }
            (feedTargetsOnly ? pendingFeed : pendingAll).set(false);
            try {
                exchange(app, feedTargetsOnly);
            } catch (Throwable t) {
                Log.w("sync failed", t);
            }
        });
    }

    private static void exchange(Context app, boolean feedTargetsOnly) {
        Prefs prefs = Prefs.get(app);
        Set<String> feedTargets = prefs.feedTargets();
        boolean anySiblingHasAccess = false;
        boolean reachedAny = false;
        for (String authority : siblings(app)) {
            if (feedTargetsOnly && !feedTargets.contains(authority)) continue;
            Boolean theirAccess = exchangeWith(app, authority);
            if (theirAccess == null) continue;
            reachedAny = true;
            anySiblingHasAccess |= theirAccess;
            prefs.setFeedTarget(authority, !theirAccess);
        }
        // Only a full round that actually reached someone says anything. A sibling that
        // could not be reached this once (it is being updated, say) has not lost its access.
        if (!feedTargetsOnly && (reachedAny || siblings(app).isEmpty())) {
            prefs.setFedBySibling(reachedAny && anySiblingHasAccess);
        }
    }

    /** @return whether the sibling has notification access, or null if it could not be reached */
    private static Boolean exchangeWith(Context app, String authority) {
        try {
            TaskStore store = TaskStore.get(app);
            Bundle request = new Bundle();
            request.putString(KEY_BOOK, store.exportJson());
            request.putBoolean(KEY_HAS_ACCESS, Nudge.hasNotificationAccess(app));
            request.putString(KEY_FROM, ownAuthority);
            // An "unstable" connection on purpose. With the ordinary kind, Android kills
            // this app if the other one dies in the middle of the exchange.
            Bundle reply;
            ContentProviderClient client =
                    app.getContentResolver().acquireUnstableContentProviderClient(authority);
            if (client == null) return null;
            try {
                reply = client.call(METHOD_SYNC, null, request);
            } finally {
                client.close();
            }
            if (reply == null) return null;
            store.merge(TaskBook.parse(reply.getString(KEY_BOOK)));
            return reply.getBoolean(KEY_HAS_ACCESS, false);
        } catch (Throwable t) {
            // Not installed any more, stopped by the system, or too much data: try again later.
            Log.w("sync with " + authority + " failed", t);
            return null;
        }
    }

    /** Authorities of other installed patched apps that are signed like this one. */
    static List<String> siblings(Context context) {
        List<String> out = new ArrayList<>();
        PackageManager pm = context.getPackageManager();
        String self = context.getPackageName();
        for (String authority : AUTHORITIES) {
            if (authority.equals(ownAuthority)) continue;
            try {
                ProviderInfo info = pm.resolveContentProvider(authority, 0);
                if (info == null || info.packageName == null || info.packageName.equals(self)) continue;
                if (pm.checkSignatures(self, info.packageName) != PackageManager.SIGNATURE_MATCH) continue;
                out.add(authority);
            } catch (Throwable t) {
                Log.w("resolving " + authority + " failed", t);
            }
        }
        return out;
    }

    // endregion

    private static boolean isSiblingAuthority(String authority) {
        if (authority == null || authority.equals(ownAuthority)) return false;
        for (String a : AUTHORITIES) {
            if (a.equals(authority)) return true;
        }
        return false;
    }

    private static boolean ownsAuthority(Context context, String authority, int uid) {
        try {
            ProviderInfo info = context.getPackageManager().resolveContentProvider(authority, 0);
            return info != null && info.applicationInfo != null && info.applicationInfo.uid == uid;
        } catch (Throwable t) {
            return false;
        }
    }
}
