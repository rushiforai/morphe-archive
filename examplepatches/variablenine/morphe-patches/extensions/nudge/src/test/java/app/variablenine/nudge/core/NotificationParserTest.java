package app.variablenine.nudge.core;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Notification;
import android.app.Person;
import android.os.Bundle;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.List;

import app.variablenine.nudge.core.NotificationParser.Reminder;

/** Reading reminders out of real Android notification objects. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34)
public class NotificationParserTest {

    private static final long POSTED = 1_800_000_000_000L;

    private static Notification.Builder builder() {
        return new Notification.Builder(RuntimeEnvironment.getApplication(), "channel")
                .setSmallIcon(android.R.drawable.ic_dialog_info);
    }

    @Test
    public void aPlainNotificationIsOneReminderFromItsTitle() {
        Notification n = builder().setContentTitle("human-task-manager")
                .setContentText("Roll the garbage bin to the curb now, before bed.")
                .setWhen(POSTED - 2000).build();
        List<Reminder> out = NotificationParser.parse(n, POSTED);
        assertEquals(1, out.size());
        assertEquals("human-task-manager", out.get(0).sender);
        assertEquals("Roll the garbage bin to the curb now, before bed.", out.get(0).text);
        assertEquals(POSTED - 2000, out.get(0).time);
    }

    @Test
    public void theExpandedTextWinsOverTheShortenedOne() {
        String full = "It's just the short list now: 1. Feed the cats 2. Cat litter 3. Shower";
        Notification n = builder().setContentTitle("Duet").setContentText("It's just the short list…")
                .setStyle(new Notification.BigTextStyle().bigText(full)).build();
        assertEquals(full, NotificationParser.parse(n, POSTED).get(0).text);
    }

    @Test
    public void aChatStyleNotificationYieldsEachMessageWithItsOwnTime() {
        Person duet = new Person.Builder().setName("Duet").build();
        Person me = new Person.Builder().setName("Me").build();
        Notification n = builder().setStyle(new Notification.MessagingStyle(me)
                .setConversationTitle("human-task-manager")
                .addMessage("Hang the wet load on the rack now.", POSTED - 60_000, duet)
                .addMessage("ok doing it", POSTED - 30_000, (Person) null)
                .addMessage("Voice lesson at 4:30, time to get set up.", POSTED - 1_000, duet)).build();
        List<Reminder> out = NotificationParser.parse(n, POSTED);
        // The message without a sender is the user's own reply and is not a reminder.
        assertEquals(2, out.size());
        assertEquals("human-task-manager", out.get(0).sender);
        assertEquals("Hang the wet load on the rack now.", out.get(0).text);
        assertEquals(POSTED - 60_000, out.get(0).time);
        assertEquals("Voice lesson at 4:30, time to get set up.", out.get(1).text);
        assertEquals(POSTED - 1_000, out.get(1).time);
    }

    @Test
    public void withoutAConversationTitleTheSenderNameIsUsed() {
        Person duet = new Person.Builder().setName("Duet").build();
        Notification n = builder().setStyle(new Notification.MessagingStyle(
                new Person.Builder().setName("Me").build())
                .addMessage("Put on deodorant before you head out.", POSTED, duet)).build();
        assertEquals("Duet", NotificationParser.parse(n, POSTED).get(0).sender);
    }

    @Test
    public void whenNoMessageNamesASenderTheyAreAllTakenAsIncoming() {
        Notification n = builder().setStyle(new Notification.MessagingStyle(
                new Person.Builder().setName("Me").build())
                .setConversationTitle("human-task-manager")
                .addMessage("Roll the bin to the curb now.", POSTED, (Person) null)).build();
        List<Reminder> out = NotificationParser.parse(n, POSTED);
        assertEquals(1, out.size());
        assertEquals("Roll the bin to the curb now.", out.get(0).text);
        assertEquals("human-task-manager", out.get(0).sender);
    }

    @Test
    public void aTitleOnlyNotificationUsesTheTitleAsTheMessage() {
        Notification n = builder().setContentTitle("Time to head home").build();
        List<Reminder> out = NotificationParser.parse(n, POSTED);
        assertEquals(1, out.size());
        assertEquals("Time to head home", out.get(0).text);
        assertEquals("", out.get(0).sender);
    }

    @Test
    public void statusNotificationsAreNotReminders() {
        assertTrue(NotificationParser.parse(null, POSTED).isEmpty());
        assertTrue(NotificationParser.parse(builder().setContentTitle("Uploading").setContentText("3 of 9")
                .setProgress(9, 3, false).build(), POSTED).isEmpty());
        assertTrue(NotificationParser.parse(builder().setContentTitle("Now playing").setContentText("Song")
                .setStyle(new Notification.MediaStyle()).build(), POSTED).isEmpty());
        Notification service = builder().setContentTitle("Working").setContentText("on it").build();
        service.flags |= Notification.FLAG_FOREGROUND_SERVICE;
        assertTrue(NotificationParser.parse(service, POSTED).isEmpty());
        assertTrue(NotificationParser.parse(builder().setContentTitle("Call").setContentText("Ringing")
                .setCategory(Notification.CATEGORY_CALL).build(), POSTED).isEmpty());
        assertTrue(NotificationParser.parse(builder().build(), POSTED).isEmpty());
    }

    @Test
    public void aStickyReminderIsStillAReminder() {
        Notification n = builder().setContentTitle("Duet").setContentText("Take the bin out")
                .setOngoing(true).build();
        assertEquals(1, NotificationParser.parse(n, POSTED).size());
    }

    @Test
    public void aGroupHeaderIsRecognisedAndLeftToTheCallerToJudge() {
        Notification header = builder().setContentTitle("human-task-manager").setContentText("Shower")
                .setGroup("g").setGroupSummary(true).build();
        assertTrue(NotificationParser.isGroupSummary(header));
        assertEquals(1, NotificationParser.parse(header, POSTED).size());
        assertFalse(NotificationParser.isGroupSummary(builder().setContentTitle("x").build()));
        assertFalse(NotificationParser.isGroupSummary(null));
    }

    @Test
    public void aNotificationWithUnreadableExtrasIsSkippedQuietly() {
        Notification n = builder().setContentTitle("x").setContentText("y").build();
        n.extras = null;
        assertTrue(NotificationParser.parse(n, POSTED).isEmpty());
        Notification odd = builder().build();
        Bundle extras = new Bundle();
        extras.putInt(Notification.EXTRA_TITLE, 7);
        extras.putStringArray(Notification.EXTRA_MESSAGES, new String[]{"not a bundle"});
        odd.extras = extras;
        assertTrue(NotificationParser.parse(odd, POSTED).isEmpty());
    }

    @Test
    public void theNotificationsOwnTimeIsUsedOnlyWhenItIsBelievable() {
        assertEquals(POSTED - 5_000, NotificationParser.eventTime(POSTED - 5_000, POSTED));
        // A calendar-style time in the future, a missing time, and a stale time all fall back.
        assertEquals(POSTED, NotificationParser.eventTime(POSTED + TaskBook.HOUR, POSTED));
        assertEquals(POSTED, NotificationParser.eventTime(0, POSTED));
        assertEquals(POSTED, NotificationParser.eventTime(POSTED - 3 * TaskBook.DAY, POSTED));
    }
}
