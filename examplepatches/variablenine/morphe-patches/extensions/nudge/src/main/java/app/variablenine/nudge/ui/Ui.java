package app.variablenine.nudge.ui;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.variablenine.nudge.core.Log;

/**
 * Colours, sizes and the few building blocks the reminder views are made of.
 *
 * <p>Everything is built in code and nothing is taken from the host app's theme or
 * resources: the same views have to look right inside YouTube and inside Reddit, in
 * their light and dark themes, and must not break when either app changes its styles.
 *
 * <p>One always-dark palette. The reminders are often read in a dark room, where a
 * light panel would glare; a dark panel is just as readable in daylight. The accent is
 * a soft amber: no saturated red or blue, and nothing ever flashes.
 */
final class Ui {

    static final int SURFACE = 0xFF26272B;
    static final int CARD = 0xFF2B2C31;
    static final int FIELD = 0xFF1E1F22;
    static final int OUTLINE = 0x29FFFFFF;
    static final int TEXT = 0xFFECE7DC;
    static final int TEXT_SOFT = 0xA8ECE7DC;
    static final int ACCENT = 0xFFE2B659;
    static final int ON_ACCENT = 0xFF201A0A;
    static final int POSITIVE = 0xFF9CC9A0;
    static final int DIVIDER = 0x1AFFFFFF;
    static final int PRESSED = 0x33FFFFFF;

    private Ui() {
    }

    static int dp(Context c, float value) {
        return Math.round(dpf(c, value));
    }

    static float dpf(Context c, float value) {
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                c.getResources().getDisplayMetrics());
    }

    static float sp(Context c, float value) {
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, value,
                c.getResources().getDisplayMetrics());
    }

    /** Runs UI code that must never take the host app down with it. */
    static void safely(Runnable r) {
        try {
            r.run();
        } catch (Throwable t) {
            Log.w("ui action failed", t);
        }
    }

    static View.OnClickListener onClick(final Runnable r) {
        return v -> safely(r);
    }

    static GradientDrawable shape(int fill, float radius, int stroke, int strokeWidth) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(fill);
        d.setCornerRadius(radius);
        if (strokeWidth > 0) d.setStroke(strokeWidth, stroke);
        return d;
    }

    /** A background that answers a touch with a soft highlight. */
    static Drawable pressable(Context c, int fill, float radius, int stroke) {
        GradientDrawable base = shape(fill, radius, stroke, stroke == 0 ? 0 : dp(c, 1));
        GradientDrawable mask = shape(0xFFFFFFFF, radius, 0, 0);
        return new RippleDrawable(ColorStateList.valueOf(PRESSED), base, mask);
    }

    static TextView text(Context c, CharSequence value, float sizeSp, int color) {
        TextView t = new TextView(c);
        t.setText(value);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sizeSp);
        t.setTextColor(color);
        t.setTypeface(Typeface.DEFAULT);
        t.setLineSpacing(dpf(c, 2), 1f);
        t.setIncludeFontPadding(true);
        // Host themes like to set these; a reminder should read as plain text.
        t.setAllCaps(false);
        t.setLetterSpacing(0f);
        return t;
    }

    /** The main action: filled with the accent colour. */
    static TextView filledButton(Context c, String label, Runnable action) {
        TextView b = button(c, label, ON_ACCENT, action);
        b.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        b.setBackground(pressable(c, ACCENT, dpf(c, 14), 0));
        return b;
    }

    /** A secondary action: an outline, no fill. */
    static TextView outlineButton(Context c, String label, Runnable action) {
        TextView b = button(c, label, TEXT, action);
        b.setBackground(pressable(c, 0x00000000, dpf(c, 14), OUTLINE));
        return b;
    }

    /** The quietest action: just words. */
    static TextView textButton(Context c, String label, Runnable action) {
        TextView b = button(c, label, TEXT_SOFT, action);
        b.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        b.setBackground(pressable(c, 0x00000000, dpf(c, 12), 0));
        b.setPadding(dp(c, 12), 0, dp(c, 12), 0);
        return b;
    }

    /** A small choice inside a row of choices. The selected one is filled. */
    static TextView chip(Context c, String label, boolean selected, Runnable action) {
        TextView b = button(c, label, selected ? ON_ACCENT : TEXT, action);
        b.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        b.setMinHeight(dp(c, 44));
        b.setMinimumHeight(dp(c, 44));
        b.setPadding(dp(c, 8), 0, dp(c, 8), 0);
        b.setBackground(selected
                ? pressable(c, ACCENT, dpf(c, 22), 0)
                : pressable(c, 0x00000000, dpf(c, 22), OUTLINE));
        if (selected) b.setContentDescription(label + ", selected");
        return b;
    }

    private static TextView button(Context c, String label, int color, Runnable action) {
        TextView b = text(c, label, 15, color);
        b.setGravity(Gravity.CENTER);
        b.setSingleLine(true);
        b.setEllipsize(TextUtils.TruncateAt.END);
        b.setMinHeight(dp(c, 48));
        b.setMinimumHeight(dp(c, 48));
        b.setPadding(dp(c, 16), 0, dp(c, 16), 0);
        b.setClickable(true);
        b.setFocusable(true);
        b.setOnClickListener(onClick(action));
        return b;
    }

    static LinearLayout column(Context c) {
        LinearLayout l = new LinearLayout(c);
        l.setOrientation(LinearLayout.VERTICAL);
        return l;
    }

    static LinearLayout row(Context c) {
        LinearLayout l = new LinearLayout(c);
        l.setOrientation(LinearLayout.HORIZONTAL);
        l.setGravity(Gravity.CENTER_VERTICAL);
        return l;
    }

    static View divider(Context c) {
        View v = new View(c);
        v.setBackgroundColor(DIVIDER);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(c, 1)));
        lp.topMargin = dp(c, 12);
        lp.bottomMargin = dp(c, 8);
        v.setLayoutParams(lp);
        return v;
    }

    static View space(Context c, int heightDp) {
        View v = new View(c);
        v.setLayoutParams(new LinearLayout.LayoutParams(1, dp(c, heightDp)));
        return v;
    }

    static LinearLayout.LayoutParams fill() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    static LinearLayout.LayoutParams wrap() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    /**
     * For a text button at the start of a row: pulls it left by its own padding, so its
     * words line up with the text above while the touch area stays finger sized.
     */
    static LinearLayout.LayoutParams lead(Context c) {
        LinearLayout.LayoutParams lp = wrap();
        lp.leftMargin = -dp(c, 12);
        return lp;
    }

    /** The same for a text button at the end of a row. */
    static LinearLayout.LayoutParams trail(Context c) {
        LinearLayout.LayoutParams lp = wrap();
        lp.rightMargin = -dp(c, 12);
        return lp;
    }

    /** Takes a share of the row's width. */
    static LinearLayout.LayoutParams weighted(float weight) {
        return new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, weight);
    }
}
