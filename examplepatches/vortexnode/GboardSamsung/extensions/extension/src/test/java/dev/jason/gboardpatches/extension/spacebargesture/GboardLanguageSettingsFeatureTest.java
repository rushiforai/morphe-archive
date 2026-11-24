package dev.jason.gboardpatches.extension.spacebargesture;

import android.content.Context;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.ConscryptMode;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsTestHost;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
@ConscryptMode(ConscryptMode.Mode.OFF)
public final class GboardLanguageSettingsFeatureTest {
    private Context context;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        GboardPatchesSettings.preferences(context).edit().clear().commit();
        GboardSpacebarGestureSettings.invalidateCache();
    }

    @Test
    public void subTogglesDefaultToSamsungAreMutuallyExclusiveAndDependOnMaster() {
        AtomicInteger refreshCount = new AtomicInteger();
        GboardPatchesSettingsTestHost host = new GboardPatchesSettingsTestHost() {
            @Override
            public Context getContext() {
                return context;
            }

            @Override
            public void refresh() {
                refreshCount.incrementAndGet();
            }
        };

        GboardLanguageSettingsFeature feature = new GboardLanguageSettingsFeature(context);
        GboardPatchesSettingsContract.Screen screen = feature.buildScreen(host);
        List<GboardPatchesSettingsContract.Row> rows = screen.getSections().get(0).getItems();
        Assert.assertEquals(6, rows.size());

        GboardPatchesSettingsContract.ToggleRow master =
                (GboardPatchesSettingsContract.ToggleRow) rows.get(0);
        GboardPatchesSettingsContract.ToggleRow samsung =
                (GboardPatchesSettingsContract.ToggleRow) rows.get(1);
        GboardPatchesSettingsContract.ToggleRow gboard =
                (GboardPatchesSettingsContract.ToggleRow) rows.get(2);
        GboardPatchesSettingsContract.ToggleRow free =
                (GboardPatchesSettingsContract.ToggleRow) rows.get(3);

        Assert.assertTrue(master.isChecked());
        Assert.assertTrue(samsung.isEnabled());
        Assert.assertTrue(samsung.isChecked());
        Assert.assertTrue(gboard.isEnabled());
        Assert.assertFalse(gboard.isChecked());
        Assert.assertTrue(free.isEnabled());
        Assert.assertFalse(free.isChecked());
        Assert.assertNotNull(samsung.getPreviewSpec());
        Assert.assertNotNull(gboard.getPreviewSpec());
        Assert.assertNotNull(free.getPreviewSpec());

        // Enabling Gboard turns off Samsung
        gboard.getToggleAction().accept(true);
        Assert.assertEquals(
                GboardSpacebarGestureSettings.SWIPE_MODE_GBOARD,
                GboardSpacebarGestureSettings.readSpacebarLanguageSwipeMode(context));
        Assert.assertTrue(refreshCount.get() >= 1);

        // Manually turning off Gboard automatically falls back to default Samsung One UI
        GboardPatchesSettingsContract.Screen afterGboard = feature.buildScreen(host);
        GboardPatchesSettingsContract.ToggleRow gboardActive =
                (GboardPatchesSettingsContract.ToggleRow)
                        afterGboard.getSections().get(0).getItems().get(2);
        Assert.assertTrue(gboardActive.isChecked());
        gboardActive.getToggleAction().accept(false);
        Assert.assertEquals(
                GboardSpacebarGestureSettings.SWIPE_MODE_SAMSUNG,
                GboardSpacebarGestureSettings.readSpacebarLanguageSwipeMode(context));

        // Trying to turn off Samsung One UI keeps Samsung One UI active
        GboardPatchesSettingsContract.Screen afterFallback = feature.buildScreen(host);
        GboardPatchesSettingsContract.ToggleRow samsungActive =
                (GboardPatchesSettingsContract.ToggleRow)
                        afterFallback.getSections().get(0).getItems().get(1);
        Assert.assertTrue(samsungActive.isChecked());
        samsungActive.getToggleAction().accept(false);
        Assert.assertEquals(
                GboardSpacebarGestureSettings.SWIPE_MODE_SAMSUNG,
                GboardSpacebarGestureSettings.readSpacebarLanguageSwipeMode(context));

        // Disabling master greys out all 3 sub-toggles
        master.getToggleAction().accept(false);
        GboardPatchesSettingsContract.Screen disabledScreen = feature.buildScreen(host);
        List<GboardPatchesSettingsContract.Row> disabledRows =
                disabledScreen.getSections().get(0).getItems();
        Assert.assertFalse(((GboardPatchesSettingsContract.ToggleRow) disabledRows.get(1)).isEnabled());
        Assert.assertFalse(((GboardPatchesSettingsContract.ToggleRow) disabledRows.get(2)).isEnabled());
        Assert.assertFalse(((GboardPatchesSettingsContract.ToggleRow) disabledRows.get(3)).isEnabled());
    }
}
