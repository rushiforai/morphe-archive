package app.template.patches.yandexnavi

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_YANDEX_NAVIGATOR

/**
 * Replaces the two stock boolean gates so the internal debug drawer / "Дебаг-панель" path always sees enabled flags.
 *
 * Targets Yandex Navigator **28.6.5** (versionCode 739172520) matching signing cert from Play `base.apk`.
 */
@Suppress("unused")
val enableDebugPanelPatch = bytecodePatch(
    name = "Enable debug panel",
    description = "Unlocks the internal Maps-shell debug panel gate (Yandexoid prefs + swipable experiment).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YANDEX_NAVIGATOR)

    execute {
        listOf(
            YandexMapsDebugV0NextLaunchFingerprint,
            YandexMapsDebugM0PanelVisibilityFingerprint,
        ).forEach { fp ->
            fp.method.apply {
                val impl = implementation!!
                val size = impl.instructions.size
                removeInstructions(0, size)
                addInstructions(
                    0,
                    """
                    const/4 v0, 0x1
                    return v0
                    """.trimIndent(),
                )
            }
        }
    }
}
