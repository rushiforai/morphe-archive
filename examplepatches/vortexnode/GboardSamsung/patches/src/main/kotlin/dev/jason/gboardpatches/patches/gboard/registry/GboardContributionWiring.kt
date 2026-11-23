package dev.jason.gboardpatches.patches.gboard.registry

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.ResourcePatchBuilder
import dev.jason.gboardpatches.patches.gboard.features.accesspointsmenu.gboardAccessPointsMenu1853Patch
import dev.jason.gboardpatches.patches.gboard.features.accesspointsmenu.gboardAccessPointsMenuFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingTools1853PreferenceObserverPatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsCorpusPatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsEmoticonStatePatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsEntryPatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsHistoryPatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsRecyclerPatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsRoutingPatch
import dev.jason.gboardpatches.patches.gboard.features.advancedvoice.gboardAdvancedVoice1803ZhTwPatch
import dev.jason.gboardpatches.patches.gboard.features.advancedvoice.gboardAdvancedVoiceFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.longpressquickactions.gboardLongPressQuickActionsInputEventPatch
import dev.jason.gboardpatches.patches.gboard.features.longpressquickactions.gboardLongPressQuickActionsGesturePatch
import dev.jason.gboardpatches.patches.gboard.features.longpressquickactions.gboardLongPressQuickActionsPointerOwnerPatch
import dev.jason.gboardpatches.patches.gboard.features.longpressquickactions.gboardLongPressQuickActionsSoftKeyPatch
import dev.jason.gboardpatches.patches.gboard.features.rambler.gboardRambler1803OfficialSelectorPatch
import dev.jason.gboardpatches.patches.gboard.features.roundedkeyboard.gboardRoundedKeyboardBytecodePatch

import dev.jason.gboardpatches.patches.gboard.features.languagemodels.gboardLanguageModelFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.languagemodels.gboardLanguageModelCachePatch
import dev.jason.gboardpatches.patches.gboard.features.languagemodels.gboardLanguageModelHmmPatch
import dev.jason.gboardpatches.patches.gboard.features.languagemodels.gboardLanguageModelDecoderPatch
import dev.jason.gboardpatches.patches.gboard.features.spacebargesture.gboardSpacebarGestureBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.spacebargesture.gboardSpacebarGestureSoftKeyPatch

internal class GboardContributionWiringUnit(
    val contributionIds: Set<String>,
    private val dependencySupplier: () -> Array<Patch<*>>,
) {
    fun dependencies(): Array<Patch<*>> = dependencySupplier()
}

internal object GboardContributionWiring {
    private val unitsByFeature = mapOf(
        "language_model_versions" to listOf(
            unit("language_model_versions.flag") { arrayOf(gboardLanguageModelFlagValuePatch) },
            unit("language_model_versions.cache") { arrayOf(gboardLanguageModelCachePatch) },
            unit("language_model_versions.hmm") { arrayOf(gboardLanguageModelHmmPatch) },
            unit("language_model_versions.decoder") { arrayOf(gboardLanguageModelDecoderPatch) },
        ),
        "ai_writing_tools" to listOf(
            unit("ai_writing_tools.flag") { arrayOf(gboardAiWritingToolsFlagValuePatch) },
            unit("ai_writing_tools.preference_observer") { arrayOf(gboardAiWritingTools1853PreferenceObserverPatch) },
        ),
        "access_points_menu_style" to listOf(
            unit("access_points_menu_style.flag") { arrayOf(gboardAccessPointsMenuFlagValuePatch) },
            unit("access_points_menu_style.bytecode") { arrayOf(gboardAccessPointsMenu1853Patch) },
        ),
        "advanced_voice_typing" to listOf(
            unit("advanced_voice_typing.flag") {
                arrayOf(gboardAdvancedVoiceFlagValuePatch)
            },
            unit("advanced_voice_typing.bytecode") {
                arrayOf(
                    gboardAdvancedVoice1803ZhTwPatch,
                    gboardRambler1803OfficialSelectorPatch,
                )
            },
        ),
        "custom_symbols" to listOf(
            unit("custom_symbols.soft_key") {
                arrayOf(gboardZhuyinCustomSymbolsEntryPatch)
            },
            unit("custom_symbols.bytecode") {
                arrayOf(
                    gboardZhuyinCustomSymbolsCorpusPatch,
                    gboardZhuyinCustomSymbolsRoutingPatch,
                    gboardZhuyinCustomSymbolsEmoticonStatePatch,
                    gboardZhuyinCustomSymbolsHistoryPatch,
                    gboardZhuyinCustomSymbolsRecyclerPatch,
                )
            },
        ),
        "long_press_editing_shortcuts" to listOf(
            unit("long_press_editing_shortcuts.soft_key") {
                arrayOf(gboardLongPressQuickActionsSoftKeyPatch)
            },
            unit("long_press_editing_shortcuts.input_event") {
                arrayOf(gboardLongPressQuickActionsInputEventPatch)
            },
            unit("long_press_editing_shortcuts.pointer") {
                arrayOf(gboardLongPressQuickActionsPointerOwnerPatch)
            },
            unit("long_press_editing_shortcuts.gesture") {
                arrayOf(gboardLongPressQuickActionsGesturePatch)
            },
        ),
        "rounded_keyboard_panel" to listOf(
            unit(
                "rounded_keyboard_panel.admission",
                "rounded_keyboard_panel.style",
            ) {
                arrayOf(gboardRoundedKeyboardBytecodePatch)
            },
        ),
        "samsung_spacebar_gestures" to listOf(
            unit("samsung_spacebar_gestures.dispatch") {
                arrayOf(gboardSpacebarGestureBytecodePatch)
            },
            unit("samsung_spacebar_gestures.soft_key") {
                arrayOf(gboardSpacebarGestureSoftKeyPatch)
            },
        ),
    )

    val registeredContributionIdsByFeature: Map<String, Set<String>> =
        unitsByFeature.mapValues { (_, units) ->
            units.flatMapTo(linkedSetOf()) { unit -> unit.contributionIds }
        }

    fun activeContributionIds(featureId: String, admitted: Set<String>): Set<String> =
        activeUnits(featureId, admitted).flatMapTo(linkedSetOf()) { unit -> unit.contributionIds }

    fun wireAdmitted(
        featureId: String,
        admitted: Set<String>,
        builder: ResourcePatchBuilder,
    ) {
        activeUnits(featureId, admitted).forEach { unit ->
            builder.dependsOn(*unit.dependencies())
        }
    }

    private fun activeUnits(
        featureId: String,
        admitted: Set<String>,
    ): List<GboardContributionWiringUnit> {
        val units = unitsByFeature[featureId] ?: return emptyList()
        val registeredIds = units.flatMapTo(linkedSetOf()) { unit -> unit.contributionIds }
        check(admitted.all { contributionId -> contributionId in registeredIds }) {
            "$featureId admits unregistered contribution IDs ${(admitted - registeredIds).sorted()}"
        }
        units.forEach { unit ->
            val admittedUnitIds = unit.contributionIds.intersect(admitted)
            check(admittedUnitIds.isEmpty() || admittedUnitIds == unit.contributionIds) {
                "$featureId partially admits indivisible execution unit " +
                    "${unit.contributionIds.sorted()}: ${admittedUnitIds.sorted()}"
            }
        }
        return units.filter { unit -> unit.contributionIds.all(admitted::contains) }
    }

    private fun unit(
        vararg contributionIds: String,
        dependencySupplier: () -> Array<Patch<*>>,
    ) = GboardContributionWiringUnit(contributionIds.toSet(), dependencySupplier)
}
