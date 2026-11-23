package dev.jason.gboardpatches.extension.spacebargesture;

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
public final class GboardSpacebarGestureSettingsTest {
    private Context context;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        GboardSpacebarGestureSettings.invalidateCache();
        GboardSpacebarGestureSettings.writeSpacebarLanguageSwipeEnabled(
                context, GboardSpacebarGestureSettings.DEFAULT_SPACEBAR_LANGUAGE_SWIPE_ENABLED);
        GboardSpacebarGestureSettings.writeSpacebarLanguageChevronsEnabled(
                context, GboardSpacebarGestureSettings.DEFAULT_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED);
    }

    @After public void tearDown() {
        GboardSpacebarGestureSettings.invalidateCache();
    }

    @Test public void chevronsDefaultIsFalseAndKeysAreDistinct() {
        Assert.assertFalse(GboardSpacebarGestureSettings.DEFAULT_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED);
        Assert.assertFalse(GboardSpacebarGestureSettings.readSpacebarLanguageChevronsEnabled(context));
        Assert.assertNotEquals(
                GboardSpacebarGestureSettings.PREF_KEY_SPACEBAR_LANGUAGE_SWIPE_ENABLED,
                GboardSpacebarGestureSettings.PREF_KEY_SPACEBAR_LANGUAGE_CHEVRONS_ENABLED);
    }

    @Test public void chevronsAndSwipeTogglesAreIndependent() {
        Assert.assertTrue(GboardSpacebarGestureSettings.writeSpacebarLanguageChevronsEnabled(context, true));
        Assert.assertTrue(GboardSpacebarGestureSettings.readSpacebarLanguageChevronsEnabled(context));
        Assert.assertTrue(GboardSpacebarGestureSettings.readSpacebarLanguageSwipeEnabled(context));

        Assert.assertTrue(GboardSpacebarGestureSettings.writeSpacebarLanguageSwipeEnabled(context, false));
        Assert.assertFalse(GboardSpacebarGestureSettings.readSpacebarLanguageSwipeEnabled(context));
        Assert.assertTrue(GboardSpacebarGestureSettings.readSpacebarLanguageChevronsEnabled(context));

        Assert.assertTrue(GboardSpacebarGestureSettings.writeSpacebarLanguageChevronsEnabled(context, false));
        Assert.assertFalse(GboardSpacebarGestureSettings.readSpacebarLanguageChevronsEnabled(context));
        Assert.assertFalse(GboardSpacebarGestureSettings.readSpacebarLanguageSwipeEnabled(context));
    }
}
