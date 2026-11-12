package app.variablenine.nudge.ui;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;

import app.variablenine.nudge.core.Log;
import app.variablenine.nudge.core.TaskStore;

/**
 * A panel in the middle of the screen over a dimmed background: the frame shared by
 * the reminder card and the settings. Tapping outside it, or pressing back, closes it.
 *
 * <p>It is a real dialog window rather than a view inside the host app's screen, so
 * the back button, focus and screen readers behave the way they do for any dialog.
 */
abstract class SheetDialog extends Dialog implements TaskStore.Listener {

    /** A scroll view that stops growing at a set height, so a long panel scrolls instead of overflowing. */
    private static final class CappedScroll extends ScrollView {
        private final int maxHeight;

        CappedScroll(Activity activity, int maxHeight) {
            super(activity);
            this.maxHeight = maxHeight;
        }

        @Override
        protected void onMeasure(int widthSpec, int heightSpec) {
            int available = MeasureSpec.getSize(heightSpec);
            int cap = available > 0 ? Math.min(available, maxHeight) : maxHeight;
            super.onMeasure(widthSpec, MeasureSpec.makeMeasureSpec(cap, MeasureSpec.AT_MOST));
        }
    }

    protected final Activity activity;
    protected final OverlayController controller;
    protected final LinearLayout panel;

    SheetDialog(Activity activity, OverlayController controller) {
        super(activity, android.R.style.Theme_Translucent_NoTitleBar);
        this.activity = activity;
        this.controller = controller;

        int windowWidth = activity.getResources().getDisplayMetrics().widthPixels;
        int windowHeight = activity.getResources().getDisplayMetrics().heightPixels;
        View decor = activity.getWindow().getDecorView();
        if (decor.getWidth() > 0) windowWidth = decor.getWidth();
        if (decor.getHeight() > 0) windowHeight = decor.getHeight();

        panel = Ui.column(activity);
        int pad = Ui.dp(activity, 16);
        panel.setPadding(pad, Ui.dp(activity, 10), pad, Ui.dp(activity, 10));

        CappedScroll scroll = new CappedScroll(activity, Math.round(windowHeight * 0.74f));
        scroll.setBackground(Ui.shape(Ui.CARD, Ui.dpf(activity, 20), Ui.OUTLINE, Ui.dp(activity, 1)));
        scroll.setClipToOutline(true);
        scroll.setElevation(Ui.dpf(activity, 10));
        scroll.setVerticalScrollBarEnabled(false);
        // A soft fade at the cut-off edge shows that there is more to scroll to.
        scroll.setVerticalFadingEdgeEnabled(true);
        scroll.setFadingEdgeLength(Ui.dp(activity, 28));
        scroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        scroll.setFillViewport(false);
        // Taps on the panel itself must not fall through to the "tap outside to close" area.
        scroll.setClickable(true);
        scroll.addView(panel, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        FrameLayout root = new FrameLayout(activity) {
            @Override
            protected void onConfigurationChanged(android.content.res.Configuration newConfig) {
                super.onConfigurationChanged(newConfig);
                // The panel was sized for the screen as it was. After a rotation it is
                // simpler and safer to close than to keep a panel that no longer fits.
                Ui.safely(SheetDialog.this::dismiss);
            }
        };
        root.setFitsSystemWindows(true);
        root.setOnClickListener(Ui.onClick(this::dismiss));
        root.setContentDescription("Close");
        int width = Math.min(windowWidth - Ui.dp(activity, 32), Ui.dp(activity, 420));
        root.addView(scroll, new FrameLayout.LayoutParams(Math.max(width, Ui.dp(activity, 200)),
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        setContentView(root);
        setCanceledOnTouchOutside(true);

        Window window = getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setDimAmount(0.4f);
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }
    }

    /** Fills the panel. Called when the dialog opens and again whenever its content has to change. */
    protected abstract void build(LinearLayout panel);

    protected final void render() {
        try {
            panel.removeAllViews();
            build(panel);
            // Nothing to show (the last reminder was just finished elsewhere, say): close.
            // Posted, because a dialog cannot be dismissed while it is still opening.
            if (panel.getChildCount() == 0) panel.post(() -> Ui.safely(this::dismiss));
        } catch (Throwable t) {
            Log.w("panel build failed", t);
            dismiss();
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        try {
            TaskStore.get(activity).addListener(this);
            render();
        } catch (Throwable t) {
            Log.w("panel start failed", t);
        }
    }

    @Override
    protected void onStop() {
        try {
            TaskStore.get(activity).removeListener(this);
        } catch (Throwable t) {
            Log.w("panel stop failed", t);
        }
        super.onStop();
    }

    @Override
    public void onTasksChanged(int origin) {
        // Something changed underneath an open panel (a reminder arrived, another app finished one).
        if (isShowing()) render();
    }
}
