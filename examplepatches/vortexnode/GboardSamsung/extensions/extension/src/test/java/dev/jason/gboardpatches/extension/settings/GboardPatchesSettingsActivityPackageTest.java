package dev.jason.gboardpatches.extension.settings;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public final class GboardPatchesSettingsActivityPackageTest {
    private static final String OFFICIAL_PACKAGE = "com.google.android.inputmethod.latin";
    private static final String DEFAULT_PATCHED_PACKAGE =
            "gboardsamsung.com.google.android.inputmethod.latin";
    private static final String LEGACY_REVERSED_DEV_PACKAGE =
            "dev.jason.com.google.android.inputmethod.latin";
    private static final String LEGACY_DEV_PACKAGE =
            "com.google.android.inputmethod.latin.jason.dev";
    private static final String CUSTOM_PACKAGE = "com.example.gboardsamsung";

    @Test
    public void ownCustomConfiguredPackageIsSupported() {
        assertTrue(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                CUSTOM_PACKAGE, CUSTOM_PACKAGE));
    }

    @Test
    public void officialDefaultAndLegacyPackagesAreAlwaysSupported() {
        assertTrue(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                OFFICIAL_PACKAGE, OFFICIAL_PACKAGE));
        assertTrue(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                OFFICIAL_PACKAGE, CUSTOM_PACKAGE));
        assertTrue(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                DEFAULT_PATCHED_PACKAGE, DEFAULT_PATCHED_PACKAGE));
        assertTrue(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                DEFAULT_PATCHED_PACKAGE, CUSTOM_PACKAGE));
        assertTrue(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                LEGACY_REVERSED_DEV_PACKAGE, CUSTOM_PACKAGE));
        assertTrue(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                LEGACY_DEV_PACKAGE, CUSTOM_PACKAGE));
    }

    @Test
    public void foreignAndBlankPackagesAreRejected() {
        assertFalse(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                "com.other.keyboard", CUSTOM_PACKAGE));
        assertFalse(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                "com.other.keyboard", null));
        assertFalse(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                null, CUSTOM_PACKAGE));
        assertFalse(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                null, null));
        assertFalse(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                "", CUSTOM_PACKAGE));
        assertFalse(GboardPatchesSettingsActivity.isSupportedTargetPackage(
                "", ""));
    }
}
