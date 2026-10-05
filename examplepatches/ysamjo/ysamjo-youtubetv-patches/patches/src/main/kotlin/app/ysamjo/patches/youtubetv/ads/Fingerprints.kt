package app.ysamjo.patches.youtubetv.ads

import app.morphe.patcher.Fingerprint

/**
 * Anchors on Cobalt's own, unobfuscated code.
 *
 * YouTube for Android TV embeds Cobalt, which is an open-source Chromium fork
 * (github.com/youtube/cobalt). Its coat layer keeps the upstream class and method names —
 * unlike the R8-renamed classes elsewhere in the APK — which makes `dev.cobalt.coat.*` a
 * stable anchor across app versions.
 *
 * `CobaltActivity.onCreate` is where the engine command line is assembled, including the
 * `--url=<cobalt.APP_URL>` switch. Injecting at the top of it runs before the engine starts.
 */
object CobaltActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Ldev/cobalt/coat/CobaltActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * Sanity anchor: the handle to the live page. Exists in every build that can be injected
 * into, and is explicitly documented as not being renamed.
 *
 * The patch does not read this fingerprint directly — the injected extension resolves it
 * reflectively at runtime, so that a single patch build keeps working if the return type
 * moves. The fingerprint is declared so that a missing seam fails the patch loudly instead
 * of producing a silently dead build.
 */
object GetActiveWebContentsFingerprint : Fingerprint(
    definingClass = "Ldev/cobalt/coat/CobaltActivity;",
    name = "getActiveWebContents",
)
