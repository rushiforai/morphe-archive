package app.quetta.patches

/**
 * Replacements are generated from the source host, so both sides always have the same byte
 * length: a length mismatch shifts everything after it in a native library and breaks dlopen.
 * `.invalid` is reserved by RFC 2606, so it can never resolve.
 */
private fun deadHost(host: String): String {
    require(host.length >= 10) { "host too short to neutralise: $host" }
    return "b" + "0".repeat(host.length - 9) + ".invalid"
}

/** Longest first, so a shorter host never rewrites part of a longer one. */
private fun deadHosts(vararg hosts: String): List<Pair<String, String>> =
    hosts.sortedByDescending { it.length }.map { it to deadHost(it) }

/** The strings a group writes; finding one proves the group already ran on this APK. */
internal fun List<Pair<String, String>>.deadMarkers(): Set<String> = map { it.second }.toSet()

/** Usage reporting, crash reporting and telemetry beacons. */
internal val ANALYTICS_HOSTS = deadHosts(
    "firebase-settings.crashlytics.com",   // Crashlytics settings and crash upload
    "chromereporting-pa.googleapis.com",   // Chromium reporting
    "app-measurement.com",                 // GA4 upload
    "google-analytics.com",                // legacy GA
    "crashpad.chromium.org",               // Chromium native crash uploader
    "sentry.thefrodo.com",                 // crash minidump uploader
)

/** Quetta's own tracking surface: favicon proxy, start page, video sniffing, share links. */
internal val VENDOR_HOSTS = deadHosts(
    "qt.quetta.net",                       // start page, search suggestions, wallpapers
    "ai.quetta.net",                       // server-side video sniffing
    "go.quetta.net",                       // share links
    "bcp.quetta.net",                      // unattributed vendor endpoint
    "f.quetta.net",                        // favicon and extension icon proxy
)

/** Component updates and push registration. Disabling these has visible feature costs. */
internal val UPDATE_PUSH_HOSTS = deadHosts(
    "firebaseperusertopics-pa.googleapis.com",
    "firebaseinstallations.googleapis.com",
    "fcmregistrations.googleapis.com",
    "test-update.quetta.net",
    "test-omaha.quetta.net",
    "update.quetta.net",
    "omaha.quetta.net",
)
