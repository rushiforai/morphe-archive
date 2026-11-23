package dev.jason.gboardpatches.extension.spacebargesture;

import android.content.Context;
import android.util.Log;

import java.util.Arrays;
import java.util.Collections;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesIcons;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/**
 * Dedicated top-level "Language" settings screen for Samsung Spacebar Gestures & language switch
 * key visibility, exposing three independent toggles:
 * <ol>
 *   <li>Switch language by swiping on spacebar (default enabled).</li>
 *   <li>Show visual language chevrons on the spacebar (default disabled).</li>
 *   <li>Hide language switch key (default disabled, immediately reversible).</li>
 * </ol>
 */
public final class GboardLanguageSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";

    private final String title;
    private final String summary;
    private final String badge;
    private final String sectionTitle;
    private final String spacebarSwipeTitle;
    private final String spacebarSwipeSummary;
    private final String spacebarChevronsTitle;
    private final String spacebarChevronsSummary;
    private final String hideGlobeKeyTitle;
    private final String hideGlobeKeySummary;

    public GboardLanguageSettingsFeature(Context context) {
        title = text(context, R.string.gboard_patches_language_settings_title);
        summary = text(context, R.string.gboard_patches_language_settings_summary);
        badge = text(context, R.string.gboard_patches_header_badge);
        sectionTitle = text(context, R.string.gboard_patches_language_settings_section);
        spacebarSwipeTitle = text(context, R.string.gboard_patches_spacebar_language_swipe_title);
        spacebarSwipeSummary =
                text(context, R.string.gboard_patches_spacebar_language_swipe_summary);
        spacebarChevronsTitle =
                text(context, R.string.gboard_patches_spacebar_language_chevrons_title);
        spacebarChevronsSummary =
                text(context, R.string.gboard_patches_spacebar_language_chevrons_summary);
        hideGlobeKeyTitle = text(context, R.string.gboard_patches_hide_language_switch_key_title);
        hideGlobeKeySummary =
                text(context, R.string.gboard_patches_hide_language_switch_key_summary);
    }

    @Override
    public String getEntryTitle() {
        return title;
    }

    @Override
    public String getEntrySummary() {
        return summary;
    }

    @Override
    public int getEntryIcon() {
        return GboardPatchesIcons.TRANSLATE;
    }

    @Override
    public String getEntryTone() {
        return "blue";
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_SAMSUNG_SPACEBAR_GESTURES);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return errorScreen();
            }
            Context context = host.getContext();
            boolean spacebarSwipeEnabled =
                    GboardSpacebarGestureSettings.readSpacebarLanguageSwipeEnabled(context);
            boolean spacebarChevronsEnabled =
                    GboardSpacebarGestureSettings.readSpacebarLanguageChevronsEnabled(context);
            boolean hideGlobeKeyEnabled =
                    GboardSpacebarGestureSettings.readHideLanguageSwitchKeyEnabled(context);
            return buildScreenForState(
                    spacebarSwipeEnabled,
                    value -> GboardSpacebarGestureSettings.writeSpacebarLanguageSwipeEnabled(
                            context, value),
                    spacebarChevronsEnabled,
                    value -> GboardSpacebarGestureSettings.writeSpacebarLanguageChevronsEnabled(
                            context, value),
                    hideGlobeKeyEnabled,
                    value -> GboardSpacebarGestureSettings.writeHideLanguageSwitchKeyEnabled(
                            context, value));
        } catch (Throwable failure) {
            Log.w(TAG, "Failed to render language settings", failure);
            return errorScreen();
        }
    }

    GboardPatchesSettingsContract.Screen buildScreenForState(
            boolean spacebarSwipeEnabled,
            GboardPatchesSettingsContract.ToggleAction spacebarSwipeAction,
            boolean spacebarChevronsEnabled,
            GboardPatchesSettingsContract.ToggleAction spacebarChevronsAction,
            boolean hideGlobeKeyEnabled,
            GboardPatchesSettingsContract.ToggleAction hideGlobeKeyAction) {
        return new GboardPatchesSettingsContract.Screen(
                title,
                badge,
                title,
                summary,
                Collections.emptyList(),
                Collections.singletonList(new GboardPatchesSettingsContract.Section(
                        sectionTitle,
                        Arrays.asList(
                                new GboardPatchesSettingsContract.ToggleRow(
                                        spacebarSwipeTitle,
                                        spacebarSwipeSummary,
                                        true,
                                        spacebarSwipeEnabled,
                                        spacebarSwipeAction),
                                new GboardPatchesSettingsContract.ToggleRow(
                                        spacebarChevronsTitle,
                                        spacebarChevronsSummary,
                                        true,
                                        spacebarChevronsEnabled,
                                        spacebarChevronsAction),
                                new GboardPatchesSettingsContract.ToggleRow(
                                        hideGlobeKeyTitle,
                                        hideGlobeKeySummary,
                                        true,
                                        hideGlobeKeyEnabled,
                                        hideGlobeKeyAction)))));
    }

    private GboardPatchesSettingsContract.Screen errorScreen() {
        return new GboardPatchesSettingsContract.Screen(
                title,
                badge,
                title,
                summary,
                Collections.singletonList(new GboardPatchesSettingsContract.StatusBlock(
                        title,
                        summary,
                        GboardPatchesSettingsContract.StatusTone.WARNING)),
                Collections.emptyList());
    }

    private static String text(Context context, int resourceId) {
        return GboardSettingsText.get(context, resourceId);
    }
}
