package app.variablenine.nudge.ui;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.Build;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.view.animation.DecelerateInterpolator;

import java.util.Collections;

import app.variablenine.nudge.core.Log;

/**
 * The reminder tab. It has two shapes:
 *
 * <ul>
 * <li>the <b>bead</b>: a small rounded tab at the screen edge with a status mark and,
 * if there is more than one reminder, a count. It never moves on its own. Research on
 * attention is clear that a looping animation in the corner of the eye stays
 * distracting, so the resting state is perfectly still;</li>
 * <li>the <b>pill</b>: the bead extended inward with two lines of text. It is shown for
 * a few seconds when there is a reason to look, then goes back to being a bead.</li>
 * </ul>
 *
 * <p>The view always occupies the size of the widest pill and only changes what it
 * draws. Changing its size on every animation frame would make the host app lay out
 * its whole screen sixty times a second.
 */
final class TabView extends View {

    interface Host {
        void onTabTapped();

        /** The finger moved this far vertically since the drag began. */
        void onTabDragged(float dy);

        /** The drag ended with the finger at this x on the screen, or NaN if it was cancelled. */
        void onTabDropped(float rawX);
    }

    /** Status marks. Shapes, not colours, carry the meaning. */
    static final int MARK_DOT = 0;
    static final int MARK_RING = 1;
    static final int MARK_QUESTION = 2;
    static final int MARK_PLUS = 3;
    static final int MARK_CHECK = 4;

    private static final long EXTEND_MS = 220;
    private static final long RETRACT_MS = 180;
    private static final long BREATH_MS = 600;

    private final Host host;
    private final float beadWidth;
    private final float radius;
    private final float touchWidth;
    private final int touchSlop;

    private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint outlinePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint markPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint linePaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint subPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint countPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();

    private boolean sideRight = true;
    private int mark = MARK_DOT;
    private int count;
    private String line = "";
    private String sub = "";
    private String shownLine = "";
    private String shownSub = "";
    private boolean lineCut;
    private float pillWidth;

    /** 0 is the bead, 1 the fully extended pill. */
    private float extension;
    private float markScale = 1f;
    private ValueAnimator extensionAnimator;
    private ValueAnimator breathAnimator;

    private float downRawX;
    private float downRawY;
    private boolean dragging;

    TabView(Context context, Host host) {
        super(context);
        this.host = host;
        beadWidth = Ui.dpf(context, 22);
        radius = Ui.dpf(context, 14);
        touchWidth = Ui.dpf(context, 44);
        touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();

        fillPaint.setColor(Ui.SURFACE);
        fillPaint.setAlpha(236);
        outlinePaint.setStyle(Paint.Style.STROKE);
        outlinePaint.setStrokeWidth(Math.max(1f, Ui.dpf(context, 1)));
        outlinePaint.setColor(Ui.OUTLINE);
        markPaint.setColor(Ui.ACCENT);
        markPaint.setStrokeCap(Paint.Cap.ROUND);
        markPaint.setStrokeJoin(Paint.Join.ROUND);
        linePaint.setColor(Ui.TEXT);
        linePaint.setTextSize(Ui.sp(context, 15));
        linePaint.setTypeface(Typeface.DEFAULT);
        subPaint.setColor(Ui.TEXT_SOFT);
        subPaint.setTextSize(Ui.sp(context, 12));
        subPaint.setTypeface(Typeface.DEFAULT);
        countPaint.setColor(Ui.TEXT);
        countPaint.setTextSize(Ui.sp(context, 11));
        countPaint.setTextAlign(Paint.Align.CENTER);
        countPaint.setTypeface(Typeface.DEFAULT_BOLD);

        setClickable(true);
        setFocusable(false);
        setHapticFeedbackEnabled(true);
    }

    // region content

    void setSide(boolean right) {
        if (sideRight != right) {
            sideRight = right;
            excludeFromBackGesture();
            invalidate();
        }
    }

    void setMark(int mark, int count) {
        if (this.mark != mark || this.count != count) {
            this.mark = mark;
            this.count = count;
            invalidate();
        }
    }

    void setLines(String line, String sub) {
        this.line = line == null ? "" : line;
        this.sub = sub == null ? "" : sub;
        fitText();
        invalidate();
    }

    /** True if the first line did not fit and was shortened. Such a pill is shown a little longer. */
    boolean isLineCut() {
        return lineCut;
    }

    boolean isExtended() {
        return extension > 0.01f;
    }

    private void fitText() {
        int width = getWidth();
        if (width <= 0) return;
        float padding = Ui.dpf(getContext(), 16);
        float room = width - beadWidth - padding - Ui.dpf(getContext(), 6);
        shownLine = TextUtils.ellipsize(line, linePaint, room, TextUtils.TruncateAt.END).toString();
        shownSub = TextUtils.ellipsize(sub, subPaint, room, TextUtils.TruncateAt.END).toString();
        lineCut = !shownLine.equals(line);
        float textWidth = Math.max(linePaint.measureText(shownLine), subPaint.measureText(shownSub));
        float wanted = beadWidth + padding + Ui.dpf(getContext(), 6) + textWidth;
        pillWidth = Math.max(Math.min(width, beadWidth + Ui.dpf(getContext(), 120)), Math.min(width, wanted));
    }

    // endregion

    // region motion

    void extend() {
        animateExtension(1f, EXTEND_MS);
    }

    void retract() {
        animateExtension(0f, RETRACT_MS);
    }

    /** Back to the bead at once, e.g. when the screen goes away. */
    void reset() {
        cancelAnimations();
        extension = 0f;
        markScale = 1f;
        invalidate();
    }

    /** One slow swell of the status mark. The only motion besides the pill sliding out. */
    void breathe() {
        if (!ValueAnimator.areAnimatorsEnabled()) return;
        if (breathAnimator != null) breathAnimator.cancel();
        breathAnimator = ValueAnimator.ofFloat(1f, 1.25f, 1f);
        breathAnimator.setDuration(BREATH_MS);
        breathAnimator.addUpdateListener(a -> {
            markScale = (float) a.getAnimatedValue();
            invalidate();
        });
        breathAnimator.start();
    }

    private void animateExtension(float target, long duration) {
        if (extensionAnimator != null) extensionAnimator.cancel();
        // "Remove animations" in the system settings is honoured: the pill simply appears.
        if (!ValueAnimator.areAnimatorsEnabled() || !isAttachedToWindow()) {
            extension = target;
            invalidate();
            return;
        }
        extensionAnimator = ValueAnimator.ofFloat(extension, target);
        extensionAnimator.setDuration(duration);
        extensionAnimator.setInterpolator(new DecelerateInterpolator(1.6f));
        extensionAnimator.addUpdateListener(a -> {
            extension = (float) a.getAnimatedValue();
            invalidate();
        });
        extensionAnimator.start();
    }

    private void cancelAnimations() {
        if (extensionAnimator != null) extensionAnimator.cancel();
        if (breathAnimator != null) breathAnimator.cancel();
    }

    @Override
    protected void onDetachedFromWindow() {
        cancelAnimations();
        super.onDetachedFromWindow();
    }

    // endregion

    // region drawing

    @Override
    protected void onSizeChanged(int w, int h, int oldW, int oldH) {
        super.onSizeChanged(w, h, oldW, oldH);
        fitText();
    }

    @Override
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        excludeFromBackGesture();
    }

    private void excludeFromBackGesture() {
        try {
            if (getWidth() == 0) return;
            if (Build.VERSION.SDK_INT >= 29) {
                // Without this the system's back swipe would win every drag that starts on the tab.
                int w = getWidth();
                Rect grab = sideRight
                        ? new Rect((int) (w - touchWidth), 0, w, getHeight())
                        : new Rect(0, 0, (int) touchWidth, getHeight());
                setSystemGestureExclusionRects(Collections.singletonList(grab));
            }
        } catch (Throwable t) {
            Log.w("gesture exclusion failed", t);
        }
    }

    private float visibleWidth() {
        return beadWidth + (pillWidth - beadWidth) * extension;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        try {
            draw2(canvas);
        } catch (Throwable t) {
            Log.w("tab draw failed", t);
        }
    }

    private void draw2(Canvas canvas) {
        float w = getWidth();
        float h = getHeight();
        float visible = visibleWidth();
        float inset = outlinePaint.getStrokeWidth() / 2f;

        // The outer side runs off the edge of the screen, so only the inner corners are round.
        if (sideRight) rect.set(w - visible + inset, inset, w + radius, h - inset);
        else rect.set(-radius, inset, visible - inset, h - inset);
        canvas.drawRoundRect(rect, radius, radius, fillPaint);
        canvas.drawRoundRect(rect, radius, radius, outlinePaint);

        float markX = sideRight ? w - beadWidth / 2f : beadWidth / 2f;
        boolean showCount = count > 1 && mark != MARK_CHECK;
        float markY = showCount ? h * 0.36f : h / 2f;
        drawMark(canvas, markX, markY);
        if (showCount) {
            String label = count > 9 ? "9+" : String.valueOf(count);
            canvas.drawText(label, markX, h * 0.36f + Ui.dpf(getContext(), 19), countPaint);
        }

        if (extension > 0.35f && !shownLine.isEmpty()) {
            int alpha = Math.round(255 * Math.min(1f, (extension - 0.35f) / 0.5f));
            float pad = Ui.dpf(getContext(), 16);
            float textLeft = sideRight ? w - pillWidth + pad : beadWidth + Ui.dpf(getContext(), 6);
            int save = canvas.save();
            canvas.clipRect(rect);
            linePaint.setAlpha(alpha);
            subPaint.setAlpha(Math.round(alpha * 0.66f));
            if (shownSub.isEmpty()) {
                canvas.drawText(shownLine, textLeft, h / 2f - (linePaint.ascent() + linePaint.descent()) / 2f,
                        linePaint);
            } else {
                canvas.drawText(shownLine, textLeft, h * 0.44f, linePaint);
                canvas.drawText(shownSub, textLeft, h * 0.80f, subPaint);
            }
            canvas.restoreToCount(save);
        }
    }

    private void drawMark(Canvas canvas, float cx, float cy) {
        float unit = Ui.dpf(getContext(), 5) * markScale;
        markPaint.setColor(mark == MARK_CHECK ? Ui.POSITIVE : Ui.ACCENT);
        switch (mark) {
            case MARK_RING:
                markPaint.setStyle(Paint.Style.STROKE);
                markPaint.setStrokeWidth(Ui.dpf(getContext(), 2));
                canvas.drawCircle(cx, cy, unit, markPaint);
                break;
            case MARK_QUESTION: {
                markPaint.setStyle(Paint.Style.FILL);
                countPaint.setColor(Ui.ACCENT);
                float size = countPaint.getTextSize();
                countPaint.setTextSize(Ui.sp(getContext(), 15) * markScale);
                canvas.drawText("?", cx, cy - (countPaint.ascent() + countPaint.descent()) / 2f, countPaint);
                countPaint.setTextSize(size);
                countPaint.setColor(Ui.TEXT);
                break;
            }
            case MARK_PLUS:
                markPaint.setStyle(Paint.Style.STROKE);
                markPaint.setStrokeWidth(Ui.dpf(getContext(), 2));
                canvas.drawLine(cx - unit, cy, cx + unit, cy, markPaint);
                canvas.drawLine(cx, cy - unit, cx, cy + unit, markPaint);
                break;
            case MARK_CHECK:
                markPaint.setStyle(Paint.Style.STROKE);
                markPaint.setStrokeWidth(Ui.dpf(getContext(), 2.2f));
                canvas.drawLine(cx - unit, cy, cx - unit * 0.25f, cy + unit * 0.75f, markPaint);
                canvas.drawLine(cx - unit * 0.25f, cy + unit * 0.75f, cx + unit, cy - unit * 0.7f, markPaint);
                break;
            case MARK_DOT:
            default:
                markPaint.setStyle(Paint.Style.FILL);
                canvas.drawCircle(cx, cy, unit, markPaint);
                break;
        }
    }

    // endregion

    // region touch

    /** Only the drawn shape (padded to a comfortable finger size) takes touches. */
    private boolean hits(float x, float y) {
        if (y < 0 || y > getHeight()) return false;
        float reach = Math.max(visibleWidth(), touchWidth);
        return sideRight ? x >= getWidth() - reach : x <= reach;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        try {
            return handleTouch(event);
        } catch (Throwable t) {
            Log.w("tab touch failed", t);
            return false;
        }
    }

    private boolean handleTouch(MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                // Anything outside the shape belongs to the app underneath.
                if (!hits(event.getX(), event.getY())) return false;
                downRawX = event.getRawX();
                downRawY = event.getRawY();
                dragging = false;
                return true;
            case MotionEvent.ACTION_MOVE: {
                float dx = event.getRawX() - downRawX;
                float dy = event.getRawY() - downRawY;
                if (!dragging && (Math.abs(dy) > touchSlop || Math.abs(dx) > touchSlop * 2)) {
                    dragging = true;
                    ViewParent parent = getParent();
                    if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
                }
                if (dragging) host.onTabDragged(dy);
                return true;
            }
            case MotionEvent.ACTION_UP:
                if (dragging) {
                    dragging = false;
                    host.onTabDropped(event.getRawX());
                } else {
                    performClick();
                }
                return true;
            case MotionEvent.ACTION_CANCEL:
                if (dragging) {
                    dragging = false;
                    host.onTabDropped(Float.NaN);
                }
                return true;
            default:
                return true;
        }
    }

    /**
     * The view is as wide as the widest pill, but only the drawn shape is "there". Without
     * this a screen reader or a mouse could not reach what lies under the empty part.
     */
    @Override
    public boolean dispatchHoverEvent(MotionEvent event) {
        try {
            return hits(event.getX(), event.getY()) && super.dispatchHoverEvent(event);
        } catch (Throwable t) {
            return false;
        }
    }

    @Override
    public boolean performClick() {
        super.performClick();
        Ui.safely(host::onTabTapped);
        return true;
    }

    // endregion
}
