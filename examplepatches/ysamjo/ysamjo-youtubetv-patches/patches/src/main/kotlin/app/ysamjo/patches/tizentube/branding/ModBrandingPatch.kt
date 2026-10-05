package app.ysamjo.patches.tizentube.branding

import app.morphe.patcher.patch.resourcePatch
import app.ysamjo.patches.shared.Constants.COMPATIBILITY_TIZENTUBE_COBALT
import java.io.File

/**
 * Anchor for loading the bundled images. Using an explicit class keeps the lookup on the
 * patch bundle's own classloader instead of the patcher's.
 */
private object BrandingResources

/**
 * The launcher artwork, relative to the APK root. The same paths exist as resources under
 * `branding/` inside this patch module, so a replacement is a straight copy.
 *
 * On Android TV the home screen draws `android:banner`, not `android:icon` — a patch that only
 * swapped `ic_app` would be invisible where the user actually looks.
 */
private val BRANDING_PATHS = listOf(
    "res/mipmap-mdpi-v4/ic_app",
    "res/mipmap-hdpi-v4/ic_app",
    "res/mipmap-xhdpi-v4/ic_app",
    "res/mipmap-xxhdpi-v4/ic_app",
    "res/mipmap-xxxhdpi-v4/ic_app",
    "res/drawable/app_banner",
    "res/drawable-hdpi-v4/app_banner",
    "res/drawable-xhdpi-v4/app_banner",
    "res/drawable-xxhdpi-v4/app_banner",
    "res/drawable-xxxhdpi-v4/app_banner",
)

/**
 * Replaces TizenTube's own artwork with a YouTube-style icon and banner carrying a MOD badge.
 *
 * TizenTube ships a house-branded logo, which on a TV full of streaming apps is hard to tell
 * apart from the thing it is meant to replace. The icon is the YouTube play mark with a MOD
 * pill; the banner is the plain YouTube logo in the middle, the TizenTube mark small in the
 * top right, and a small MOD badge in the top left.
 *
 * Kept opt-in and limited to TizenTube: YouTube for Android TV has its own artwork, and
 * overwriting that would remove the last visual cue that it is the real app.
 *
 * Must be a [resourcePatch], not a [app.morphe.patcher.patch.rawResourcePatch]. `get()` resolves
 * every `res/…` path through the coder's package map, and that map is only populated when
 * resources are decoded in full — which in turn only happens if at least one patch in the run is
 * a `ResourcePatch`. A raw resource patch alone runs in `RAW_ONLY` mode, where the map stays
 * empty and every `get("res/…")` throws `PatchException: Package <pkg> not found`.
 */
@Suppress("unused")
val modBrandingPatch = resourcePatch(
    name = "MOD-Kennzeichnung für Icon und Banner",
    description = "Ersetzt Icon und Banner der App durch YouTube-Artwork mit MOD-Aufkleber. " +
        "Das Icon ist das YouTube-Abspielsymbol mit MOD-Pille, der Banner das normale " +
        "YouTube-Logo mittig, das TizenTube-Zeichen klein oben rechts und MOD klein oben links. " +
        "Auf Android TV zeigt der Launcher den Banner, deshalb wird beides getauscht. " +
        "Nur für TizenTube — die Stock-App behält ihr eigenes Artwork.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TIZENTUBE_COBALT)

    execute {
        var replaced = 0
        val missing = mutableListOf<String>()

        for (path in BRANDING_PATHS) {
            // copy = true (the default): stage the entry out of the input APK if it is not there yet.
            val target: File? = get(path)
            if (target == null || !target.exists()) {
                missing += path
                continue
            }

            val source = BrandingResources::class.java.getResourceAsStream("/branding/$path")
            if (source == null) {
                missing += "/branding/$path (im Bundle)"
                continue
            }

            source.use { input -> target.outputStream().use { input.copyTo(it) } }
            replaced++
        }

        println("Branding: $replaced von ${BRANDING_PATHS.size} Ressourcen ersetzt")
        if (missing.isNotEmpty()) {
            println("Branding: nicht gefunden — ${missing.joinToString(", ")}")
        }
    }
}
