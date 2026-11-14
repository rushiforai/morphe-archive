package app.ysamjo.patches.youtubetv.misc.backtoexit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ysamjo.patches.shared.Constants.COMPATIBILITY_TIZENTUBE_COBALT
import app.ysamjo.patches.shared.Constants.COMPATIBILITY_YOUTUBE_TV
import app.ysamjo.patches.youtubetv.ads.CobaltActivityOnCreateFingerprint
import app.ysamjo.patches.youtubetv.ads.GetActiveWebContentsFingerprint

private const val EXTENSION_CLASS = "Lapp/ysamjo/extension/youtubetv/BackToExitInjector;"

/**
 * Closes the app when the user presses Back on the YouTube TV home screen.
 *
 * YouTube for Android TV (Cobalt shell) has no native back-button handler that exits when on
 * the home screen — the back button is consumed by the leanback web app's own navigation stack.
 * This patch injects a JavaScript handler that fires a callback when the app returns to the
 * home URL with no history left, and the callback calls {@code Activity.finish()}.
 *
 * Detection relies on the Cobalt engine firing a {@code popstate} event when the user presses
 * Back and the web app runs out of its own navigation stack. At that point the URL is the home
 * path ({@code /tv}), and the injected JS detects this condition and calls the callback.
 *
 * The callback uses the same {@code JavaScriptCallback} bridge that the existing read-back
 * probe uses: passed as the third argument to {@code WebContents.evaluateJavaScript} and
 * invoked by the engine with the result string.
 *
 * Runs on both targets — the extension resolves everything by shape.
 */
@Suppress("unused")
val injectBackToExitPatch = bytecodePatch(
    name = "Back-Taste → App beenden",
    description = "Schließt die App, wenn auf der Startseite (YouTube TV Home) die " +
        "Zurück-Taste gedrückt wird. Der Benutzer wird zum Launcher zurückgeleitet. " +
        "Funktioniert auf beiden Cobalt-Zielen (Stock-App und TizenTube Cobalt).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_TV, COMPATIBILITY_TIZENTUBE_COBALT)

    execute {
        // Fail loudly if the seam is gone.
        GetActiveWebContentsFingerprint.method

        // Inject the back-to-exit handler at the very start of CobaltActivity.onCreate.
        // Same register-range requirement as the ad-block: invoke-static/range on both targets.
        CobaltActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->schedule(Landroid/app/Activity;)V
            """,
        )
    }
}
