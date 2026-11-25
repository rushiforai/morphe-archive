package app.template.patches.citizen

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.CITIZEN_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// move-object/from16 v0, p0 brings p0 into v0 regardless of .registers count,
// keeping the finish() call valid in high-register methods like MultimonthPaywallActivity.
private val dismissOnCreate =
    "move-object/from16 v0, p0\n" +
    "invoke-virtual { v0 }, Landroid/app/Activity;->finish()V\n" +
    "return-void"

// Uses p1 (param register) to avoid requiring .locals >= 1
private val returnKotlinUnit =
    "sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;\n" +
    "return-object p1"

@Suppress("unused")
val citizenUnlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks local Citizen Plus/Protect features and hides paywalls.",
    default = true
) {
    compatibleWith(CITIZEN_COMPATIBILITY)

    execute {
        // Required, DEX-verified hooks: a missing target must fail visibly.
        listOf(
            CitizenPlusInfoGetActiveFingerprint,
            CitizenProtectInfoGetActiveFingerprint,
            CitizenProtectInfoDomainGetActiveFingerprint,
            PrivateUserIsPlusActiveFingerprint,
            PrivateUserIsProtectActiveFingerprint,
            PrivateUserIsProtectActiveOrInSetupFingerprint,
            PrivateUserIsPaidFingerprint,
            ShowPaywallUseCaseAFingerprint,
            ShowPaywallUseCaseCFingerprint,
            ShowPaywallUseCaseDFingerprint,
            MonoSubscriptionIsSafetyToolAvailableFingerprint,
            MonoSubscriptionGetHidePremiumOnboardingFingerprint,
            ClarityMapTooltipUpsellEnabledFingerprint,
            ClarityRadioClipsUpsellEnabledFingerprint,
            ClaritySettingsUpsellEnabledFingerprint,
            PlusV1NeighborhoodTrendsEnabledFingerprint,
            PlusV1RadioClipsEnabledFingerprint,
            ClarityProfileEntrypointEnabledFingerprint,
            TrustedContactsConfigGetEnabledFingerprint
        ).forEach { fp ->
            fp.method.apply {
                removeInstructions(0, instructions.count())
                addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            }
        }

        listOf(
            ShowPaywallUseCaseEFingerprint,
            ShowPaywallUseCaseFFingerprint,
            MonoSubscriptionGetShowPlusToPremiumEducationFingerprint,
            MonoSubscriptionGetShowPlusToPremiumProfileBannerFingerprint,
            PaywallHomescreenTriggerConfigGetEnabledFingerprint
        ).forEach { fp ->
            fp.method.apply {
                removeInstructions(0, instructions.count())
                addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            }
        }

        SafetyNetworkRemoveExpiredFingerprint.method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(0, returnKotlinUnit)
        }
        ClarityEntrypointVisibleFingerprint.method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(0, "sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;\nreturn-object p1")
        }

        // Keep the original superclass initialization to satisfy Activity's
        // lifecycle contract. The Multimonth method uses 27 registers.
        listOf(
            OnboardingOverridePaywallOnCreateFingerprint,
            PromoOfferPaywallActivityOnCreateFingerprint,
            MultimonthPaywallActivityOnCreateFingerprint,
            ProtectOnBoardingUpsellActivityOnCreateFingerprint,
            PostDemoRealCallUpsellActivityOnCreateFingerprint
        ).forEach { fp ->
            fp.method.apply {
                val superOnCreate = instructions.indexOfFirst { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    (instruction.opcode == Opcode.INVOKE_SUPER || instruction.opcode == Opcode.INVOKE_SUPER_RANGE) &&
                        reference?.name == "onCreate" &&
                        reference.parameterTypes == listOf("Landroid/os/Bundle;") &&
                        reference.returnType == "V"
                }
                check(superOnCreate >= 0) { "Missing super.onCreate in ${definingClass}" }
                addInstructions(superOnCreate + 1, dismissOnCreate)
            }
        }

        // Preserve demo intent construction and the paid Protect navigation;
        // replacing these entire methods would discard legitimate behavior.
        PurchasePremiumHelperFingerprint.method.addInstructions(0, "const/4 p1, 0x0")
        ProtectFabHelperFingerprint.method.addInstructions(0, "const/4 p3, 0x1")

        // Only change the entitlement flag. Preserve pending-invite handling,
        // Safety Network navigation, finish(), and the collector's Unit return.
        FamilyPlanBenefitFlowCollectorFingerprint.let { fp ->
            val flagIndex = fp.instructionMatches.single().index
            val flagRegister = fp.method.getInstruction<TwoRegisterInstruction>(flagIndex).registerA
            fp.method.replaceInstruction(flagIndex, "const/4 v$flagRegister, 0x1")
        }

        // Invitation, education, and challenge handlers retain their original behavior.
    }
}
