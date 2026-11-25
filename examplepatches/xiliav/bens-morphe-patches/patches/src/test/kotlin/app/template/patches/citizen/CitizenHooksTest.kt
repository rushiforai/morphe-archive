package app.template.patches.citizen

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.*
import org.junit.Test

/** Minimal instruction fixtures for the signatures observed in Citizen 0.1320.0. */
class CitizenHooksTest {
    private fun classDef(method: ImmutableMethod) = ImmutableClassDef(
        method.definingClass, AccessFlags.PUBLIC.value, "Ljava/lang/Object;",
        null, null, null, null, listOf(method)
    )

    private fun helper(
        purchase: Boolean,
        withPaywallCall: Boolean = true,
        booleanType: String = "Z"
    ): ImmutableMethod {
        val parameters = if (purchase) listOf(
            "Landroid/content/Context;", booleanType,
            "Lsp0n/citizen/data/variablesettings/VariableSettingsRepository;",
            "Lsp0n/citizen/analytics/premium/purchase/PurchaseAnalyticsApi\$ProtectPaywallOrigin;"
        ) else listOf(
            "Lsp0n/citizen/data/variablesettings/VariableSettingsRepository;",
            "Lsp0n/citizen/data/store/PreferenceStorage;",
            "Lao;", booleanType, "Ld17;",
            "Lsp0n/citizen/premium/purchase/ui/ProtectFabOrigin;"
        )
        return ImmutableMethod(
            if (purchase) "Ljfd;" else "Lifd;", "a",
            parameters.map { ImmutableMethodParameter(it, null, null) },
            if (purchase) "Landroid/content/Intent;" else "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            MutableMethodImplementation(if (purchase) 6 else 7).apply {
                if (withPaywallCall) addInstruction(BuilderInstruction35c(
                    Opcode.INVOKE_STATIC, 4, 0, 1, 2, 3, 0,
                    ImmutableMethodReference(
                        "Lsp0n/citizen/paywall/superwall/MultimonthPaywallActivity\$a;", "a",
                        listOf("Landroid/content/Context;", "Ljava/lang/String;",
                            "Lsp0n/citizen/paywall/superwall/PlusFeature;", "I"),
                        "Landroid/content/Intent;"
                    )
                ))
                if (purchase) {
                    addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 0))
                    addInstruction(BuilderInstruction11x(Opcode.RETURN_OBJECT, 0))
                } else {
                    addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
                }
            }
        )
    }

    private fun familyCollector(
        continuation: String = "Lhx3;",
        fields: List<String> = listOf("a", "b", "c")
    ) = ImmutableMethod(
        "Lsp0n/citizen/social/safetynetwork/FamilyPlanBenefitActivity\$a\$a\$a;", "emit",
        listOf("Ljava/lang/Object;", continuation).map { ImmutableMethodParameter(it, null, null) },
        "Ljava/lang/Object;", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
        MutableMethodImplementation(4).apply {
            for (field in fields) addInstruction(BuilderInstruction22c(
                Opcode.IGET_BOOLEAN, 0, 2,
                ImmutableFieldReference("Lsp0n/citizen/social/safetynetwork/e\$b\$a;", field, "Z")
            ))
        }
    )

    private fun assertMatch(fingerprint: Fingerprint, method: ImmutableMethod, expected: Boolean) {
        fingerprint.clearMatch()
        try {
            val match = fingerprint.matchOrNull(method, classDef(method))
            if (expected) assertNotNull(method.toString(), match) else assertNull(method.toString(), match)
        } finally {
            fingerprint.clearMatch()
        }
    }

    @Test
    fun `helpers match the current signatures and reject a boxed boolean descriptor`() {
        for (purchase in listOf(true, false)) {
            val fingerprint = if (purchase) PurchasePremiumHelperFingerprint else ProtectFabHelperFingerprint
            assertMatch(fingerprint, helper(purchase), true)
            assertMatch(fingerprint, helper(purchase, booleanType = "Ljava/lang/Boolean;"), false)
        }
    }

    @Test
    fun `obfuscated helper classes require the paywall method call anchor`() {
        assertMatch(PurchasePremiumHelperFingerprint, helper(true, withPaywallCall = false), false)
        assertMatch(ProtectFabHelperFingerprint, helper(false, withPaywallCall = false), false)
    }

    @Test
    fun `family collector requires the current continuation and selects only the entitlement read`() {
        val method = familyCollector()
        val fingerprint = FamilyPlanBenefitFlowCollectorFingerprint
        fingerprint.clearMatch()
        try {
            val match = fingerprint.matchOrNull(method, classDef(method))
            assertNotNull(match)
            assertEquals(1, match!!.instructionMatches.single().index)
        } finally {
            fingerprint.clearMatch()
        }
        for (oldContinuation in listOf("Lyx3;", "Lxx3;")) {
            assertMatch(fingerprint, familyCollector(oldContinuation), false)
        }
        assertMatch(fingerprint, familyCollector(fields = listOf("a", "c")), false)
    }
}
