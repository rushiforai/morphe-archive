package app.edgewindow.patches.cutout

import app.morphe.patcher.patch.bytecodePatch

/**
 * Universal variant of the hide-status-bar patch. In addition to sharing the same
 * runtime policy as the YouTube variant, it relies on a browser-safe runtime helper
 * that keeps Chromium-based browser windows from shifting their entire content
 * below the display cutout (a fit-to-system-bars relayout that some browsers
 * restore on their new tab page), so it can be enabled for any app.
 */
@Suppress("unused")
val hideStatusBarUniversalPatch = bytecodePatch(
    name = "Hide status bar and ignore display cutouts (universal)",
    description = "Hides the status bar and removes top status-bar and cutout insets from app content in any app.",
    default = false,
) {
    extendWith("extensions/extension.mpe")

    execute {
        applyPolicyToAllActivities()
    }
}
