package app.variablenine.nudge.ui;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.provider.Settings;
import android.text.TextUtils;
import android.text.format.DateFormat;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import app.variablenine.nudge.Nudge;
import app.variablenine.nudge.core.Log;
import app.variablenine.nudge.core.Prefs;
import app.variablenine.nudge.core.Task;
import app.variablenine.nudge.core.TaskBook;
import app.variablenine.nudge.core.TaskStore;
import app.variablenine.nudge.core.TimeText;

/**
 * What opens when the tab is tapped. Three faces:
 *
 * <ul>
 * <li><b>focus</b>: one reminder and what can be done with it. One thing at a time, on
 * purpose: a long list is where reminders go to be ignored;</li>
 * <li><b>list</b>: everything, for when the user asks to see it;</li>
 * <li><b>setup</b>: the walk through Android's settings that lets reminders arrive here.</li>
 * </ul>
 *
 * <p>The wording is deliberately plain and free of blame. Nothing here says "overdue".
 */
final class CardDialog extends SheetDialog {

    static final int FOCUS = 0;
    static final int LIST = 1;
    static final int SETUP = 2;

    private static final String[] DONE_LINES = {"Done. Nice.", "Done.", "That's one less."};
    private static int doneRound;

    private int mode;
    private String focusId;
    private boolean laterOpen;

    CardDialog(Activity activity, OverlayController controller, int mode) {
        super(activity, controller);
        this.mode = mode;
    }

    boolean isSetup() {
        return mode == SETUP;
    }

    @Override
    protected void build(LinearLayout panel) {
        if (mode == SETUP) buildSetup(panel);
        else if (mode == LIST) buildList(panel);
        else buildFocus(panel);
    }

    private void show(int nextMode) {
        mode = nextMode;
        laterOpen = false;
        render();
    }

    // region one reminder

    private void buildFocus(LinearLayout panel) {
        long now = System.currentTimeMillis();
        Prefs prefs = Prefs.get(activity);
        TaskStore store = TaskStore.get(activity);
        List<Task> current = store.current(now, prefs.fadeMillis());

        Task picked = focusId == null ? null : store.get(focusId);
        if (picked != null && picked.isClosed()) picked = null;
        if (picked == null && !current.isEmpty()) picked = current.get(0);
        if (picked == null) {
            // Nothing left to show: either everything is finished or nothing has arrived yet.
            // An empty panel closes itself.
            if (Nudge.needsSetup(activity, now)) show(SETUP);
            return;
        }
        final Task task = picked;
        focusId = task.id;

        LinearLayout header = Ui.row(activity);
        String from = task.source.isEmpty() ? "Reminder" : task.source;
        TextView meta = Ui.text(activity, from + " · " + TimeText.ago(now - task.anchor()), 13, Ui.TEXT_SOFT);
        meta.setSingleLine(true);
        meta.setEllipsize(TextUtils.TruncateAt.END);
        header.addView(meta, Ui.weighted(1));
        header.addView(Ui.textButton(activity, "Settings", () -> controller.openSettings(activity)), Ui.trail(activity));
        panel.addView(header, Ui.fill());

        if (task.needsCheckIn(now)) {
            TextView ask = Ui.text(activity, "How did it go?", 14, Ui.ACCENT);
            ask.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            panel.addView(ask, Ui.fill());
            panel.addView(Ui.space(activity, 4));
        }

        TextView body = Ui.text(activity, task.text, 17, Ui.TEXT);
        body.setTextIsSelectable(false);
        panel.addView(body, Ui.fill());

        if (task.isSleeping(now)) {
            panel.addView(note("Snoozed · back " + TimeText.in(task.until - now)), Ui.fill());
        } else if (task.isInProgress(now)) {
            panel.addView(note("On it · checking back " + TimeText.in(task.until - now)), Ui.fill());
        } else if (task.count > 1) {
            panel.addView(note("Asked " + task.count + " times"), Ui.fill());
        }
        panel.addView(Ui.space(activity, 14));

        LinearLayout main = Ui.row(activity);
        main.addView(Ui.filledButton(activity, "Done", () -> finish(task)), Ui.weighted(3));
        LinearLayout.LayoutParams second = Ui.weighted(2);
        second.leftMargin = Ui.dp(activity, 10);
        if (task.isSleeping(now)) {
            main.addView(Ui.outlineButton(activity, "Bring back", () -> {
                Nudge.reopen(activity, task);
                controller.noteInteraction();
            }), second);
        } else {
            String label = task.state == Task.DOING ? "Still on it" : "On it";
            main.addView(Ui.outlineButton(activity, label, () -> onIt(task)), second);
        }
        panel.addView(main, Ui.fill());

        if (!task.isSleeping(now)) {
            if (laterOpen) {
                LinearLayout chips = Ui.row(activity);
                chips.setPadding(0, Ui.dp(activity, 8), 0, 0);
                addChip(chips, "30 min", () -> snooze(task, 30 * TaskBook.MINUTE));
                addChip(chips, "2 hours", () -> snooze(task, 2 * TaskBook.HOUR));
                addChip(chips, "12 hours", () -> snooze(task, 12 * TaskBook.HOUR));
                panel.addView(chips, Ui.fill());
            } else {
                LinearLayout quiet = Ui.row(activity);
                quiet.addView(Ui.textButton(activity, "Later", () -> {
                    laterOpen = true;
                    render();
                }), Ui.lead(activity));
                quiet.addView(new View(activity), Ui.weighted(1));
                quiet.addView(Ui.textButton(activity, "Drop it", () -> drop(task)), Ui.trail(activity));
                panel.addView(quiet, Ui.fill());
            }
        }

        List<Task> others = new ArrayList<>();
        for (Task t : current) {
            if (!t.id.equals(task.id)) others.add(t);
        }
        int waiting = store.sleeping(now).size() + store.faded(now, prefs.fadeMillis()).size();
        if (!others.isEmpty() || waiting > 0) {
            panel.addView(Ui.divider(activity));
            for (int i = 0; i < Math.min(2, others.size()); i++) {
                panel.addView(taskRow(others.get(i), now, false), Ui.fill());
            }
            int total = current.size() + waiting;
            if (others.size() > 2 || waiting > 0) {
                panel.addView(Ui.textButton(activity, "Show all (" + total + ")", () -> show(LIST)), Ui.lead(activity));
            }
        }

        panel.addView(Ui.divider(activity));
        addFooter(panel, now);
    }

    private TextView note(String text) {
        TextView t = Ui.text(activity, text, 13, Ui.TEXT_SOFT);
        t.setPadding(0, Ui.dp(activity, 6), 0, 0);
        return t;
    }

    private void addChip(LinearLayout row, String label, Runnable action) {
        LinearLayout.LayoutParams lp = Ui.weighted(1);
        if (row.getChildCount() > 0) lp.leftMargin = Ui.dp(activity, 8);
        row.addView(Ui.chip(activity, label, false, action), lp);
    }

    private View taskRow(final Task task, long now, boolean snoozed) {
        LinearLayout row = Ui.row(activity);
        row.setMinimumHeight(Ui.dp(activity, 44));
        row.setBackground(Ui.pressable(activity, 0x00000000, Ui.dpf(activity, 10), 0));
        row.setClickable(true);
        row.setFocusable(true);
        row.setOnClickListener(Ui.onClick(() -> {
            focusId = task.id;
            show(FOCUS);
        }));
        TextView text = Ui.text(activity, task.text, 15, Ui.TEXT);
        text.setSingleLine(true);
        text.setEllipsize(TextUtils.TruncateAt.END);
        row.addView(text, Ui.weighted(1));
        String when = snoozed ? "back " + TimeText.in(task.until - now)
                : TimeText.ago(now - task.anchor());
        TextView age = Ui.text(activity, when, 12, Ui.TEXT_SOFT);
        age.setPadding(Ui.dp(activity, 10), 0, 0, 0);
        row.addView(age, Ui.wrap());
        return row;
    }

    private void addFooter(LinearLayout panel, long now) {
        final Prefs prefs = Prefs.get(activity);
        LinearLayout footer = Ui.row(activity);
        if (now < prefs.pausedUntil()) {
            String until = DateFormat.getTimeFormat(activity).format(new Date(prefs.pausedUntil()));
            footer.addView(Ui.textButton(activity, "Quiet until " + until + " · Resume", () -> {
                prefs.setPausedUntil(0);
                render();
            }), Ui.lead(activity));
        } else {
            footer.addView(Ui.textButton(activity, "Quiet for 1 hour", () -> {
                prefs.setPausedUntil(System.currentTimeMillis() + TaskBook.HOUR);
                render();
            }), Ui.lead(activity));
        }
        if (Nudge.needsSetup(activity, now)) {
            footer.addView(new View(activity), Ui.weighted(1));
            footer.addView(Ui.textButton(activity, "Connect Duet", () -> show(SETUP)), Ui.trail(activity));
        }
        panel.addView(footer, Ui.fill());
    }

    // endregion

    // region actions

    private void finish(Task task) {
        controller.haptic(panel);
        Nudge.done(activity, task);
        dismiss();
        String line = DONE_LINES[doneRound++ % DONE_LINES.length];
        controller.confirm(activity, line, "Tap to undo", TabView.MARK_CHECK, task, 5_000L);
    }

    private void drop(Task task) {
        Nudge.skip(activity, task);
        dismiss();
        controller.confirm(activity, "Dropped", "Tap to undo", TabView.MARK_CHECK, task, 5_000L);
    }

    private void onIt(Task task) {
        Nudge.onIt(activity, task);
        dismiss();
        controller.confirm(activity, "On it", "Checking back " + TimeText.in(Nudge.ON_IT_CHECK_IN),
                TabView.MARK_RING, null, 3_000L);
    }

    private void snooze(Task task, long millis) {
        Nudge.snooze(activity, task, System.currentTimeMillis() + millis);
        dismiss();
        controller.confirm(activity, "Later", "Back " + TimeText.in(millis), TabView.MARK_RING, task, 4_000L);
    }

    // endregion

    // region everything

    private void buildList(LinearLayout panel) {
        long now = System.currentTimeMillis();
        Prefs prefs = Prefs.get(activity);
        TaskStore store = TaskStore.get(activity);
        List<Task> current = store.current(now, prefs.fadeMillis());
        List<Task> sleeping = store.sleeping(now);
        final List<Task> faded = store.faded(now, prefs.fadeMillis());
        if (current.isEmpty() && sleeping.isEmpty() && faded.isEmpty()) return;

        LinearLayout header = Ui.row(activity);
        TextView title = Ui.text(activity, "All reminders", 17, Ui.TEXT);
        header.addView(title, Ui.weighted(1));
        header.addView(Ui.textButton(activity, "Back", () -> {
            focusId = null;
            show(FOCUS);
        }), Ui.trail(activity));
        panel.addView(header, Ui.fill());

        if (!current.isEmpty()) {
            panel.addView(section("Now"), Ui.fill());
            for (Task t : current) panel.addView(taskRow(t, now, false), Ui.fill());
        }
        if (!sleeping.isEmpty()) {
            panel.addView(section("Snoozed"), Ui.fill());
            for (Task t : sleeping) panel.addView(taskRow(t, now, true), Ui.fill());
        }
        if (!faded.isEmpty()) {
            panel.addView(section("Older"), Ui.fill());
            for (Task t : faded) panel.addView(taskRow(t, now, false), Ui.fill());
            panel.addView(Ui.textButton(activity, "Clear older", () -> {
                for (Task t : faded) Nudge.skip(activity, t);
                controller.noteInteraction();
            }), Ui.lead(activity));
        }
    }

    private TextView section(String label) {
        TextView t = Ui.text(activity, label, 13, Ui.TEXT_SOFT);
        t.setPadding(0, Ui.dp(activity, 12), 0, Ui.dp(activity, 2));
        return t;
    }

    // endregion

    // region setup

    /**
     * Android treats apps installed from a file as "restricted" and greys out the
     * notification access switch until the user lifts that for the app. It takes three
     * trips into the system settings; each step here has a button that goes straight
     * to the right page.
     */
    private void buildSetup(LinearLayout panel) {
        String app = appName();

        TextView title = Ui.text(activity, "Let Duet's reminders wait here", 18, Ui.TEXT);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        panel.addView(title, Ui.fill());
        panel.addView(Ui.space(activity, 6));
        panel.addView(Ui.text(activity, "Anything Claude Duet sends you stays in this tab until you "
                + "finish it, so a swiped-away notification is not a forgotten one. Notifications "
                + "from other apps are ignored.", 14, Ui.TEXT_SOFT), Ui.fill());

        addStep(panel, "1", "Open notification access and tap the switch for " + app
                        + ". Android will say it is restricted. That is expected.",
                "Open notification access", this::openAccess);
        addStep(panel, "2", "Open the info page of " + app + ", tap the three dots at the top right, "
                        + "then “Allow restricted settings”.",
                "Open app info", this::openAppInfo);
        addStep(panel, "3", "Go back to notification access and switch it on.",
                "Open notification access", this::openAccess);

        panel.addView(Ui.space(activity, 10));
        panel.addView(Ui.text(activity, "If the switch already works in step 1, you are done. Only one of "
                + "your patched apps needs this; the others pick the reminders up from it.",
                13, Ui.TEXT_SOFT), Ui.fill());

        panel.addView(Ui.divider(activity));
        LinearLayout footer = Ui.row(activity);
        final Prefs prefs = Prefs.get(activity);
        footer.addView(Ui.textButton(activity, "Not now", () -> {
            prefs.setSetupDismissedUntil(System.currentTimeMillis() + TaskBook.DAY);
            dismiss();
            OverlayController.refreshAll();
        }), Ui.lead(activity));
        footer.addView(new View(activity), Ui.weighted(1));
        footer.addView(Ui.textButton(activity, "Don't ask again", () -> {
            prefs.setSetupDismissedUntil(Long.MAX_VALUE);
            dismiss();
            OverlayController.refreshAll();
        }), Ui.trail(activity));
        panel.addView(footer, Ui.fill());
    }

    private void addStep(LinearLayout panel, String number, String text, String button, Runnable action) {
        panel.addView(Ui.space(activity, 14));
        LinearLayout row = Ui.row(activity);
        row.setGravity(Gravity.TOP);
        TextView n = Ui.text(activity, number, 14, Ui.ACCENT);
        n.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        n.setMinWidth(Ui.dp(activity, 22));
        row.addView(n, Ui.wrap());
        row.addView(Ui.text(activity, text, 14, Ui.TEXT), Ui.weighted(1));
        panel.addView(row, Ui.fill());
        LinearLayout.LayoutParams lp = Ui.fill();
        lp.topMargin = Ui.dp(activity, 8);
        lp.leftMargin = Ui.dp(activity, 22);
        TextView b = Ui.outlineButton(activity, button, action);
        b.setMinHeight(Ui.dp(activity, 44));
        b.setMinimumHeight(Ui.dp(activity, 44));
        panel.addView(b, lp);
    }

    private String appName() {
        try {
            CharSequence label = activity.getApplicationInfo().loadLabel(activity.getPackageManager());
            if (label != null && label.length() > 0 && label.length() < 40) return label.toString();
        } catch (Throwable t) {
            Log.w("app label unavailable", t);
        }
        return "this app";
    }

    private void openAccess() {
        if (start(Nudge.accessSettingsIntent(activity))) return;
        if (start(Nudge.accessListIntent())) return;
        hint("Open Settings, then Notifications, then Notification access.");
    }

    private void openAppInfo() {
        Uri app = Uri.fromParts("package", activity.getPackageName(), null);
        if (start(new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, app))) return;
        hint("Open Settings, then Apps, then " + appName() + ".");
    }

    private boolean start(Intent intent) {
        try {
            activity.startActivity(intent);
            return true;
        } catch (Throwable t) {
            // Some phones do not have the page under this name.
            return false;
        }
    }

    private void hint(String text) {
        TextView t = Ui.text(activity, text, 14, Ui.ACCENT);
        t.setPadding(0, Ui.dp(activity, 10), 0, 0);
        panel.addView(t, Ui.fill());
    }

    // endregion
}
