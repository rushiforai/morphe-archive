package dev.jason.gboardpatches.extension.spacebargesture;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOverlay;
import android.view.ViewParent;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.Predicate;

/**
 * Passive visual decorator that renders Samsung-style {@code <} and {@code >} language-switch
 * chevrons near the left and right edges of Gboard's spacebar using {@link View#getOverlay()}.
 *
 * <p>Using {@link ViewOverlay} avoids depending on Gboard's custom {@code AutoSizeTextView}
 * drawing {@code CompoundDrawables}, never alters touch/gesture handling, never calls
 * {@link View#requestLayout()}, and never mutates the spacebar's text or background.
 */
public final class GboardSpacebarChevronRuntime {
    private static final String SPACE_BAR_TAG = ".space_bar";
    private static final String SPACE_BAR_TAG_PREFIX = ".space_bar.";

    private static final float MIN_KEYCAP_WIDTH_DP = 72.0f;
    private static final float MIN_KEYCAP_HEIGHT_DP = 20.0f;
    private static final float CHEVRON_WIDTH_DP = 5.5f;
    private static final float CHEVRON_HEIGHT_DP = 9.5f;
    private static final float STROKE_WIDTH_DP = 1.65f;
    private static final float EDGE_INSET_RATIO = 0.11f;
    private static final float MIN_EDGE_INSET_DP = 10.0f;
    private static final float MAX_EDGE_INSET_DP = 20.0f;
    private static final float MIN_TEXT_GAP_DP = 6.0f;

    private static final Map<View, AttachedOverlay> ATTACHED_OVERLAYS = new WeakHashMap<>();
    private static final Map<View, Boolean> KNOWN_SPACE_VIEWS = new WeakHashMap<>();

    private static volatile Predicate<View> spaceKeyPredicate =
            GboardSpacebarKeyHitTester::isSpaceSoftKeyView;
    private static volatile Predicate<View> settingEnabledPredicate =
            view -> GboardSpacebarGestureSettings.isSpacebarLanguageChevronsEnabled(
                    view.getContext());

    private GboardSpacebarChevronRuntime() {}

    /** Separate after-stock runtime entry point for the bound SoftKeyView. */
    public static void afterSoftKeyBind(View softKeyView) {
        if (softKeyView == null) return;
        try {
            boolean isSpaceKey = spaceKeyPredicate.test(softKeyView);
            boolean enabled = settingEnabledPredicate.test(softKeyView);
            applyToSoftKeyView(softKeyView, isSpaceKey, enabled);
        } catch (Throwable ignored) {
            // A decorative feature must never break Gboard's key binding or layout.
        }
    }

    /** Immediately detaches or re-evaluates overlays when the Settings toggle changes. */
    public static void onChevronsPreferenceChanged(boolean enabled) {
        Runnable update = () -> {
            if (!enabled) {
                List<View> hosts;
                synchronized (ATTACHED_OVERLAYS) {
                    hosts = new ArrayList<>(ATTACHED_OVERLAYS.keySet());
                }
                for (View host : hosts) {
                    if (host != null) {
                        detachOverlay(host);
                    }
                }
                return;
            }
            List<View> candidates;
            synchronized (KNOWN_SPACE_VIEWS) {
                candidates = new ArrayList<>(KNOWN_SPACE_VIEWS.keySet());
            }
            for (View host : candidates) {
                if (host != null) {
                    applyToSoftKeyView(host, spaceKeyPredicate.test(host), true);
                }
            }
        };

        try {
            Looper mainLooper = Looper.getMainLooper();
            if (mainLooper != null && Looper.myLooper() != mainLooper) {
                new Handler(mainLooper).post(update);
                return;
            }
        } catch (Throwable ignored) {
            // Keep synchronous fallback usable in JVM unit tests.
        }
        update.run();
    }

    static void applyToSoftKeyView(
            View softKeyView, boolean isSpaceKey, boolean chevronsEnabled) {
        if (softKeyView == null) return;
        if (!isSpaceKey) {
            synchronized (KNOWN_SPACE_VIEWS) {
                KNOWN_SPACE_VIEWS.remove(softKeyView);
            }
            detachOverlay(softKeyView);
            return;
        }

        synchronized (KNOWN_SPACE_VIEWS) {
            KNOWN_SPACE_VIEWS.put(softKeyView, Boolean.TRUE);
        }

        if (!chevronsEnabled) {
            detachOverlay(softKeyView);
            return;
        }

        attachOrUpdateOverlay(softKeyView);
    }

    private static void attachOrUpdateOverlay(View host) {
        ViewOverlay overlay = host.getOverlay();
        if (overlay == null) return;

        AttachedOverlay existing;
        synchronized (ATTACHED_OVERLAYS) {
            existing = ATTACHED_OVERLAYS.get(host);
        }

        int width = Math.max(0, host.getWidth());
        int height = Math.max(0, host.getHeight());
        if (existing != null) {
            existing.drawable.setBounds(0, 0, width, height);
            host.invalidate();
            return;
        }

        ChevronOverlayDrawable drawable = new ChevronOverlayDrawable(host);
        drawable.setBounds(0, 0, width, height);
        View.OnLayoutChangeListener layoutListener = (v, l, t, r, b, ol, ot, or, ob) -> {
            drawable.setBounds(0, 0, Math.max(0, r - l), Math.max(0, b - t));
            v.invalidate();
        };

        overlay.add(drawable);
        host.addOnLayoutChangeListener(layoutListener);
        synchronized (ATTACHED_OVERLAYS) {
            ATTACHED_OVERLAYS.put(host, new AttachedOverlay(drawable, layoutListener));
        }
        host.invalidate();
    }

    private static void detachOverlay(View host) {
        AttachedOverlay attached;
        synchronized (ATTACHED_OVERLAYS) {
            attached = ATTACHED_OVERLAYS.remove(host);
        }
        if (attached == null) return;
        try {
            host.removeOnLayoutChangeListener(attached.layoutListener);
        } catch (Throwable ignored) {
            // Ignore detached view edge cases.
        }
        try {
            ViewOverlay overlay = host.getOverlay();
            if (overlay != null) {
                overlay.remove(attached.drawable);
            }
        } catch (Throwable ignored) {
            // Ignore detached view edge cases.
        }
        host.invalidate();
    }

    static ChevronGeometry computeGeometry(View host) {
        if (host == null || host.getVisibility() != View.VISIBLE) return null;
        if (!settingEnabledPredicate.test(host) || !spaceKeyPredicate.test(host)) return null;

        TextView labelView = findPrimarySpaceLabel(host);
        if (labelView == null) return null;
        CharSequence rawText = labelView.getText();
        if (TextUtils.isEmpty(rawText)) return null;
        String text = rawText.toString().trim();
        if (text.isEmpty()) return null;

        RectF keycap = resolveKeycapBoundsInHost(host);
        if (keycap == null) return null;

        float density = resolveDensity(host);
        float keycapWidth = keycap.width();
        float keycapHeight = keycap.height();
        if (keycapWidth < MIN_KEYCAP_WIDTH_DP * density
                || keycapHeight < MIN_KEYCAP_HEIGHT_DP * density) {
            return null;
        }

        TextPaint textPaint = labelView.getPaint();
        if (textPaint == null) return null;
        float textWidth = textPaint.measureText(text);
        if (textWidth <= 0f) return null;

        float chevronWidth = Math.max(1f, CHEVRON_WIDTH_DP * density);
        float chevronHeight = Math.max(1f, CHEVRON_HEIGHT_DP * density);
        float strokeWidth = Math.max(1f, STROKE_WIDTH_DP * density);
        float edgeInset = clamp(
                keycapWidth * EDGE_INSET_RATIO,
                MIN_EDGE_INSET_DP * density,
                MAX_EDGE_INSET_DP * density);
        float minTextGap = MIN_TEXT_GAP_DP * density;

        float centerX = keycap.centerX();
        float textLeft = centerX - textWidth * 0.5f;
        float textRight = centerX + textWidth * 0.5f;

        float leftChevronX = keycap.left + edgeInset;
        float leftChevronRight = leftChevronX + chevronWidth;
        float rightChevronRight = keycap.right - edgeInset;
        float rightChevronX = rightChevronRight - chevronWidth;

        if (leftChevronRight + minTextGap > textLeft || rightChevronX - minTextGap < textRight) {
            return null;
        }

        RectF labelRect = resolveViewBoundsInHost(host, labelView);
        float centerY = (labelRect != null && labelRect.height() > 0f)
                ? clamp(labelRect.centerY(),
                        keycap.top + chevronHeight * 0.5f + strokeWidth,
                        keycap.bottom - chevronHeight * 0.5f - strokeWidth)
                : keycap.centerY();

        return new ChevronGeometry(
                leftChevronX,
                rightChevronX,
                centerY - chevronHeight * 0.5f,
                chevronWidth,
                chevronHeight,
                strokeWidth,
                labelView.getCurrentTextColor());
    }

    private static RectF resolveKeycapBoundsInHost(View host) {
        View spaceBarView = findSpaceBarKeycap(host);
        if (spaceBarView != null && spaceBarView != host) {
            RectF rect = resolveViewBoundsInHost(host, spaceBarView);
            if (rect != null && rect.width() > 0f && rect.height() > 0f) {
                return rect;
            }
        }
        int width = host.getWidth();
        int height = host.getHeight();
        if (width <= 0 || height <= 0) return null;
        float left = host.getPaddingLeft();
        float top = host.getPaddingTop();
        float right = width - host.getPaddingRight();
        float bottom = height - host.getPaddingBottom();
        if (right <= left || bottom <= top) return null;
        return new RectF(left, top, right, bottom);
    }

    private static View findSpaceBarKeycap(View root) {
        if (root == null || root.getVisibility() != View.VISIBLE) return null;
        Object tag = root.getTag();
        if (tag instanceof String tagText
                && (SPACE_BAR_TAG.equals(tagText) || tagText.startsWith(SPACE_BAR_TAG_PREFIX))) {
            return root;
        }
        if (root instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findSpaceBarKeycap(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static TextView findPrimarySpaceLabel(View root) {
        if (root == null || root.getVisibility() != View.VISIBLE) return null;
        if (root instanceof TextView textView) {
            CharSequence text = textView.getText();
            return !TextUtils.isEmpty(text) && !text.toString().trim().isEmpty() ? textView : null;
        }
        if (root instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = findPrimarySpaceLabel(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static RectF resolveViewBoundsInHost(View host, View target) {
        if (target == null || target.getWidth() <= 0 || target.getHeight() <= 0) return null;
        float x = 0f;
        float y = 0f;
        View current = target;
        while (current != null && current != host) {
            x += current.getX();
            y += current.getY();
            ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        if (current != host) return null;
        return new RectF(x, y, x + target.getWidth(), y + target.getHeight());
    }

    private static float resolveDensity(View view) {
        try {
            Resources resources = view.getResources();
            if (resources != null && resources.getDisplayMetrics() != null
                    && resources.getDisplayMetrics().density > 0f) {
                return resources.getDisplayMetrics().density;
            }
        } catch (Throwable ignored) {
            // Use density-independent test fallback.
        }
        return 1f;
    }

    private static float clamp(float value, float min, float max) {
        return Math.max(min, Math.min(max, value));
    }

    static boolean isOverlayAttachedForTesting(View host) {
        synchronized (ATTACHED_OVERLAYS) {
            return ATTACHED_OVERLAYS.containsKey(host);
        }
    }

    static void setTestPredicates(Predicate<View> spacePredicate, Predicate<View> enabledPredicate) {
        spaceKeyPredicate = spacePredicate != null
                ? spacePredicate
                : GboardSpacebarKeyHitTester::isSpaceSoftKeyView;
        settingEnabledPredicate = enabledPredicate != null
                ? enabledPredicate
                : view -> GboardSpacebarGestureSettings.isSpacebarLanguageChevronsEnabled(
                        view.getContext());
    }

    static void resetForTesting() {
        List<View> hosts;
        synchronized (ATTACHED_OVERLAYS) {
            hosts = new ArrayList<>(ATTACHED_OVERLAYS.keySet());
        }
        for (View host : hosts) {
            if (host != null) detachOverlay(host);
        }
        synchronized (KNOWN_SPACE_VIEWS) {
            KNOWN_SPACE_VIEWS.clear();
        }
        setTestPredicates(null, null);
    }

    private static final class AttachedOverlay {
        final ChevronOverlayDrawable drawable;
        final View.OnLayoutChangeListener layoutListener;

        AttachedOverlay(
                ChevronOverlayDrawable drawable,
                View.OnLayoutChangeListener layoutListener) {
            this.drawable = drawable;
            this.layoutListener = layoutListener;
        }
    }

    static final class ChevronGeometry {
        final float leftChevronX;
        final float rightChevronX;
        final float topY;
        final float width;
        final float height;
        final float strokeWidth;
        final int color;

        ChevronGeometry(
                float leftChevronX,
                float rightChevronX,
                float topY,
                float width,
                float height,
                float strokeWidth,
                int color) {
            this.leftChevronX = leftChevronX;
            this.rightChevronX = rightChevronX;
            this.topY = topY;
            this.width = width;
            this.height = height;
            this.strokeWidth = strokeWidth;
            this.color = color;
        }
    }

    static final class ChevronOverlayDrawable extends Drawable {
        private final WeakReference<View> hostRef;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        ChevronOverlayDrawable(View host) {
            this.hostRef = new WeakReference<>(host);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            View host = hostRef.get();
            if (host == null) return;
            ChevronGeometry geometry = computeGeometry(host);
            if (geometry == null) return;

            paint.setColor(geometry.color);
            paint.setStrokeWidth(geometry.strokeWidth);

            float inset = geometry.strokeWidth * 0.5f;
            float top = geometry.topY + inset;
            float bottom = geometry.topY + geometry.height - inset;
            float midY = (top + bottom) * 0.5f;

            float leftInner = geometry.leftChevronX + inset;
            float leftOuter = geometry.leftChevronX + geometry.width - inset;
            float rightInner = geometry.rightChevronX + inset;
            float rightOuter = geometry.rightChevronX + geometry.width - inset;

            path.reset();
            // Left chevron (<)
            path.moveTo(leftOuter, top);
            path.lineTo(leftInner, midY);
            path.lineTo(leftOuter, bottom);
            // Right chevron (>)
            path.moveTo(rightInner, top);
            path.lineTo(rightOuter, midY);
            path.lineTo(rightInner, bottom);

            canvas.drawPath(path, paint);
        }

        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter colorFilter) { paint.setColorFilter(colorFilter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}