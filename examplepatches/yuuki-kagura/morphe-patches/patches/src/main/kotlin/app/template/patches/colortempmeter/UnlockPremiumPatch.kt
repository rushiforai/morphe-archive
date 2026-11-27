package app.template.patches.colortempmeter

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_COLOR_TEMP_METER
import app.template.patches.shared.disablePairipLicenseCheckPatch

/**
 * Purchase model (3.15.0): RevenueCat with two tiers, `hobby` and `pro`
 * (each available as monthly / yearly / lifetime product). The Flutter/Dart layer
 * decides what is unlocked by looking at `customerInfo.entitlements.active`.
 *
 * That decision cannot be patched directly (Dart is AOT compiled into `libapp.so`),
 * so the entitlement payload the RevenueCat Flutter bridge hands to Dart is replaced
 * with one that always reports an active `pro` entitlement. The Dart model only needs
 * the documented `EntitlementInfo` fields, which are all provided below.
 */

// 2024-01-01T00:00:00Z, used for the purchase dates of the synthetic entitlement.
private const val PURCHASE_DATE_MILLIS = 0x18cc6fbf000L
private const val PURCHASE_DATE_ISO = "2024-01-01T00:00:00Z"
private const val PRODUCT_IDENTIFIER = "pro"

private fun putString(key: String, value: String) = """
    const-string v4, "$key"
    const-string v5, "$value"
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
"""

private fun putNull(key: String) = """
    const-string v4, "$key"
    const/4 v5, 0x0
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
"""

private fun putBoolean(key: String, value: Boolean) = """
    const-string v4, "$key"
    sget-object v5, Ljava/lang/Boolean;->${if (value) "TRUE" else "FALSE"}:Ljava/lang/Boolean;
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
"""

private fun putLong(key: String, value: Long) = """
    const-string v4, "$key"
    const-wide v5, 0x${value.toString(16)}L
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v5
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
"""

private fun syntheticEntitlement(): String = """
    new-instance v2, Ljava/util/HashMap;
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    ${putString("identifier", PRODUCT_IDENTIFIER)}
    ${putBoolean("isActive", true)}
    ${putBoolean("willRenew", true)}
    ${putString("periodType", "NORMAL")}
    ${putLong("latestPurchaseDateMillis", PURCHASE_DATE_MILLIS)}
    ${putString("latestPurchaseDate", PURCHASE_DATE_ISO)}
    ${putLong("originalPurchaseDateMillis", PURCHASE_DATE_MILLIS)}
    ${putString("originalPurchaseDate", PURCHASE_DATE_ISO)}
    ${putNull("expirationDateMillis")}
    ${putNull("expirationDate")}
    ${putString("store", "PLAY_STORE")}
    ${putString("productIdentifier", PRODUCT_IDENTIFIER)}
    ${putNull("productPlanIdentifier")}
    ${putBoolean("isSandbox", false)}
    ${putNull("unsubscribeDetectedAt")}
    ${putNull("unsubscribeDetectedAtMillis")}
    ${putNull("billingIssueDetectedAt")}
    ${putNull("billingIssueDetectedAtMillis")}
    ${putString("ownershipType", "PURCHASED")}
    ${putString("verification", "NOT_REQUESTED")}
"""

@Suppress("unused")
val unlockPremiumPatch = patch(
    name = "Unlock Pro",
    description = "Reports an active \"pro\" entitlement to the Flutter side so every " +
        "Pro feature (calibration, custom white balance presets, extra measurement modes, " +
        "ad free usage) is unlocked without a RevenueCat purchase.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_COLOR_TEMP_METER)

    dependsOn(disablePairipLicenseCheckPatch)

    execute {
        EntitlementInfosMapperFingerprint.method.addInstructions(
            0,
            """
                # v0 = active entitlements, v1 = all entitlements
                new-instance v0, Ljava/util/HashMap;
                invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
                new-instance v1, Ljava/util/HashMap;
                invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

                # v2 = synthetic EntitlementInfo map ("pro", active, lifetime-ish)
                ${syntheticEntitlement()}

                const-string v4, "$PRODUCT_IDENTIFIER"
                invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v5
                invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v5

                # v3 = result: { "all": ..., "active": ..., "verification": ... }
                new-instance v3, Ljava/util/HashMap;
                invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

                const-string v4, "all"
                invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v5
                const-string v4, "active"
                invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v5
                const-string v4, "verification"
                const-string v5, "NOT_REQUESTED"
                invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v5

                return-object v3
            """,
        )
    }
}
