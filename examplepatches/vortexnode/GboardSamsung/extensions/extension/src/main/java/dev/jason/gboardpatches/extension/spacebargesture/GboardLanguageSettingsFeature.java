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
 * key visibility, exposing the master spacebar language swipe toggle, three mutually exclusive
 * swipe-order sub-toggles (Samsung One UI default, Gboard recent-first, Free direction), spacebar
 * chevrons, and globe key visibility.
 */
public final class GboardLanguageSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String EMPTY_PREVIEW_MESSAGE = "";

    private final String title;
    private final String summary;
    private final String badge;
    private final String sectionTitle;
    private final String spacebarSwipeTitle;
    private final String spacebarSwipeSummary;
    private final String swipeModeSamsungTitle;
    private final String swipeModeSamsungSummary;
    private final String swipeModeSamsungCaption;
    private final String swipeModeGboardTitle;
    private final String swipeModeGboardSummary;
    private final String swipeModeGboardCaption;
    private final String swipeModeFreeTitle;
    private final String swipeModeFreeSummary;
    private final String swipeModeFreeCaption;
    private final String swipeModeKeepSamsungNotice;
    private final String swipeModeFallbackSamsungNotice;
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
        swipeModeSamsungTitle =
                text(context, R.string.gboard_patches_spacebar_swipe_mode_samsung_title);
        swipeModeSamsungSummary =
                text(context, R.string.gboard_patches_spacebar_swipe_mode_samsung_summary);
        swipeModeSamsungCaption =
                text(context, R.string.gboard_patches_spacebar_swipe_mode_samsung_preview_caption);
        swipeModeGboardTitle =
                text(context, R.string.gboard_patches_spacebar_swipe_mode_gboard_title);
        swipeModeGboardSummary =
                text(context, R.string.gboard_patches_spacebar_swipe_mode_gboard_summary);
        swipeModeGboardCaption =
                text(context, R.string.gboard_patches_spacebar_swipe_mode_gboard_preview_caption);
        swipeModeFreeTitle =
                text(context, R.string.gboard_patches_spacebar_swipe_mode_free_title);
        swipeModeFreeSummary =
                text(context, R.string.gboard_patches_spacebar_swipe_mode_free_summary);
        swipeModeFreeCaption =
                text(context, R.string.gboard_patches_spacebar_swipe_mode_free_preview_caption);
        swipeModeKeepSamsungNotice =
                text(context, R.string.gboard_patches_spacebar_swipe_mode_keep_samsung_notice);
        swipeModeFallbackSamsungNotice =
                text(context, R.string.gboard_patches_spacebar_swipe_mode_fallback_samsung_notice);
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
            String swipeMode =
                    GboardSpacebarGestureSettings.readSpacebarLanguageSwipeMode(context);
            boolean spacebarChevronsEnabled =
                    GboardSpacebarGestureSettings.readSpacebarLanguageChevronsEnabled(context);
            boolean hideGlobeKeyEnabled =
                    GboardSpacebarGestureSettings.readHideLanguageSwitchKeyEnabled(context);
            return buildScreenForState(
                    spacebarSwipeEnabled,
                    value -> {
                        GboardSpacebarGestureSettings.writeSpacebarLanguageSwipeEnabled(
                                context, value);
                        GboardPatchesSettingsContract.refresh(host);
                    },
                    swipeMode,
                    (targetMode, enabled) -> {
                        if (enabled) {
                            GboardSpacebarGestureSettings.writeSpacebarLanguageSwipeMode(
                                    context, targetMode);
                        } else {
                            GboardSpacebarGestureSettings.writeSpacebarLanguageSwipeMode(
                                    context, GboardSpacebarGestureSettings.SWIPE_MODE_SAMSUNG);
                            String notice = GboardSpacebarGestureSettings.SWIPE_MODE_SAMSUNG
                                    .equals(targetMode)
                                    ? swipeModeKeepSamsungNotice
                                    : swipeModeFallbackSamsungNotice;
                            GboardPatchesSettingsContract.showMessage(host, notice);
                        }
                        GboardPatchesSettingsContract.refresh(host);
                    },
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

    interface ModeToggleHandler {
        void onModeToggled(String mode, boolean enabled);
    }

    GboardPatchesSettingsContract.Screen buildScreenForState(
            boolean spacebarSwipeEnabled,
            GboardPatchesSettingsContract.ToggleAction spacebarSwipeAction,
            String swipeMode,
            ModeToggleHandler modeToggleHandler,
            boolean spacebarChevronsEnabled,
            GboardPatchesSettingsContract.ToggleAction spacebarChevronsAction,
            boolean hideGlobeKeyEnabled,
            GboardPatchesSettingsContract.ToggleAction hideGlobeKeyAction) {
        String normalizedMode = GboardSpacebarGestureSettings.normalizeSwipeMode(swipeMode);
        boolean samsungSelected =
                GboardSpacebarGestureSettings.SWIPE_MODE_SAMSUNG.equals(normalizedMode);
        boolean gboardSelected =
                GboardSpacebarGestureSettings.SWIPE_MODE_GBOARD.equals(normalizedMode);
        boolean freeSelected =
                GboardSpacebarGestureSettings.SWIPE_MODE_FREE.equals(normalizedMode);

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
                                        swipeModeSamsungTitle,
                                        swipeModeSamsungSummary,
                                        spacebarSwipeEnabled,
                                        samsungSelected,
                                        value -> modeToggleHandler.onModeToggled(
                                                GboardSpacebarGestureSettings.SWIPE_MODE_SAMSUNG,
                                                value),
                                        buildPreview(
                                                swipeModeSamsungTitle,
                                                "settings-previews/spacebargesture/samsung_one_ui_order.png",
                                                swipeModeSamsungCaption)),
                                new GboardPatchesSettingsContract.ToggleRow(
                                        swipeModeGboardTitle,
                                        swipeModeGboardSummary,
                                        spacebarSwipeEnabled,
                                        gboardSelected,
                                        value -> modeToggleHandler.onModeToggled(
                                                GboardSpacebarGestureSettings.SWIPE_MODE_GBOARD,
                                                value),
                                        buildPreview(
                                                swipeModeGboardTitle,
                                                "settings-previews/spacebargesture/gboard_recent_order.png",
                                                swipeModeGboardCaption)),
                                new GboardPatchesSettingsContract.ToggleRow(
                                        swipeModeFreeTitle,
                                        swipeModeFreeSummary,
                                        spacebarSwipeEnabled,
                                        freeSelected,
                                        value -> modeToggleHandler.onModeToggled(
                                                GboardSpacebarGestureSettings.SWIPE_MODE_FREE,
                                                value),
                                        buildPreview(
                                                swipeModeFreeTitle,
                                                "settings-previews/spacebargesture/free_direction_order.png",
                                                swipeModeFreeCaption)),
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

    private GboardPatchesSettingsContract.PreviewSpec buildPreview(
            String previewTitle, String assetPath, String caption) {
        return new GboardPatchesSettingsContract.PreviewSpec(
                previewTitle,
                EMPTY_PREVIEW_MESSAGE,
                GboardPatchesSettingsContract.PreviewLayout.STACKED,
                new GboardPatchesSettingsContract.PreviewImage(assetPath, caption));
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
