package app.edgewindow.patches.cutout

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

/**
 * YouTube target variant of the hide-status-bar patch. Kept separate from the
 * universal variant so the window policy that works well for YouTube is listed
 * only for YouTube and cannot be selected by accident for other apps.
 */
@Suppress("unused")
val forceContentIntoDisplayCutoutPatch = bytecodePatch(
    name = "Hide status bar and ignore display cutouts",
    description = "Hides the status bar and removes top status-bar and cutout insets from app content.",
    default = false,
) {
    extendWith("extensions/extension.mpe")

    compatibleWith(
        Compatibility(
            name = "YouTube",
            packageName = "com.google.android.youtube",
        ),
    )

    execute {
        applyPolicyToAllActivities()
    }
}
