package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardAdvancedVoiceFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "在 18.0.3 stock flag getter 後套用 Advanced Voice 與 Rambler typed policy。",
    feature = GboardFlagFamilyFeature.ADVANCED_VOICE_TYPING,
)
