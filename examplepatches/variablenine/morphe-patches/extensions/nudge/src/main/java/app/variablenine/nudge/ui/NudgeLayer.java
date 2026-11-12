package app.variablenine.nudge.ui;

import android.app.Activity;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;

import app.variablenine.nudge.core.Log;
import app.variablenine.nudge.core.Prefs;

/**
 * A see-through sheet over one screen of the host app. Its only content is the
 * reminder tab; everywhere else it lets every touch through to the app underneath.
 *
 * <p>It is added as the last child of the window's root view, so it sits above the
 * app's own content without being part of it, and survives the app swapping its
 * content around.
 */
final class NudgeLayer extends FrameLayout implements TabView.Host {

    interface Host {
        void onTabTapped(Activity activity);

        /** Something that decides whether the tab may be shown has changed (fullscreen, keyboard, size). */
        void onSurroundingsChanged(Activity activity);
    }

    private static final float TAB_HEIGHT_DP = 52;

    final TabView tab;
    private final Activity activity;
    private final Host host;
    private final Prefs prefs;
    private float dragOffset;

    NudgeLayer(Activity activity, Host host) {
        super(activity);
        this.activity = activity;
        this.host = host;
        this.prefs = Prefs.get(activity);

        // The sheet itself is nothing: not a touch target, not a focus stop, not read out.
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        tab = new TabView(activity, this);
        tab.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        tab.setVisibility(View.GONE);
        addView(tab, new LayoutParams(Ui.dp(activity, 300), Ui.dp(activity, TAB_HEIGHT_DP)));
    }

    // region placement

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        try {
            // The tab is as wide as the widest pill may get, decided before it is measured.
            int width = MeasureSpec.getSize(widthSpec);
            int widest = Math.max(Ui.dp(activity, 120),
                    Math.min(width - Ui.dp(activity, 32), Ui.dp(activity, 340)));
            tab.getLayoutParams().width = widest;
        } catch (Throwable t) {
            Log.w("layer measure failed", t);
        }
        super.onMeasure(widthSpec, heightSpec);
    }

    @Override
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        try {
            place();
            if (changed) host.onSurroundingsChanged(activity);
        } catch (Throwable t) {
            Log.w("layer layout failed", t);
        }
    }

    @Override
    public WindowInsets onApplyWindowInsets(WindowInsets insets) {
        try {
            place();
            host.onSurroundingsChanged(activity);
        } catch (Throwable t) {
            Log.w("layer insets failed", t);
        }
        // Handed on untouched: this sheet must not change how the app sees the screen edges.
        return insets;
    }

    /** Puts the tab where the user left it, clear of the status bar, navigation bar and cut-outs. */
    void place() {
        int width = getWidth();
        int height = getHeight();
        if (width == 0 || height == 0) return;
        int[] edge = edges();
        float tabHeight = Ui.dpf(activity, TAB_HEIGHT_DP);
        float margin = Ui.dpf(activity, 8);
        float top = edge[1] + margin;
        float bottom = Math.max(top, height - edge[3] - margin - tabHeight);
        float y = top + prefs.yFraction() * (bottom - top) + dragOffset;
        tab.setY(Math.max(top, Math.min(bottom, y)));

        boolean right = prefs.sideRight();
        tab.setSide(right);
        tab.setX(right ? width - edge[2] - tab.getLayoutParams().width : edge[0]);
    }

    /** Space taken by system bars and display cut-outs: left, top, right, bottom. */
    private int[] edges() {
        int[] out = new int[4];
        WindowInsets insets = getRootWindowInsets();
        if (insets == null) return out;
        if (Build.VERSION.SDK_INT >= 30) {
            android.graphics.Insets i = insets.getInsetsIgnoringVisibility(
                    WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            out[0] = i.left;
            out[1] = i.top;
            out[2] = i.right;
            out[3] = i.bottom;
        } else {
            out[0] = insets.getSystemWindowInsetLeft();
            out[1] = insets.getSystemWindowInsetTop();
            out[2] = insets.getSystemWindowInsetRight();
            out[3] = insets.getSystemWindowInsetBottom();
        }
        return out;
    }

    /**
     * True while the tab would be in the way: fullscreen video, picture-in-picture, a
     * window too small to spare the room, or the keyboard being up.
     */
    boolean obstructed() {
        try {
            if (activity.isInPictureInPictureMode()) return true;
            int small = Ui.dp(activity, 240);
            if (getWidth() > 0 && (getWidth() < small || getHeight() < small)) return true;
            WindowInsets insets = getRootWindowInsets();
            if (insets == null) return false;
            if (Build.VERSION.SDK_INT >= 30) {
                // Apps hide the status bar for fullscreen video. That is the cue to step aside.
                if (!insets.isVisible(WindowInsets.Type.statusBars())) return true;
                return insets.isVisible(WindowInsets.Type.ime());
            }
            return (getWindowSystemUiVisibility() & View.SYSTEM_UI_FLAG_FULLSCREEN) != 0;
        } catch (Throwable t) {
            return false;
        }
    }

    // endregion

    // region the tab reporting touches

    @Override
    public void onTabTapped() {
        host.onTabTapped(activity);
    }

    @Override
    public void onTabDragged(float dy) {
        dragOffset = dy;
        place();
    }

    @Override
    public void onTabDropped(float rawX) {
        int[] edge = edges();
        float tabHeight = Ui.dpf(activity, TAB_HEIGHT_DP);
        float margin = Ui.dpf(activity, 8);
        float top = edge[1] + margin;
        float bottom = Math.max(top, getHeight() - edge[3] - margin - tabHeight);
        float fraction = bottom > top ? (tab.getY() - top) / (bottom - top) : prefs.yFraction();
        boolean right = prefs.sideRight();
        if (!Float.isNaN(rawX)) {
            int[] onScreen = new int[2];
            getLocationOnScreen(onScreen);
            right = rawX - onScreen[0] >= getWidth() / 2f;
        }
        prefs.setPlacement(right, Math.max(0f, Math.min(1f, fraction)));
        dragOffset = 0;
        place();
    }

    // endregion
}
