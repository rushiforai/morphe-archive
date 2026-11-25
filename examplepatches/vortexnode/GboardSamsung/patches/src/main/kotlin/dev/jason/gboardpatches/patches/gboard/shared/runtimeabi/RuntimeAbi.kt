package dev.jason.gboardpatches.patches.gboard.shared.runtimeabi

internal enum class RuntimeCallId(internal val encodedAbi: String) {
    KEYPRESS_HAPTICS_RUNTIME_APPLY_FLAG_VALUE("Ldev/jason/gboardpatches/extension/keypresshaptics/GboardKeypressHapticsRuntime;->applyFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    LANGUAGE_MODELS_RUNTIME_APPLY_FLAG_VALUE("Ldev/jason/gboardpatches/extension/languagemodels/GboardLanguageModelRuntime;->applyOverriddenFlagValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
    LANGUAGE_MODELS_RUNTIME_RESTRICT_NWP_CACHED_PACK("Ldev/jason/gboardpatches/extension/languagemodels/GboardLanguageModelRuntime;->restrictNwpCachedPack(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
    LANGUAGE_MODELS_RUNTIME_AFTER_HMM_ENROLL("Ldev/jason/gboardpatches/extension/languagemodels/GboardLanguageModelRuntime;->afterHmmEnroll(Ljava/lang/Object;Ljava/lang/String;Z)V"),
    LANGUAGE_MODELS_RUNTIME_AFTER_LANGUAGE_MODEL_LOAD("Ldev/jason/gboardpatches/extension/languagemodels/GboardLanguageModelRuntime;->afterLanguageModelLoad(Ljava/lang/Object;Ljava/lang/Object;Z)V"),
    LANGUAGE_MODELS_RUNTIME_AFTER_LANGUAGE_MODEL_UNLOAD("Ldev/jason/gboardpatches/extension/languagemodels/GboardLanguageModelRuntime;->afterLanguageModelUnload(Ljava/lang/Object;Ljava/lang/Object;Z)V"),
    LANGUAGE_MODELS_RUNTIME_AFTER_ENGINE_ADDED("Ldev/jason/gboardpatches/extension/languagemodels/GboardLanguageModelRuntime;->afterEngineAdded(Ljava/lang/Object;Ljava/lang/Object;)V"),
    LANGUAGE_MODELS_RUNTIME_AFTER_ENGINE_REMOVED("Ldev/jason/gboardpatches/extension/languagemodels/GboardLanguageModelRuntime;->afterEngineRemoved(Ljava/lang/Object;Ljava/lang/Object;)V"),
    LANGUAGE_MODELS_RUNTIME_BEFORE_DECODER_RESET("Ldev/jason/gboardpatches/extension/languagemodels/GboardLanguageModelRuntime;->beforeDecoderReset(Ljava/lang/Object;)V"),

    CLIPBOARD_RUNTIME_ABORT_ITEM_BIND("Ldev/jason/gboardpatches/extension/clipboard/GboardClipboardRuntime;->abortItemBind()V"),
    CLIPBOARD_RUNTIME_RESOLVE_COLUMN_COUNT("Ldev/jason/gboardpatches/extension/clipboard/GboardClipboardRuntime;->resolveColumnCount(Ljava/lang/Object;I)I"),
    CLIPBOARD_RUNTIME_AFTER_LAYOUT("Ldev/jason/gboardpatches/extension/clipboard/GboardClipboardRuntime;->afterLayout(Ljava/lang/Object;)V"),
    AI_WRITING_TOOLS_RUNTIME_NOTE_OFFICIAL_PREFERENCE("Ldev/jason/gboardpatches/extension/writingtools/GboardAiWritingToolsOfficialPreferences;->notePreferenceValue(IZ)V"),
    ADVANCED_VOICE_RUNTIME_SHOULD_CHECK_NATIVE("Ldev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntime;->shouldCheckNative(Z)Z"),
    ADVANCED_VOICE_RUNTIME_CLAIM_MDD("Ldev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntime;->claimMddRequest()Z"),
    ADVANCED_VOICE_RUNTIME_RESET_MDD("Ldev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntime;->resetMddRequest()V"),
    ADVANCED_VOICE_RUNTIME_FORMATTER_GATE("Ldev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntime;->formatterGate(Ljava/util/Locale;ZZ)Z"),
    ADVANCED_VOICE_RUNTIME_SHOULD_SUPPRESS_VOICE_BEEP("Ldev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntime;->shouldSuppressVoiceBeep()Z"),
    ACCESS_POINTS_MENU_RUNTIME_SELECT_BODY("Ldev/jason/gboardpatches/extension/accesspointsmenu/GboardAccessPointsMenuRuntime;->selectBody(I)I"),
    ACCESS_POINTS_MENU_RUNTIME_SELECT_KEYBOARD_LAYOUT("Ldev/jason/gboardpatches/extension/accesspointsmenu/GboardAccessPointsMenuRuntime;->selectKeyboardLayout(I)I"),
    ACCESS_POINTS_MENU_RUNTIME_WANTS_LEGACY("Ldev/jason/gboardpatches/extension/accesspointsmenu/GboardAccessPointsMenuRuntime;->wantsLegacy()Z"),
    ACCESS_POINTS_MENU_RUNTIME_DRAG_SCALE("Ldev/jason/gboardpatches/extension/accesspointsmenu/GboardAccessPointsMenuRuntime;->dragScale(Landroid/view/View;F)F"),
    ACCESS_POINTS_MENU_RUNTIME_DRAG_MODE("Ldev/jason/gboardpatches/extension/accesspointsmenu/GboardAccessPointsMenuRuntime;->dragMode(Landroid/view/View;Z)Z"),
    ACCESS_POINTS_MENU_RUNTIME_PREPARE_DRAG("Ldev/jason/gboardpatches/extension/accesspointsmenu/GboardAccessPointsMenuRuntime;->prepareDrag(Landroid/view/View;Landroid/widget/ImageView;)V"),
    ACCESS_POINTS_MENU_RUNTIME_ROLLBACK_DRAG("Ldev/jason/gboardpatches/extension/accesspointsmenu/GboardAccessPointsMenuRuntime;->rollbackDrag(Landroid/view/View;)V"),
    ACCESS_POINTS_MENU_RUNTIME_COMPLETE_DRAG("Ldev/jason/gboardpatches/extension/accesspointsmenu/GboardAccessPointsMenuRuntime;->completeDrag(Landroid/view/View;)V"),
    EDITING_ACCESS_POINTS_START("Ldev/jason/gboardpatches/extension/editingaccesspoints/GboardEditingAccessPointsRuntime;->start(Ljava/lang/Object;)V"),
    EDITING_ACCESS_POINTS_END("Ldev/jason/gboardpatches/extension/editingaccesspoints/GboardEditingAccessPointsRuntime;->end()V"),
    ACCESS_POINT_COUNT_RUNTIME_APPLY_FLAG_VALUE("Ldev/jason/gboardpatches/extension/accesspointcount/GboardAccessPointCountRuntime;->applyFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    ACCESS_POINT_CONTRIBUTIONS_AFTER_CONTROLLER_CREATED("Ldev/jason/gboardpatches/extension/accesspoint/GboardAccessPointContributionsRuntime;->afterControllerCreated(Ljava/lang/Object;Landroid/content/Context;)V"),
    ACCESS_POINT_CONTRIBUTIONS_INCLUDE_ORDER_CATALOG("Ldev/jason/gboardpatches/extension/accesspoint/GboardAccessPointContributionsRuntime;->includeOrderCatalog(Landroid/content/Context;Ljava/lang/Object;)Ljava/lang/Object;"),
    ACCESS_POINTS_MENU_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE("Ldev/jason/gboardpatches/extension/accesspointsmenu/GboardAccessPointsMenuRuntime;->applyOverriddenFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    ADD_SYMBOLS_RUNTIME_APPEND_CUSTOM_CORPUS_ITEM("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->appendCustomCorpusItem(Ljava/lang/Object;)Ljava/lang/Object;"),
    ADD_SYMBOLS_RUNTIME_BIND_CUSTOM_VIEW_HOLDER("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->bindCustomViewHolder(Ljava/lang/Object;Ljava/lang/Object;I)Z"),
    ADD_SYMBOLS_RUNTIME_BRIDGE_PROVIDER_RECEIVER("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->bridgeProviderReceiver(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
    ADD_SYMBOLS_RUNTIME_CREATE_CUSTOM_VIEW_HOLDER("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->createCustomViewHolder(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;"),
    ADD_SYMBOLS_RUNTIME_ENSURE_EXTENSION_PROVIDER_MAPPING("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->ensureExtensionProviderMapping(Ljava/lang/Object;Ljava/lang/Object;)V"),
    ADD_SYMBOLS_RUNTIME_HANDLE_CATEGORY_BIND("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->handleCategoryBind(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Z"),
    ADD_SYMBOLS_RUNTIME_HANDLE_CATEGORY_CHANGE("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->handleCategoryChange(Ljava/lang/Object;II)Z"),
    ADD_SYMBOLS_RUNTIME_INTERCEPT_HISTORY_WRITE("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->interceptHistoryWrite(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Z"),
    ADD_SYMBOLS_RUNTIME_ON_EMOTICON_BODY_READY("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onEmoticonBodyReady(Ljava/lang/Object;)V"),
    ADD_SYMBOLS_RUNTIME_ON_EMOTICON_KEYBOARD_CONSTRUCTED("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onEmoticonKeyboardConstructed(Ljava/lang/Object;)V"),
    ADD_SYMBOLS_RUNTIME_ON_EMOTICON_RECYCLER_ADAPTER_CONSTRUCTED("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onEmoticonRecyclerAdapterConstructed(Ljava/lang/Object;Ljava/lang/Object;)V"),
    ADD_SYMBOLS_RUNTIME_ON_EXPRESSION_CORPUS_FOOTER_TAB_CLICK("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onExpressionCorpusFooterTabClick(Ljava/lang/Object;Ljava/lang/Object;)V"),
    ADD_SYMBOLS_RUNTIME_ON_HEADER_CALLBACK_AFTER("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onHeaderCallbackAfter(Ljava/lang/Object;)V"),
    ADD_SYMBOLS_RUNTIME_ON_KEYBOARD_READY("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onKeyboardReady(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"),
    ADD_SYMBOLS_RUNTIME_OVERRIDE_CATEGORY_NAME_FROM_INDEX("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->overrideCategoryNameFromIndex(Ljava/lang/Object;I)Ljava/lang/String;"),
    ADD_SYMBOLS_RUNTIME_RESOLVE_CUSTOM_VIEW_TYPE("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->resolveCustomViewType(Ljava/lang/Object;I)I"),
    ADD_SYMBOLS_RUNTIME_RESOLVE_SELECTED_CATEGORY_INDEX("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->resolveSelectedCategoryIndex(Ljava/lang/Object;Ljava/lang/Object;)I"),
    ADD_SYMBOLS_RUNTIME_REWRITE_METRICS_KEYBOARD_TYPE("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->rewriteMetricsKeyboardType(Ljava/lang/Object;)Ljava/lang/Object;"),
    ADD_SYMBOLS_RUNTIME_REWRITE_NAVIGATION_KEYBOARD_TYPE("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->rewriteNavigationKeyboardType(Ljava/lang/Object;)Ljava/lang/Object;"),
    ADD_SYMBOLS_RUNTIME_REWRITE_PROVIDER_REQUEST_TYPE("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->rewriteProviderRequestType(Ljava/lang/Object;)Ljava/lang/Object;"),
    ADD_SYMBOLS_RUNTIME_REWRITE_PROVIDER_WRAPPER_KEYBOARD_TYPE("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->rewriteProviderWrapperKeyboardType(Ljava/lang/Object;)Ljava/lang/Object;"),
    ADD_SYMBOLS_RUNTIME_SHOULD_SKIP_DETACHED_VIEW_TRANSFORM("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->shouldSkipDetachedViewTransform(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z"),
    ADD_SYMBOLS_RUNTIME_SHOULD_SKIP_HEADER_START_EDGE_UPDATE("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->shouldSkipHeaderStartEdgeUpdate(Ljava/lang/Object;)Z"),
    ADD_SYMBOLS_SOFT_KEY_RUNTIME_PATCH_SOFT_KEY_METADATA("Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsSoftKeyRuntime;->patchSoftKeyMetadata(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
    ADVANCED_VOICE_RUNTIME_AFTER_FLAG_VALUE("Ldev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntime;->afterFlagValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
    ADVANCED_VOICE_RUNTIME_INCLUDE_EXACT_ZH_TW_SUPPORTED_LOCALE("Ldev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntime;->includeExactZhTwSupportedLocale(Ljava/lang/Object;)Ljava/lang/Object;"),
    ADVANCED_VOICE_RUNTIME_SEED_APPLICATION_CONTEXT("Ldev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoiceRuntime;->seedApplicationContext(Landroid/content/Context;)V"),
    BLUETOOTH_MICROPHONE_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE("Ldev/jason/gboardpatches/extension/bluetoothmicrophone/GboardBluetoothMicrophoneRuntime;->applyOverriddenFlagValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
    CALCULATOR_RUNTIME_ON_INPUT_VIEW_STARTED("Ldev/jason/gboardpatches/extension/calculator/GboardCalculatorLifecycleRuntime;->onInputViewStarted(Ljava/lang/Object;)V"),
    CALCULATOR_RUNTIME_ON_SELECTION_UPDATED("Ldev/jason/gboardpatches/extension/calculator/GboardCalculatorLifecycleRuntime;->onSelectionUpdated(Ljava/lang/Object;Landroid/view/View;II)V"),
    CALCULATOR_RUNTIME_ON_INPUT_WINDOW_HIDDEN("Ldev/jason/gboardpatches/extension/calculator/GboardCalculatorLifecycleRuntime;->onInputWindowHidden()V"),
    FROSTED_GLASS_RUNTIME_ON_INPUT_VIEW_STARTED("Ldev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassLifecycleRuntime;->onInputViewStarted(Ljava/lang/Object;)V"),
    FROSTED_GLASS_RUNTIME_AFTER_CONFIGURE_WINDOW("Ldev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassLifecycleRuntime;->afterConfigureWindow(Landroid/view/Window;ZZ)V"),
    FROSTED_GLASS_RUNTIME_ON_INPUT_WINDOW_HIDDEN("Ldev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassLifecycleRuntime;->onInputWindowHidden(Ljava/lang/Object;)V"),
    FROSTED_GLASS_RUNTIME_ON_APPLY_NAV_BAR_ENTRY("Ldev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassLifecycleRuntime;->onApplyNavBarEntry(Landroid/view/Window;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
    FROSTED_GLASS_RUNTIME_ON_APPLY_NAV_BAR_EXIT("Ldev/jason/gboardpatches/extension/frostedglass/GboardFrostedGlassLifecycleRuntime;->onApplyNavBarExit(Ljava/lang/Object;)V"),
    CLIPBOARD_CONTENT_LIMIT_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE("Ldev/jason/gboardpatches/extension/clipboardcontentlimit/GboardClipboardContentLimitRuntime;->applyOverriddenFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    CLOSE_PROACTIVE_SUGGESTIONS_RUNTIME_APPLY_FLAG_VALUE("Ldev/jason/gboardpatches/extension/closeproactivesuggestions/GboardCloseProactiveSuggestionsRuntime;->applyFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    CLIPBOARD_RUNTIME_AFTER_ADAPTER_TRIM("Ldev/jason/gboardpatches/extension/clipboard/GboardClipboardRuntime;->afterAdapterTrim(Ljava/lang/Object;)V"),
    CLIPBOARD_RUNTIME_AFTER_ITEM_BIND("Ldev/jason/gboardpatches/extension/clipboard/GboardClipboardRuntime;->afterItemBind(Ljava/lang/Object;Ljava/lang/Object;I)V"),
    CLIPBOARD_RUNTIME_BEFORE_ITEM_BIND("Ldev/jason/gboardpatches/extension/clipboard/GboardClipboardRuntime;->beforeItemBind(Ljava/lang/Object;Ljava/lang/Object;I)V"),
    CLIPBOARD_RUNTIME_HANDLE_CUSTOM_PRUNE("Ldev/jason/gboardpatches/extension/clipboard/GboardClipboardRuntime;->handleCustomPrune(Ljava/lang/Object;)Z"),
    CLIPBOARD_RUNTIME_MAYBE_BUILD_LOADER_RESULT("Ldev/jason/gboardpatches/extension/clipboard/GboardClipboardRuntime;->maybeBuildLoaderResult(Ljava/lang/Object;)Ljava/lang/Object;"),
    CLIPBOARD_RUNTIME_RESOLVE_COLUMN_COUNT_OVERRIDE("Ldev/jason/gboardpatches/extension/clipboard/GboardClipboardRuntime;->resolveColumnCountOverride(Ljava/lang/Object;)Ljava/lang/Integer;"),
    CLIPBOARD_RUNTIME_SHOULD_KEEP_WHOLE_BLOCK("Ldev/jason/gboardpatches/extension/clipboard/GboardClipboardRuntime;->shouldKeepWholeClipboardBlock(Ljava/lang/Object;)Z"),
    CUSTOM_THEME_RUNTIME_HANDLE_ACTIVITY_RESULT("Ldev/jason/gboardpatches/extension/customtheme/GboardCustomThemeOfficialImportRuntime;->handleActivityResult(Ljava/lang/Object;IILandroid/content/Intent;)Z"),
    CUSTOM_THEME_RUNTIME_INTERCEPT_PLUS("Ldev/jason/gboardpatches/extension/customtheme/GboardCustomThemeOfficialImportRuntime;->interceptPlus(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)Z"),
    DEVICE_INTELLIGENCE_RUNTIME_APPLY_FLAG_VALUE("Ldev/jason/gboardpatches/extension/featureflags/GboardFeatureFlagsRuntime;->applyDeviceIntelligenceFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    EMOJI_SIZE_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE("Ldev/jason/gboardpatches/extension/emojisize/GboardEmojiSizeRuntime;->applyOverriddenFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    FEATURE_FLAGS_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE("Ldev/jason/gboardpatches/extension/featureflags/GboardFeatureFlagsRuntime;->applyOverriddenFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    GRAMMAR_CHECKER_RUNTIME_APPLY_FLAG_VALUE("Ldev/jason/gboardpatches/extension/featureflags/GboardFeatureFlagsRuntime;->applyGrammarCheckerFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    INLINE_SUGGESTIONS_RUNTIME_APPLY_FLAG_VALUE("Ldev/jason/gboardpatches/extension/featureflags/GboardFeatureFlagsRuntime;->applyInlineSuggestionsFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    KEY_SHAPE_SELECTION_RUNTIME_APPLY_FLAG_VALUE("Ldev/jason/gboardpatches/extension/featureflags/GboardFeatureFlagsRuntime;->applyKeyShapeSelectionFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_ENSURE_LONG_PRESS_SCHEDULED("Ldev/jason/gboardpatches/extension/longpressquickactions/GboardLongPressQuickActionsRuntime;->maybeEnsureLongPressScheduled(Ljava/lang/Object;Landroid/view/View;)V"),
    LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_HANDLE_GLOBE_GESTURE("Ldev/jason/gboardpatches/extension/longpressquickactions/GboardGlobeDragRuntime;->maybeHandleGestureDispatch(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z"),
    LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_HANDLE_INPUT_EVENT("Ldev/jason/gboardpatches/extension/longpressquickactions/GboardLongPressQuickActionsRuntime;->maybeHandleInputEvent(Landroid/inputmethodservice/InputMethodService;Ljava/lang/Object;)Z"),
    LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_PATCH_METADATA("Ldev/jason/gboardpatches/extension/longpressquickactions/GboardLongPressQuickActionsRuntime;->maybePatchMetadata(Ljava/lang/Object;Landroid/view/View;)Ljava/lang/Object;"),
    LONG_PRESS_QUICK_ACTIONS_RUNTIME_ON_GLOBE_POINTER_CANCEL("Ldev/jason/gboardpatches/extension/longpressquickactions/GboardGlobeDragRuntime;->onPointerCancel(Ljava/lang/Object;)V"),
    LONG_PRESS_QUICK_ACTIONS_RUNTIME_ON_GLOBE_POINTER_FINISH("Ldev/jason/gboardpatches/extension/longpressquickactions/GboardGlobeDragRuntime;->onPointerFinish(Ljava/lang/Object;)V"),
    MANUAL_INCOGNITO_RUNTIME_APPLY_CLIPBOARD_POLICY("Ldev/jason/gboardpatches/extension/manualincognito/GboardManualIncognitoRuntime;->applyClipboardIncognitoPolicy(Z)Z"),
    MANUAL_INCOGNITO_RUNTIME_APPLY_DICTATION_FLAG("Ldev/jason/gboardpatches/extension/manualincognito/GboardManualIncognitoRuntime;->applyDictationIncognitoFlag(Z)Z"),
    MANUAL_INCOGNITO_RUNTIME_APPLY_INCOGNITO_PREDICATE("Ldev/jason/gboardpatches/extension/manualincognito/GboardManualIncognitoRuntime;->applyIncognitoPredicate(Z)Z"),
    MANUAL_INCOGNITO_RUNTIME_APPLY_VOICE_POLICY("Ldev/jason/gboardpatches/extension/manualincognito/GboardManualIncognitoRuntime;->applyVoiceIncognitoPolicy(Z)Z"),
    MANUAL_INCOGNITO_RUNTIME_ON_INPUT_STARTING("Ldev/jason/gboardpatches/extension/manualincognito/GboardManualIncognitoRuntime;->onInputStarting(Ljava/lang/Object;Landroid/view/inputmethod/EditorInfo;)V"),
    MANUAL_INCOGNITO_RUNTIME_ON_INPUT_VIEW_STARTING("Ldev/jason/gboardpatches/extension/manualincognito/GboardManualIncognitoRuntime;->onInputViewStarting(Ljava/lang/Object;Landroid/view/inputmethod/EditorInfo;)V"),
    MANUAL_INCOGNITO_RUNTIME_ON_INPUT_WINDOW_HIDDEN("Ldev/jason/gboardpatches/extension/manualincognito/GboardManualIncognitoRuntime;->onInputWindowHidden(Ljava/lang/Object;)V"),
    RAMBLER_RUNTIME_ENTER_DEFAULT_SELECTION_SUPPRESSION("Ldev/jason/gboardpatches/extension/rambler/GboardRamblerOfficialSelectionRuntime;->enterDefaultSelectionSuppression()V"),
    RAMBLER_RUNTIME_ENTER_VOICE_SETTINGS_SCOPE("Ldev/jason/gboardpatches/extension/rambler/GboardRamblerOfficialSelectionRuntime;->enterVoiceSettingsScope()V"),
    RAMBLER_RUNTIME_EXIT_DEFAULT_SELECTION_SUPPRESSION("Ldev/jason/gboardpatches/extension/rambler/GboardRamblerOfficialSelectionRuntime;->exitDefaultSelectionSuppression()V"),
    RAMBLER_RUNTIME_EXIT_VOICE_SETTINGS_SCOPE("Ldev/jason/gboardpatches/extension/rambler/GboardRamblerOfficialSelectionRuntime;->exitVoiceSettingsScope()V"),
    RAMBLER_RUNTIME_UPDATE_OFFICIAL_SELECTION("Ldev/jason/gboardpatches/extension/rambler/GboardRamblerOfficialSelectionRuntime;->updateOfficialSelection(Z)V"),
    QUICK_INSERT_RUNTIME_APPLY_FLAG_VALUE("Ldev/jason/gboardpatches/extension/quickinsert/GboardQuickInsertRuntime;->applyFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;"),
    ROUNDED_KEYBOARD_RUNTIME_APPLY_THEME_ADMISSION("Ldev/jason/gboardpatches/extension/roundedkeyboard/GboardRoundedKeyboardRuntime;->applyThemeAdmission(Z)Z"),
    ROUNDED_KEYBOARD_RUNTIME_RESOLVE_EFFECTIVE_RADII_DP("Ldev/jason/gboardpatches/extension/roundedkeyboard/GboardRoundedKeyboardRuntime;->resolveEffectiveRadiiDp(Ljava/lang/String;)[F"),
    SETTINGS_HOMEPAGE_RUNTIME_APPLY_SETTINGS_HOMEPAGE_POLICY("Ldev/jason/gboardpatches/extension/settingshomepage/GboardSettingsHomepageRuntime;->applySettingsHomepagePolicy(Ljava/lang/Object;)V"),
    SPLIT_KEYBOARD_RUNTIME_APPLY_ACCESS_POINT_STATE("Ldev/jason/gboardpatches/extension/splitkeyboard/GboardSplitKeyboardRuntime;->applyAccessPointState(Ljava/lang/String;I)I"),
    SPLIT_KEYBOARD_RUNTIME_APPLY_DEVICE_ELIGIBILITY("Ldev/jason/gboardpatches/extension/splitkeyboard/GboardSplitKeyboardRuntime;->applyDeviceEligibility(Z)Z"),
    SPLIT_KEYBOARD_RUNTIME_APPLY_WIDTH_ELIGIBILITY("Ldev/jason/gboardpatches/extension/splitkeyboard/GboardSplitKeyboardRuntime;->applyWidthEligibility(ZZZI)Z"),
    SPLIT_KEYBOARD_RUNTIME_AFTER_MODE_ENVIRONMENT_CHANGED("Ldev/jason/gboardpatches/extension/splitkeyboard/GboardSplitKeyboardRuntime;->afterModeEnvironmentChanged(Ljava/lang/Object;)V"),
    SPLIT_KEYBOARD_RUNTIME_INCLUDE_ACCESS_POINT_IN_ORDER("Ldev/jason/gboardpatches/extension/splitkeyboard/GboardSplitKeyboardRuntime;->includeAccessPointInOrder(Ljava/lang/Object;)Ljava/lang/Object;"),
    SPLIT_KEYBOARD_RUNTIME_INTERCEPT_SPLIT_ACTION("Ldev/jason/gboardpatches/extension/splitkeyboard/GboardSplitKeyboardRuntime;->interceptSplitAction(Ljava/lang/Object;)Z"),
    SPACEBAR_GESTURE_RUNTIME_ON_HOLDER_TOUCH("Ldev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarGestureRuntime;->onHolderTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z"),
    SPACEBAR_GESTURE_RUNTIME_AFTER_SOFT_KEY_BIND("Ldev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarGlobeKeyRuntime;->afterSoftKeyBind(Landroid/view/View;)V"),
    SPACEBAR_CHEVRON_RUNTIME_AFTER_SOFT_KEY_BIND("Ldev/jason/gboardpatches/extension/spacebargesture/GboardSpacebarChevronRuntime;->afterSoftKeyBind(Landroid/view/View;)V"),
    TOOLBAR_ROUND_CHIPS_RUNTIME_AFTER_SOFT_KEY_BIND("Ldev/jason/gboardpatches/extension/toolbarroundchips/GboardToolbarRoundChipsRuntime;->afterSoftKeyBind(Landroid/view/View;)V"),
    SWIPE_DISMISS_RUNTIME_ON_HEADER_TOUCH("Ldev/jason/gboardpatches/extension/swipedismiss/GboardSwipeDismissRuntime;->onHeaderTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z"),
    SYMBOL_FOOTER_ORDER_RUNTIME_REORDER_EXPRESSION_CORPUS_LIST("Ldev/jason/gboardpatches/extension/symbolfooter/GboardSymbolFooterOrderRuntime;->reorderExpressionCorpusList(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
    AI_WRITING_TOOLS_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE("Ldev/jason/gboardpatches/extension/writingtools/GboardAiWritingToolsRuntime;->applyOverriddenFlagValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
    AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_APPLY_GEN_AI_INIT_CLIENT_TYPE("Ldev/jason/gboardpatches/extension/writingtools/GboardAiWritingToolsVoiceCommandRuntime;->applyGenAiInitClientType(Ljava/lang/Object;Z)Z"),
    AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_APPLY_SMART_EDIT_INIT_CLIENT_TYPE("Ldev/jason/gboardpatches/extension/writingtools/GboardAiWritingToolsVoiceCommandRuntime;->applySmartEditInitClientType(Ljava/lang/Object;Z)Z"),
    AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_BEGIN_GEN_AI_REFRESH("Ldev/jason/gboardpatches/extension/writingtools/GboardAiWritingToolsVoiceCommandRuntime;->beginGenAiRefresh(Ljava/lang/Object;)V"),
    AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_FINISH_GEN_AI_REFRESH("Ldev/jason/gboardpatches/extension/writingtools/GboardAiWritingToolsVoiceCommandRuntime;->finishGenAiRefresh(Ljava/lang/Object;)V"),
    AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_OBSERVE_GEN_AI_REFRESH_CLIENT_TYPE("Ldev/jason/gboardpatches/extension/writingtools/GboardAiWritingToolsVoiceCommandRuntime;->observeGenAiRefreshClientType(Ljava/lang/Object;Ljava/lang/Object;)V"),
    AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_REMEMBER_GEN_AI_INIT_CALL("Ldev/jason/gboardpatches/extension/writingtools/GboardAiWritingToolsVoiceCommandRuntime;->rememberGenAiInitCall(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"),
}

internal data class RuntimeAbi(
    val owner: String,
    val name: String,
    val parameters: List<String>,
    val returnType: String,
    val isStatic: Boolean,
) {
    val descriptor: String
        get() = parameters.joinToString(prefix = "(", postfix = ")$returnType", separator = "")

    val reference: String
        get() = "$owner->$name$descriptor"

    companion object {
        fun decode(encoded: String): RuntimeAbi {
            val owner = encoded.substringBefore("->")
            val method = encoded.substringAfter("->")
            val name = method.substringBefore('(')
            val parametersDescriptor = method.substringAfter('(').substringBefore(')')
            return RuntimeAbi(
                owner = owner,
                name = name,
                parameters = decodeTypes(parametersDescriptor),
                returnType = method.substringAfter(')'),
                isStatic = true,
            )
        }

        private fun decodeTypes(descriptor: String): List<String> = buildList {
            var index = 0
            while (index < descriptor.length) {
                val start = index
                while (descriptor[index] == '[') index++
                if (descriptor[index] == 'L') {
                    index = descriptor.indexOf(';', index) + 1
                    require(index > 0) { "Malformed object type in runtime ABI: $descriptor" }
                } else {
                    index++
                }
                add(descriptor.substring(start, index))
            }
        }
    }
}

internal object RuntimeAbiCatalog {
    private val abiByCall = RuntimeCallId.entries.associateWith { call ->
        RuntimeAbi.decode(call.encodedAbi)
    }

    fun abi(call: RuntimeCallId): RuntimeAbi = abiByCall.getValue(call)
}
