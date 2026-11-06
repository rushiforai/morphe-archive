package app.quetta.patches

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** Quetta Browser 2.2.0 from Google Play (versionCode 1540055). */
internal val COMPATIBILITY_QUETTA = Compatibility(
    name = "Quetta Browser",
    packageName = "net.quetta.browser",
    targets = listOf(AppTarget(version = "2.2.0"))
)

/** Quetta Browser 2.0.9 from quetta.net, which ships as one APK under its own package. */
internal val COMPATIBILITY_QUETTA_OFFICIAL = Compatibility(
    name = "Quetta Browser (official APK)",
    packageName = "net.quetta.browser.official",
    targets = listOf(AppTarget(version = "2.0.9"))
)
