package dev.jason.gboardpatches.extension.frostedglass;

import org.junit.Assert;
import org.junit.Test;

import java.util.OptionalInt;

import dev.jason.gboardpatches.extension.advancedvoice.GboardAdvancedVoiceRuntime;
import dev.jason.gboardpatches.extension.advancedvoice.GboardAdvancedVoiceRuntimeSettings;
import dev.jason.gboardpatches.extension.longpressquickactions.GboardLongPressQuickActionsRuntime;

public final class GboardAmoledAndV417UnitTest {
    public static final class FakeNavParams {
        public final int a;
        public final int b;
        public final OptionalInt c;
        public final OptionalInt d;
        public final boolean e;

        public FakeNavParams(int a, int b, OptionalInt c, OptionalInt d, boolean e) {
            this.a = a;
            this.b = b;
            this.c = c;
            this.d = d;
            this.e = e;
        }
    }

    @Test
    public void amoledBlackOnlyActivatesInNightModeWhenFrostedGlassIsOff() {
        Assert.assertTrue(GboardAmoledBlackRuntime.shouldApplyForState(true, false, true));
        Assert.assertFalse(GboardAmoledBlackRuntime.shouldApplyForState(false, false, true));
        Assert.assertFalse(GboardAmoledBlackRuntime.shouldApplyForState(true, true, true));
        Assert.assertFalse(GboardAmoledBlackRuntime.shouldApplyForState(true, false, false));
    }

    @Test
    public void amoledBlackRewritesNavBarParamsToPureBlackWithoutMutatingOriginal() throws Exception {
        FakeNavParams original = new FakeNavParams(
                0xFF1C1C22, 0xFF2A2A32, OptionalInt.of(0xFF101014), OptionalInt.empty(), true);
        FakeNavParams rewritten = (FakeNavParams) GboardAmoledBlackRuntime.rewriteNavBarParams(original);

        Assert.assertNotSame(original, rewritten);
        Assert.assertEquals(0xFF000000, rewritten.a);
        Assert.assertEquals(0xFF000000, rewritten.b);
        Assert.assertSame(original.c, rewritten.c);
        Assert.assertSame(original.d, rewritten.d);
        Assert.assertFalse(rewritten.e);
        Assert.assertEquals(0xFF1C1C22, original.a);
        Assert.assertTrue(original.e);
    }

    @Test
    public void amoledBlackTagClassificationPreservesActionKeysAndCandidates() {
        Assert.assertTrue(GboardAmoledBlackRuntime.isAmoledSurfaceTag(".keyboard-base-area"));
        Assert.assertTrue(GboardAmoledBlackRuntime.isAmoledSurfaceTag(".keyboard-base-area.keyboard-outline"));
        Assert.assertTrue(GboardAmoledBlackRuntime.isAmoledSurfaceTag(".keyboard-header-area"));
        Assert.assertTrue(GboardAmoledBlackRuntime.isAmoledSurfaceTag(".keyboard-body-area"));
        Assert.assertTrue(GboardAmoledBlackRuntime.isAmoledKeyTag(".keytop"));
        Assert.assertTrue(GboardAmoledBlackRuntime.isAmoledKeyTag(".space_bar"));
        Assert.assertFalse(GboardAmoledBlackRuntime.isAmoledKeyTag(".keytop.for-action-key"));
        Assert.assertFalse(GboardAmoledBlackRuntime.isAmoledKeyTag(".background-icon.for-action-key"));
        Assert.assertFalse(GboardAmoledBlackRuntime.isAmoledKeyTag(".keytop.for-candidate-key"));
    }

    @Test
    public void disableVoiceBeepRuntimeHonorsOverride() {
        try {
            GboardAdvancedVoiceRuntimeSettings.setDisableVoiceBeepOverrideForTest(false);
            Assert.assertFalse(GboardAdvancedVoiceRuntime.shouldSuppressVoiceBeep());
            GboardAdvancedVoiceRuntimeSettings.setDisableVoiceBeepOverrideForTest(true);
            Assert.assertTrue(GboardAdvancedVoiceRuntime.shouldSuppressVoiceBeep());
        } finally {
            GboardAdvancedVoiceRuntimeSettings.clearEnabledOverrideForTest();
        }
    }

    @Test
    public void disableEnterOneHandedOnlyBlocksLongPressSwitchToOneHandedMode() {
        Assert.assertTrue(GboardLongPressQuickActionsRuntime.shouldSuppressEnterOneHandedMode(
                "LONG_PRESS", -10057, true));
        Assert.assertFalse(GboardLongPressQuickActionsRuntime.shouldSuppressEnterOneHandedMode(
                "LONG_PRESS", -10057, false));
        Assert.assertFalse(GboardLongPressQuickActionsRuntime.shouldSuppressEnterOneHandedMode(
                "PRESS", -10057, true));
        Assert.assertFalse(GboardLongPressQuickActionsRuntime.shouldSuppressEnterOneHandedMode(
                "LONG_PRESS", 66, true));
    }
}
