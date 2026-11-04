/*
 * Zerobun Morphe patches - GPLv3.
 *
 * The on-screen capture indicator. New in v2.
 *
 * A small overlay pinned over the follower/following list while a capture is running,
 * which is exactly when the information is wanted and costs nothing when it is not.
 * It answers, in order of what matters: is capture running, how far through am I, did
 * the rows actually reach the server, did this count as complete, and if not why.
 *
 * Built as a plain Android view added to the activity's own content root, with no
 * Instagram view classes touched. That is deliberate: it is the part of the patch
 * least likely to break on an Instagram update, because it depends on nothing
 * Instagram owns beyond having an Activity.
 *
 * Deliberately NOT a toast per batch: a 968-row scroll would produce twenty toasts
 * and train you to dismiss them. Toasts are reserved for failures, once per reason.
 */

package app.zerobun.extension.followertrack;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;

@SuppressWarnings("unused")
public final class CaptureHud {

    private static final Handler UI = new Handler(Looper.getMainLooper());
    private static WeakReference<Activity> host = new WeakReference<>(null);
    private static View root;
    private static TextView headline;
    private static TextView detail;
    private static View bar;
    private static View barFill;
    private static boolean collapsed = false;

    // Colour never carries meaning alone - every state also changes the words.
    private static final int OK = Color.parseColor("#4ADE80");
    private static final int WARN = Color.parseColor("#FBBF24");
    private static final int BAD = Color.parseColor("#F87171");
    private static final int INK = Color.parseColor("#E5E7EB");
    private static final int PANEL = Color.parseColor("#E6111318");

    private CaptureHud() {}

    /** Called from the capture hook once it knows which list is on screen. */
    public static void attach(Activity activity) {
        if (activity == null) return;
        host = new WeakReference<>(activity);
        Status.setListener(CaptureHud::refresh);
        UI.post(() -> {
            try {
                build(activity);
                refresh();
            } catch (Exception ignored) {
                // A HUD that cannot be drawn must never stop the capture.
            }
        });
    }

    public static void detach() {
        Status.setListener(null);
        UI.post(() -> {
            try {
                if (root != null && root.getParent() instanceof ViewGroup) {
                    ((ViewGroup) root.getParent()).removeView(root);
                }
            } catch (Exception ignored) {
            }
            root = null;
        });
    }

    private static int dp(Activity a, float value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                a.getResources().getDisplayMetrics());
    }

    private static void build(Activity activity) {
        if (root != null && root.getParent() != null) return;
        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null) return;

        LinearLayout panel = new LinearLayout(activity);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(dp(activity, 12), dp(activity, 8), dp(activity, 12),
                dp(activity, 9));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(PANEL);
        bg.setCornerRadius(dp(activity, 12));
        panel.setBackground(bg);

        headline = new TextView(activity);
        headline.setTextColor(INK);
        headline.setTextSize(13f);
        panel.addView(headline);

        bar = new FrameLayout(activity);
        LinearLayout.LayoutParams barParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 3));
        barParams.topMargin = dp(activity, 6);
        bar.setLayoutParams(barParams);
        GradientDrawable track = new GradientDrawable();
        track.setColor(Color.parseColor("#33FFFFFF"));
        track.setCornerRadius(dp(activity, 2));
        bar.setBackground(track);
        barFill = new View(activity);
        GradientDrawable fill = new GradientDrawable();
        fill.setColor(OK);
        fill.setCornerRadius(dp(activity, 2));
        barFill.setBackground(fill);
        ((FrameLayout) bar).addView(barFill,
                new FrameLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT));
        panel.addView(bar);

        detail = new TextView(activity);
        detail.setTextColor(Color.parseColor("#94A3B8"));
        detail.setTextSize(11f);
        detail.setPadding(0, dp(activity, 4), 0, 0);
        panel.addView(detail);

        // Tap collapses to one line and back. This is only an indicator: the account
        // list, history and analysis live in the instagram-monitor dashboard and the
        // Zerobun app, not inside Instagram.
        panel.setOnClickListener(v -> {
            collapsed = !collapsed;
            refresh();
        });

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        // BOTTOM, not top. At the top it sat under the status bar on an edge-to-edge
        // activity - reported as "on my phone's status bar, can't even see it
        // properly" - and it covered the first rows of the very list being captured.
        lp.gravity = Gravity.BOTTOM;
        lp.setMargins(dp(activity, 10), 0, dp(activity, 10), dp(activity, 10));
        panel.setLayoutParams(lp);

        // Keep clear of the system bars whatever the activity does about insets. A
        // fixed margin is not enough: it is the gesture bar and status bar heights
        // that vary, and they are only known at runtime.
        panel.setOnApplyWindowInsetsListener((v, insets) -> {
            int bottom = 0;
            int top = 0;
            try {
                if (android.os.Build.VERSION.SDK_INT >= 30) {
                    android.graphics.Insets bars = insets.getInsets(
                            android.view.WindowInsets.Type.systemBars());
                    bottom = bars.bottom;
                    top = bars.top;
                } else {
                    bottom = insets.getSystemWindowInsetBottom();
                    top = insets.getSystemWindowInsetTop();
                }
            } catch (Throwable ignored) {
            }
            FrameLayout.LayoutParams p = (FrameLayout.LayoutParams) v.getLayoutParams();
            p.bottomMargin = dp(activity, 10) + bottom;
            p.topMargin = dp(activity, 10) + top;
            v.setLayoutParams(p);
            return insets;
        });
        panel.requestApplyInsets();

        content.addView(panel);
        root = panel;
    }

    private static void refresh() {
        UI.post(() -> {
            if (root == null || headline == null) return;
            Activity activity = host.get();
            if (activity == null) return;

            boolean show = Status.isActive();
            root.setVisibility(show ? View.VISIBLE : View.GONE);
            if (!show) return;

            headline.setText(Status.headline());

            Status.Upload upload = Status.getUpload();
            int accent = Status.isComplete() ? OK
                    : (upload == Status.Upload.FAILED ? BAD
                       : (upload == Status.Upload.QUEUED ? WARN : INK));
            headline.setTextColor(accent);

            String line = Status.uploadLine();
            // When the list reached its end but fell short of the profile's count, say
            // so plainly - the server will treat it as partial, and the user needs to
            // know the scroll has to be redone rather than believing it is captured.
            if (!Status.isComplete() && Status.getExpected() > 0
                    && Status.getCaptured() > 0 && !Status.serverWouldAccept()) {
                line = (line.isEmpty() ? "" : line + "  -  ")
                        + "not enough of the list yet to count as complete";
            }
            detail.setText(line);
            detail.setVisibility(collapsed || line.isEmpty() ? View.GONE : View.VISIBLE);

            int want = Status.getExpected();
            int have = Status.getCaptured();
            if (collapsed || want <= 0) {
                bar.setVisibility(View.GONE);
            } else {
                bar.setVisibility(View.VISIBLE);
                int width = root.getWidth() - dp(activity, 24);
                float fraction = Math.min(1f, have / (float) want);
                ViewGroup.LayoutParams lp = barFill.getLayoutParams();
                lp.width = Math.max(dp(activity, 2), (int) (width * fraction));
                barFill.setLayoutParams(lp);
                ((GradientDrawable) barFill.getBackground()).setColor(accent);
            }
        });
    }
}
