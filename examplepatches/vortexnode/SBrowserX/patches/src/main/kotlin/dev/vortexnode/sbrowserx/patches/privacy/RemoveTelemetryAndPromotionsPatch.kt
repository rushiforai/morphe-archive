package dev.vortexnode.sbrowserx.patches.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import dev.vortexnode.sbrowserx.patches.core.sbrowserXCorePatch
import app.morphe.patcher.patch.bytecodePatch
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow
import dev.vortexnode.sbrowserx.shared.returnConstantBoolean
import dev.vortexnode.sbrowserx.shared.returnVoidEarly

private const val SA_LOGGING_CLASS =
    "Lcom/sec/android/app/sbrowser/SALoggingInitializer;"
private const val SI_LOG_CLASS =
    "Lcom/sec/android/app/sbrowser/si_log/SILog;"
private const val SMP_CONTROLLER_CLASS =
    "Lcom/sec/android/app/sbrowser/smp/SmpController;"
private const val PROMOTION_CONTROLLER_CLASS =
    "Lcom/sec/android/app/sbrowser/promotion/PromotionController;"
private const val KINDRED_FACTORY_CLASS =
    "Lcom/sec/android/app/sbrowser/kindred/KindredControllerFactory;"
private const val UPDATE_MANAGER_CLASS =
    "Lcom/sec/android/app/sbrowser/stub/UpdateManager;"
private const val BIXBY_DELEGATE_CLASS =
    "Lcom/sec/android/app/sbrowser/BixbyDelegate;"
private const val SAMSUNG_PASS_CLASS =
    "Lcom/samsung/android/authfw/pass/sdk/receiver/SamsungPassStateManager;"
private const val SEARCH_ENGINE_HELPER_CLASS =
    "Lcom/sec/android/app/sbrowser/searchengine/SettingSearchEngineHelper;"
private const val QUICKACCESS_PROMO_ADAPTER_CLASS =
    "Lcom/sec/android/app/sbrowser/quickaccess/ui/page/PromotionAdapter;"

@Suppress("unused")
val removeTelemetryAndPromotionsPatch = bytecodePatch(
    name = "Remove telemetry, promotions & updates",
    description = "Removes built-in analytics, promotional banners, shopping ads, and background update checks while keeping website notifications working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)
    dependsOn(sbrowserXCorePatch)

    execute {
        // 1. Samsung Analytics
        findMethodOrThrow(
            classType = SA_LOGGING_CLASS,
            methodName = "initialize",
            parameterTypes = listOf("Landroid/app/Application;"),
            returnType = "V",
        ).returnVoidEarly()

        // 2. Samsung Internet Logging (SILog)
        findMethodOrThrow(
            classType = SI_LOG_CLASS,
            methodName = "initialize",
            parameterTypes = emptyList(),
            returnType = "V",
        ).returnVoidEarly()

        findMethodOrThrow(
            classType = SI_LOG_CLASS,
            methodName = "sendInternal",
            returnType = "V",
        ).returnVoidEarly()

        mutableClassDefBy(SI_LOG_CLASS)
            .methods
            .filter { it.name == "sendStatusLogInternal" && it.returnType == "V" }
            .forEach { it.returnVoidEarly() }

        // 3. Samsung Marketing Push (SMP) — keeps WebPushNotificationManager & GCM intact
        findMethodOrThrow(
            classType = SMP_CONTROLLER_CLASS,
            methodName = "initialize",
            returnType = "V",
        ).returnVoidEarly()

        // 4. Promotion Engine
        findMethodOrThrow(
            classType = PROMOTION_CONTROLLER_CLASS,
            methodName = "isSupport",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).returnConstantBoolean(false)

        // 5. Kindred / Smart Shopping / Coupons (force enabled = false -> returns EmptyKindredController)
        findMethodOrThrow(
            classType = KINDRED_FACTORY_CLASS,
            methodName = "createKindredController",
        ).addInstruction(0, "const/4 p0, 0x0")

        // 6. Galaxy Store & Play Store update checks
        findMethodOrThrow(
            classType = UPDATE_MANAGER_CLASS,
            methodName = "checkUpdate",
            parameterTypes = emptyList(),
            returnType = "V",
        ).returnVoidEarly()

        // 7. Samsung Bixby SDK cold-start initialization
        findMethodOrThrow(
            classType = BIXBY_DELEGATE_CLASS,
            methodName = "initSbixby",
            parameterTypes = listOf("Landroid/app/Application;"),
            returnType = "V",
        ).returnVoidEarly()

        // 8. Samsung Pass SDK receiver cold-start initialization
        findMethodOrThrow(
            classType = SAMSUNG_PASS_CLASS,
            methodName = "init",
            parameterTypes = listOf("Landroid/content/Context;"),
            returnType = "V",
        ).returnVoidEarly()

        // 9. QuickAccess "Samsung Browser for Windows" promotion banner
        findMethodOrThrow(
            classType = QUICKACCESS_PROMO_ADAPTER_CLASS,
            methodName = "getItemCount",
            parameterTypes = emptyList(),
            returnType = "I",
        ).addInstructions(
            0,
            """
                const/4 p0, 0x0
                return p0
            """.trimIndent(),
        )

        // 10. Built-in removal of Yandex, Mail.ru, Rambler & Russian search engines (no separate patch toggle)
        findMethodOrThrow(
            classType = SEARCH_ENGINE_HELPER_CLASS,
            methodName = "removePolicyRestrictedEngines",
            parameterTypes = listOf("Ljava/util/List;"),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->filterBlockedSearchEngines(Ljava/util/List;)V
            """.trimIndent(),
        )

        val availMethod = findMethodOrThrow(
            classType = SEARCH_ENGINE_HELPER_CLASS,
            methodName = "getListAvailableEngines",
            parameterTypes = emptyList(),
            returnType = "Ljava/util/ArrayList;",
        )
        val availInsns = availMethod.implementation?.instructions
            ?: error("Missing instructions in getListAvailableEngines")
        availMethod.addInstructions(
            availInsns.size - 1,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->filterBlockedSearchEngines(Ljava/util/List;)V
            """.trimIndent(),
        )

        val editMethod = findMethodOrThrow(
            classType = SEARCH_ENGINE_HELPER_CLASS,
            methodName = "getEditableSearchEngineList",
            parameterTypes = emptyList(),
            returnType = "Ljava/util/List;",
        )
        val editInsns = editMethod.implementation?.instructions
            ?: error("Missing instructions in getEditableSearchEngineList")
        editMethod.addInstructions(
            editInsns.size - 1,
            """
                invoke-static {v0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->filterBlockedSearchEngines(Ljava/util/List;)V
            """.trimIndent(),
        )

        // 11. Disable Samsung Internet activation ping (terms.internet.apps.samsung.com/activated)
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/common/tnc/SIActivatedLoggingTask;",
            methodName = "onStartTask",
            parameterTypes = listOf(
                "Ljava/lang/String;",
                "Lcom/sec/android/app/sbrowser/common/model/general/GeneralCallback;",
            ),
            returnType = "V",
        ).returnVoidEarly()

        // 12. Kill residual Samsung Marketing Push background JobService (keeps WebPush intact)
        findMethodOrThrow(
            classType = "Lcom/samsung/android/sdk/smp/SmpJobService;",
            methodName = "onStartJob",
            parameterTypes = listOf("Landroid/app/job/JobParameters;"),
            returnType = "Z",
        ).returnConstantBoolean(false)

        // 13. Disable remote GlobalConfig A/B & JSON fetches (config-api.internet.apps.samsung.com)
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/global_config/GlobalConfigUpdateClient;",
            methodName = "updateIfNeeded",
            parameterTypes = listOf(
                "Landroid/content/Context;",
                "Lcom/sec/android/app/sbrowser/global_config/GlobalConfigDelegate;",
                "Lcom/sec/android/app/sbrowser/global_config/GlobalConfigUpdateClient${'$'}UpdateCallback;",
            ),
            returnType = "V",
        ).returnVoidEarly()

        // 14. Disable SmartTabDelete background ML model training & job scheduling
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/sbrowser_tab/smart_tab_delete/SmartTabDeleteAIModelManager;",
            methodName = "scheduleJob",
            parameterTypes = listOf("Landroid/content/Context;"),
            returnType = "V",
        ).returnVoidEarly()

        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/sbrowser_tab/smart_tab_delete/SmartTabDeleteAIModelManager;",
            methodName = "retrain",
            parameterTypes = emptyList(),
            returnType = "V",
        ).returnVoidEarly()

        // 15. Disable Samsung DataLake cloud top-sites/categories telemetry (data-lake-api.internet.apps.samsung.com)
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/search_window/model/data_lake/DataLakeTopSites;",
            methodName = "fetchCategories",
            parameterTypes = listOf("Lcom/sec/android/app/sbrowser/search_window/model/data_lake/DataLakeTopSites${'$'}Listener;"),
            returnType = "V",
        ).returnVoidEarly()

        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/search_window/model/data_lake/DataLakeTopSites;",
            methodName = "fetchTopSites",
            parameterTypes = listOf(
                "Ljava/lang/String;",
                "I",
                "I",
                "Lcom/sec/android/app/sbrowser/search_window/model/data_lake/DataLakeTopSites${'$'}Listener;",
            ),
            returnType = "V",
        ).returnVoidEarly()

        // 16. Disable QuickAccess News Feed background fetches (news-cdn.internet.apps.samsung.com)
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/quickaccess/ui/viewmodel/NewsFeedVisibilityLiveData;",
            methodName = "isNewsFeedSupported",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                const/4 p0, 0x0
                return p0
            """.trimIndent(),
        )

        // 17. Silence the annoying "This page was opened by <App>" snackbar while keeping Intent Blocker intact
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/main_activity/BackgroundCallerHandler;",
            methodName = "showSnackBar",
            parameterTypes = emptyList(),
            returnType = "V",
        ).returnVoidEarly()

        // 18. Disable Samsung "Set Quick Access as homepage" promo card in Settings app bar
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/common/suggestion_appbar/QuickAccessPromotionInfo;",
            methodName = "shouldShowQuickAccessPromotion",
            parameterTypes = listOf("Landroid/content/Context;"),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                const/4 p0, 0x0
                return p0
            """.trimIndent(),
        )
    }
}
