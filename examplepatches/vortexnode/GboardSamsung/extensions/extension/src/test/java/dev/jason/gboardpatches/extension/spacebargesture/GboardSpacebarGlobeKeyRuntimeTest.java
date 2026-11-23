package dev.jason.gboardpatches.extension.spacebargesture;

import android.view.KeyEvent;

import org.junit.Assert;
import org.junit.Test;

public final class GboardSpacebarGlobeKeyRuntimeTest {
    @Test
    public void identifiesLanguageSwitchKeycodesRegardlessOfViewName() {
        Assert.assertTrue(GboardSpacebarGlobeKeyRuntime.isLanguageSwitchKeyDescriptor(
                GboardSpacebarGlobeKeyRuntime.KEYCODE_SWITCH_TO_NEXT_LANGUAGE,
                "key_pos_custom_slot"));
        Assert.assertTrue(GboardSpacebarGlobeKeyRuntime.isLanguageSwitchKeyDescriptor(
                GboardSpacebarGlobeKeyRuntime.KEYCODE_SWITCH_TO_NEXT_LANGUAGE_ALL_IMES,
                null));
    }

    @Test
    public void neverMisidentifiesSpacebarOrNonLanguageKeyOnGlobeSlot() {
        Assert.assertFalse(GboardSpacebarGlobeKeyRuntime.isLanguageSwitchKeyDescriptor(
                KeyEvent.KEYCODE_SPACE,
                GboardSpacebarGlobeKeyRuntime.GLOBE_VIEW_NAME));
        // Emoji or Comma sharing the bottom-row globe slot (non-zero non-language keycode).
        Assert.assertFalse(GboardSpacebarGlobeKeyRuntime.isLanguageSwitchKeyDescriptor(
                ',',
                GboardSpacebarGlobeKeyRuntime.GLOBE_VIEW_NAME));
        Assert.assertFalse(GboardSpacebarGlobeKeyRuntime.isLanguageSwitchKeyDescriptor(
                -10027,
                GboardSpacebarGlobeKeyRuntime.NEXT_LANGUAGE_VIEW_NAME));
    }

    @Test
    public void fallsBackToResourceEntryNameOnlyWhenKeycodeIsZero() {
        Assert.assertTrue(GboardSpacebarGlobeKeyRuntime.isLanguageSwitchKeyDescriptor(
                0, GboardSpacebarGlobeKeyRuntime.GLOBE_VIEW_NAME));
        Assert.assertTrue(GboardSpacebarGlobeKeyRuntime.isLanguageSwitchKeyDescriptor(
                0, GboardSpacebarGlobeKeyRuntime.NEXT_LANGUAGE_VIEW_NAME));
        Assert.assertFalse(GboardSpacebarGlobeKeyRuntime.isLanguageSwitchKeyDescriptor(
                0, "key_pos_space"));
        Assert.assertFalse(GboardSpacebarGlobeKeyRuntime.isLanguageSwitchKeyDescriptor(
                0, null));
    }

    @Test
    public void spacebarSwipeAndHideGlobeSettingsAreDistinctAndIndependent() {
        Assert.assertNotEquals(
                GboardSpacebarGestureSettings.PREF_KEY_SPACEBAR_LANGUAGE_SWIPE_ENABLED,
                GboardSpacebarGestureSettings.PREF_KEY_HIDE_LANGUAGE_SWITCH_KEY);
        Assert.assertTrue(GboardSpacebarGestureSettings.DEFAULT_SPACEBAR_LANGUAGE_SWIPE_ENABLED);
        Assert.assertFalse(GboardSpacebarGestureSettings.DEFAULT_HIDE_LANGUAGE_SWITCH_KEY);
    }
}
