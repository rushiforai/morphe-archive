package dev.jason.gboardpatches.extension.spacebargesture;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.ConscryptMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
@ConscryptMode(ConscryptMode.Mode.OFF)
public final class GboardSpacebarChevronRuntimeTest {
    private Context context;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        GboardSpacebarChevronRuntime.resetForTesting();
        GboardSpacebarGestureSettings.invalidateCache();
    }

    @After
    public void tearDown() {
        GboardSpacebarChevronRuntime.resetForTesting();
        GboardSpacebarGestureSettings.invalidateCache();
    }

    @Test
    public void disabledByDefaultAttachesNoOverlayAndLeavesTextViewUntouched() {
        KeycapPair pair = createKeycap("Русский", 480, 80, Color.BLACK,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        Assert.assertFalse(
                GboardSpacebarGestureSettings.DEFAULT_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED);
        GboardSpacebarChevronRuntime.setTestPredicates(v -> true, null);

        GboardSpacebarChevronRuntime.afterSoftKeyBind(pair.container);

        Assert.assertFalse(GboardSpacebarChevronRuntime.isOverlayAttachedForTesting(pair.container));
        Assert.assertNull(GboardSpacebarChevronRuntime.computeGeometry(pair.container));
        Assert.assertNull(pair.label.getCompoundDrawables()[0]);
        Assert.assertNull(pair.label.getCompoundDrawables()[2]);
    }

    @Test
    public void wideSpacebarWithWrapContentLabelComputesSymmetricChevronsInTextColor() {
        KeycapPair pair = createKeycap("English (US)", 480, 80, Color.WHITE,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        GboardSpacebarChevronRuntime.setTestPredicates(v -> true, v -> true);

        GboardSpacebarChevronRuntime.applyToSoftKeyView(pair.container, true, true);

        Assert.assertTrue(GboardSpacebarChevronRuntime.isOverlayAttachedForTesting(pair.container));
        GboardSpacebarChevronRuntime.ChevronGeometry geometry =
                GboardSpacebarChevronRuntime.computeGeometry(pair.container);
        Assert.assertNotNull(geometry);
        Assert.assertEquals(Color.WHITE, geometry.color);
        Assert.assertTrue(geometry.leftChevronX > 0f);
        Assert.assertTrue(geometry.rightChevronX > geometry.leftChevronX);
        // Stock TextView compound drawables remain completely untouched.
        Assert.assertNull(pair.label.getCompoundDrawables()[0]);
        Assert.assertNull(pair.label.getCompoundDrawables()[2]);
    }

    @Test
    public void chevronOverlayDrawableEmitsChevronPathsToCanvas() {
        KeycapPair pair = createKeycap("English (US)", 480, 80, Color.WHITE,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        GboardSpacebarChevronRuntime.setTestPredicates(v -> true, v -> true);

        GboardSpacebarChevronRuntime.ChevronOverlayDrawable drawable =
                new GboardSpacebarChevronRuntime.ChevronOverlayDrawable(pair.container);
        drawable.setBounds(0, 0, pair.container.getWidth(), pair.container.getHeight());

        RecordingCanvas canvas = new RecordingCanvas();
        drawable.draw(canvas);

        Assert.assertEquals("Expected both chevrons in one path", 1, canvas.drawPathCalls);
        Assert.assertFalse("Expected a non-empty chevron path", canvas.pathWasEmpty);
        Assert.assertEquals(Color.WHITE, canvas.color);
        Assert.assertTrue("Expected a visible stroke width", canvas.strokeWidth > 0f);
        Assert.assertEquals(Paint.Style.STROKE, canvas.paintStyle);
    }

    private static final class RecordingCanvas extends Canvas {
        int drawPathCalls;
        boolean pathWasEmpty = true;
        int color;
        float strokeWidth;
        Paint.Style paintStyle;

        @Override
        public void drawPath(Path path, Paint paint) {
            drawPathCalls++;
            pathWasEmpty = path.isEmpty();
            color = paint.getColor();
            strokeWidth = paint.getStrokeWidth();
            paintStyle = paint.getStyle();
        }
    }

    @Test
    public void emptyLabelHidesChevrons() {
        KeycapPair pair = createKeycap("   ", 480, 80, Color.BLACK,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        GboardSpacebarChevronRuntime.setTestPredicates(v -> true, v -> true);

        GboardSpacebarChevronRuntime.applyToSoftKeyView(pair.container, true, true);

        Assert.assertNull(GboardSpacebarChevronRuntime.computeGeometry(pair.container));
    }

    @Test
    public void narrowKeycapHidesChevronsSafely() {
        KeycapPair pair = createKeycap("English (United Kingdom)", 60, 80, Color.BLACK,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        GboardSpacebarChevronRuntime.setTestPredicates(v -> true, v -> true);

        GboardSpacebarChevronRuntime.applyToSoftKeyView(pair.container, true, true);

        Assert.assertNull(GboardSpacebarChevronRuntime.computeGeometry(pair.container));
    }

    @Test
    public void recyclingToNonSpaceKeyAndDisablingSettingDetachOverlayImmediately() {
        KeycapPair pair = createKeycap("Русский", 480, 80, Color.BLACK,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        GboardSpacebarChevronRuntime.setTestPredicates(v -> true, v -> true);

        GboardSpacebarChevronRuntime.applyToSoftKeyView(pair.container, true, true);
        Assert.assertTrue(GboardSpacebarChevronRuntime.isOverlayAttachedForTesting(pair.container));

        // Recycled for another key -> overlay removed immediately.
        GboardSpacebarChevronRuntime.applyToSoftKeyView(pair.container, false, true);
        Assert.assertFalse(GboardSpacebarChevronRuntime.isOverlayAttachedForTesting(pair.container));

        // Re-attached on spacebar, then disabled via Settings callback -> overlay removed.
        GboardSpacebarChevronRuntime.applyToSoftKeyView(pair.container, true, true);
        Assert.assertTrue(GboardSpacebarChevronRuntime.isOverlayAttachedForTesting(pair.container));
        GboardSpacebarChevronRuntime.onChevronsPreferenceChanged(false);
        Assert.assertFalse(GboardSpacebarChevronRuntime.isOverlayAttachedForTesting(pair.container));
    }

    @Test
    public void existingStockDrawablesOnLabelAreNeverModified() {
        Drawable stockLeft = new ColorDrawable(Color.BLUE);
        KeycapPair pair = createKeycap("Русский", 480, 80, Color.BLACK,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        pair.label.setCompoundDrawables(stockLeft, null, null, null);
        GboardSpacebarChevronRuntime.setTestPredicates(v -> true, v -> true);

        GboardSpacebarChevronRuntime.applyToSoftKeyView(pair.container, true, true);

        Assert.assertSame(stockLeft, pair.label.getCompoundDrawables()[0]);
        Assert.assertNull(pair.label.getCompoundDrawables()[2]);
    }

    private KeycapPair createKeycap(
            String text, int width, int height, int textColor, int labelWidth) {
        FrameLayout container = new FrameLayout(context);
        View spaceBar = new View(context);
        spaceBar.setTag(".space_bar");
        container.addView(spaceBar, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        TextView label = new TextView(context);
        label.setText(text);
        label.setTextColor(textColor);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                labelWidth, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.gravity = Gravity.CENTER;
        container.addView(label, lp);

        int widthSpec = View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY);
        int heightSpec = View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY);
        container.measure(widthSpec, heightSpec);
        container.layout(0, 0, width, height);
        return new KeycapPair(container, label);
    }

    private static final class KeycapPair {
        final FrameLayout container;
        final TextView label;

        KeycapPair(FrameLayout container, TextView label) {
            this.container = container;
            this.label = label;
        }
    }
}
