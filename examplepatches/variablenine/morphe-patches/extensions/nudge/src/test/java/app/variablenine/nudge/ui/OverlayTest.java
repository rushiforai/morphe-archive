package app.variablenine.nudge.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.os.SystemClock;
import android.provider.Settings;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;

import java.util.List;

import app.variablenine.nudge.TestSupport;
import app.variablenine.nudge.core.Prefs;
import app.variablenine.nudge.core.Task;
import app.variablenine.nudge.core.TaskBook;
import app.variablenine.nudge.core.TaskStore;

/** The tab and its panels, driven through the real Android lifecycle on a simulated device. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, qualifiers = "w411dp-h891dp-420dpi")
public class OverlayTest {

    private static final long FADE = 36 * TaskBook.HOUR;

    @Before
    public void setUp() throws Exception {
        TestSupport.freshProcess();
        TestSupport.grantNotificationAccess(true);
        TestSupport.install();
    }

    private static TaskStore store() {
        return TaskStore.get(TestSupport.app());
    }

    private static void remind(String text) {
        store().ingest(TestSupport.DUET, "human-task-manager", text, System.currentTimeMillis(),
                TaskStore.FROM_NOTIFICATION);
        TestSupport.idle();
    }

    private static NudgeLayer layerOf(Activity activity) {
        ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
        View last = decor.getChildAt(decor.getChildCount() - 1);
        assertTrue("the reminder layer must be the top-most child", last instanceof NudgeLayer);
        return (NudgeLayer) last;
    }

    private static int layerCount(Activity activity) {
        ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
        int n = 0;
        for (int i = 0; i < decor.getChildCount(); i++) {
            if (decor.getChildAt(i) instanceof NudgeLayer) n++;
        }
        return n;
    }

    private static View find(View root, String text) {
        if (root instanceof TextView && text.contentEquals(((TextView) root).getText())) return root;
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = find(group.getChildAt(i), text);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static void tap(Dialog dialog, String text) {
        View v = find(dialog.getWindow().getDecorView(), text);
        assertNotNull("no button \"" + text + "\"", v);
        // A label inside a row: the row is what takes the tap.
        while (!v.isClickable() && v.getParent() instanceof View) v = (View) v.getParent();
        assertTrue(v.performClick());
        TestSupport.idle();
    }

    private static List<Task> current() {
        return store().current(System.currentTimeMillis(), FADE);
    }

    // region presence

    @Test
    public void withNothingWaitingThereIsNothingToSee() {
        Activity a = TestSupport.launch().get();
        assertEquals(1, layerCount(a));
        assertEquals(View.GONE, layerOf(a).tab.getVisibility());
        assertNull(ShadowDialog.getLatestDialog());
    }

    @Test
    public void aReminderMakesTheTabAppearAndFinishingItMakesItLeave() {
        Activity a = TestSupport.launch().get();
        remind("Hang the laundry");
        TabView tab = layerOf(a).tab;
        assertEquals(View.VISIBLE, tab.getVisibility());
        assertTrue(tab.getContentDescription().toString().contains("Hang the laundry"));

        store().act(current().get(0).id, Task.DONE, 0);
        TestSupport.idle();
        assertEquals(View.GONE, tab.getVisibility());
    }

    @Test
    public void theLayerIsAddedOnceAndStaysOnTopAcrossResumes() {
        ActivityController<Activity> controller = TestSupport.launch();
        Activity a = controller.get();
        remind("Hang the laundry");
        controller.pause().resume();
        TestSupport.idle();
        // The app adds a view of its own afterwards.
        ((ViewGroup) a.getWindow().getDecorView()).addView(new View(a));
        controller.pause().resume();
        TestSupport.idle();
        assertEquals(1, layerCount(a));
        layerOf(a);
    }

    @Test
    public void theLayerGoesAwayWithItsScreen() {
        ActivityController<Activity> controller = TestSupport.launch();
        Activity a = controller.get();
        remind("Hang the laundry");
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        Dialog card = ShadowDialog.getLatestDialog();
        assertTrue(card.isShowing());
        controller.pause().stop().destroy();
        TestSupport.idle();
        assertFalse("an open panel must not outlive its screen", card.isShowing());
        assertEquals(0, layerCount(a));
    }

    // endregion

    // region touches

    @Test
    public void touchesBesideTheTabBelongToTheApp() {
        Activity a = TestSupport.launch().get();
        Prefs.get(a).setCues(Prefs.CUES_OFF);
        remind("Hang the laundry");
        NudgeLayer layer = layerOf(a);
        TabView tab = layer.tab;
        long t = SystemClock.uptimeMillis();
        // Far from the edge: inside the view's bounds, outside the bead.
        MotionEvent away = MotionEvent.obtain(t, t, MotionEvent.ACTION_DOWN, 10, tab.getHeight() / 2f, 0);
        assertFalse(tab.onTouchEvent(away));
        away.recycle();
        MotionEvent onBead = MotionEvent.obtain(t, t, MotionEvent.ACTION_DOWN, tab.getWidth() - 5,
                tab.getHeight() / 2f, 0);
        assertTrue(tab.onTouchEvent(onBead));
        onBead.recycle();
        assertFalse("the sheet itself must never take a touch", layer.isClickable());
        assertFalse(layer.isFocusable());
    }

    @Test
    public void draggingMovesTheTabAndRemembersWhere() {
        Activity a = TestSupport.launch().get();
        Prefs prefs = Prefs.get(a);
        prefs.setCues(Prefs.CUES_OFF);
        remind("Hang the laundry");
        NudgeLayer layer = layerOf(a);
        float before = prefs.yFraction();
        assertTrue(prefs.sideRight());

        layer.onTabDragged(600);
        // Dropped on the left half of the screen.
        layer.onTabDropped(40);
        assertTrue("moved down", prefs.yFraction() > before);
        assertFalse("switched to the left edge", prefs.sideRight());
        assertEquals(0f, layer.tab.getX(), 0.5f);

        // A cancelled drag keeps the side.
        layer.onTabDragged(-100);
        layer.onTabDropped(Float.NaN);
        assertFalse(prefs.sideRight());
    }

    // endregion

    // region the card

    @Test
    public void tappingOpensTheCardAndDoneFinishesWithAnUndo() {
        Activity a = TestSupport.launch().get();
        remind("Hang the laundry");
        TestSupport.advance(10_000);
        assertTrue(layerOf(a).tab.performClick());
        TestSupport.idle();
        Dialog card = ShadowDialog.getLatestDialog();
        assertNotNull(card);
        assertNotNull(find(card.getWindow().getDecorView(), "Hang the laundry"));

        tap(card, "Done");
        assertFalse(card.isShowing());
        assertTrue(current().isEmpty());
        TabView tab = layerOf(a).tab;
        assertEquals("the acknowledgement keeps the tab up for a moment", View.VISIBLE, tab.getVisibility());

        // Tapping the acknowledgement takes it back.
        assertTrue(tab.performClick());
        TestSupport.idle();
        assertEquals(1, current().size());
        assertEquals(Task.OPEN, current().get(0).state);
    }

    @Test
    public void withoutUndoTheAcknowledgementLeavesOnItsOwn() {
        Activity a = TestSupport.launch().get();
        remind("Hang the laundry");
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        tap(ShadowDialog.getLatestDialog(), "Done");
        TestSupport.advance(6_000);
        assertEquals(View.GONE, layerOf(a).tab.getVisibility());
        assertTrue(current().isEmpty());
    }

    @Test
    public void laterSnoozesAndTheReminderComesBack() {
        Activity a = TestSupport.launch().get();
        remind("Call the pharmacy");
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        Dialog card = ShadowDialog.getLatestDialog();
        tap(card, "Later");
        tap(card, "30 min");
        assertFalse(card.isShowing());
        assertTrue(current().isEmpty());
        assertEquals(1, store().sleeping(System.currentTimeMillis()).size());
        assertTrue(store().nextWake(System.currentTimeMillis()) > System.currentTimeMillis());
    }

    @Test
    public void onItAndDropIt() {
        Activity a = TestSupport.launch().get();
        remind("Shower");
        remind("Shave");
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        tap(ShadowDialog.getLatestDialog(), "On it");
        TestSupport.advance(4_000);
        long now = System.currentTimeMillis();
        int doing = 0;
        for (Task t : current()) {
            if (t.isInProgress(now)) doing++;
        }
        assertEquals(1, doing);

        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        tap(ShadowDialog.getLatestDialog(), "Drop it");
        TestSupport.advance(6_000);
        assertEquals(1, current().size());
        assertTrue("what is left is the one being worked on", current().get(0).isInProgress(now));
    }

    @Test
    public void theListShowsEverythingAndClearsOlderOnes() {
        Activity a = TestSupport.launch().get();
        long now = System.currentTimeMillis();
        store().ingest(TestSupport.DUET, "s", "Very old one", now - 50 * TaskBook.HOUR, TaskStore.FROM_NOTIFICATION);
        remind("One");
        remind("Two");
        remind("Three");
        remind("Four");
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        Dialog card = ShadowDialog.getLatestDialog();
        tap(card, "Show all (5)");
        View decor = card.getWindow().getDecorView();
        assertNotNull(find(decor, "Now"));
        assertNotNull(find(decor, "Older"));
        assertNotNull(find(decor, "Very old one"));
        tap(card, "Clear older");
        assertTrue(store().faded(System.currentTimeMillis(), FADE).isEmpty());
        assertEquals(4, current().size());
    }

    // endregion

    // region attention

    @Test
    public void openingTheAppShowsTheTopReminderBrieflyThenRests() {
        remind("Hang the laundry");
        Activity a = TestSupport.launch().get();
        TestSupport.advance(400);
        TabView tab = layerOf(a).tab;
        assertTrue("extended into a pill", tab.isExtended());
        TestSupport.advance(8_000);
        assertFalse("and back to a still bead", tab.isExtended());
    }

    @Test
    public void quietAndNeverMeanNoCueButTheTabStays() {
        remind("Hang the laundry");
        Prefs prefs = Prefs.get(TestSupport.app());
        prefs.setPausedUntil(System.currentTimeMillis() + TaskBook.HOUR);
        ActivityController<Activity> controller = TestSupport.launch();
        TestSupport.advance(400);
        TabView tab = layerOf(controller.get()).tab;
        assertEquals(View.VISIBLE, tab.getVisibility());
        assertFalse(tab.isExtended());

        prefs.setPausedUntil(0);
        prefs.setCues(Prefs.CUES_OFF);
        controller.pause().resume();
        TestSupport.advance(400);
        assertFalse(tab.isExtended());
    }

    @Test
    public void cuesAreSpacedOutButANewReminderSpeaksUpAtOnce() {
        remind("First");
        ActivityController<Activity> controller = TestSupport.launch();
        TabView tab = layerOf(controller.get()).tab;
        TestSupport.advance(8_000);
        assertFalse(tab.isExtended());

        // Coming back a minute later is too soon for another cue.
        controller.pause();
        TestSupport.advance(60_000);
        controller.resume();
        TestSupport.advance(400);
        assertFalse(tab.isExtended());

        // A reminder arriving is a reason in itself.
        remind("Second");
        TestSupport.advance(400);
        assertTrue(tab.isExtended());
        TestSupport.advance(8_000);

        // Nothing for the next ten minutes, then the timer brings it up again on its own.
        for (int second = 0; second < 600; second += 5) {
            TestSupport.advance(5_000);
            assertFalse("no cue expected " + second + "s in", tab.isExtended());
        }
        boolean cued = false;
        for (int second = 0; second < 400 && !cued; second++) {
            TestSupport.advance(1_000);
            cued = tab.isExtended();
        }
        assertTrue("the gentle timer should have cued by now", cued);
    }

    @Test
    public void aReminderThatArrivedWhileAwayIsShownOnReturnEvenSoonAfterACue() {
        remind("First");
        ActivityController<Activity> controller = TestSupport.launch();
        TabView tab = layerOf(controller.get()).tab;
        TestSupport.advance(8_000);
        assertFalse(tab.isExtended());

        // The app goes to the background, a reminder arrives, and a minute later the
        // user is back. The usual gap between cues has not passed, but this one is new.
        controller.pause();
        remind("Arrived while away");
        TestSupport.advance(60_000);
        controller.resume();
        TestSupport.advance(400);
        assertTrue(tab.isExtended());
    }

    @Test
    public void theAcknowledgementEndsWithItsScreenAndUndoIsOnlyOfferedThere() {
        ActivityController<Activity> controller = TestSupport.launch();
        Activity a = controller.get();
        remind("Hang the laundry");
        remind("Shower");
        TestSupport.advance(10_000);
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        tap(ShadowDialog.getLatestDialog(), "Done");
        assertEquals(1, current().size());

        // Leaving the screen ends the acknowledgement. A tap afterwards opens the card
        // for what is left. It does not silently bring the finished reminder back.
        controller.pause().resume();
        TestSupport.advance(10_000);
        assertTrue(layerOf(a).tab.performClick());
        TestSupport.idle();
        assertEquals(1, current().size());
        assertTrue(ShadowDialog.getLatestDialog().isShowing());
    }

    // endregion

    // region setup

    @Test
    public void withoutAccessTheTabOffersSetupAndItsButtonsOpenTheRightPages() {
        TestSupport.grantNotificationAccess(false);
        Activity a = TestSupport.launch().get();
        TabView tab = layerOf(a).tab;
        assertEquals(View.VISIBLE, tab.getVisibility());
        TestSupport.advance(10_000);

        assertTrue(tab.performClick());
        TestSupport.idle();
        Dialog setup = ShadowDialog.getLatestDialog();
        assertNotNull(find(setup.getWindow().getDecorView(), "Let Duet's reminders wait here"));

        tap(setup, "Open notification access");
        Intent access = Shadows.shadowOf(a).getNextStartedActivity();
        assertEquals(Settings.ACTION_NOTIFICATION_LISTENER_DETAIL_SETTINGS, access.getAction());
        assertTrue(access.getStringExtra(Settings.EXTRA_NOTIFICATION_LISTENER_COMPONENT_NAME)
                .contains("NudgeListenerService"));

        tap(setup, "Open app info");
        Intent info = Shadows.shadowOf(a).getNextStartedActivity();
        assertEquals(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, info.getAction());
        assertEquals("package:" + a.getPackageName(), info.getDataString());
    }

    @Test
    public void notNowHidesTheOfferAndGrantingAccessClosesTheGuide() {
        TestSupport.grantNotificationAccess(false);
        ActivityController<Activity> controller = TestSupport.launch();
        Activity a = controller.get();
        TestSupport.advance(10_000);
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        Dialog setup = ShadowDialog.getLatestDialog();

        // The user goes to the settings, grants access, and comes back.
        controller.pause();
        TestSupport.grantNotificationAccess(true);
        controller.resume();
        TestSupport.idle();
        assertFalse(setup.isShowing());

        // With access and nothing waiting, the tab is gone once the confirmation has passed.
        TestSupport.advance(6_000);
        assertEquals(View.GONE, layerOf(a).tab.getVisibility());
    }

    @Test
    public void declinedSetupStaysDeclined() {
        TestSupport.grantNotificationAccess(false);
        Activity a = TestSupport.launch().get();
        TestSupport.advance(10_000);
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        tap(ShadowDialog.getLatestDialog(), "Don't ask again");
        assertEquals(View.GONE, layerOf(a).tab.getVisibility());
        assertEquals(Long.MAX_VALUE, Prefs.get(a).setupDismissedUntil());
    }

    // endregion

    // region settings

    @Test
    public void settingsChangeWhatTheyClaimTo() {
        Activity a = TestSupport.launch().get();
        remind("Hang the laundry");
        Prefs prefs = Prefs.get(a);
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        tap(ShadowDialog.getLatestDialog(), "Settings");
        Dialog settings = ShadowDialog.getLatestDialog();
        assertNotNull(find(settings.getWindow().getDecorView(), "Duet reminders"));

        tap(settings, "Regular");
        assertEquals(Prefs.CUES_REGULAR, prefs.cues());
        tap(settings, "Never");
        // "Never" appears twice (cues and fading). The first one is the cue setting.
        assertEquals(Prefs.CUES_OFF, prefs.cues());
        tap(settings, "3 days");
        assertEquals(72, prefs.fadeHours());
        tap(settings, "1 hour");
        assertTrue(prefs.pausedUntil() > System.currentTimeMillis());
        tap(settings, "Resume now");
        assertEquals(0, prefs.pausedUntil());

        assertTrue(prefs.haptics());
        tap(settings, "Haptic tick when a reminder is finished");
        assertFalse(prefs.haptics());

        tap(settings, "Sample reminder");
        assertFalse(settings.isShowing());
        assertEquals(2, current().size());
        int samples = 0;
        for (Task t : current()) {
            if (Task.PKG_SAMPLE.equals(t.sourcePkg)) samples++;
        }
        assertEquals(1, samples);
    }

    // endregion
}
