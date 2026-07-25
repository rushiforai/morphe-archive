package app.morphe.extension.youtube.videoplayer;

import android.view.View;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.patches.catlock.CatLockOverlay;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Top player-controls button that engages {@link CatLockOverlay}. Mirrors the other Morphe
 * player-overlay buttons (e.g. ExternalDownloadButton) so it rides the same initialize
 * injection point. {@link LegacyPlayerControlButton} derives its own visibility from the
 * setting, so no separate visibility injection points are needed.
 */
@SuppressWarnings("unused")
public class CatLockButton {

    static {
        if (Settings.CAT_LOCK_BUTTON.get()) {
            LegacyPlayerControlButton.incrementUpperButtonCount();
        }
    }

    /**
     * Injection point.
     */
    public static void initializeLegacyButton(View controlsView) {
        try {
            new LegacyPlayerControlButton(
                    controlsView,
                    "morphe_cat_lock_button",
                    null,
                    "morphe_yt_cat_lock_button",
                    Settings.CAT_LOCK_BUTTON,
                    CatLockButton::onClick,
                    null
            );
        } catch (Exception ex) {
            Logger.printException(() -> "Cat lock initializeButton failure", ex);
        }
    }

    private static void onClick(View view) {
        CatLockOverlay.engage(view);
    }
}
