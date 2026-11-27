package dev.vortexnode.sbrowserx.patches.translate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.vortexnode.sbrowserx.patches.core.sbrowserXCorePatch
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow

private const val SIX_STATUS_CLASS =
    "Lcom/sec/android/app/sbrowser/common/extensions/SixStatus;"
private const val SETTING_PREFERENCE_CLASS =
    "Lcom/sec/android/app/sbrowser/common/device/setting_preference/SettingPreference;"
private const val SIX_TRANS_SERVICE_CLASS =
    "Lcom/sec/android/app/sbrowser/extensions/trans/SixTransService;"
private const val WEB_ASSIST_UTIL_CLASS =
    "Lcom/sec/android/app/sbrowser/artificial_intelligence/utils/WebAssistUtil;"
private const val SIX_MANAGER_CLASS =
    "Lcom/sec/android/app/sbrowser/extensions/SixManager;"
private const val LANG_PACK_MANAGER_CLASS =
    "Lcom/sec/android/app/sbrowser/artificial_intelligence/translate/LangPackManager;"
private const val TEXT_TRANSLATE_MANAGER_CLASS =
    "Lcom/sec/android/app/sbrowser/artificial_intelligence/translate/TextTranslateManager;"
private const val TRANS_BAR_CONTAINER_CLASS =
    "Lcom/sec/android/app/sbrowser/trans_bar/TransBarContainerV2;"
private const val TRANS_BAR_LANG_HANDLER_CLASS =
    "Lcom/sec/android/app/sbrowser/trans_bar/TransBarLangServiceHandler;"
private const val TRANS_BAR_INFO_CLASS =
    "Lcom/sec/android/app/sbrowser/trans_bar/TransBarInfo;"
private const val CUSTOM_TAB_ACTIVITY_CLASS =
    "Lcom/sec/android/app/sbrowser/customtabs/CustomTabActivity;"
private const val CUSTOM_TAB_TOOLBAR_CLASS =
    "Lcom/sec/android/app/sbrowser/customtabs/features/toolbar/CustomTabToolbar;"
private const val CUSTOM_TAB_ROOT_UI_CLASS =
    "Lcom/sec/android/app/sbrowser/customtabs/CustomTabRootUiCoordinator;"
private const val MENU_SETTINGS_HELPER_CLASS =
    "Lcom/sec/android/app/sbrowser/main_view/menu/MenuSettingsHelper;"

@Suppress("unused")
val googleTranslatePatch = bytecodePatch(
    name = "Built-in Google Translate engine",
    description = "Adds a built-in page translation engine with automatic translation and quick language settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)
    dependsOn(sbrowserXCorePatch)

    execute {
        // 1. Force SixStatus.isTranslatorEnabled() -> true when Google Translate is enabled
        findMethodOrThrow(
            classType = SIX_STATUS_CLASS,
            methodName = "isTranslatorEnabled",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isGoogleTranslateEnabled()Z
                move-result v0
                if-eqz v0, :sbrowserx_trans_en_stock
                const/4 v0, 0x1
                return v0
                :sbrowserx_trans_en_stock
                nop
            """.trimIndent(),
        )

        // 2. Skip Galaxy AI Browsing Assist FTU popup when tapping Translate in the side menu
        findMethodOrThrow(
            classType = SETTING_PREFERENCE_CLASS,
            methodName = "isBrowsingAssistFTU",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isGoogleTranslateEnabled()Z
                move-result v0
                if-eqz v0, :sbrowserx_ftu_stock
                const/4 v0, 0x0
                return v0
                :sbrowserx_ftu_stock
                nop
            """.trimIndent(),
        )


        // 2b. Bypass Galaxy AI / Samsung Account consent screen when tapping Translate in side menu
        findMethodOrThrow(
            classType = WEB_ASSIST_UTIL_CLASS,
            methodName = "promptUserConsentAndSamsungAccountLogin",
            parameterTypes = listOf(
                "Landroid/app/Activity;",
                "Z",
                "Lcom/sec/android/app/sbrowser/artificial_intelligence/utils/WebAssistUtil\$PromptScreenCallback;",
            ),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isGoogleTranslateEnabled()Z
                move-result v0
                if-eqz v0, :sbrowserx_consent_stock
                if-eqz p2, :sbrowserx_consent_ret
                const/4 v0, 0x1
                invoke-interface {p2, v0}, Lcom/sec/android/app/sbrowser/artificial_intelligence/utils/WebAssistUtil${'$'}PromptScreenCallback;->onResult(Z)V
                :sbrowserx_consent_ret
                const/4 v0, 0x1
                return v0
                :sbrowserx_consent_stock
                nop
            """.trimIndent(),
        )


        // 2c. Keep built-in translator extension (webtrans.crx) enabled even without Samsung Account login
        findMethodOrThrow(
            classType = SIX_MANAGER_CLASS,
            methodName = "updateDefaultTranslatorStatus",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isGoogleTranslateEnabled()Z
                move-result v0
                if-eqz v0, :sbrowserx_upd_trans_stock
                const/4 v0, 0x1
                invoke-virtual {p0, v0}, Lcom/sec/android/app/sbrowser/extensions/SixManager;->changeDefaultTranslatorStatus(Z)Z
                move-result v0
                return v0
                :sbrowserx_upd_trans_stock
                nop
            """.trimIndent(),
        )

        findMethodOrThrow(
            classType = SIX_MANAGER_CLASS,
            methodName = "changeDefaultTranslatorStatus",
            parameterTypes = listOf("Z"),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isGoogleTranslateEnabled()Z
                move-result v0
                if-eqz v0, :sbrowserx_chg_trans_stock
                const/4 p1, 0x1
                :sbrowserx_chg_trans_stock
                nop
            """.trimIndent(),
        )

        // 3. SixTransService.getSupport(String, int, int, long)V
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "getSupport",
            parameterTypes = listOf("Ljava/lang/String;", "I", "I", "J"),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0, p4, p5}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryTransGetSupport(Ljava/lang/Object;J)Z
                move-result p1
                if-eqz p1, :sbrowserx_sup_stock
                return-void
                :sbrowserx_sup_stock
                nop
            """.trimIndent(),
        )

        // 4. SixTransService.getMode(String, int, int, long)V
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "getMode",
            parameterTypes = listOf("Ljava/lang/String;", "I", "I", "J"),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0, p4, p5}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryTransGetMode(Ljava/lang/Object;J)Z
                move-result v0
                if-eqz v0, :sbrowserx_mode_stock
                return-void
                :sbrowserx_mode_stock
                nop
            """.trimIndent(),
        )

        // 5. SixTransService.createTrans(String, int, int, long)V
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "createTrans",
            parameterTypes = listOf("Ljava/lang/String;", "I", "I", "J"),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0, p4, p5}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryTransCreate(Ljava/lang/Object;J)Z
                move-result p1
                if-eqz p1, :sbrowserx_create_stock
                return-void
                :sbrowserx_create_stock
                nop
            """.trimIndent(),
        )

        // 6. SixTransService.getLangList(String, String, String, String, int, int, long)V
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "getLangList",
            parameterTypes = listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "I",
                "I",
                "J",
            ),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0, p3, p7, p8}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryTransGetLangList(Ljava/lang/Object;Ljava/lang/String;J)Z
                move-result p1
                if-eqz p1, :sbrowserx_langlist_stock
                return-void
                :sbrowserx_langlist_stock
                nop
            """.trimIndent(),
        )

        // 7. SixTransService.detectionLang(String, String, String, int, int, long)V
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "detectionLang",
            parameterTypes = listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "I",
                "I",
                "J",
            ),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0, p3, p6, p7}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryTransDetectLang(Ljava/lang/Object;Ljava/lang/String;J)Z
                move-result p1
                if-eqz p1, :sbrowserx_detect_stock
                return-void
                :sbrowserx_detect_stock
                nop
            """.trimIndent(),
        )

        // 8. SixTransService.translate(...)V
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "translate",
            parameterTypes = listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "[Ljava/lang/String;",
                "Ljava/lang/Boolean;",
                "Ljava/lang/Boolean;",
                "I",
                "I",
                "J",
            ),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->setActiveTransService(Ljava/lang/Object;)V
                invoke-static {p4, p5, p6, p11, p12}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryGoogleTranslate(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;J)Z
                move-result p1
                if-eqz p1, :sbrowserx_stock_trans
                return-void
                :sbrowserx_stock_trans
                nop
            """.trimIndent(),
        )

        // 9. SixTransService.openSettingsImpl()V -> open Chrome-style SBrowserXTranslateSettingsActivity
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "openSettingsImpl",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryOpenTranslateSettings(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :sbrowserx_openset_stock
                return-void
                :sbrowserx_openset_stock
                nop
            """.trimIndent(),
        )

        // 10. SixTransService.getLangList(String)[String] -> populate TransBar dropdown with all 40 Google Translate languages
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "getLangList",
            parameterTypes = listOf("Ljava/lang/String;"),
            returnType = "[Ljava/lang/String;",
        ).addInstructions(
            0,
            """
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->getGoogleTranslateLangCodes()[Ljava/lang/String;
                move-result-object p1
                if-eqz p1, :sbrowserx_gl1_stock
                return-object p1
                :sbrowserx_gl1_stock
                nop
            """.trimIndent(),
        )

        // 11. LangPackManager.getTargetLang(I) -> return configured Google Translate target language (e.g. "ru")
        findMethodOrThrow(
            classType = LANG_PACK_MANAGER_CLASS,
            methodName = "getTargetLang",
            parameterTypes = listOf("I"),
            returnType = "Ljava/lang/String;",
        ).addInstructions(
            0,
            """
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->getGoogleTranslateTargetLangOrNull()Ljava/lang/String;
                move-result-object p0
                if-eqz p0, :sbrowserx_tl_stock
                return-object p0
                :sbrowserx_tl_stock
                nop
            """.trimIndent(),
        )

        // 12. SixTransService.setTargetLang(String) -> sync language picked in TransBar back to SBrowserX prefs
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "setTargetLang",
            parameterTypes = listOf("Ljava/lang/String;"),
            returnType = "V",
        ).addInstructions(
            0,
            "invoke-static {p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onTransBarTargetLangSelected(Ljava/lang/String;)V",
        )

        // 13. SixTransService.openLangPackSettings()V -> open Chrome-style Google Translate settings instead of Samsung Language Packs
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "openLangPackSettings",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryOpenTranslateSettings(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :sbrowserx_olp_stock
                return-void
                :sbrowserx_olp_stock
                nop
            """.trimIndent(),
        )

        // 14. SixTransService.getLangLocaleInfo(String)String -> return localized display name for all 40 languages
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "getLangLocaleInfo",
            parameterTypes = listOf("Ljava/lang/String;"),
            returnType = "Ljava/lang/String;",
        ).addInstructions(
            0,
            """
                invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->resolveTransLangDisplayName(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                move-result-object p0
                return-object p0
            """.trimIndent(),
        )

        // 15. TextTranslateManager.isSupport()Z -> true when Google Translate enabled (bypass Samsung SCS check)
        findMethodOrThrow(
            classType = TEXT_TRANSLATE_MANAGER_CLASS,
            methodName = "isSupport",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isGoogleTranslateEnabled()Z
                move-result v0
                if-eqz v0, :sbrowserx_ttm_stock
                const/4 v0, 0x1
                return v0
                :sbrowserx_ttm_stock
                nop
            """.trimIndent(),
        )

        // 16. TransBarContainerV2.onTranslatePage(Z)V -> run direct Google Translate DOM engine (or revert)
        findMethodOrThrow(
            classType = TRANS_BAR_CONTAINER_CLASS,
            methodName = "onTranslatePage",
            parameterTypes = listOf("Z"),
            returnType = "V",
        ).addInstructions(
            0,
            "invoke-static {p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onTransBarTranslatePage(Z)V",
        )

        // 17. TransBarLangServiceHandler.onTargetItemSelected(TransBarInfo)V -> save chosen target lang BEFORE updateTargetLang() & translate
        findMethodOrThrow(
            classType = TRANS_BAR_LANG_HANDLER_CLASS,
            methodName = "onTargetItemSelected",
            parameterTypes = listOf(TRANS_BAR_INFO_CLASS),
            returnType = "V",
        ).addInstructions(
            0,
            "invoke-static {p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onTransBarTargetItemSelected(Ljava/lang/Object;)V",
        )

        // 18. TransBarLangServiceHandler.onSourceItemSelected(TransBarInfo)V -> re-translate with chosen source lang
        findMethodOrThrow(
            classType = TRANS_BAR_LANG_HANDLER_CLASS,
            methodName = "onSourceItemSelected",
            parameterTypes = listOf(TRANS_BAR_INFO_CLASS),
            returnType = "V",
        ).addInstructions(
            0,
            "invoke-static {p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onTransBarSourceItemSelected(Ljava/lang/Object;)V",
        )

        // 19. TransBarLangServiceHandler.onCloseFab()V -> revert page back to original when closing TransBar
        findMethodOrThrow(
            classType = TRANS_BAR_LANG_HANDLER_CLASS,
            methodName = "onCloseFab",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstructions(
            0,
            "invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onTransBarClose()V",
        )

        // 20. TransBarContainerV2.onTranslate(Z)V -> trigger translation immediately on first tap from side menu
        findMethodOrThrow(
            classType = TRANS_BAR_CONTAINER_CLASS,
            methodName = "onTranslate",
            parameterTypes = listOf("Z"),
            returnType = "V",
        ).addInstructions(
            0,
            "invoke-static {p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onTransBarTranslatePage(Z)V",
        )

        // 21. SixTransService.onLoadFinished(I)V -> true Chrome-like auto-translate on page load
        findMethodOrThrow(
            classType = SIX_TRANS_SERVICE_CLASS,
            methodName = "onLoadFinished",
            parameterTypes = listOf("I"),
            returnType = "V",
        ).addInstructions(
            0,
            "invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onTransBarLoadFinished()V",
        )

        // 22. CustomTabActivity.onResume() & onLoadFinished(String) -> auto-translate in Telegram / Custom Tabs
        findMethodOrThrow(
            classType = CUSTOM_TAB_ACTIVITY_CLASS,
            methodName = "onResume",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstructions(
            0,
            "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onCustomTabResume(Landroid/app/Activity;)V",
        )

        findMethodOrThrow(
            classType = CUSTOM_TAB_ACTIVITY_CLASS,
            methodName = "onLoadFinished",
            parameterTypes = listOf("Ljava/lang/String;"),
            returnType = "V",
        ).addInstructions(
            0,
            "invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onCustomTabLoadFinished(Landroid/app/Activity;Ljava/lang/String;)V",
        )

        // 23. CustomTabToolbar.initializeMenuPopup() -> add "Translate..." item to Custom Tab 3-dot menu
        val initMenu = findMethodOrThrow(
            classType = CUSTOM_TAB_TOOLBAR_CLASS,
            methodName = "initializeMenuPopup",
            parameterTypes = emptyList(),
            returnType = "V",
        )
        val initMenuInsns = initMenu.implementation?.instructions?.toList()
            ?: error("Missing implementation in CustomTabToolbar.initializeMenuPopup")
        val menuRetIdx = initMenuInsns.indexOfLast { it.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_VOID }
        if (menuRetIdx < 0) error("Missing return-void in CustomTabToolbar.initializeMenuPopup")
        initMenu.addInstructions(
            menuRetIdx,
            "invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->onCustomTabMenuInitialized(Ljava/lang/Object;)V",
        )

        // 24. CustomTabRootUiCoordinator.runMenuItem(MenuItem)Z -> handle "Translate..." click in Custom Tab
        findMethodOrThrow(
            classType = CUSTOM_TAB_ROOT_UI_CLASS,
            methodName = "runMenuItem",
            parameterTypes = listOf("Landroid/view/MenuItem;"),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryHandleCustomTabMenuItem(Ljava/lang/Object;Landroid/view/MenuItem;)Z
                move-result v0
                if-eqz v0, :sbrowserx_ct_menu_stock
                const/4 v0, 0x1
                return v0
                :sbrowserx_ct_menu_stock
                nop
            """.trimIndent(),
        )

        // 25. MenuSettingsHelper.handleDefaultExtensionClicked -> launch our One UI Glass Chrome pill instead of Samsung TransBar
        findMethodOrThrow(
            classType = MENU_SETTINGS_HELPER_CLASS,
            methodName = "handleDefaultExtensionClicked",
            parameterTypes = listOf(
                "Lcom/sec/terrace/browser/extensions/TerraceExtensionsManager\$ExtensionActionItem;",
                "Landroid/view/View;",
                "Lcom/sec/android/app/sbrowser/main_view/menu/MenuSettingsHelper\$Delegate;",
                "Lcom/sec/android/app/sbrowser/main_view/main_interface/MainViewInterface;",
            ),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0, p3}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->tryHandleMainTranslateClick(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :sbrowserx_def_ext_stock
                return-void
                :sbrowserx_def_ext_stock
                nop
            """.trimIndent(),
        )
    }
}
