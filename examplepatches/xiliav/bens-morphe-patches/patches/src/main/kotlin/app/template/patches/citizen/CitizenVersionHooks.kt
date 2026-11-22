package app.template.patches.citizen

import app.morphe.patcher.Fingerprint

internal data class CitizenVersionHooks(
    val purchasePremiumHelper: Fingerprint,
    val protectFabHelper: Fingerprint,
    val familyPlanBenefitCollector: Fingerprint
)

// Keep obfuscated hooks tied to the exact DEX version that was checked.
internal fun citizenVersionHooks(version: String): CitizenVersionHooks? = when (version) {
    "0.1318.0" -> CitizenVersionHooks(
        PurchasePremiumHelper1318Fingerprint,
        ProtectFabHelper1318Fingerprint,
        FamilyPlanBenefitFlowCollector1318Fingerprint
    )
    "0.1319.0" -> CitizenVersionHooks(
        PurchasePremiumHelper1319Fingerprint,
        ProtectFabHelper1319Fingerprint,
        FamilyPlanBenefitFlowCollector1319Fingerprint
    )
    else -> null
}
