package app.ysamjo.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Die Ziel-Apps dieses Bundles.
 *
 * Drei Produkte, ein Bundle: die Leanback-YouTube-App und ihr Cobalt-Ableger teilen sich
 * denselben Seam, RTL+ hat seinen eigenen. Jede `Compatibility` hier erzeugt im Morphe Manager
 * eine eigene App-Gruppe.
 */
object Constants {

    /**
     * YouTube **for** Android TV — the leanback client that ships on Android TV / Google TV.
     *
     * This is NOT "YouTube TV: Live TV & more", the separate live-TV streaming service
     * (com.google.android.apps.youtube.unplugged).
     *
     * Declared as APKM because Google ships this app as a split bundle
     * (base.apk + split_config.armeabi_v7a.apk) and the manifest sets
     * `com.android.vending.splits.required = true` with `requiredSplitTypes="base__abi"`,
     * so a bare base.apk will not install or run. Morphe Manager merges the bundle
     * into a single APK before patching.
     */
    val COMPATIBILITY_YOUTUBE_TV = Compatibility(
        name = "YouTube for Android TV",
        packageName = "com.google.android.youtube.tv",
        apkFileType = ApkFileType.APKM,
        // YouTube red.
        appIconColor = 0xFF0000,
        targets = listOf(
            // Version used for the reverse engineering this repo is based on
            // (version code 711300320, 32-bit ARM only bundle).
            AppTarget(version = "7.11.300"),
            // Verified against the APK pulled from a Google TV Streamer (device `kirkwood`,
            // Android 14, armeabi-v7a) on 2026-10-04. Version code 725302320.
            //
            // Confirmed in that build:
            //  - `cobalt.APP_URL` meta-data present twice (MainActivity, StandalonePlayerActivity)
            //  - `dev.cobalt.coat.CobaltActivity` present, declares `onCreate` and
            //    `getActiveWebContents`
            //  - `cobalt.org.chromium.content.browser.webcontents.WebContentsImpl` has exactly
            //    one `long` field
            //  - `org.jni_zero.GEN_JNI` still registers the `evaluateJavaScript` native
            AppTarget(version = "7.25.302"),
        ),
    )

    /**
     * TizenTube Cobalt — a third-party Cobalt build that brings the TizenTube mods to Android TV.
     *
     * This is NOT a patch of YouTube for Android TV. It is its own app with its own package,
     * built from the same Cobalt/Chrobalt source (its engine library is even called
     * `libchrobalt.so`, like the stock app's). Patching it therefore reuses the same seam.
     *
     * Verified against the v2.0.2 `cobalt-arm.apk` on 2026-10-04:
     *
     *  - `dev.cobalt.app.MainActivity` (the launcher) extends `dev.cobalt.coat.CobaltActivity`
     *  - `CobaltActivity.onCreate` is protected with 7 registers, so p0 sits on v5
     *  - `getActiveWebContents()` returns `org.chromium.content_public.browser.WebContents`
     *  - `WebContentsImpl.mNativeWebContentsAndroid` is the only instance `long` field
     *  - `GEN_JNI` registers the `evaluateJavaScript` native
     *
     * Two differences from the stock app matter in practice: the namespace is plain
     * `org.chromium.*` without the `cobalt.` prefix, and the build is not obfuscated —
     * `JavaScriptCallback` even keeps its real method name, so the read-back diagnostic returns
     * an actual value here instead of firing a no-argument stub.
     *
     * Shipped as a single APK, not a split bundle, so `apkFileType` stays unset.
     */
    val COMPATIBILITY_TIZENTUBE_COBALT = Compatibility(
        name = "TizenTube",
        packageName = "io.gh.reisxd.tizentube.cobalt",
        targets = listOf(
            AppTarget(version = "2.0.2"),
            AppTarget(
                version = "2.0.3",
                description = "Offizielles ARM-APK: SHA-256 und Cobalt-/JNI-Fingerprints statisch geprüft; " +
                    "Hardwareprüfung getrennt im Verifikationsbericht.",
            ),
        ),
    )

    /**
     * RTL+ (RTL Plus) — der deutsche Streaming-Dienst der RTL Deutschland.
     *
     * Paket: `de.rtli.tvnow`. Die historische Paket-ID `tvnow` wird weitergeführt;
     * die App wurde nie unter `rtlplus` neu verpackt.
     *
     * RTL+ wird als Split-Bundle ausgeliefert (base.apk + split_config.armeabi_v7a.apk +
     * split_config.xhdpi.apk) und das Manifest setzt
     * `com.android.vending.splits.required = true`, daher installiert eine nackte
     * base.apk nicht. Morphe Manager führt das Bundle vor dem Patchen zu einer
     * einzelnen APK zusammen, daher `apkFileType = ApkFileType.APKM`.
     *
     * Reverse-Engineering-Ziel ist der echte TV-Build, gezogen von einem Google TV
     * Streamer (Gerät `kirkwood`, Android 14, armeabi-v7a) am 2026-10-04:
     * Version 7.15.2, Version-Code 2025100658.
     */
    val COMPATIBILITY_RTLPLUS = Compatibility(
        name = "RTL+",
        packageName = "de.rtli.tvnow",
        apkFileType = ApkFileType.APKM,
        // RTL+-Markenrot.
        appIconColor = 0xE2001A,
        targets = listOf(
            AppTarget(
                version = "7.15.2",
                description = "Reverse-engineered aus der APK vom Google TV Streamer " +
                    "(Android 14, armeabi-v7a) am 2026-10-04 (Version-Code 2025100658).",
            ),
        ),
    )
}
