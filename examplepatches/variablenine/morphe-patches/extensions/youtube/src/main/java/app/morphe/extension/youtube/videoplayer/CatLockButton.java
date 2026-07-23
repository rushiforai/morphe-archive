package app.morphe.extension.youtube.videoplayer;

import android.view.View;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.patches.catlock.CatLockOverlay;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Top player-controls button that engages {@link CatLockOverlay}. Mirrors the other Morphe
 * player-overlay buttons (e.g. ExternalDownloadButton) so it rides the same initialize/visibility
 * injection points.
 */
@SuppressWarnings("unused")
public class CatLockButton {

    static {
        if (Settings.CAT_LOCK_BUTTON.get()) {
            LegacyPlayerControlButton.incrementUpperButtonCount();
        }
    }

    @Nullable
    private static LegacyPlayerControlButton legacy;

    /**
     * Injection point.
     */
    public static void initializeLegacyButton(View controlsView) {
        try {
            legacy = new LegacyPlayerControlButton(
                    controlsView,
                    "morphe_cat_lock_button",
                    null,
                    "morphe_yt_cat_lock_button",
                    Settings.CAT_LOCK_BUTTON::get,
                    CatLockButton::onClick,
                    null
            );
        } catch (Exception ex) {
            Logger.printException(() -> "Cat lock initializeButton failure", ex);
        }
    }

    /**
     * Injection point.
     */
    public static void setVisibilityNegatedImmediate() {
        if (legacy != null) legacy.setVisibilityNegatedImmediate();
    }

    /**
     * Injection point.
     */
    public static void setVisibilityImmediate(boolean visible) {
        if (legacy != null) legacy.setVisibilityImmediate(visible);
    }

    /**
     * Injection point.
     */
    public static void setVisibility(boolean visible, boolean animated) {
        if (legacy != null) legacy.setVisibility(visible, animated);
    }

    private static void onClick(View view) {
        CatLockOverlay.engage(view);
    }
}
