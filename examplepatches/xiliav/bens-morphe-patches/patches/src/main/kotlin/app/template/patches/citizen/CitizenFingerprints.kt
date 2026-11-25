package app.template.patches.citizen

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Required targets for Citizen 0.1320.0 (1153). Missing targets fail visibly.

val CitizenPlusInfoGetActiveFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/user/dto/CitizenPlusInfoDTO;",
    name = "getActive",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val CitizenProtectInfoGetActiveFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/user/dto/CitizenProtectInfoDTO;",
    name = "getActive",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val CitizenProtectInfoDomainGetActiveFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/domain/models/user/CitizenProtectInfo;",
    name = "getActive",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val PrivateUserIsPlusActiveFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/domain/models/user/PrivateUser;",
    name = "isPlusActive",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val PrivateUserIsProtectActiveFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/domain/models/user/PrivateUser;",
    name = "isProtectActive",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val PrivateUserIsProtectActiveOrInSetupFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/domain/models/user/PrivateUser;",
    name = "isProtectActiveOrInSetup",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val ShowPaywallUseCaseAFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/incidentdetail/ShowPaywallUseCase;",
    name = "a",
    parameters = listOf("Lsp0n/citizen/incidentdetail/ShowPaywallUseCase\$SubscriptionFeature;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val ShowPaywallUseCaseCFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/incidentdetail/ShowPaywallUseCase;",
    name = "c",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val ShowPaywallUseCaseDFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/incidentdetail/ShowPaywallUseCase;",
    name = "d",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val ShowPaywallUseCaseEFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/incidentdetail/ShowPaywallUseCase;",
    name = "e",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val ShowPaywallUseCaseFFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/incidentdetail/ShowPaywallUseCase;",
    name = "f",
    parameters = listOf("Ljava/lang/Boolean;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val PrivateUserIsPaidFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/domain/models/user/PrivateUser;",
    name = "isPaid",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val SafetyNetworkRemoveExpiredFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/social/SafetyNetworkRepository\$removeNetworkIfExpired\$1;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val ClarityEntrypointVisibleFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/clarity/ClarityEntrypointRepository\$profileEntrypointVisible\$1;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val MonoSubscriptionIsSafetyToolAvailableFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/variablesettings/FeatureConfigValue\$MonoSubscription;",
    name = "isSafetyToolAvailable",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val MonoSubscriptionGetHidePremiumOnboardingFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/variablesettings/FeatureConfigValue\$MonoSubscription;",
    name = "getHidePremiumOnboarding",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val MonoSubscriptionGetShowPlusToPremiumEducationFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/variablesettings/FeatureConfigValue\$MonoSubscription;",
    name = "getShowPlusToPremiumEducation",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val MonoSubscriptionGetShowPlusToPremiumProfileBannerFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/variablesettings/FeatureConfigValue\$MonoSubscription;",
    name = "getShowPlusToPremiumProfileBanner",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val OnboardingOverridePaywallOnCreateFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/campaign/OnboardingOverridePaywallActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val ClarityMapTooltipUpsellEnabledFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/variablesettings/FeatureConfigValue\$ClarityMasterSwitch;",
    name = "getMapTooltipPlusUpsellEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val ClarityRadioClipsUpsellEnabledFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/variablesettings/FeatureConfigValue\$ClarityMasterSwitch;",
    name = "getRadioClipsPlusUpsellEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val ClaritySettingsUpsellEnabledFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/variablesettings/FeatureConfigValue\$ClarityMasterSwitch;",
    name = "getSettingsPlusUpsellEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val PlusV1NeighborhoodTrendsEnabledFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/variablesettings/FeatureConfigValue\$CitizenPlusV1MasterSwitch;",
    name = "getNeighborhoodTrendsEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val PlusV1RadioClipsEnabledFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/variablesettings/FeatureConfigValue\$CitizenPlusV1MasterSwitch;",
    name = "getRadioClipsEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val ClarityProfileEntrypointEnabledFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/clarity/ClarityEntrypointRepository;",
    name = "getProfileEntrypointEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL)
)

val PromoOfferPaywallActivityOnCreateFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/paywall/promooffer/PromoOfferPaywallActivity;",
    name = "onCreate", parameters = listOf("Landroid/os/Bundle;"), returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val TrustedContactsConfigGetEnabledFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/variablesettings/FeatureConfigValue\$TrustedContactsConfig;",
    name = "getEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val PaywallHomescreenTriggerConfigGetEnabledFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/data/variablesettings/FeatureConfigValue\$PaywallHomescreenTriggerConfig;",
    name = "getEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val MultimonthPaywallActivityOnCreateFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/paywall/superwall/MultimonthPaywallActivity;",
    name = "onCreate", parameters = listOf("Landroid/os/Bundle;"), returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val ProtectOnBoardingUpsellActivityOnCreateFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/onboarding/modules/protect/ProtectOnBoardingUpsellActivity;",
    name = "onCreate", parameters = listOf("Landroid/os/Bundle;"), returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val PostDemoRealCallUpsellActivityOnCreateFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/premium/protect/ui/demo/PostDemoRealCallUpsellActivity;",
    name = "onCreate", parameters = listOf("Landroid/os/Bundle;"), returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val PurchasePremiumHelperFingerprint = Fingerprint(
    definingClass = "Ljfd;",
    name = "a",
    parameters = listOf(
        "Landroid/content/Context;",
        "Z",
        "Lsp0n/citizen/data/variablesettings/VariableSettingsRepository;",
        "Lsp0n/citizen/analytics/premium/purchase/PurchaseAnalyticsApi\$ProtectPaywallOrigin;"
    ),
    returnType = "Landroid/content/Intent;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(
        methodCall(
            definingClass = "Lsp0n/citizen/paywall/superwall/MultimonthPaywallActivity\$a;",
            name = "a",
            returnType = "Landroid/content/Intent;"
        )
    )
)

val ProtectFabHelperFingerprint = Fingerprint(
    definingClass = "Lifd;",
    name = "a",
    parameters = listOf(
        "Lsp0n/citizen/data/variablesettings/VariableSettingsRepository;",
        "Lsp0n/citizen/data/store/PreferenceStorage;",
        "Lao;",
        "Z",
        "Ld17;",
        "Lsp0n/citizen/premium/purchase/ui/ProtectFabOrigin;"
    ),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(
        methodCall(
            definingClass = "Lsp0n/citizen/paywall/superwall/MultimonthPaywallActivity\$a;",
            name = "a",
            returnType = "Landroid/content/Intent;"
        )
    )
)

val FamilyPlanBenefitFlowCollectorFingerprint = Fingerprint(
    definingClass = "Lsp0n/citizen/social/safetynetwork/FamilyPlanBenefitActivity\$a\$a\$a;",
    name = "emit",
    parameters = listOf("Ljava/lang/Object;", "Lhx3;"),
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "Lsp0n/citizen/social/safetynetwork/e\$b\$a;",
            name = "b",
            type = "Z"
        )
    )
)
