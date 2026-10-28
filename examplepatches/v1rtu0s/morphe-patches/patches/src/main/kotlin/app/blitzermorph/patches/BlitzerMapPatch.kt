package app.blitzermorph.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.blitzermorph.patches.shared.Constants.COMPATIBILITY_MICROG_MAPS

private const val EXTENSION_CLASS = "Lapp/blitzermorph/extension/BlitzerInjector;"

/**
 * Fingerprint for SpeedCameras.moved(Location) - called on every location
 * update. We inject a call to our extension here so it can fetch Atudo POIs
 * around the user and inject them into the app's camera layer.
 */
val BlitzerHookFingerprint = Fingerprint(
    definingClass = "Lorg/ungoogled/ui/SpeedCameras;",
    name = "moved",
    returnType = "V",
    parameters = listOf("Landroid/location/Location;"),
    filters = listOf(
        // moved() calls around(lat, lng) internally
        methodCall(
            name = "around"
        )
    )
)

/**
 * BlitzerMorph - live Blitzer.de speed cameras for microG Maps.
 *
 * On every location update the extension queries the Atudo API
 * (cdn2.atudo.net) for speed cameras around the user and injects them
 * into the app's existing "speed cameras" layer. They show up with a
 * "Blitzer.de - " label prefix so the data source is distinguishable.
 */
val blitzerMapPatch = bytecodePatch(
    name = "BlitzerMorph",
    description = "Shows live Blitzer.de speed cameras from Atudo on the map.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MICROG_MAPS)

    extendWith("extensions/blitzermorph.mpe")

    execute {
        BlitzerHookFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, $EXTENSION_CLASS;->onLocationChanged(Landroid/location/Location;)V
            """
        )
    }
}