package app.morphe.extension.youtube.videoplayer;

import android.view.View;
import android.widget.ImageView;

public class PlayerOverlayButton {
    public interface PlayerOverlayButtonIsEnabledInterface {
        boolean isButtonCurrentlyEnabled();
    }

    public static ImageView addButton(View controlsView, String iconResourceName,
                                      PlayerOverlayButtonIsEnabledInterface isEnabled,
                                      View.OnClickListener onClickListener, View.OnLongClickListener onLongClickListener) {
        return null;
    }
}
