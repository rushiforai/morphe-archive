package app.variablenine.nudge;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Notification;
import android.content.Context;
import android.os.Bundle;
import android.os.Process;
import android.os.UserHandle;
import android.service.notification.StatusBarNotification;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.util.Collections;
import java.util.List;
import java.util.TreeSet;

import app.variablenine.nudge.core.Prefs;
import app.variablenine.nudge.core.Task;
import app.variablenine.nudge.core.TaskBook;
import app.variablenine.nudge.core.TaskIds;
import app.variablenine.nudge.core.TaskStore;

/** Notifications coming in, and reminders being exchanged between patched apps. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34)
public class ListenerAndSyncTest {

    private static final long FADE = 36 * TaskBook.HOUR;

    private Context context;
    private NudgeListenerService listener;

    @Before
    public void setUp() throws Exception {
        TestSupport.freshProcess();
        context = TestSupport.app();
        listener = Robolectric.setupService(NudgeListenerService.class);
    }

    private StatusBarNotification posted(String pkg, int id, String title, String text, long postTime) {
        Notification n = new Notification.Builder(context, "c")
                .setSmallIcon(android.R.drawable.ic_dialog_info)
                .setContentTitle(title).setContentText(text).setWhen(postTime).build();
        return new StatusBarNotification(pkg, pkg, id, null, 10123, 0, 0, n,
                UserHandle.getUserHandleForUid(Process.myUid()), postTime);
    }

    private List<Task> current() {
        TestSupport.idle();
        return TaskStore.get(context).current(System.currentTimeMillis(), FADE);
    }

    // region listening

    @Test
    public void aDuetNotificationBecomesAReminder() {
        long now = System.currentTimeMillis();
        listener.onNotificationPosted(posted("com.anthropic.aibo", 1, "human-task-manager",
                "Hang the wet load on the rack now.", now));
        List<Task> tasks = current();
        assertEquals(1, tasks.size());
        assertEquals("Hang the wet load on the rack now.", tasks.get(0).text);
        assertEquals("human-task-manager", tasks.get(0).source);
        assertTrue(Prefs.get(context).seenSenders().contains("human-task-manager"));
    }

    @Test
    public void theClaudeAppCountsTooButNothingElseIsEvenRead() {
        long now = System.currentTimeMillis();
        listener.onNotificationPosted(posted("com.anthropic.claude", 1, "Claude", "Your task is done.", now));
        listener.onNotificationPosted(posted("com.whatsapp", 2, "Mum", "Call me when you can", now));
        listener.onNotificationPosted(posted("com.bank.app", 3, "Bank", "Your code is 493021", now));
        listener.onNotificationPosted(posted("com.anthropicfake.app", 4, "Fake", "Not from Anthropic", now));
        List<Task> tasks = current();
        assertEquals(1, tasks.size());
        assertEquals("Your task is done.", tasks.get(0).text);
        // Not even the names of other senders are kept.
        assertEquals(Collections.singleton("Claude"), Prefs.get(context).seenSenders());
    }

    @Test
    public void aMutedSenderAndARemovedAppAreIgnored() {
        Prefs prefs = Prefs.get(context);
        long now = System.currentTimeMillis();
        prefs.setSenderMuted("Nyx live", true);
        listener.onNotificationPosted(posted("com.anthropic.aibo", 1, "Nyx live", "Nothing to report", now));
        assertTrue(current().isEmpty());

        prefs.setSources(new TreeSet<>(Collections.singleton("com.example.notes")));
        listener.onNotificationPosted(posted("com.anthropic.aibo", 2, "human-task-manager", "Shower", now));
        assertTrue(current().isEmpty());
        listener.onNotificationPosted(posted("com.example.notes", 3, "Notes", "Buy cat food", now));
        assertEquals(1, current().size());
    }

    @Test
    public void theSameNotificationPostedAgainDoesNotReopenWhatWasFinished() {
        long now = System.currentTimeMillis();
        listener.onNotificationPosted(posted("com.anthropic.aibo", 7, "t", "Feed the cats", now - 5_000));
        Task task = current().get(0);
        Nudge.done(context, task);
        // The app updates the same notification a moment later, and again minutes later.
        listener.onNotificationPosted(posted("com.anthropic.aibo", 7, "t", "Feed the cats", now + 1_000));
        listener.onNotificationPosted(posted("com.anthropic.aibo", 7, "t", "Feed the cats", now + 4 * 60_000));
        assertTrue(current().isEmpty());
        assertEquals(Task.DONE, TaskStore.get(context).get(task.id).state);
    }

    private StatusBarNotification grouped(int id, String text, boolean summary, long postTime) {
        Notification n = new Notification.Builder(context, "c")
                .setSmallIcon(android.R.drawable.ic_dialog_info)
                .setContentTitle("human-task-manager").setContentText(text).setWhen(postTime)
                .setGroup("duet").setGroupSummary(summary).build();
        return new StatusBarNotification("com.anthropic.aibo", "com.anthropic.aibo", id, null, 10123, 0, 0,
                n, UserHandle.getUserHandleForUid(Process.myUid()), postTime);
    }

    @Test
    public void aGroupHeaderWithMembersIsNotAReminderOfItsOwn() {
        long now = System.currentTimeMillis();
        StatusBarNotification header = grouped(1, "2 new messages", true, now);
        StatusBarNotification member = grouped(2, "Feed the cats", false, now);
        Shadows.shadowOf(listener).addActiveNotification(header);
        Shadows.shadowOf(listener).addActiveNotification(member);
        listener.onNotificationPosted(header);
        listener.onNotificationPosted(member);
        TestSupport.advance(3_000);
        List<Task> tasks = current();
        assertEquals(1, tasks.size());
        assertEquals("Feed the cats", tasks.get(0).text);
    }

    @Test
    public void aGroupHeaderThatStaysAloneIsTheMessage() {
        long now = System.currentTimeMillis();
        StatusBarNotification header = grouped(1, "Bring the bin back in", true, now);
        Shadows.shadowOf(listener).addActiveNotification(header);
        listener.onNotificationPosted(header);
        assertTrue("not before its members had a chance to arrive", current().isEmpty());
        TestSupport.advance(3_000);
        assertEquals("Bring the bin back in", current().get(0).text);
    }

    @Test
    public void aSampleAlwaysShowsUpEvenRightAfterOneWasFinished() {
        Nudge.addSample(context);
        Task sample = current().get(0);
        Nudge.done(context, sample);
        assertTrue(current().isEmpty());
        Nudge.addSample(context);
        assertEquals(1, current().size());
        Nudge.addManual(context, "Buy cat food");
        assertEquals(2, current().size());
    }

    @Test
    public void aBrokenNotificationNeverEscapesAsACrash() {
        listener.onNotificationPosted(null);
        Notification n = new Notification();
        n.extras = null;
        listener.onNotificationPosted(new StatusBarNotification("com.anthropic.aibo", "com.anthropic.aibo",
                1, null, 1, 0, 0, n, UserHandle.getUserHandleForUid(Process.myUid()), 5));
        assertTrue(current().isEmpty());
    }

    // endregion

    // region sync between patched apps

    private Bundle request(TaskBook theirs, boolean theirAccess) {
        Bundle b = new Bundle();
        b.putString(SiblingSync.KEY_BOOK, theirs.toJson());
        b.putBoolean(SiblingSync.KEY_HAS_ACCESS, theirAccess);
        b.putString(SiblingSync.KEY_FROM, "com.reddit.frontpage.duetnudge");
        return b;
    }

    @Test
    public void anExchangeHandsOverBothWays() {
        long now = System.currentTimeMillis();
        TaskStore store = TaskStore.get(context);
        store.ingest(TestSupport.DUET, "s", "Only here", now, TaskStore.FROM_NOTIFICATION);
        TaskBook theirs = new TaskBook();
        theirs.ingest(TestSupport.DUET, "s", "Only there", now);

        Bundle reply = SiblingSync.serve(context, request(theirs, false), Process.myUid());
        assertNotNull(reply);
        assertFalse(reply.getBoolean(SiblingSync.KEY_HAS_ACCESS));
        assertEquals(2, current().size());

        theirs.merge(TaskBook.parse(reply.getString(SiblingSync.KEY_BOOK)));
        assertEquals(2, theirs.current(now, FADE).size());
    }

    @Test
    public void finishedElsewhereIsFinishedHere() {
        long now = System.currentTimeMillis();
        TaskStore store = TaskStore.get(context);
        store.ingest(TestSupport.DUET, "s", "Litter", now - 60_000, TaskStore.FROM_NOTIFICATION);
        TaskBook theirs = new TaskBook();
        theirs.ingest(TestSupport.DUET, "s", "Litter", now - 60_000);
        theirs.act(TaskIds.of(TestSupport.DUET, "Litter"), Task.DONE, 0, now);

        SiblingSync.serve(context, request(theirs, true), Process.myUid());
        assertTrue(current().isEmpty());
    }

    @Test
    public void garbageFromTheOtherSideIsHarmless() {
        Bundle b = new Bundle();
        b.putString(SiblingSync.KEY_BOOK, "{\"tasks\":[{\"id\":7},\"x\"]} trailing");
        assertNotNull(SiblingSync.serve(context, b, Process.myUid()));
        assertNotNull(SiblingSync.serve(context, null, Process.myUid()));
        assertTrue(current().isEmpty());
    }

    @Test
    public void theProviderOnlyAnswersTheSyncCallAndOnlyStartsOnce() {
        NudgeProvider provider = Robolectric.setupContentProvider(NudgeProvider.class,
                "com.reddit.frontpage.duetnudge");
        assertEquals("com.reddit.frontpage.duetnudge", SiblingSync.ownAuthority());
        assertNull(provider.call("something-else", null, null));
        assertNotNull(provider.call(SiblingSync.METHOD_SYNC, null, new Bundle()));
        assertNull(provider.query(null, null, null, null, null));
        assertNull(provider.insert(null, null));
        assertEquals(0, provider.delete(null, null, null));
        assertEquals(0, provider.update(null, null, null, null));
        // A second start is a no-op rather than a second set of callbacks.
        Nudge.start(context);
    }

    @Test
    public void noSiblingsMeansNoOneToTalkTo() {
        SiblingSync.setOwnAuthority("com.reddit.frontpage.duetnudge");
        assertTrue(SiblingSync.siblings(context).isEmpty());
    }

    // endregion
}
