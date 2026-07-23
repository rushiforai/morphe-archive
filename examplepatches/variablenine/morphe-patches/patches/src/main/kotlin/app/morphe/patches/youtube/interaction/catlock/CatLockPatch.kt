package app.morphe.patches.youtube.interaction.catlock

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.misc.settings.preference.SwitchPreference
import app.morphe.patches.youtube.misc.playercontrols.addTopControl
import app.morphe.patches.youtube.misc.playercontrols.initializeTopControl
import app.morphe.patches.youtube.misc.playercontrols.injectVisibilityCheckCall
import app.morphe.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.morphe.patches.youtube.misc.settings.PreferenceScreen
import app.morphe.patches.youtube.misc.settings.settingsPatch
import app.morphe.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources

private val catLockResourcePatch = resourcePatch {
    dependsOn(
        legacyPlayerControlsPatch,
        settingsPatch,
    )

    execute {
        PreferenceScreen.PLAYER.addPreferences(
            SwitchPreference("morphe_cat_lock_button", summary = true),
        )

        copyResources(
            "catlock",
            ResourceGroup(
                "drawable",
                "morphe_yt_cat_lock_button.xml",
                "morphe_yt_cat_lock_button_bold.xml",
            ),
        )
    }

    finalize {
        addTopControl(
            "catlock",
            "@+id/morphe_cat_lock_button",
            "@+id/morphe_cat_lock_button",
        )
    }
}

private const val EXTENSION_BUTTON = "Lapp/morphe/extension/youtube/videoplayer/CatLockButton;"

@Suppress("unused")
val catLockPatch = bytecodePatch(
    name = "Cat lock",
    description = "Adds a cat button to the video player that locks the screen so a pet can watch " +
        "without accidentally swiping the video away; unlock by quickly tapping alternating " +
        "opposite sides of the screen.",
) {
    dependsOn(
        catLockResourcePatch,
        legacyPlayerControlsPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        // The button's click/visibility are handled entirely in the extension via
        // LegacyPlayerControlButton, so only the initialize + visibility hooks are needed.
        initializeTopControl(EXTENSION_BUTTON)
        injectVisibilityCheckCall(EXTENSION_BUTTON)
    }
}
