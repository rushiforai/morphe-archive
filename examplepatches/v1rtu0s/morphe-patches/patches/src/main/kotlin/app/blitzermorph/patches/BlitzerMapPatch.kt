package app.blitzermorph.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.blitzermorph.patches.shared.Constants.COMPATIBILITY_GOOGLE_MAPS

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
 * Fingerprint for SpeedCameras class - to add the new preference constant.
 */
val SpeedCamerasClassFingerprint = Fingerprint(
    definingClass = "Lorg/ungoogled/ui/SpeedCameras;",
    name = "<clinit>",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(anyInstruction())
)

/**
 * Fingerprint for SpeedCameras.refresh() - to add preference check.
 */
val SpeedCamerasRefreshFingerprint = Fingerprint(
    definingClass = "Lorg/ungoogled/ui/SpeedCameras;",
    name = "refresh",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(anyInstruction())
)

/**
 * Fingerprint for SpeedCameras.mapItems() - to inject Blitzer.de layer only when enabled.
 */
val SpeedCamerasMapItemsFingerprint = Fingerprint(
    definingClass = "Lorg/ungoogled/ui/SpeedCameras;",
    name = "mapItems",
    returnType = "Lkotlin/collections/List;",
    parameters = listOf(),
    filters = listOf(anyInstruction())
)

/**
 * BlitzerMorph - live Blitzer.de speed cameras for microG Maps.
 *
 * Adds a dedicated "Blitzer.de cameras" toggle to Speed Cameras settings.
 * Only fetches and injects Blitzer.de cameras when the toggle is enabled.
 */
val blitzerMapPatch = bytecodePatch(
    name = "BlitzerMorph",
    description = "Shows live Blitzer.de speed cameras from Atudo on the map with a dedicated settings toggle.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MAPS)

    extendWith("extensions/blitzermorph.mpe")

    // Note: This patch depends on bearinmind_patches:speedCamerasPatch which adds the SpeedCameras class
    // The dependency is resolved at runtime by Morphe Manager when both sources are enabled
    execute {
        SpeedCamerasClassFingerprint.method.addInstructions(
            -1, // append to end of <clinit>
            """
                .field public static final KEY_BLITZER_DE:Ljava/lang/String; = "blitzer_de_cameras"
            """
        )
    }

    // 2. Hook moved() to call extension only when preference is enabled
    execute {
        BlitzerHookFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, $EXTENSION_CLASS;->onLocationChanged(Landroid/location/Location;)V
            """
        )
    }

    // 3. Add preference check in refresh() to initialize extension state
    execute {
        SpeedCamerasRefreshFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, $EXTENSION_CLASS;->initialize(Landroid/content/Context;)V
            """
        )
    }

    // 4. Modify mapItems() to conditionally inject Blitzer.de cameras
    execute {
        SpeedCamerasMapItemsFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $EXTENSION_CLASS;->getBlitzerMapItems()Ljava/util/List;
                if-nez v0, :inject_blitzer
                goto :return_original

                :inject_blitzer
                invoke-virtual {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

                :return_original
                return-object v0
            """
        )
    }
}

/**
 * Resource patch to add the Blitzer.de toggle to Speed Cameras preferences.
 */
val blitzerPreferencePatch = resourcePatch(
    name = "BlitzerMorphPreference",
    description = "Adds Blitzer.de cameras toggle to Speed Cameras settings",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MAPS)

    execute {
        // Read the preferences XML
        val file = get("res/xml/preferences_speed_cameras.xml", true)
        val content = file.readText()
        
        // Add the new preference before the closing PreferenceScreen
        val newPref = """
            <SwitchPreference
                android:key="blitzer_de_cameras"
                android:title="Blitzer.de cameras"
                android:summary="Show live Blitzer.de speed cameras from Atudo API"
                android:defaultValue="true" />
            </PreferenceScreen>"""
        
        val newContent = content.replace("</PreferenceScreen>", newPref.trim())
        file.writeText(newContent)
    }
}