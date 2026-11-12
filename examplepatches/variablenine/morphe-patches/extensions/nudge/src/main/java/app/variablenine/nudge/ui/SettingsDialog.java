package app.variablenine.nudge.ui;

import android.app.Activity;
import android.graphics.Typeface;
import android.text.InputType;
import android.text.format.DateFormat;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

import app.variablenine.nudge.Nudge;
import app.variablenine.nudge.core.Prefs;
import app.variablenine.nudge.core.TaskBook;

/**
 * Settings for the reminder spot, opened from the card. Everything that could make the
 * tab annoying has a switch here, with the quiet switch at the top: a reminder that is
 * easy to hush for an hour is one that does not get uninstalled.
 */
final class SettingsDialog extends SheetDialog {

    interface TextResult {
        void accept(String text);
    }

    /** A one-line question with a text field. */
    private static final class InputDialog extends SheetDialog {
        private final String title;
        private final String hint;
        private final String explanation;
        private final TextResult result;

        InputDialog(Activity activity, OverlayController controller, String title, String hint,
                    String explanation, TextResult result) {
            super(activity, controller);
            this.title = title;
            this.hint = hint;
            this.explanation = explanation;
            this.result = result;
        }

        @Override
        protected void build(LinearLayout panel) {
            TextView heading = Ui.text(activity, title, 17, Ui.TEXT);
            heading.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            panel.addView(heading, Ui.fill());
            if (explanation != null) {
                panel.addView(Ui.space(activity, 4));
                panel.addView(Ui.text(activity, explanation, 13, Ui.TEXT_SOFT), Ui.fill());
            }
            panel.addView(Ui.space(activity, 12));

            final EditText field = new EditText(activity);
            field.setHint(hint);
            field.setHintTextColor(Ui.TEXT_SOFT);
            field.setTextColor(Ui.TEXT);
            field.setTextSize(16);
            field.setSingleLine(true);
            field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
            field.setImeOptions(EditorInfo.IME_ACTION_DONE);
            field.setBackground(Ui.shape(Ui.FIELD, Ui.dpf(activity, 12), Ui.OUTLINE, Ui.dp(activity, 1)));
            int pad = Ui.dp(activity, 12);
            field.setPadding(pad, pad, pad, pad);
            field.setMinHeight(Ui.dp(activity, 48));
            panel.addView(field, Ui.fill());
            panel.addView(Ui.space(activity, 14));

            final Runnable submit = () -> {
                String text = field.getText() == null ? "" : field.getText().toString().trim();
                dismiss();
                if (!text.isEmpty()) result.accept(text);
            };
            field.setOnEditorActionListener((v, action, event) -> {
                if (action != EditorInfo.IME_ACTION_DONE) return false;
                Ui.safely(submit);
                return true;
            });
            LinearLayout buttons = Ui.row(activity);
            buttons.addView(Ui.textButton(activity, "Cancel", this::dismiss), Ui.lead(activity));
            buttons.addView(new View(activity), Ui.weighted(1));
            buttons.addView(Ui.filledButton(activity, "Add", submit), Ui.wrap());
            panel.addView(buttons, Ui.fill());
            panel.addView(Ui.space(activity, 6));
        }

        @Override
        public void onTasksChanged(int origin) {
            // Rebuilding would wipe what is being typed.
        }
    }

    SettingsDialog(Activity activity, OverlayController controller) {
        super(activity, controller);
    }

    @Override
    public void onTasksChanged(int origin) {
        // Nothing here depends on the reminders themselves.
    }

    @Override
    protected void build(LinearLayout panel) {
        final Prefs prefs = Prefs.get(activity);
        long now = System.currentTimeMillis();

        LinearLayout header = Ui.row(activity);
        TextView title = Ui.text(activity, "Duet reminders", 18, Ui.TEXT);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        header.addView(title, Ui.weighted(1));
        header.addView(Ui.textButton(activity, "Close", this::dismiss), Ui.trail(activity));
        panel.addView(header, Ui.fill());

        // Quiet comes first: it is the switch people look for when a reminder gets in the way.
        section(panel, "Quiet");
        if (now < prefs.pausedUntil()) {
            String until = DateFormat.getTimeFormat(activity).format(new Date(prefs.pausedUntil()));
            panel.addView(Ui.text(activity, "The tab stays, but it will not ask for attention until "
                    + until + ".", 14, Ui.TEXT), Ui.fill());
            choices(panel, new String[]{"Resume now"}, -1, i -> prefs.setPausedUntil(0));
        } else {
            choices(panel, new String[]{"1 hour", "12 hours"}, -1, i -> prefs.setPausedUntil(
                    System.currentTimeMillis() + (i == 0 ? TaskBook.HOUR : 12 * TaskBook.HOUR)));
            explain(panel, "The tab stays where it is. It just stops speaking up for a while.");
        }

        section(panel, "How often it speaks up");
        choices(panel, new String[]{"Never", "Gentle", "Regular"}, prefs.cues(), prefs::setCues);
        explain(panel, prefs.cues() == Prefs.CUES_OFF
                ? "The tab only shows that something is waiting. It never extends on its own."
                : prefs.cues() == Prefs.CUES_REGULAR
                ? "Shows the top reminder for a few seconds about every 8 minutes while you are in the app."
                : "Shows the top reminder for a few seconds about every 15 minutes while you are in the app.");

        section(panel, "Reminders stop asking after");
        final int[] hours = {12, 36, 72, 0};
        int selected = -1;
        for (int i = 0; i < hours.length; i++) {
            if (hours[i] == prefs.fadeHours()) selected = i;
        }
        choices(panel, new String[]{"12 hr", "36 hr", "3 days", "Never"}, selected,
                i -> prefs.setFadeHours(hours[i]));
        explain(panel, "Older ones are not deleted. They move to “Older” under Show all.");

        section(panel, "Connection");
        String status = Nudge.hasNotificationAccess(activity) ? "Notification access is on."
                : prefs.fedBySibling() ? "Reminders arrive through another patched app."
                : "Notification access is off, so reminders cannot arrive yet.";
        panel.addView(Ui.text(activity, status, 14, Ui.TEXT), Ui.fill());
        panel.addView(Ui.space(activity, 8));
        panel.addView(Ui.outlineButton(activity, "Set up notification access", () -> {
            prefs.setSetupDismissedUntil(0);
            controller.openSetup(activity);
        }), Ui.fill());

        section(panel, "Options");
        toggle(panel, "Haptic tick when a reminder is finished", prefs.haptics(), prefs::setHaptics);
        toggle(panel, "Clear the notification when I finish a reminder", prefs.clearNotification(),
                prefs::setClearNotification);
        toggle(panel, "Listen only while this app is open", prefs.onlyWhileOpen(), on -> {
            prefs.setOnlyWhileOpen(on);
            if (!on) Nudge.onForeground(activity);
        });
        explain(panel, "Uses less memory. A notification swiped away while the app is closed is then missed.");

        section(panel, "Senders");
        Set<String> senders = prefs.seenSenders();
        if (senders.isEmpty()) {
            explain(panel, "Nothing received yet. Each sender gets its own switch here.");
        }
        for (final String sender : senders) {
            toggle(panel, sender, !prefs.isSenderMuted(sender), on -> prefs.setSenderMuted(sender, !on));
        }

        section(panel, "Apps to listen to");
        final Set<String> sources = prefs.sources();
        for (final String source : sources) {
            LinearLayout row = Ui.row(activity);
            String shown = source.endsWith(".") ? source + "*" : source;
            row.addView(Ui.text(activity, shown, 14, Ui.TEXT), Ui.weighted(1));
            if (sources.size() > 1) {
                row.addView(Ui.textButton(activity, "Remove", () -> {
                    Set<String> next = new TreeSet<>(sources);
                    next.remove(source);
                    prefs.setSources(next);
                    render();
                }), Ui.trail(activity));
            }
            row.setMinimumHeight(Ui.dp(activity, 44));
            panel.addView(row, Ui.fill());
        }
        explain(panel, "The default covers Claude Duet and Claude. Nothing from any other app is read.");
        panel.addView(Ui.space(activity, 6));
        panel.addView(Ui.outlineButton(activity, "Add an app", () -> ask("Add an app",
                "com.example.app", "The app's package name. End it with a dot to match every app that "
                        + "starts with it.", text -> {
                    String name = text.toLowerCase(java.util.Locale.ROOT).replace("*", "").replace(" ", "");
                    if (name.isEmpty() || name.length() > 120) return;
                    Set<String> next = new TreeSet<>(prefs.sources());
                    next.add(name);
                    prefs.setSources(next);
                    render();
                })), Ui.fill());

        section(panel, "Try it");
        LinearLayout tryRow = Ui.row(activity);
        tryRow.addView(Ui.outlineButton(activity, "Sample reminder", () -> {
            Nudge.addSample(activity);
            dismiss();
        }), Ui.weighted(1));
        LinearLayout.LayoutParams lp = Ui.weighted(1);
        lp.leftMargin = Ui.dp(activity, 10);
        tryRow.addView(Ui.outlineButton(activity, "Add my own", () -> ask("Add a reminder",
                "What should wait here?", null, text -> Nudge.addManual(activity, text))), lp);
        panel.addView(tryRow, Ui.fill());
        panel.addView(Ui.space(activity, 8));
    }

    private InputDialog input;

    private void ask(String title, String hint, String explanation, TextResult result) {
        Ui.safely(() -> {
            if (input != null && input.isShowing()) input.dismiss();
            input = new InputDialog(activity, controller, title, hint, explanation, result);
            input.show();
        });
    }

    @Override
    protected void onStop() {
        // The question belongs to this panel and must not outlive it.
        Ui.safely(() -> {
            if (input != null && input.isShowing()) input.dismiss();
        });
        super.onStop();
    }

    private void section(LinearLayout panel, String label) {
        TextView t = Ui.text(activity, label, 13, Ui.ACCENT);
        t.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        t.setPadding(0, Ui.dp(activity, 20), 0, Ui.dp(activity, 8));
        panel.addView(t, Ui.fill());
    }

    private void explain(LinearLayout panel, String text) {
        TextView t = Ui.text(activity, text, 13, Ui.TEXT_SOFT);
        t.setPadding(0, Ui.dp(activity, 6), 0, 0);
        panel.addView(t, Ui.fill());
    }

    interface Choice {
        void pick(int index);
    }

    interface Switch {
        void set(boolean on);
    }

    private void choices(LinearLayout panel, String[] labels, int selected, final Choice choice) {
        LinearLayout row = Ui.row(activity);
        for (int i = 0; i < labels.length; i++) {
            final int index = i;
            LinearLayout.LayoutParams lp = Ui.weighted(1);
            if (i > 0) lp.leftMargin = Ui.dp(activity, 8);
            row.addView(Ui.chip(activity, labels[i], i == selected, () -> {
                choice.pick(index);
                controller.settingsChanged();
                render();
            }), lp);
        }
        panel.addView(row, Ui.fill());
    }

    /** A row that reads "label ... On/Off". The state is spelled out, never shown by colour alone. */
    private void toggle(LinearLayout panel, String label, final boolean on, final Switch change) {
        LinearLayout row = Ui.row(activity);
        row.setMinimumHeight(Ui.dp(activity, 48));
        row.setBackground(Ui.pressable(activity, 0x00000000, Ui.dpf(activity, 10), 0));
        row.setClickable(true);
        row.setFocusable(true);
        row.setContentDescription(label + ", " + (on ? "on" : "off"));
        row.setOnClickListener(Ui.onClick(() -> {
            change.set(!on);
            render();
        }));
        row.addView(Ui.text(activity, label, 15, Ui.TEXT), Ui.weighted(1));
        TextView state = Ui.text(activity, on ? "On" : "Off", 14, on ? Ui.ACCENT : Ui.TEXT_SOFT);
        state.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        state.setPadding(Ui.dp(activity, 12), 0, 0, 0);
        row.addView(state, Ui.wrap());
        panel.addView(row, Ui.fill());
    }
}
