package app.ysamjo.patches.youtubetv.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ysamjo.patches.shared.Constants.COMPATIBILITY_TIZENTUBE_COBALT
import app.ysamjo.patches.shared.Constants.COMPATIBILITY_YOUTUBE_TV

private const val EXTENSION_CLASS = "Lapp/ysamjo/extension/youtubetv/CobaltScriptInjector;"

/**
 * Injects a userscript into the leanback web app running inside Cobalt.
 *
 * YouTube for Android TV has no local ad code to no-op: the whole ad pipeline is served from
 * `youtube.com/tv` and executed by the native Cobalt engine. The seam is that the shipped
 * build still contains the injection machinery — `components/js_injection` is compiled into
 * the engine, the `WebContents.evaluateJavaScript` native is still registered in
 * `org.jni_zero.GEN_JNI`, and `CobaltActivity.getActiveWebContents()` still exposes a handle
 * to the live page. Only the Java caller was tree-shaken away, so we add it back.
 *
 * `evaluateJavaScript` runs in the page's main world, which is what lets the payload replace
 * the page's own `JSON.parse` and see the InnerTube player responses before the app does.
 *
 * The same seam exists in TizenTube Cobalt, which is a separate Cobalt build rather than a
 * modified copy of this app. Its namespace is `org.chromium.*` instead of
 * `cobalt.org.chromium.*`, but the extension resolves everything by shape, so a single patch
 * covers both.
 */
@Suppress("unused")
val injectAdblockUserscriptPatch = bytecodePatch(
    name = "Werbe-Blocker-Userscript einspritzen",
    description = "Spritzt ein JavaScript-Userscript in die Leanback-Web-App ein, die Cobalt von " +
        "youtube.com/tv lädt — dort liegt die Werbe-Pipeline tatsächlich. Das Skript entfernt " +
        "Werbeplatzierungen aus den InnerTube-Antworten, bevor die App sie auswertet. " +
        "Geprüft auf einem Google TV Streamer; die Payload greift nachweislich zu.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_TV, COMPATIBILITY_TIZENTUBE_COBALT)

    extendWith("extensions/extension.mpe")

    execute {
        // Fail loudly if the seam is gone instead of shipping a dead build.
        GetActiveWebContentsFingerprint.method

        // Post the injector before the engine starts. CobaltActivity extends Activity, so
        // `this` satisfies the Activity parameter. The extension only schedules a poll, so
        // running before super.onCreate() is harmless.
        //
        // `invoke-static/range` instead of `invoke-static` is deliberate: the non-range form
        // encodes its registers in 4 bits (dex format 35c, v0..v15), and on YouTube for
        // Android TV `onCreate` has 26 registers, which puts p0 on v24. The range form
        // (format 3rc) takes 16-bit registers and is the only form that works there. On
        // TizenTube Cobalt the same method has 7 registers and p0 lands on v5, where either
        // form would do — the range form is simply the one that is correct everywhere.
        CobaltActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->schedule(Landroid/app/Activity;)V
            """,
        )
    }
}
