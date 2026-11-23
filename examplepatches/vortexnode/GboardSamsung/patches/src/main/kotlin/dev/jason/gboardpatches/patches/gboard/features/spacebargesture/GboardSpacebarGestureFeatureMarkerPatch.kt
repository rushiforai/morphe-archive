package dev.jason.gboardpatches.patches.gboard.features.spacebargesture

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardSpacebarGestureFeatureMarkerPatch = resourcePatch(
    description = "Marks Samsung Spacebar Gestures as patched in the target APK for the shared settings UI.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(SAMSUNG_SPACEBAR_GESTURES_FEATURE_MARKER_NAME)
    }
}

private const val SAMSUNG_SPACEBAR_GESTURES_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.samsung_spacebar_gestures"
