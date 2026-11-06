package app.geminiask.extension;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.widget.Toast;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.youtube.addon.AddOnApi;
import app.morphe.extension.youtube.patches.LegacyPlayerControlsPatch;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.videoplayer.PlayerOverlayButton;

public final class GeminiAsk {
    static final BooleanSetting BUTTON = new BooleanSetting("morphe_gemini_button", true);
    static final String ICON = "morphe_gemini_button";

    /** Called from AddOnManager.registerAddOns(). */
    public static void register() {
        AddOnApi.addPlayerOverlayButtonsListener(controls -> {
            if (!LegacyPlayerControlsPatch.RESTORE_OLD_PLAYER_BUTTONS) {
                PlayerOverlayButton.addButton(controls, ICON, BUTTON::get, GeminiAsk::onClick, null);
            }
        });
        AddOnApi.addLegacyPlayerControlsListener(controls -> {
            if (LegacyPlayerControlsPatch.RESTORE_OLD_PLAYER_BUTTONS) {
                AddOnApi.createLegacyButton("gemini", controls, ICON, BUTTON, GeminiAsk::onClick, null);
            }
        });
    }

    static void onClick(View v) {
        Context context = v.getContext();
        Intent intent = new Intent(Intent.ACTION_SEND).setType("text/plain").setPackage("com.google.android.apps.bard")
                .putExtra(Intent.EXTRA_TEXT, "https://youtu.be/" + VideoInformation.getVideoId());
        // checked up front: YouTube's activity swallows ActivityNotFoundException with its own generic toast
        if (context.getPackageManager().queryIntentActivities(intent, 0).isEmpty()) {
            Toast.makeText(context, "Gemini is not installed", Toast.LENGTH_SHORT).show();
            return;
        }
        context.startActivity(intent);
    }
}
