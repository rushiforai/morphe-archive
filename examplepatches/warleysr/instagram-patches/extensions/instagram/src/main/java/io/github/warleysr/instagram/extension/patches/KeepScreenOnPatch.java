package io.github.warleysr.instagram.extension.patches;

import android.util.Log;
import io.github.warleysr.instagram.extension.utils.Pref;

@SuppressWarnings("unused")
public class KeepScreenOnPatch {
    private static final String TAG = "PikoPatch";

    // Called when the video player starts playing, with the value of the server side
    // setting that decides whether the video view keeps the screen on while playing.
    public static boolean keepScreenOnWhilePlaying(boolean original) {
        boolean patchPref = Pref.keepScreenOnWhilePlaying();
        boolean result = original || patchPref;
        Log.i(TAG, "keepScreenOnWhilePlaying(original=" + original + ") -> pref=" + patchPref + ", result=" + result);
        return result;
    }

    // Called when the video completes, after the player turned keep screen on off.
    // In Instagram feed/reels/carousels, playback restarts or loops while the user is watching.
    // If the setting is enabled, always keep the screen on instead of shutting it off.
    public static boolean keepScreenOnWhileLooping(boolean isLooping) {
        boolean patchPref = Pref.keepScreenOnWhilePlaying();
        Log.i(TAG, "keepScreenOnWhileLooping(isLooping=" + isLooping + ") -> returning pref=" + patchPref);
        return patchPref;
    }
}

