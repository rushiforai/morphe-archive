package app.template.patches.citizen

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Test

/** Exercise Morphe's matcher, including exact access flags, without shipping Citizen's DEX. */
class PaywallActivityFingerprintTest {
    private val activities = listOf(
        OnboardingOverridePaywallOnCreateFingerprint to
            "Lsp0n/citizen/campaign/OnboardingOverridePaywallActivity;",
        PromoOfferPaywallActivityOnCreateFingerprint to
            "Lsp0n/citizen/paywall/promooffer/PromoOfferPaywallActivity;",
        MultimonthPaywallActivityOnCreateFingerprint to
            "Lsp0n/citizen/paywall/superwall/MultimonthPaywallActivity;",
        ProtectOnBoardingUpsellActivityOnCreateFingerprint to
            "Lsp0n/citizen/onboarding/modules/protect/ProtectOnBoardingUpsellActivity;",
        PostDemoRealCallUpsellActivityOnCreateFingerprint to
            "Lsp0n/citizen/premium/protect/ui/demo/PostDemoRealCallUpsellActivity;"
    )

    private fun method(type: String, parameter: String = "Landroid/os/Bundle;") = ImmutableMethod(
        type,
        "onCreate",
        listOf(ImmutableMethodParameter(parameter, null, null)),
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        null,
        null,
        null
    )

    private fun classDef(method: ImmutableMethod) = ImmutableClassDef(
        method.definingClass,
        AccessFlags.PUBLIC.value,
        "Landroid/app/Activity;",
        null,
        null,
        null,
        null,
        listOf(method)
    )

    @Test
    fun `all five activities match the public final signatures observed in Citizen 1318`() {
        activities.forEach { (fingerprint, type) ->
            val method = method(type)
            fingerprint.clearMatch()
            try {
                assertNotNull(type, fingerprint.matchOrNull(method, classDef(method)))
            } finally {
                fingerprint.clearMatch()
            }
        }
    }

    @Test
    fun `activity fingerprints still reject a different parameter type`() {
        activities.forEach { (fingerprint, type) ->
            val method = method(type, "Landroid/content/Intent;")
            fingerprint.clearMatch()
            try {
                assertNull(type, fingerprint.matchOrNull(method, classDef(method)))
            } finally {
                fingerprint.clearMatch()
            }
        }
    }

    @Test
    fun `public alone does not match public final in Morphe`() {
        val method = method("Lexample/PaywallActivity;")
        val originalFingerprint = Fingerprint(
            definingClass = method.definingClass,
            name = "onCreate",
            parameters = listOf("Landroid/os/Bundle;"),
            returnType = "V",
            accessFlags = listOf(AccessFlags.PUBLIC)
        )
        assertNull(originalFingerprint.matchOrNull(method, classDef(method)))
    }
}
