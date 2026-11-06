package app.morphe.extension.youtube.addon;

import android.view.View;

import java.util.function.Consumer;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.youtube.videoplayer.LegacyPlayerControlButton;

public final class AddOnApi {
    public static void addPlayerOverlayButtonsListener(Consumer<View> listener) {
    }

    public static void addLegacyPlayerControlsListener(Consumer<View> listener) {
    }

    public static LegacyPlayerControlButton createLegacyButton(String addOnId, View controlsView, String iconResourceName,
                                                               BooleanSetting setting, View.OnClickListener onClickListener,
                                                               View.OnLongClickListener onLongClickListener) {
        return null;
    }
}
