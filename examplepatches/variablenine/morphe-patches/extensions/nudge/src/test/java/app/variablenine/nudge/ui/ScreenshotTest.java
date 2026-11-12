package app.variablenine.nudge.ui;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;
import android.view.ViewGroup;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowDialog;

import java.io.File;
import java.io.FileOutputStream;

import app.variablenine.nudge.Nudge;
import app.variablenine.nudge.TestSupport;
import app.variablenine.nudge.core.Prefs;
import app.variablenine.nudge.core.Task;
import app.variablenine.nudge.core.TaskBook;
import app.variablenine.nudge.core.TaskIds;
import app.variablenine.nudge.core.TaskStore;

/**
 * Draws the real views into PNG files under {@code build/screenshots}. There is no phone
 * in the build, so this is how the look of the tab and its panels gets checked: with
 * the same drawing code Android uses, over a dark and over a light app background.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, qualifiers = "w411dp-h891dp-420dpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class ScreenshotTest {

    private static final int DARK = 0xFF0F0F0F;
    private static final int LIGHT = 0xFFF7F7F7;
    private static final long NOW = System.currentTimeMillis();

    @Before
    public void setUp() throws Exception {
        TestSupport.freshProcess();
        TestSupport.grantNotificationAccess(true);
        TestSupport.install();
    }

    private TaskStore store() {
        return TaskStore.get(TestSupport.app());
    }

    private void remind(String sender, String text, long minutesAgo) {
        store().ingest(TestSupport.DUET, sender, text, NOW - minutesAgo * TaskBook.MINUTE,
                TaskStore.FROM_NOTIFICATION);
    }

    @Test
    public void beadWithOneReminderOnDark() throws Exception {
        remind("human-task-manager", "Hang the laundry on the rack", 25);
        Prefs.get(TestSupport.app()).setCues(Prefs.CUES_OFF);
        Activity a = TestSupport.launch().get();
        snap("01-bead-one-dark", a, null, DARK);
    }

    @Test
    public void beadWithThreeRemindersOnLight() throws Exception {
        remind("human-task-manager", "Hang the laundry on the rack", 25);
        remind("human-task-manager", "Bring the garbage bin back in", 40);
        remind("human-task-manager", "Voice lesson at 4:30, get set up", 5);
        Prefs.get(TestSupport.app()).setCues(Prefs.CUES_OFF);
        Activity a = TestSupport.launch().get();
        snap("02-bead-three-light", a, null, LIGHT);
    }

    @Test
    public void cueOnDarkAndLight() throws Exception {
        remind("human-task-manager", "Hang the laundry on the rack", 25);
        Activity a = TestSupport.launch().get();
        TestSupport.advance(400);
        snap("03-cue-dark", a, null, DARK);
        snap("04-cue-light", a, null, LIGHT);
    }

    @Test
    public void cueWithLongTextOnTheLeft() throws Exception {
        remind("human-task-manager", "It's just the short list now: feed the cats, litter, shower, "
                + "brush teeth and hair, shave. Bed right after.", 190);
        Prefs.get(TestSupport.app()).setPlacement(false, 0.6f);
        Activity a = TestSupport.launch().get();
        TestSupport.advance(400);
        snap("05-cue-long-left-dark", a, null, DARK);
    }

    @Test
    public void undoAfterDone() throws Exception {
        remind("human-task-manager", "Hang the laundry on the rack", 25);
        remind("human-task-manager", "Bring the garbage bin back in", 40);
        Prefs.get(TestSupport.app()).setCues(Prefs.CUES_OFF);
        Activity a = TestSupport.launch().get();
        Task t = store().get(TaskIds.of(TestSupport.DUET, "Hang the laundry on the rack"));
        Nudge.done(a, t);
        OverlayController.get().confirm(a, "Done. Nice.", "Tap to undo", TabView.MARK_CHECK, t, 5_000L);
        TestSupport.advance(400);
        snap("06-undo-dark", a, null, DARK);
    }

    @Test
    public void cardForOneReminder() throws Exception {
        remind("human-task-manager", "Hang the laundry on the rack now, before anything else, so it "
                + "doesn't sit.", 25);
        Prefs.get(TestSupport.app()).setCues(Prefs.CUES_OFF);
        Activity a = TestSupport.launch().get();
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        snap("07-card-one-dark", a, ShadowDialog.getLatestDialog(), DARK);
        snap("08-card-one-light", a, ShadowDialog.getLatestDialog(), LIGHT);
    }

    @Test
    public void cardWithMoreWaitingAndLaterOpen() throws Exception {
        remind("human-task-manager", "Voice lesson at 4:30, time to get set up: water, quiet spot.", 3);
        remind("human-task-manager", "Hang the laundry on the rack", 25);
        remind("human-task-manager", "Bring the garbage bin back in from the curb", 40);
        remind("Nyx", "Nyx is not plugged in. Tonight's limit is 53% and the battery is at 41%.", 95);
        store().ingest(TestSupport.DUET, "human-task-manager", "Voice lesson at 4:30, time to get set up: "
                + "water, quiet spot.", NOW - TaskBook.MINUTE, TaskStore.FROM_NOTIFICATION);
        Prefs.get(TestSupport.app()).setCues(Prefs.CUES_OFF);
        Activity a = TestSupport.launch().get();
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        snap("09-card-more-dark", a, ShadowDialog.getLatestDialog(), DARK);
        Dialog d = ShadowDialog.getLatestDialog();
        clickText(d.getWindow().getDecorView(), "Later");
        TestSupport.idle();
        snap("10-card-later-dark", a, d, DARK);
    }

    @Test
    public void cardWithVeryLongText() throws Exception {
        StringBuilder sb = new StringBuilder("It's just the short list now. ");
        for (int i = 1; i <= 14; i++) sb.append(i).append(". Another step that needs doing today. ");
        remind("human-task-manager", sb.toString(), 12);
        Prefs.get(TestSupport.app()).setCues(Prefs.CUES_OFF);
        Activity a = TestSupport.launch().get();
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        snap("11-card-long-dark", a, ShadowDialog.getLatestDialog(), DARK);
    }

    @Test
    public void listOfEverything() throws Exception {
        remind("human-task-manager", "Voice lesson at 4:30, time to get set up", 3);
        remind("human-task-manager", "Hang the laundry on the rack", 25);
        remind("human-task-manager", "Bring the garbage bin back in from the curb", 40);
        remind("human-task-manager", "Start a laundry load", 60);
        remind("human-task-manager", "Call the pharmacy about the refill", 50 * 60);
        Task snoozed = store().get(TaskIds.of(TestSupport.DUET, "Start a laundry load"));
        Nudge.snooze(TestSupport.app(), snoozed, System.currentTimeMillis() + 2 * TaskBook.HOUR);
        Prefs.get(TestSupport.app()).setCues(Prefs.CUES_OFF);
        Activity a = TestSupport.launch().get();
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        Dialog d = ShadowDialog.getLatestDialog();
        clickText(d.getWindow().getDecorView(), "Show all (5)");
        TestSupport.idle();
        snap("12-list-dark", a, d, DARK);
    }

    @Test
    public void setupGuide() throws Exception {
        TestSupport.grantNotificationAccess(false);
        Activity a = TestSupport.launch().get();
        TestSupport.advance(400);
        snap("13-setup-cue-dark", a, null, DARK);
        TestSupport.advance(8_000);
        OverlayController.get().onTabTapped(a);
        TestSupport.idle();
        snap("14-setup-card-dark", a, ShadowDialog.getLatestDialog(), DARK);
    }

    @Test
    public void settings() throws Exception {
        remind("human-task-manager", "Hang the laundry on the rack", 25);
        Prefs prefs = Prefs.get(TestSupport.app());
        prefs.setCues(Prefs.CUES_OFF);
        prefs.noteSender("human-task-manager");
        prefs.noteSender("Nyx");
        Activity a = TestSupport.launch().get();
        prefs.setCues(Prefs.CUES_GENTLE);
        OverlayController.get().openSettings(a);
        TestSupport.idle();
        Dialog d = ShadowDialog.getLatestDialog();
        snap("15-settings-top-dark", a, d, DARK);
        View scroll = findScroll(d.getWindow().getDecorView());
        assertNotNull(scroll);
        scroll.scrollTo(0, 100_000);
        snap("16-settings-bottom-dark", a, d, DARK);
    }

    // region drawing helpers

    private static void snap(String name, Activity activity, Dialog dialog, int background) throws Exception {
        View decor = activity.getWindow().getDecorView();
        activity.getWindow().setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(0));
        View content = activity.findViewById(android.R.id.content);
        if (content != null) content.setBackgroundColor(0);
        int width = activity.getResources().getDisplayMetrics().widthPixels;
        int height = activity.getResources().getDisplayMetrics().heightPixels;
        layoutIfNeeded(decor, width, height);
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        canvas.drawColor(background);
        fakeAppContent(canvas, width, height, background == DARK);
        decor.draw(canvas);
        if (dialog != null) {
            assertTrue(name + ": dialog not showing", dialog.isShowing());
            canvas.drawColor(0x66000000);
            View dialogDecor = dialog.getWindow().getDecorView();
            layoutIfNeeded(dialogDecor, width, height);
            dialogDecor.draw(canvas);
        }
        File dir = new File("build/screenshots");
        assertTrue(dir.isDirectory() || dir.mkdirs());
        try (FileOutputStream out = new FileOutputStream(new File(dir, name + ".png"))) {
            // Half size keeps the files small and is plenty to judge the layout.
            Bitmap small = Bitmap.createScaledBitmap(bitmap, width / 2, height / 2, true);
            small.compress(Bitmap.CompressFormat.PNG, 100, out);
        }
    }

    private static void layoutIfNeeded(View view, int width, int height) {
        if (view.getWidth() == width && view.getHeight() == height && !view.isLayoutRequested()) return;
        view.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        view.layout(0, 0, width, height);
    }

    /** Something feed-like behind the tab, so contrast is judged against content, not a blank page. */
    private static void fakeAppContent(Canvas canvas, int width, int height, boolean dark) {
        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        int block = dark ? 0xFF272727 : 0xFFE4E4E4;
        int line = dark ? 0xFF3A3A3A : 0xFFCFCFCF;
        float y = 120;
        while (y < height - 200) {
            p.setColor(block);
            canvas.drawRect(0, y, width, y + 420, p);
            p.setColor(line);
            canvas.drawRect(40, y + 450, width * 0.8f, y + 480, p);
            canvas.drawRect(40, y + 500, width * 0.5f, y + 524, p);
            y += 600;
        }
    }

    private static boolean clickText(View root, String text) {
        if (root instanceof android.widget.TextView
                && text.contentEquals(((android.widget.TextView) root).getText()) && root.isClickable()) {
            root.performClick();
            return true;
        }
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                if (clickText(group.getChildAt(i), text)) return true;
            }
        }
        return false;
    }

    private static View findScroll(View root) {
        if (root instanceof android.widget.ScrollView) return root;
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findScroll(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    // endregion
}
