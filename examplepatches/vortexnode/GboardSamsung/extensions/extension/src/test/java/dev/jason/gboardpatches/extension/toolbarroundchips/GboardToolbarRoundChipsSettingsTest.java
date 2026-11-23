package dev.jason.gboardpatches.extension.toolbarroundchips;

import android.content.Context;

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
public final class GboardToolbarRoundChipsSettingsTest {
    private Context context;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        GboardToolbarRoundChipsSettings.invalidateCache();
        GboardToolbarRoundChipsSettings.writeEnabled(
                context, GboardToolbarRoundChipsSettings.DEFAULT_TOOLBAR_ROUND_CHIPS_ENABLED);
        GboardToolbarRoundChipsSettings.writeMenuGridEnabled(
                context, GboardToolbarRoundChipsSettings.DEFAULT_MENU_GRID_CHIP_ENABLED);
    }

    @After
    public void tearDown() {
        GboardToolbarRoundChipsSettings.invalidateCache();
    }

    @Test
    public void defaultIsFalseAndTogglePersistsCleanly() {
        Assert.assertFalse(GboardToolbarRoundChipsSettings.DEFAULT_TOOLBAR_ROUND_CHIPS_ENABLED);
        Assert.assertFalse(GboardToolbarRoundChipsSettings.readEnabled(context));
        Assert.assertFalse(GboardToolbarRoundChipsSettings.isEnabled(context));

        Assert.assertTrue(GboardToolbarRoundChipsSettings.writeEnabled(context, true));
        Assert.assertTrue(GboardToolbarRoundChipsSettings.readEnabled(context));
        Assert.assertTrue(GboardToolbarRoundChipsSettings.isEnabled(context));

        Assert.assertTrue(GboardToolbarRoundChipsSettings.writeEnabled(context, false));
        Assert.assertFalse(GboardToolbarRoundChipsSettings.readEnabled(context));
        Assert.assertFalse(GboardToolbarRoundChipsSettings.isEnabled(context));
    }

    @Test
    public void menuGridDefaultIsFalseAndPersistsIndependently() {
        Assert.assertFalse(GboardToolbarRoundChipsSettings.DEFAULT_MENU_GRID_CHIP_ENABLED);
        Assert.assertFalse(GboardToolbarRoundChipsSettings.readMenuGridEnabled(context));
        Assert.assertFalse(GboardToolbarRoundChipsSettings.isMenuGridEnabled(context));

        Assert.assertTrue(GboardToolbarRoundChipsSettings.writeMenuGridEnabled(context, true));
        Assert.assertTrue(GboardToolbarRoundChipsSettings.readMenuGridEnabled(context));
        Assert.assertTrue(GboardToolbarRoundChipsSettings.isMenuGridEnabled(context));
        Assert.assertFalse(GboardToolbarRoundChipsSettings.readEnabled(context));

        Assert.assertTrue(GboardToolbarRoundChipsSettings.writeMenuGridEnabled(context, false));
        Assert.assertFalse(GboardToolbarRoundChipsSettings.readMenuGridEnabled(context));
        Assert.assertFalse(GboardToolbarRoundChipsSettings.isMenuGridEnabled(context));
    }
}
