package dev.jason.gboardpatches.patches.gboard.features.spacebargesture

import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val gboardSpacebarGestureSoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "Applies optional language switch (Globe) key visibility after SoftKeyView bind.",
    feature = GboardSoftKeyFamilyFeature.SAMSUNG_SPACEBAR_GESTURES,
)
