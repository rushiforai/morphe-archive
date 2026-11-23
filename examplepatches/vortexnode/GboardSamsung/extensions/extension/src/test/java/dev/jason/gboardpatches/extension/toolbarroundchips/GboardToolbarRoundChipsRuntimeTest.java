package dev.jason.gboardpatches.extension.toolbarroundchips;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
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
public final class GboardToolbarRoundChipsRuntimeTest {
    private Context context;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        GboardToolbarRoundChipsRuntime.resetForTesting();
        GboardToolbarRoundChipsSettings.invalidateCache();
    }

    @After
    public void tearDown() {
        GboardToolbarRoundChipsRuntime.resetForTesting();
        GboardToolbarRoundChipsSettings.invalidateCache();
    }

    @Test
    public void disabledByDefaultAttachesNoOverlayViaRealAfterSoftKeyBind() {
        ToolbarSlot slot = createAccessPointSlot(48, 42, Color.WHITE);
        Assert.assertFalse(GboardToolbarRoundChipsSettings.DEFAULT_TOOLBAR_ROUND_CHIPS_ENABLED);

        GboardToolbarRoundChipsRuntime.afterSoftKeyBind(slot.root);

        Assert.assertFalse(GboardToolbarRoundChipsRuntime.isChipAttachedForTesting(slot.root));
        Assert.assertNull(GboardToolbarRoundChipsRuntime.computeGeometry(slot.root, slot.bgView));
    }

    @Test
    public void drawableHasValidBoundsAndPreservesStockBackground() {
        Drawable stockRipple = new ColorDrawable(Color.TRANSPARENT);
        ToolbarSlot slot = createAccessPointSlot(48, 42, 0xFF8AB4F8);
        slot.bgView.setBackground(stockRipple);
        GboardToolbarRoundChipsRuntime.setSettingEnabledPredicateForTesting(v -> true);
        GboardToolbarRoundChipsRuntime.setActiveThemeSpecProviderForTesting(c -> "system_auto:");

        GboardToolbarRoundChipsRuntime.afterSoftKeyBind(slot.root);

        Assert.assertTrue(GboardToolbarRoundChipsRuntime.isChipAttachedForTesting(slot.root));
        Assert.assertSame(stockRipple, slot.bgView.getBackground());

        GboardToolbarRoundChipsRuntime.ChipGeometry geometry =
                GboardToolbarRoundChipsRuntime.computeGeometry(slot.root, slot.bgView);
        Assert.assertNotNull(geometry);
        // Preserves tinted icon RGB with subtle alpha on dark surface.
        Assert.assertEquals(Color.red(0xFF8AB4F8), Color.red(geometry.color));
        Assert.assertEquals(Color.green(0xFF8AB4F8), Color.green(geometry.color));
        Assert.assertEquals(Color.blue(0xFF8AB4F8), Color.blue(geometry.color));
        Assert.assertTrue(Color.alpha(geometry.color) > 0 && Color.alpha(geometry.color) < 64);

        GboardToolbarRoundChipsRuntime.RoundChipOverlayDrawable drawable =
                new GboardToolbarRoundChipsRuntime.RoundChipOverlayDrawable(slot.root, slot.bgView);
        drawable.setBounds(0, 0, slot.bgView.getWidth(), slot.bgView.getHeight());

        Bitmap bitmap = Bitmap.createBitmap(
                slot.bgView.getWidth(), slot.bgView.getHeight(), Bitmap.Config.ARGB_8888);
        try {
            Canvas canvas = new Canvas(bitmap);
            drawable.draw(canvas);
            Assert.assertTrue("Expected non-empty drawable bounds", drawable.getBounds().width() > 0);
            Assert.assertTrue("Expected non-empty drawable bounds", drawable.getBounds().height() > 0);
            Assert.assertTrue("Expected a visible chip radius", geometry.radius > 0f);
            Assert.assertTrue("Expected a translucent chip color", Color.alpha(geometry.color) > 0);
        } finally {
            bitmap.recycle();
        }
    }

    @Test
    public void adaptsColorBetweenStandardLightDarkAndDynamicColorThemes() {
        GboardToolbarRoundChipsRuntime.setSettingEnabledPredicateForTesting(v -> true);

        ToolbarSlot lightSlot = createAccessPointSlot(48, 42, Color.BLACK);
        ToolbarSlot darkSlot = createAccessPointSlot(48, 42, Color.WHITE);

        // 1. Standard Light / System Auto Light -> crisp pure white matching Rambler mic + subtle border.
        GboardToolbarRoundChipsRuntime.setActiveThemeSpecProviderForTesting(c -> "system_auto:");
        Assert.assertFalse(GboardToolbarRoundChipsRuntime.isDynamicColorThemeSelected(context));
        GboardToolbarRoundChipsRuntime.ChipGeometry stdLight =
                GboardToolbarRoundChipsRuntime.computeGeometry(lightSlot.root, lightSlot.bgView);
        Assert.assertNotNull(stdLight);
        Assert.assertEquals(Color.WHITE, stdLight.color);
        Assert.assertNotEquals(0, stdLight.strokeColor);
        Assert.assertTrue(stdLight.strokeWidth > 0f);

        // 2. Standard Dark / System Auto Dark -> neutral translucent dark surface, no stroke.
        GboardToolbarRoundChipsRuntime.ChipGeometry stdDark =
                GboardToolbarRoundChipsRuntime.computeGeometry(darkSlot.root, darkSlot.bgView);
        Assert.assertNotNull(stdDark);
        Assert.assertEquals(38, Color.alpha(stdDark.color));
        Assert.assertEquals(0, stdDark.strokeColor);

        // Explicit static/custom themes remain non-dynamic.
        GboardToolbarRoundChipsRuntime.setActiveThemeSpecProviderForTesting(
                c -> "assets:theme_package_metadata_material_light.binarypb");
        Assert.assertFalse(GboardToolbarRoundChipsRuntime.isDynamicColorThemeSelected(context));
        GboardToolbarRoundChipsRuntime.setActiveThemeSpecProviderForTesting(
                c -> "files:Samsung_OneUI8_Light.zip");
        Assert.assertFalse(GboardToolbarRoundChipsRuntime.isDynamicColorThemeSelected(context));

        // 3. Dynamic Color (absent default key on Android 12+ OR silk:) -> Material You palette.
        GboardToolbarRoundChipsRuntime.setActiveThemeSpecProviderForTesting(c -> null);
        Assert.assertTrue(GboardToolbarRoundChipsRuntime.isDynamicColorThemeSelected(context));
        GboardToolbarRoundChipsRuntime.setActiveThemeSpecProviderForTesting(c -> "silk:material3_light");
        Assert.assertTrue(GboardToolbarRoundChipsRuntime.isDynamicColorThemeSelected(context));
        int expectedDynLight = context.getResources().getColor(
                android.R.color.system_accent1_100, context.getTheme());
        GboardToolbarRoundChipsRuntime.ChipGeometry dynLight =
                GboardToolbarRoundChipsRuntime.computeGeometry(lightSlot.root, lightSlot.bgView);
        Assert.assertNotNull(dynLight);
        Assert.assertEquals(255, Color.alpha(dynLight.color));
        Assert.assertEquals(Color.red(expectedDynLight), Color.red(dynLight.color));
        Assert.assertEquals(Color.green(expectedDynLight), Color.green(dynLight.color));
        Assert.assertEquals(Color.blue(expectedDynLight), Color.blue(dynLight.color));
        Assert.assertEquals(0, dynLight.strokeColor);

        GboardToolbarRoundChipsRuntime.setActiveThemeSpecProviderForTesting(
                c -> "silk:");
        Assert.assertTrue(GboardToolbarRoundChipsRuntime.isDynamicColorThemeSelected(context));
        int expectedDynDark = context.getResources().getColor(
                android.R.color.system_accent2_700, context.getTheme());
        GboardToolbarRoundChipsRuntime.ChipGeometry dynDark =
                GboardToolbarRoundChipsRuntime.computeGeometry(darkSlot.root, darkSlot.bgView);
        Assert.assertNotNull(dynDark);
        Assert.assertEquals(240, Color.alpha(dynDark.color));
        Assert.assertEquals(Color.red(expectedDynDark), Color.red(dynDark.color));
        Assert.assertEquals(Color.green(expectedDynDark), Color.green(dynDark.color));
        Assert.assertEquals(Color.blue(expectedDynDark), Color.blue(dynDark.color));
        Assert.assertEquals(0, dynDark.strokeColor);
    }

    @Test
    public void rendersChipsForThreeToEightAccessPointsAndExcludesTextPills() {
        GboardToolbarRoundChipsRuntime.setSettingEnabledPredicateForTesting(v -> true);

        // Wide icon-only Access Point slots when toolbar holds 3, 4, or 5 items (aspect > 1.6).
        ToolbarSlot threeItemSlot = createAccessPointSlot(110, 32, Color.WHITE);
        ToolbarSlot fourItemSlot = createAccessPointSlot(78, 32, Color.WHITE);
        ToolbarSlot fiveItemSlot = createAccessPointSlot(62, 32, Color.WHITE);

        // Hidden or empty TextView inside an Access Point slot must NOT suppress the chip.
        TextView hiddenLabel = new TextView(context);
        hiddenLabel.setText("Hidden");
        hiddenLabel.setVisibility(View.GONE);
        threeItemSlot.root.addView(hiddenLabel);
        layoutView(threeItemSlot.root, 110, 32);

        GboardToolbarRoundChipsRuntime.ChipGeometry threeGeom =
                GboardToolbarRoundChipsRuntime.computeGeometry(threeItemSlot.root, threeItemSlot.bgView);
        GboardToolbarRoundChipsRuntime.ChipGeometry fourGeom =
                GboardToolbarRoundChipsRuntime.computeGeometry(fourItemSlot.root, fourItemSlot.bgView);
        GboardToolbarRoundChipsRuntime.ChipGeometry fiveGeom =
                GboardToolbarRoundChipsRuntime.computeGeometry(fiveItemSlot.root, fiveItemSlot.bgView);

        Assert.assertNotNull("3-item wide toolbar slot must render a round chip", threeGeom);
        Assert.assertNotNull("4-item wide toolbar slot must render a round chip", fourGeom);
        Assert.assertNotNull("5-item wide toolbar slot must render a round chip", fiveGeom);
        Assert.assertTrue(
                "Chip diameter should closely fill bgTarget height to match mic circle",
                threeGeom.radius * 2f >= 31.0f);

        // Sparse vs dense/one-handed narrow slot adapts diameter cleanly.
        ToolbarSlot sparseSlot = createAccessPointSlot(64, 44, Color.BLACK);
        ToolbarSlot denseSlot = createAccessPointSlot(34, 44, Color.BLACK);
        ToolbarSlot tinySlot = createAccessPointSlot(20, 44, Color.BLACK);

        GboardToolbarRoundChipsRuntime.ChipGeometry sparse =
                GboardToolbarRoundChipsRuntime.computeGeometry(sparseSlot.root, sparseSlot.bgView);
        GboardToolbarRoundChipsRuntime.ChipGeometry dense =
                GboardToolbarRoundChipsRuntime.computeGeometry(denseSlot.root, denseSlot.bgView);

        Assert.assertNotNull(sparse);
        Assert.assertNotNull(dense);
        Assert.assertTrue(
                "Dense narrow slot should produce a smaller radius than sparse slot",
                dense.radius < sparse.radius);
        Assert.assertNull(
                GboardToolbarRoundChipsRuntime.computeGeometry(tinySlot.root, tinySlot.bgView));

        // Clipboard/suggestion text pill with a visible non-empty TextView is excluded.
        ToolbarSlot textClipboardChip = createAccessPointSlot(180, 40, Color.BLACK);
        TextView visibleLabel = new TextView(context);
        visibleLabel.setText("Copied snippet");
        visibleLabel.setVisibility(View.VISIBLE);
        textClipboardChip.root.addView(visibleLabel);
        layoutView(textClipboardChip.root, 180, 40);

        GboardToolbarRoundChipsRuntime.afterSoftKeyBind(textClipboardChip.root);
        Assert.assertFalse(
                GboardToolbarRoundChipsRuntime.isChipAttachedForTesting(textClipboardChip.root));
        Assert.assertNull(
                GboardToolbarRoundChipsRuntime.computeGeometry(
                        textClipboardChip.root, textClipboardChip.bgView));
    }

    @Test
    public void excludesRamblerActionKeyMenuGridAndCandidates() {
        GboardToolbarRoundChipsRuntime.setSettingEnabledPredicateForTesting(v -> true);

        // 1. Rambler voice button (.background-icon.for-action-key.for-action-default-key)
        FrameLayout rambler = new FrameLayout(context);
        ImageView ramblerBg = new ImageView(context);
        ramblerBg.setTag(".background-icon.for-action-key.for-action-default-key");
        rambler.addView(ramblerBg);
        layoutView(rambler, 44, 44);
        GboardToolbarRoundChipsRuntime.afterSoftKeyBind(rambler);
        Assert.assertFalse(GboardToolbarRoundChipsRuntime.isChipAttachedForTesting(rambler));

        // 2. Menu grid button ⊞ (.access-point-entry-menu-icon.item-ripple)
        FrameLayout menuGrid = new FrameLayout(context);
        ImageView menuIcon = new ImageView(context);
        menuIcon.setTag(".access-point-entry-menu-icon.item-ripple");
        menuGrid.addView(menuIcon);
        layoutView(menuGrid, 44, 44);
        GboardToolbarRoundChipsRuntime.afterSoftKeyBind(menuGrid);
        Assert.assertFalse(GboardToolbarRoundChipsRuntime.isChipAttachedForTesting(menuGrid));

        // 3. Candidate strip ancestor (.candidates-area)
        FrameLayout candidatesArea = new FrameLayout(context);
        candidatesArea.setTag(".candidates-area");
        ToolbarSlot insideCandidates = createAccessPointSlot(44, 44, Color.WHITE);
        candidatesArea.addView(insideCandidates.root);
        layoutView(candidatesArea, 200, 44);
        GboardToolbarRoundChipsRuntime.afterSoftKeyBind(insideCandidates.root);
        Assert.assertFalse(
                GboardToolbarRoundChipsRuntime.isChipAttachedForTesting(insideCandidates.root));
    }

    @Test
    public void detachesImmediatelyOnRecyclingAndPreferenceDisable() {
        ToolbarSlot slot = createAccessPointSlot(48, 42, Color.WHITE);
        GboardToolbarRoundChipsRuntime.setSettingEnabledPredicateForTesting(v -> true);

        GboardToolbarRoundChipsRuntime.afterSoftKeyBind(slot.root);
        Assert.assertTrue(GboardToolbarRoundChipsRuntime.isChipAttachedForTesting(slot.root));

        // Disable in Settings -> detached immediately.
        GboardToolbarRoundChipsRuntime.onPreferenceChanged(false);
        Assert.assertFalse(GboardToolbarRoundChipsRuntime.isChipAttachedForTesting(slot.root));

        // Re-enable, then simulate recycling into non-toolbar key.
        GboardToolbarRoundChipsRuntime.onPreferenceChanged(true);
        Assert.assertTrue(GboardToolbarRoundChipsRuntime.isChipAttachedForTesting(slot.root));

        slot.bgView.setTag(".keytop");
        GboardToolbarRoundChipsRuntime.afterSoftKeyBind(slot.root);
        Assert.assertFalse(GboardToolbarRoundChipsRuntime.isChipAttachedForTesting(slot.root));
    }

    private ToolbarSlot createAccessPointSlot(int width, int height, int iconTintColor) {
        FrameLayout root = new FrameLayout(context);
        View bgView = new View(context);
        bgView.setTag(".access-point-bar-item-ripple-background.item-ripple");
        root.addView(bgView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        ImageView iconView = new ImageView(context);
        iconView.setTag(".icon.for-access-point-icon.non-linear-scale");
        iconView.setImageTintList(ColorStateList.valueOf(iconTintColor));
        root.addView(iconView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        layoutView(root, width, height);
        return new ToolbarSlot(root, bgView);
    }

    private static void layoutView(View view, int width, int height) {
        int wSpec = View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY);
        int hSpec = View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY);
        view.measure(wSpec, hSpec);
        view.layout(0, 0, width, height);
    }

    private static final class ToolbarSlot {
        final FrameLayout root;
        final View bgView;

        ToolbarSlot(FrameLayout root, View bgView) {
            this.root = root;
            this.bgView = bgView;
        }
    }

    @Test
    public void menuGridChipWrapsAndUnwrapsCleanlyWithFixedRamblerStyleAndSkipsExpandedState() {
        Drawable stockRipple = new ColorDrawable(Color.TRANSPARENT);
        FrameLayout softKey = new FrameLayout(context);
        FrameLayout menuFrame = new FrameLayout(context);
        menuFrame.setTag(".access-point-entry-menu-icon.item-ripple");
        menuFrame.setBackground(stockRipple);
        ImageView icon = new ImageView(context);
        icon.setTag(".icon.for-access-point-icon.entry.non-linear-scale");
        icon.setImageTintList(ColorStateList.valueOf(Color.BLACK));
        menuFrame.addView(icon);
        softKey.addView(menuFrame, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        layoutView(softKey, 44, 44);

        // Off by default via real afterSoftKeyBind.
        GboardToolbarRoundChipsRuntime.afterSoftKeyBind(softKey);
        Assert.assertFalse(GboardToolbarRoundChipsRuntime.isMenuChipAttachedForTesting(softKey));
        Assert.assertSame(stockRipple, menuFrame.getBackground());

        // Enable menu grid chip independently (even in Dynamic Color theme, color stays fixed white!).
        GboardToolbarRoundChipsRuntime.setMenuGridEnabledPredicateForTesting(v -> true);
        GboardToolbarRoundChipsRuntime.setActiveThemeSpecProviderForTesting(c -> null);
        GboardToolbarRoundChipsRuntime.afterSoftKeyBind(softKey);

        Assert.assertTrue(GboardToolbarRoundChipsRuntime.isMenuChipAttachedForTesting(softKey));
        Assert.assertTrue(menuFrame.getBackground() instanceof GboardToolbarRoundChipsRuntime.MenuChipLayerDrawable);
        Assert.assertEquals(1, menuFrame.getChildCount());
        Assert.assertSame(icon, menuFrame.getChildAt(0));

        GboardToolbarRoundChipsRuntime.ChipGeometry lightGeom =
                GboardToolbarRoundChipsRuntime.computeMenuGridGeometry(softKey, menuFrame);
        Assert.assertNotNull(lightGeom);
        Assert.assertEquals(Color.WHITE, lightGeom.color);
        Assert.assertTrue(lightGeom.radius * 2f <= 38.01f);

        // Expanded (✕) selected/activated state skips drawing our layer so native circle stays clean.
        softKey.setSelected(true);
        Assert.assertNull(GboardToolbarRoundChipsRuntime.computeMenuGridGeometry(softKey, menuFrame));
        softKey.setSelected(false);

        // Disable unwraps exact stockBackground cleanly.
        GboardToolbarRoundChipsRuntime.onMenuGridPreferenceChanged(false);
        Assert.assertFalse(GboardToolbarRoundChipsRuntime.isMenuChipAttachedForTesting(softKey));
        Assert.assertSame(stockRipple, menuFrame.getBackground());
    }
}
