package dev.jason.gboardpatches.patches.gboard.features.toolbarroundchips

import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val gboardToolbarRoundChipsSoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "Applies adaptive circular toolbar icon backgrounds after SoftKeyView bind.",
    feature = GboardSoftKeyFamilyFeature.TOOLBAR_ROUND_CHIPS,
)
