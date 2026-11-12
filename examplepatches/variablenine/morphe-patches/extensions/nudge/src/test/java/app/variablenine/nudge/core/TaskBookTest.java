package app.variablenine.nudge.core;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

/** Plain JVM tests: the rules of the reminder list, with no Android involved. */
public class TaskBookTest {

    private static final String DUET = "com.anthropic.aibo";
    private static final long T0 = 1_800_000_000_000L;
    private static final long MIN = TaskBook.MINUTE;
    private static final long HOUR = TaskBook.HOUR;
    private static final long FADE = 36 * HOUR;

    private static Task only(TaskBook book, long now) {
        List<Task> current = book.current(now, FADE);
        assertEquals(1, current.size());
        return current.get(0);
    }

    // region ingest

    @Test
    public void aNewReminderIsOpenAndCurrent() {
        TaskBook book = new TaskBook();
        assertTrue(book.ingest(DUET, "human-task-manager", "Hang the laundry", T0));
        Task t = only(book, T0);
        assertEquals("Hang the laundry", t.text);
        assertEquals("human-task-manager", t.source);
        assertEquals(DUET, t.sourcePkg);
        assertEquals(Task.OPEN, t.state);
        assertEquals(1, t.count);
        assertEquals(T0, t.createdAt);
    }

    @Test
    public void emptyTextIsIgnored() {
        TaskBook book = new TaskBook();
        assertFalse(book.ingest(DUET, "x", "   \n\t ", T0));
        assertFalse(book.ingest(DUET, "x", null, T0));
        assertEquals(0, book.size());
    }

    @Test
    public void theSameNotificationReplayedChangesNothing() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Feed the cats", T0);
        assertFalse(book.ingest(DUET, "s", "Feed the cats", T0));
        assertFalse(book.ingest(DUET, "s", "Feed the cats", T0 - 5 * MIN));
        assertEquals(1, only(book, T0).count);
    }

    @Test
    public void wordingThatOnlyDiffersInCaseOrSpacingIsTheSameReminder() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Feed the cats", T0);
        book.ingest(DUET, "s", "  feed   the CATS ", T0 + MIN);
        Task t = only(book, T0 + MIN);
        assertEquals(2, t.count);
        // The wording first seen is the one that stays on screen.
        assertEquals("Feed the cats", t.text);
    }

    @Test
    public void theSameWordsFromAnotherAppAreAnotherReminder() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Feed the cats", T0);
        book.ingest("com.anthropic.claude", "s", "Feed the cats", T0);
        assertEquals(2, book.current(T0, FADE).size());
    }

    @Test
    public void askedAgainWhileUnfinishedCountsButKeepsItsAge() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Shower", T0);
        assertTrue(book.ingest(DUET, "s", "Shower", T0 + HOUR));
        Task t = only(book, T0 + HOUR);
        assertEquals(2, t.count);
        assertEquals(T0, t.createdAt);
        assertEquals(Task.OPEN, t.state);
    }

    @Test
    public void finishedStaysFinishedWhenTheOldNotificationIsSeenAgain() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Take out the bin", T0);
        Task t = only(book, T0);
        assertTrue(book.act(t.id, Task.DONE, 0, T0 + 10 * MIN));
        // Replay of the original, and a re-post right as it was closed.
        book.ingest(DUET, "s", "Take out the bin", T0);
        book.ingest(DUET, "s", "Take out the bin", T0 + 10 * MIN + 30_000);
        assertTrue(book.current(T0 + 11 * MIN, FADE).isEmpty());
        assertEquals(Task.DONE, book.get(t.id).state);
    }

    @Test
    public void askedAgainAfterItWasFinishedOpensAFreshRound() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Put on deodorant", T0);
        Task t = only(book, T0);
        book.ingest(DUET, "s", "Put on deodorant", T0 + MIN);
        book.act(t.id, Task.DONE, 0, T0 + 5 * MIN);
        long nextDay = T0 + TaskBook.DAY;
        assertTrue(book.ingest(DUET, "s", "Put on deodorant", nextDay));
        Task again = only(book, nextDay);
        assertEquals(t.id, again.id);
        assertEquals(Task.OPEN, again.state);
        assertEquals(1, again.count);
        assertEquals(nextDay, again.createdAt);
    }

    @Test
    public void veryLongTextIsCutNotDropped() {
        TaskBook book = new TaskBook();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 400; i++) sb.append("word ");
        book.ingest(DUET, "s", sb.toString(), T0);
        Task t = only(book, T0);
        assertTrue(t.text.length() <= TaskIds.MAX_TEXT);
        assertTrue(t.text.endsWith("…"));
    }

    // endregion

    // region user actions

    @Test
    public void snoozedHidesUntilItsTimeAndThenReturns() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Call the pharmacy", T0);
        Task t = only(book, T0);
        book.act(t.id, Task.SNOOZED, T0 + 30 * MIN, T0 + MIN);
        assertTrue(book.current(T0 + 10 * MIN, FADE).isEmpty());
        assertEquals(1, book.sleeping(T0 + 10 * MIN).size());
        assertEquals(T0 + 30 * MIN, book.nextWake(T0 + 10 * MIN));
        assertEquals(1, book.current(T0 + 30 * MIN, FADE).size());
        assertTrue(book.sleeping(T0 + 30 * MIN).isEmpty());
        assertEquals(Long.MAX_VALUE, book.nextWake(T0 + 31 * MIN));
    }

    @Test
    public void beingAskedAgainWakesASnoozedReminder() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Call the pharmacy", T0);
        Task t = only(book, T0);
        book.act(t.id, Task.SNOOZED, T0 + 12 * HOUR, T0 + MIN);
        book.ingest(DUET, "s", "Call the pharmacy", T0 + HOUR);
        Task woken = only(book, T0 + HOUR);
        assertEquals(Task.OPEN, woken.state);
        assertEquals(2, woken.count);
    }

    @Test
    public void onItWaitsQuietlyThenAsksFirst() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Older reminder", T0);
        book.ingest(DUET, "s", "Newer reminder", T0 + MIN);
        Task older = book.get(TaskIds.of(DUET, "Older reminder"));
        book.act(older.id, Task.DOING, T0 + 22 * MIN, T0 + 2 * MIN);

        List<Task> during = book.current(T0 + 5 * MIN, FADE);
        assertEquals(2, during.size());
        assertEquals("Newer reminder", during.get(0).text);
        assertTrue(during.get(1).isInProgress(T0 + 5 * MIN));

        List<Task> after = book.current(T0 + 23 * MIN, FADE);
        assertEquals("Older reminder", after.get(0).text);
        assertTrue(after.get(0).needsCheckIn(T0 + 23 * MIN));
    }

    @Test
    public void undoBringsAFinishedReminderBack() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Shave", T0);
        Task t = only(book, T0);
        book.act(t.id, Task.DONE, 0, T0 + MIN);
        assertEquals(1, book.recentlyClosed(T0 + MIN + 2000, 5000).size());
        assertTrue(book.act(t.id, Task.OPEN, 0, T0 + MIN + 2000));
        assertEquals(Task.OPEN, only(book, T0 + 2 * MIN).state);
    }

    @Test
    public void actingOnSomethingUnknownOrWithoutChangeDoesNothing() {
        TaskBook book = new TaskBook();
        assertFalse(book.act("nope", Task.DONE, 0, T0));
        book.ingest(DUET, "s", "Shave", T0);
        Task t = only(book, T0);
        assertFalse(book.act(t.id, Task.OPEN, 0, T0 + MIN));
        assertFalse(book.act(t.id, 99, 0, T0 + MIN));
    }

    @Test
    public void aClockSetBackStillProducesANewerStamp() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Shave", T0);
        Task t = only(book, T0);
        book.act(t.id, Task.DONE, 0, T0 - HOUR);
        assertTrue(book.get(t.id).updatedAt > T0);
    }

    // endregion

    // region fading

    @Test
    public void oldRemindersStopAskingButAreNotLost() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Old one", T0);
        book.ingest(DUET, "s", "Fresh one", T0 + 40 * HOUR);
        long now = T0 + 41 * HOUR;
        assertEquals("Fresh one", only(book, now).text);
        List<Task> faded = book.faded(now, FADE);
        assertEquals(1, faded.size());
        assertEquals("Old one", faded.get(0).text);
        // "Never" keeps everything current.
        assertEquals(2, book.current(now, 0).size());
        assertTrue(book.faded(now, 0).isEmpty());
    }

    @Test
    public void beingAskedAgainMakesAnOldReminderFreshAgain() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Old but asked again", T0);
        long later = T0 + 48 * HOUR;
        assertTrue("faded by now", book.current(later, FADE).isEmpty());
        book.ingest(DUET, "s", "Old but asked again", later);
        Task t = only(book, later + MIN);
        assertEquals(2, t.count);
        assertTrue(book.faded(later + MIN, FADE).isEmpty());
    }

    @Test
    public void anOldSnoozedReminderThatIsAskedAgainComesBackInsteadOfVanishing() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Snoozed for ages", T0);
        Task t = only(book, T0);
        book.act(t.id, Task.SNOOZED, T0 + 60 * HOUR, T0 + MIN);
        long later = T0 + 50 * HOUR;
        book.ingest(DUET, "s", "Snoozed for ages", later);
        assertEquals(Task.OPEN, only(book, later + MIN).state);
    }

    @Test
    public void undoingAnOldReminderPutsItBackInViewNotAmongTheOldOnes() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Old one", T0);
        Task t = only(book, T0);
        book.act(t.id, Task.SNOOZED, T0 + 40 * HOUR, T0 + MIN);
        long later = T0 + 41 * HOUR;
        assertEquals(1, book.current(later, FADE).size());
        // Two days on it has faded. It is finished from the list, and then undone.
        long muchLater = T0 + 90 * HOUR;
        assertTrue(book.current(muchLater, FADE).isEmpty());
        book.act(t.id, Task.DONE, 0, muchLater);
        book.act(t.id, Task.OPEN, 0, muchLater + 2000);
        assertEquals(1, book.current(muchLater + 3000, FADE).size());
    }

    @Test
    public void aReminderThatJustCameBackFromSnoozeIsFreshAgain() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Snoozed long", T0);
        Task t = only(book, T0);
        book.act(t.id, Task.SNOOZED, T0 + 48 * HOUR, T0 + MIN);
        assertEquals(1, book.current(T0 + 49 * HOUR, FADE).size());
    }

    // endregion

    // region merge

    @Test
    public void theLaterChangeWinsWhicheverSideHasIt() {
        TaskBook a = new TaskBook();
        TaskBook b = new TaskBook();
        a.ingest(DUET, "s", "Litter", T0);
        b.ingest(DUET, "s", "Litter", T0);
        String id = TaskIds.of(DUET, "Litter");
        a.act(id, Task.DONE, 0, T0 + 5 * MIN);

        assertTrue(b.merge(a.snapshot()));
        assertEquals(Task.DONE, b.get(id).state);
        assertFalse(a.merge(b.snapshot()));
        assertEquals(Task.DONE, a.get(id).state);
    }

    @Test
    public void aStaleCopyCannotBringBackWhatWasFinished() {
        TaskBook a = new TaskBook();
        a.ingest(DUET, "s", "Litter", T0);
        List<Task> stale = a.snapshot();
        String id = TaskIds.of(DUET, "Litter");
        a.act(id, Task.DONE, 0, T0 + 5 * MIN);
        assertFalse(a.merge(stale));
        assertEquals(Task.DONE, a.get(id).state);
    }

    @Test
    public void mergingBringsOverRemindersTheOtherSideNeverSaw() {
        TaskBook withAccess = new TaskBook();
        TaskBook without = new TaskBook();
        withAccess.ingest(DUET, "s", "Voice lesson at 4:30", T0);
        assertTrue(without.merge(withAccess.snapshot()));
        assertEquals("Voice lesson at 4:30", only(without, T0).text);
        // And the notification arriving later on that side is then a replay.
        assertFalse(without.ingest(DUET, "s", "Voice lesson at 4:30", T0));
    }

    @Test
    public void twoAppsEndUpIdenticalWhateverOrderThingsHappenIn() {
        String[] texts = {"Feed the cats", "Litter", "Shower", "Brush teeth", "Shave", "Laundry"};
        Random random = new Random(20261111L);
        for (int round = 0; round < 300; round++) {
            TaskBook a = new TaskBook();
            TaskBook b = new TaskBook();
            long clock = T0;
            for (int step = 0; step < 40; step++) {
                clock += 1 + random.nextInt((int) (20 * MIN));
                TaskBook actor = random.nextBoolean() ? a : b;
                TaskBook other = actor == a ? b : a;
                String text = texts[random.nextInt(texts.length)];
                String id = TaskIds.of(DUET, text);
                switch (random.nextInt(7)) {
                    case 0:
                    case 1:
                        // Both listeners get the notification, in either order, maybe with
                        // a sync squeezed in between.
                        actor.ingest(DUET, "s", text, clock);
                        if (random.nextInt(4) == 0) other.merge(actor.snapshot());
                        other.ingest(DUET, "s", text, clock);
                        break;
                    case 2:
                        // Only one of them hears about it (the other has no access).
                        actor.ingest(DUET, "s", text, clock);
                        break;
                    case 3:
                        actor.act(id, Task.DONE, 0, clock);
                        break;
                    case 4:
                        actor.act(id, Task.SNOOZED, clock + 30 * MIN, clock);
                        break;
                    case 5:
                        actor.act(id, random.nextBoolean() ? Task.DOING : Task.OPEN,
                                clock + 20 * MIN, clock);
                        break;
                    default:
                        // One exchange, as a sync does it: each side folds in the other.
                        List<Task> fromActor = actor.snapshot();
                        actor.merge(other.snapshot());
                        other.merge(fromActor);
                        break;
                }
            }
            List<Task> fromA = a.snapshot();
            a.merge(b.snapshot());
            b.merge(fromA);
            assertEquals("round " + round, sorted(a.snapshot()), sorted(b.snapshot()));
            // Merging again must be a no-op: the result is stable.
            assertFalse(a.merge(b.snapshot()));
            assertFalse(b.merge(a.snapshot()));
        }
    }

    private static List<Task> sorted(List<Task> tasks) {
        List<Task> out = new ArrayList<>(tasks);
        Collections.sort(out, Comparator.comparing((Task t) -> t.id));
        return out;
    }

    // endregion

    // region storage

    @Test
    public void whatIsWrittenIsWhatIsReadBack() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "human-task-manager", "Say \"hi\" to Hex & Rune 🐈", T0);
        book.ingest(Task.PKG_MANUAL, "", "Typed in by hand", T0 + MIN);
        book.act(TaskIds.of(Task.PKG_MANUAL, "Typed in by hand"), Task.SNOOZED, T0 + HOUR, T0 + 2 * MIN);
        TaskBook copy = new TaskBook();
        copy.load(book.toJson());
        assertEquals(sorted(book.snapshot()), sorted(copy.snapshot()));
    }

    @Test
    public void damagedStorageMeansAnEmptyListNotACrash() {
        TaskBook book = new TaskBook();
        book.load("{ this is not json");
        assertEquals(0, book.size());
        book.load("{\"tasks\":[{\"id\":\"\",\"text\":\"no id\"},7,null,{\"id\":\"x\",\"text\":\"ok\",\"st\":0}]}");
        assertEquals(1, book.size());
        book.load(null);
        assertEquals(0, book.size());
        assertTrue(TaskBook.parse("[]").isEmpty());
    }

    @Test
    public void anEntryWithAnImpossibleStateIsSkipped() {
        assertNull(Task.fromJson(null));
        TaskBook book = new TaskBook();
        book.load("{\"tasks\":[{\"id\":\"a\",\"text\":\"t\",\"st\":42}]}");
        assertEquals(0, book.size());
    }

    // endregion

    // region housekeeping

    @Test
    public void tombstonesAndForgottenRemindersAreEventuallyDropped() {
        TaskBook book = new TaskBook();
        book.ingest(DUET, "s", "Done long ago", T0);
        book.act(TaskIds.of(DUET, "Done long ago"), Task.DONE, 0, T0 + MIN);
        book.ingest(DUET, "s", "Never touched", T0);
        book.ingest(DUET, "s", "Recent", T0 + 29 * TaskBook.DAY);

        assertTrue(book.prune(T0 + 20 * TaskBook.DAY));
        assertNotNull(book.get(TaskIds.of(DUET, "Done long ago")));
        assertNull(book.get(TaskIds.of(DUET, "Never touched")));

        assertTrue(book.prune(T0 + 32 * TaskBook.DAY));
        assertNull(book.get(TaskIds.of(DUET, "Done long ago")));
        assertNotNull(book.get(TaskIds.of(DUET, "Recent")));
        assertFalse(book.prune(T0 + 32 * TaskBook.DAY));
    }

    @Test
    public void theListCannotGrowWithoutBound() {
        TaskBook book = new TaskBook();
        for (int i = 0; i < TaskBook.MAX_TASKS + 50; i++) {
            book.ingest(DUET, "s", "Reminder number " + i, T0 + i);
        }
        book.prune(T0 + HOUR);
        assertEquals(TaskBook.MAX_TASKS, book.size());
        // The newest survive.
        assertNotNull(book.get(TaskIds.of(DUET, "Reminder number " + (TaskBook.MAX_TASKS + 49))));
    }

    // endregion
}
