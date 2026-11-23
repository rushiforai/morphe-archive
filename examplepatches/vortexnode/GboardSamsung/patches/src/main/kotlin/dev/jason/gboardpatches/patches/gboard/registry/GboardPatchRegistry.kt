package dev.jason.gboardpatches.patches.gboard.registry

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.Patch
import dev.jason.gboardpatches.patches.gboard.features.editingaccesspoints.gboardEditingAccessPointsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.editingaccesspoints.gboardEditingAccessPointsLifecyclePatch
import app.morphe.patcher.patch.ResourcePatchBuilder
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import dev.jason.gboardpatches.patches.gboard.features.accesspointcount.gboardAccessPointCountFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.accesspointcount.gboardAccessPointCountFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.accesspointsmenu.gboardAccessPointsMenuFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.accesspointsmenu.gboardAccessPointsMenuFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.advancedvoice.gboardAdvancedVoiceFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.gboardBluetoothMicrophoneFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.gboardBluetoothMicrophoneFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.backuprestore.gboardBackupRestoreFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.backuprestore.gboardBackupRestoreManifestPatch
import dev.jason.gboardpatches.patches.gboard.features.calculator.gboardCalculatorFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.calculator.gboardCalculatorLifecyclePatch
import dev.jason.gboardpatches.patches.gboard.features.about.gboardAboutPageResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardCustomSymbolsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardAdapterTrimPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardColumnCountPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardItemBindPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardLoaderPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardPrunePatch
import dev.jason.gboardpatches.patches.gboard.features.clipboardcontentlimit.gboardClipboardContentLimitFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboardcontentlimit.gboardClipboardContentLimitFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.closeproactivesuggestions.gboardCloseProactiveSuggestionsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.closeproactivesuggestions.gboardCloseProactiveSuggestionsFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.developeroptions.gboardDeveloperOptionsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeAssetsPatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeManifestPatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeOfficialImportPatch
import dev.jason.gboardpatches.patches.gboard.features.emojisize.gboardEmojiSizeFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.emojisize.gboardEmojiSizeFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.websearch.gboardFloatingWebSearchFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.websearch.gboardFloatingWebSearchManifestPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardDeviceIntelligenceFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardDeviceIntelligenceFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardGrammarCheckerFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardGrammarCheckerFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardInlineSuggestionsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardInlineSuggestionsFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardKeyShapeSelectionFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardKeyShapeSelectionFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.longpressquickactions.gboardLongPressQuickActionsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.manualincognito.gboardManualIncognitoFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.manualincognito.gboardManualIncognitoLifecyclePatch
import dev.jason.gboardpatches.patches.gboard.features.manualincognito.gboardManualIncognitoPolicyPatch
import dev.jason.gboardpatches.patches.gboard.features.packagerename.GboardPackageRenameTarget
import dev.jason.gboardpatches.patches.gboard.features.packagerename.applyGboardApplicationDisplayName
import dev.jason.gboardpatches.patches.gboard.features.packagerename.gboardPackageRenameResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.appicon.gboardCustomAppIconResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.packagerename.isValidGboardAppDisplayName
import dev.jason.gboardpatches.patches.gboard.features.packagerename.isValidGboardTargetPackageName
import dev.jason.gboardpatches.patches.gboard.features.quickinsert.gboardQuickInsertFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.quickinsert.gboardQuickInsertFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.roundedkeyboard.gboardRoundedKeyboardFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.frostedglass.gboardFrostedGlassFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.frostedglass.gboardFrostedGlassLifecyclePatch
import dev.jason.gboardpatches.patches.gboard.features.settingshomepage.gboardSettingsHomepageBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.settingshomepage.gboardSettingsHomepageFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.signaturebypass.gboardSignatureBypassBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.splitkeyboard.gboardSplitKeyboardFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.splitkeyboard.gboardSplitKeyboardAccessPointPatch
import dev.jason.gboardpatches.patches.gboard.features.splitkeyboard.gboardSplitKeyboardModePatch
import dev.jason.gboardpatches.patches.gboard.features.spacebargesture.gboardSpacebarGestureFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.spacebargesture.gboardSpacebarGestureResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.toolbarroundchips.gboardToolbarRoundChipsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.toolbarroundchips.gboardToolbarRoundChipsSoftKeyPatch
import dev.jason.gboardpatches.patches.gboard.features.symbolfooter.gboardSymbolFooterOrderBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.symbolfooter.gboardSymbolFooterOrderFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.swipedismiss.gboardSwipeDismissBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.swipedismiss.gboardSwipeDismissFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesSettingsPatch
import dev.jason.gboardpatches.patches.gboard.shared.accesspoint.gboardAccessPointContributions1803Patch
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardTargetAdmission
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_DEFAULT_PATCHED_PACKAGE_NAME
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PACKAGE_NAME

@Suppress("unused")
val gboardLanguageModelVersionsPatch = gboardPublicResourcePatch(
    featureId = "language_model_versions",
    name = "Dictionaries & Predictions",
    description = "Choose resource versions for dictionaries, predictions, and input correction.\n" +
        "Выбор версий ресурсов для словарей, подсказок и исправления ввода.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesSettingsPatch,
        dev.jason.gboardpatches.patches.gboard.features.languagemodels.gboardLanguageModelFeatureMarkerPatch,
        dev.jason.gboardpatches.patches.gboard.features.languagemodels.gboardLanguageModelResourcesPatch)
}

@Suppress("unused")
val gboardKeypressHapticsPatch = gboardPublicResourcePatch(
    featureId = "keypress_haptics",
    name = "Keypress Vibration Intensity Control",
    description = "Control keypress vibration intensity instead of duration.\n" +
        "Управление силой вибрации при нажатии клавиш вместо её длительности.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesSettingsPatch,
        dev.jason.gboardpatches.patches.gboard.features.keypresshaptics.gboardKeypressHapticsFeatureMarkerPatch,
        dev.jason.gboardpatches.patches.gboard.features.keypresshaptics.gboardKeypressHapticsFlagValuePatch)
}

private fun gboardPublicResourcePatch(
    featureId: String,
    name: String,
    description: String,
    default: Boolean,
    block: ResourcePatchBuilder.() -> Unit,
) = GboardTargetAdmission.admittedContributions(featureId).let { admitted ->
    resourcePatch(
        name = name.takeIf { admitted.isNotEmpty() },
        description = description,
        default = default,
    ) {
        if (admitted.isNotEmpty()) {
            block()
            GboardContributionWiring.wireAdmitted(featureId, admitted, this)
        }
    }
}

@Suppress("unused")
val gboardLongPressQuickActionsPatch = gboardPublicResourcePatch(
    featureId = "long_press_editing_shortcuts",
    name = "Long-Press Editing Shortcuts",
    description = "Add Select all, Undo, Copy, Cut, Paste, and Redo long-press shortcuts " +
        "to English QWERTY and Zhuyin.\n" +
        "Добавляет быстрые действия по долгому нажатию (Выбрать всё, Отменить, Копировать, Вырезать, Вставить, Повторить) на английской QWERTY и Zhuyin.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardLongPressQuickActionsFeatureMarkerPatch,
    )
}

@Suppress("unused")
val gboardManualIncognitoModePatch = gboardPublicResourcePatch(
    featureId = "incognito_mode_toggle",
    name = "Incognito Mode Toggle",
    description = "Add an Incognito toggle to the Access Point toolbar and configure clipboard and voice typing availability while Incognito mode is active.\n" +
        "Добавляет переключатель режима инкогнито на панель инструментов и позволяет настроить работу буфера обмена и голосового ввода в этом режиме.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardManualIncognitoFeatureMarkerPatch,
        gboardManualIncognitoLifecyclePatch,
        gboardManualIncognitoPolicyPatch,
        gboardAccessPointContributions1803Patch,
    )
}

@Suppress("unused")
val gboardEditingAccessPointsPatch = gboardPublicResourcePatch(
    featureId = "editing_access_points",
    name = "Toolbar Editing Buttons",
    description = "Add Select All, Copy, Cut and Paste to the menu.\n" +
        "Добавляет кнопки «Выбрать всё», «Копировать», «Вырезать» и «Вставить» в меню панели инструментов.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        gboardPatchesSettingsPatch,
        gboardEditingAccessPointsFeatureMarkerPatch,
        gboardEditingAccessPointsLifecyclePatch,
        gboardAccessPointContributions1803Patch,
    )
}

@Suppress("unused")
val gboardFloatingWebSearchPatch = gboardPublicResourcePatch(
    featureId = "floating_web_search",
    name = "Floating Web Search",
    description = "Open a floating web page directly from Gboard to quickly search for the information you need.\n" +
        "Открывает плавающее окно веб-поиска прямо из Gboard для быстрого поиска информации.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardFloatingWebSearchFeatureMarkerPatch,
        gboardFloatingWebSearchManifestPatch,
        gboardAccessPointContributions1803Patch,
    )
}

@Suppress("unused")
val gboardSimpleCalculatorPatch = gboardPublicResourcePatch(
    featureId = "simple_calculator",
    name = "Simple Calculator",
    description = "Type an expression and show a scrollable equation plus its answer in Gboard's suggestion row.\n" +
        "Показывает введённое математическое выражение и результат вычисления в строке подсказок Gboard.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardCalculatorFeatureMarkerPatch,
        gboardCalculatorLifecyclePatch,
    )
}

@Suppress("unused")
val gboardSwipeDismissPatch = gboardPublicResourcePatch(
    featureId = "swipe_down_to_dismiss_keyboard",
    name = "Swipe Down to Dismiss Keyboard",
    description = "Swipe down from the suggestions or toolbar to close the keyboard.\n" +
        "Свайп вниз от строки подсказок или панели инструментов для закрытия клавиатуры.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardSwipeDismissFeatureMarkerPatch,
        gboardSwipeDismissBytecodePatch,
    )
}

@Suppress("unused")
val gboardSamsungSpacebarGesturesPatch = gboardPublicResourcePatch(
    featureId = "samsung_spacebar_gestures",
    name = "Samsung Spacebar Gestures",
    description = "Enable Samsung-style spacebar gestures: swipe left/right to switch languages, long-press to move the cursor, and optionally hide the language switch key.\n" +
        "Жесты на пробеле в стиле Samsung: свайп влево/вправо переключает язык, удержание перемещает курсор, а также доступна настройка скрытия клавиши переключения языка.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardSpacebarGestureFeatureMarkerPatch,
        gboardSpacebarGestureResourcePatch,
    )
}

@Suppress("unused")
val gboardCustomAppIconPatch = gboardPublicResourcePatch(
    featureId = "custom_app_icon",
    name = "Custom App Icon",
    description = "Replace Gboard's launcher icon with the GboardSamsung Light/Dark adaptive icon.\n" +
        "Заменяет иконку приложения на фирменную адаптивную иконку GboardSamsung (светлая и тёмная темы).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardCustomAppIconResourcePatch,
    )
}

@Suppress("unused")
val gboardToolbarRoundChipsPatch = gboardPublicResourcePatch(
    featureId = "toolbar_round_chips",
    name = "Toolbar Round Chips",
    description = "Add adaptive circular backgrounds behind eligible icons in Gboard's top toolbar.\n" +
        "Добавляет адаптивные круглые подложки под подходящими значками верхней панели Gboard.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardToolbarRoundChipsFeatureMarkerPatch,
        gboardToolbarRoundChipsSoftKeyPatch,
    )
}

@Suppress("unused")
val gboardAdvancedVoiceTypingPatch = gboardPublicResourcePatch(
    featureId = "advanced_voice_typing",
    name = "Advanced Voice Typing",
    description = "Enable Advanced Voice Typing with automatic punctuation, and separately enable automatic punctuation for Traditional Chinese voice typing, which does not support Advanced Voice Typing.\n" +
        "Включает расширенный голосовой ввод с автопунктуацией, а также отдельно включает автопунктуацию для традиционного китайского.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAdvancedVoiceFeatureMarkerPatch,
    )
}

@Suppress("unused")
val gboardBluetoothMicrophonePatch = gboardPublicResourcePatch(
    featureId = "use_bluetooth_microphone",
    name = "Use Bluetooth Microphone",
    description = "Enable Voice typing -> Use Bluetooth microphone.\n" +
        "Включает опцию «Голосовой ввод -> Использовать Bluetooth-микрофон».",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardBluetoothMicrophoneFeatureMarkerPatch,
        gboardBluetoothMicrophoneFlagValuePatch,
    )
}

@Suppress("unused")
val gboardEmojiSizePatch = gboardPublicResourcePatch(
    featureId = "change_emoji_size",
    name = "Change emoji size",
    description = "Change emoji size.\n" +
        "Позволяет изменять размер эмодзи на клавиатуре.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardEmojiSizeFeatureMarkerPatch,
        gboardEmojiSizeFlagValuePatch,
    )
}

@Suppress("unused")
val gboardAccessPointsMenuStylePatch = gboardPublicResourcePatch(
    featureId = "access_points_menu_style",
    name = "Access Points menu style",
    description = "Switch between the new and legacy Access Points menu styles.\n" +
        "Переключает стиль меню панели инструментов между новым и классическим.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAccessPointsMenuFeatureMarkerPatch,
        gboardAccessPointsMenuFlagValuePatch,
    )
}

@Suppress("unused")
val gboardSplitKeyboardPatch = gboardPublicResourcePatch(
    featureId = "enable_split_keyboard",
    name = "Enable split keyboard",
    description = "Enable the split keyboard layout.\n" +
        "Включает разделённую раскладку клавиатуры.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardSplitKeyboardFeatureMarkerPatch,
        gboardSplitKeyboardAccessPointPatch,
        gboardSplitKeyboardModePatch,
    )
}

@Suppress("unused")
val gboardRoundedKeyboardPanelPatch = gboardPublicResourcePatch(
    featureId = "rounded_keyboard_panel",
    name = "Rounded Keyboard Panel",
    description = "Customize which corners of the keyboard panel are rounded, and set the top and bottom radii separately.\n" +
        "Позволяет выбрать скругляемые углы панели клавиатуры и отдельно задать верхний и нижний радиусы.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardRoundedKeyboardFeatureMarkerPatch,
    )
}

@Suppress("unused")
val gboardFrostedGlassPatch = gboardPublicResourcePatch(
    featureId = "frosted_glass",
    name = "Frosted Glass",
    description = "Add live background blur and custom-theme opacity to the keyboard.\n" +
        "Добавляет размытие фона в реальном времени и настройку прозрачности пользовательских тем.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardFrostedGlassFeatureMarkerPatch,
        gboardFrostedGlassLifecyclePatch,
    )
}

@Suppress("unused")
val gboardAccessPointCountPatch = gboardPublicResourcePatch(
    featureId = "access_point_count",
    name = "Top Toolbar Item Count",
    description = "Customize the Gboard top toolbar item count.\n" +
        "Позволяет настроить количество значков на верхней панели инструментов Gboard.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAccessPointCountFeatureMarkerPatch,
        gboardAccessPointCountFlagValuePatch,
    )
}

@Suppress("unused")
val gboardCloseProactiveSuggestionsPatch = gboardPublicResourcePatch(
    featureId = "close_proactive_suggestions",
    name = "Close Proactive Suggestions",
    description = "Show a dismiss button in the proactive suggestions bar.\n" +
        "Показывает кнопку закрытия на панели проактивных подсказок.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardCloseProactiveSuggestionsFeatureMarkerPatch,
        gboardCloseProactiveSuggestionsFlagValuePatch,
    )
}

@Suppress("unused")
val gboardCustomThemePatch = gboardPublicResourcePatch(
    featureId = "custom_theme",
    name = "Custom Theme",
    description = "Import custom ZIP themes and beautiful themes from the official Rboard repository.\n" +
        "Поддерживает импорт пользовательских ZIP-тем и тем из официального репозитория Rboard.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        gboardPatchesSettingsPatch,
        gboardCustomThemeFeatureMarkerPatch,
        gboardCustomThemeAssetsPatch,
        gboardCustomThemeManifestPatch,
        gboardCustomThemeOfficialImportPatch,
    )
}

@Suppress("unused")
val gboardQuickInsertPatch = gboardPublicResourcePatch(
    featureId = "quick_insert",
    name = "Quick Insert",
    description = "Enable the Quick Insert panel and toolbar access point.\n" +
        "Включает панель быстрой вставки и её значок на панели инструментов.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardQuickInsertFeatureMarkerPatch,
        gboardQuickInsertFlagValuePatch,
    )
}

@Suppress("unused")
val gboardCustomSymbolsPatch = gboardPublicResourcePatch(
    featureId = "custom_symbols",
    name = "Custom Symbols",
    description = "Add a dedicated custom symbols tab and replace the long-press comma entry with a heart shortcut.\n" +
        "Добавляет отдельную вкладку специальных символов и заменяет долгое нажатие запятой на быстрый переход к символам.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardAboutPageResourcePatch,
        gboardCustomSymbolsFeatureMarkerPatch,
    )
}

@Suppress("unused")
val gboardDeveloperOptionsPatch = gboardPublicResourcePatch(
    featureId = "developer_options",
    name = "Developer options",
    description = "Enable Developer options and the Flag Editor, allowing you to modify flag values.\n" +
        "Включает параметры разработчика и редактор флагов для ручного изменения значений флагов Gboard.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardDeveloperOptionsFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardBackupRestorePatch = gboardPublicResourcePatch(
    featureId = "backup_restore",
    name = "Backup & Restore",
    description = "Export or restore all Patches settings, and back up, compare, or restore the Gboard PB/XML flag store.\n" +
        "Экспорт и восстановление всех настроек патчей, а также резервное копирование и сравнение хранилища флагов Gboard (PB/XML).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardBackupRestoreFeatureMarkerPatch,
        gboardBackupRestoreManifestPatch,
    )
}

@Suppress("unused")
val gboardSymbolsFooterOrderPatch = gboardPublicResourcePatch(
    featureId = "emojis_stickers_gifs_tab_order",
    name = "Emojis, stickers & GIFs Tab Order",
    description = "Customize the bottom tab order in Gboard's Emojis, stickers & GIFs panel with drag-and-drop reordering.\n" +
        "Позволяет менять порядок нижних вкладок панели эмодзи, стикеров и GIF перетаскиванием.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardSymbolFooterOrderFeatureMarkerPatch,
        gboardSymbolFooterOrderBytecodePatch
    )
}

@Suppress("unused")
val gboardClipboardEnhancementsPatch = gboardPublicResourcePatch(
    featureId = "clipboard_enhancements",
    name = "Clipboard Enhancements",
    description = "Enhance clipboard retention time, item count limit, preview lines, countdown/creation time labels, order index, and column count.\n" +
        "Расширяет буфер обмена: срок хранения, лимит записей, строки предпросмотра, таймер/время создания, нумерацию и число столбцов.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardAboutPageResourcePatch,
        gboardPatchesSettingsPatch,
        gboardClipboardFeatureMarkerPatch,
        gboardClipboardLoaderPatch,
        gboardClipboardPrunePatch,
        gboardClipboardColumnCountPatch,
        gboardClipboardAdapterTrimPatch,
        gboardClipboardItemBindPatch
    )
}

@Suppress("unused")
val gboardClipboardContentLimitPatch = gboardPublicResourcePatch(
    featureId = "clipboard_custom_character_limit",
    name = "Clipboard Custom Character Limit",
    description = "Customize the maximum character count for each text clipboard item.\n" +
        "Позволяет задать максимальное количество символов для каждой текстовой записи буфера обмена.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardClipboardContentLimitFeatureMarkerPatch,
        gboardClipboardContentLimitFlagValuePatch
    )
}

@Suppress("unused")
val gboardDeviceIntelligencePatch = gboardPublicResourcePatch(
    featureId = "enable_inline_autofill_suggestions",
    name = "Enable Inline Autofill Suggestions",
    description = "Enable Inline Autofill Suggestions.\n" +
        "Включает встроенные подсказки автозаполнения в строке предложений.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardDeviceIntelligenceFlagValuePatch,
        gboardDeviceIntelligenceFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardGrammarCheckerFlagPatch = gboardPublicResourcePatch(
    featureId = "grammar_checker",
    name = "Grammar Checker",
    description = "Enable Text correction > Grammar check.\n" +
        "Включает раздел «Исправление текста > Проверка грамматики».",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardGrammarCheckerFlagValuePatch,
        gboardGrammarCheckerFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardInlineSuggestionsFlagPatch = gboardPublicResourcePatch(
    featureId = "inline_suggestions",
    name = "Inline Suggestions",
    description = "Enable Text correction > Smart Compose.\n" +
        "Включает функцию «Исправление текста > Умный ввод».",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardInlineSuggestionsFlagValuePatch,
        gboardInlineSuggestionsFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardKeyShapeSelectionFlagPatch = gboardPublicResourcePatch(
    featureId = "key_shape_selection",
    name = "Key Shape Selection",
    description = "Enable Key shape in Theme details.\n" +
        "Включает выбор формы клавиш (включая скруглённые) в параметрах темы.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardKeyShapeSelectionFlagValuePatch,
        gboardKeyShapeSelectionFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardAiWritingToolsPatch = gboardPublicResourcePatch(
    featureId = "ai_writing_tools",
    name = "AI Writing Tools",
    description = "Enable AI writing tools with support for all languages.\n" +
        "Включает ИИ-инструменты для работы с текстом с поддержкой всех языков.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAiWritingToolsFeatureMarkerPatch,
        gboardAiWritingToolsFlagValuePatch,
    )
}

@Suppress("unused")
val gboardSettingsHomepagePatch = gboardPublicResourcePatch(
    featureId = "settings_homepage_override",
    name = "Settings Homepage Override",
    description = "Allow switching between the new and legacy Gboard settings pages.\n" +
        "Позволяет переключаться между новой и классической главной страницей настроек Gboard.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardSettingsHomepageFeatureMarkerPatch,
        gboardSettingsHomepageBytecodePatch
    )
}

@Suppress("unused")
val gboardPackageRenamePatch = gboardPublicResourcePatch(
    featureId = "package_rename",
    name = "Package Rename",
    description = "Configure the Android package name (default gboardsamsung.com.google.android.inputmethod.latin, " +
        "official com.google.android.inputmethod.latin, or a custom package ID) and allow a custom app name.\n" +
        "Позволяет задать имя Android-пакета (по умолчанию gboardsamsung.com.google.android.inputmethod.latin, " +
        "официальный com.google.android.inputmethod.latin или собственный ID пакета) и пользовательское название приложения.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    val packageName = stringOption(
        key = "package_name",
        default = GBOARD_DEFAULT_PATCHED_PACKAGE_NAME,
        values = linkedMapOf(
            GBOARD_DEFAULT_PATCHED_PACKAGE_NAME to GBOARD_DEFAULT_PATCHED_PACKAGE_NAME,
            GBOARD_PACKAGE_NAME to GBOARD_PACKAGE_NAME,
        ),
        title = "Package name / Имя пакета",
        description = "Android package ID for the patched app: keep the default side-by-side ID, " +
            "use com.google.android.inputmethod.latin, or enter any valid custom Android package name.\n" +
            "ID Android-пакета пропатченного приложения: оставьте значение по умолчанию для установки рядом, " +
            "выберите com.google.android.inputmethod.latin или введите собственное корректное имя пакета.",
        required = true,
    ) { value ->
        isValidGboardTargetPackageName(value)
    }

    val appDisplayName = stringOption(
        key = "app_display_name",
        default = "GboardSamsung",
        values = linkedMapOf(
            "GboardSamsung" to "GboardSamsung",
            "Gboard" to "Gboard",
            "Gboard Dev" to "Gboard Dev",
            "Gboard Patches" to "Gboard Patches",
            "Gboard Mod" to "Gboard Mod",
        ),
        title = "App name / Название приложения",
        description = "",
        required = true,
    ) { value ->
        isValidGboardAppDisplayName(value)
    }

    dependsOn(
        gboardPackageRenameResourcePatch
    )

    execute {
        val resolvedPackageName = checkNotNull(packageName.value)
        require(isValidGboardTargetPackageName(resolvedPackageName)) {
            "Invalid Gboard target package name '$resolvedPackageName'"
        }
        GboardPackageRenameTarget.packageName = resolvedPackageName
    }

    finalize {
        applyGboardApplicationDisplayName(displayName = checkNotNull(appDisplayName.value))
    }
}

@Suppress("unused")
val gboardSignatureBypassPatch = gboardPublicResourcePatch(
    featureId = "add_gboard_signature_bypass",
    name = "Add Gboard Signature Bypass",
    description = "Bypass Gboard signature whitelist checks and force them to pass.\n" +
        "Обходит проверки белого списка подписей Gboard и принудительно пропускает их.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardSignatureBypassBytecodePatch
    )
}

object GboardPublishedPatchCatalog {
    val morpheRegistrations: Set<Patch<*>> = linkedSetOf(
        gboardLongPressQuickActionsPatch,
        gboardManualIncognitoModePatch,
        gboardFloatingWebSearchPatch,
        gboardEditingAccessPointsPatch,
        gboardSimpleCalculatorPatch,
        gboardSwipeDismissPatch,
        gboardSamsungSpacebarGesturesPatch,
        gboardToolbarRoundChipsPatch,
        gboardCustomAppIconPatch,
        gboardAdvancedVoiceTypingPatch,
        gboardBluetoothMicrophonePatch,
        gboardEmojiSizePatch,
        gboardAccessPointsMenuStylePatch,
        gboardSplitKeyboardPatch,
        gboardRoundedKeyboardPanelPatch,
        gboardFrostedGlassPatch,
        gboardAccessPointCountPatch,
        gboardCloseProactiveSuggestionsPatch,
        gboardCustomThemePatch,
        gboardQuickInsertPatch,
        gboardCustomSymbolsPatch,
        gboardBackupRestorePatch,
        gboardDeveloperOptionsPatch,
        gboardSymbolsFooterOrderPatch,
        gboardClipboardEnhancementsPatch,
        gboardClipboardContentLimitPatch,
        gboardDeviceIntelligencePatch,
        gboardGrammarCheckerFlagPatch,
        gboardInlineSuggestionsFlagPatch,
        gboardKeyShapeSelectionFlagPatch,
        gboardAiWritingToolsPatch,
        gboardLanguageModelVersionsPatch,
        gboardKeypressHapticsPatch,
        gboardSettingsHomepagePatch,
        gboardPackageRenamePatch,
        gboardSignatureBypassPatch,
    ).filterTo(linkedSetOf()) { patch -> patch.name != null }

    fun publishedInventory(version: String): String {
        val publishedPatches = morpheRegistrations.sortedBy { patch -> patch.name }.map { patch ->
            PublishedPatch(
                name = patch.name!!,
                description = patch.description,
                use = patch.default,
                dependencies = patch.dependencies.mapNotNull { dependency -> dependency.name }.sorted(),
                compatiblePackages = patch.compatibility?.mapNotNull { compatibility ->
                    compatibility.publishedPackageVersions()
                }?.toMap(),
                options = patch.options.values.map { option ->
                    PublishedPatch.Option(
                        key = option.key,
                        title = option.title,
                        description = option.description,
                        required = option.required,
                        type = option.type.toString(),
                        default = option.default,
                        values = option.values,
                    )
                },
            )
        }
        val gson = GsonBuilder()
            .serializeNulls()
            .disableHtmlEscaping()
            .setPrettyPrinting()
            .create()
        val inventory = JsonObject().apply {
            addProperty("version", version)
            add("patches", gson.toJsonTree(publishedPatches))
        }

        return gson.toJson(inventory) + "\n"
    }

    // Keeps the published package-to-versions shape that patcher 2.x no longer exposes:
    // stable targets win over experimental ones, and any version-less target means all versions.
    private fun Compatibility.publishedPackageVersions(): Pair<String, Set<String>?>? {
        val packageName = packageName ?: return null
        val listedTargets = targets.filter { target -> !target.isExperimental }.ifEmpty { targets }
        if (listedTargets.isEmpty() || listedTargets.any { target -> target.version == null }) {
            return packageName to null
        }
        return packageName to listedTargets.mapTo(linkedSetOf()) { target -> target.version!! }
    }

    private class PublishedPatch(
        val name: String,
        val description: String?,
        val use: Boolean,
        val dependencies: List<String>,
        val compatiblePackages: Map<String, Set<String>?>?,
        val options: List<Option>,
    ) {
        class Option(
            val key: String,
            val title: String?,
            val description: String?,
            val required: Boolean,
            val type: String,
            val default: Any?,
            val values: Map<String, Any?>?,
        )
    }
}
