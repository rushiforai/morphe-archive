package app.ysamjo.patches.youtubetv.misc.startupurl

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.ysamjo.patches.shared.Constants.COMPATIBILITY_YOUTUBE_TV
import org.w3c.dom.Element

/** Meta-data key the Cobalt shell reads to build its `--url=` engine switch. */
private const val APP_URL_META_DATA = "cobalt.APP_URL"

/**
 * Repoints the Cobalt engine at a different startup URL.
 *
 * YouTube for Android TV is not a native app whose UI and ad logic live in smali. It is a
 * Cobalt (Chromium) shell that loads YouTube's leanback web app from the network at runtime
 * and runs it inside the native engine. Everything the user sees — feed, player, ad
 * pipeline — is served from that URL, so the startup URL is the highest-leverage patch point
 * in the whole APK.
 *
 * `CobaltActivity` builds its engine command line and, when the launch intent supplies no
 * `--url=` switch, appends `--url=<cobalt.APP_URL>` read from this meta-data. The stock
 * startup guard only logs `Non-Youtube startup URL detected.` and disarms a watchdog for
 * non-YouTube URLs — it does not block or rewrite them, so an arbitrary URL loads.
 */
@Suppress("unused")
val cobaltStartupUrlPatch = resourcePatch(
    name = "Cobalt-Start-URL ändern",
    description = "Schreibt die Meta-Data 'cobalt.APP_URL' in der AndroidManifest.xml um. Sie " +
        "entscheidet, welche URL die Cobalt-Engine beim Start lädt. Damit lässt sich ein " +
        "filterndes Frontend ansteuern, das eine veränderte Leanback-Web-App ausliefert und " +
        "Werbung entfernt, ohne die native Engine anzufassen. Die serienmäßige Startprüfung " +
        "blockiert fremde URLs nicht.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_TV)

    val startupUrl by stringOption(
        key = "startupUrl",
        title = "Start-URL",
        description = "URL, die die Cobalt-Engine beim Start lädt. Original ist " +
            "https://www.youtube.com/tv. Muss eine http(s)-URL sein.",
    )

    execute {
        val url = startupUrl?.trim().orEmpty()

        if (url.isEmpty()) {
            throw PatchException("Die Option 'Start-URL' ist für diesen Patch erforderlich.")
        }

        if (!url.startsWith("https://") && !url.startsWith("http://")) {
            throw PatchException("Die Option 'Start-URL' muss eine http(s)-URL sein, übergeben wurde: $url")
        }

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("Kein <application>-Element in der AndroidManifest.xml gefunden.")

            val metaDataNodes = application.getElementsByTagName("meta-data")

            var patched = false
            for (index in 0 until metaDataNodes.length) {
                val metaData = metaDataNodes.item(index) as? Element ?: continue
                if (metaData.getAttribute("android:name") != APP_URL_META_DATA) continue

                metaData.setAttribute("android:value", url)
                patched = true
            }

            if (!patched) {
                throw PatchException(
                    "Keine '$APP_URL_META_DATA'-Meta-Data in der AndroidManifest.xml gefunden. " +
                        "Diese App-Version wird von diesem Patch nicht unterstützt."
                )
            }
        }
    }
}
