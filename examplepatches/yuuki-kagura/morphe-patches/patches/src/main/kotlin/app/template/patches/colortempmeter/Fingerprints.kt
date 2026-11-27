package app.template.patches.colortempmeter

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * RevenueCat's hybrid-common mapper that converts `EntitlementInfos` into the
 * `Map<String, Object>` handed over the Flutter method channel
 * (`getCustomerInfo`, `purchasePackage`, `restorePurchases`, ...).
 *
 * This app is Flutter/Dart (AOT `libapp.so`), so the entitlement check itself lives in
 * native Dart code and cannot be patched here. Instead the *data* the Dart layer sees is
 * replaced, which is equivalent: the Dart side only reads this map.
 */
object EntitlementInfosMapperFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;",
    name = "map",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/util/Map;",
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfos;"),
)
