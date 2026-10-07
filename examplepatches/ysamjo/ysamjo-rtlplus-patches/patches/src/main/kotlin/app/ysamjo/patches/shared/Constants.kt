package app.ysamjo.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

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
object Constants {

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
