package dev.jason.gboardpatches.patches.gboard.features.toolbarroundchips

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardToolbarRoundChipsFeatureMarkerPatch = resourcePatch(
    description = "Marks Toolbar Round Chips as patched in the target APK for the shared settings UI.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(TOOLBAR_ROUND_CHIPS_FEATURE_MARKER_NAME)
    }
}

private const val TOOLBAR_ROUND_CHIPS_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.toolbar_round_chips"
