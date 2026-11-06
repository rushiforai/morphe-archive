package patches.bol.sponsored

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import com.android.tools.smali.dexlib2.Opcode

/**
 * GraphQL input type `SearchInput` (obfuscated: hdj in 2026.22.1).
 * One of its fields is `enableSponsoredProducts: Optional<Boolean>`, which the app sets to
 * `Present(true)` for regular searches. The server then mixes sponsored products into the results.
 */
internal object SearchInputToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("SearchInput(query=", ", enableSponsoredProducts=")
)

/**
 * Product page (PDP) sections, `enum class (value: String)`, with the values used by the
 * `android_config_pdp_phone_configuration` remote config:
 * `advertisement`, `considerationDisplayAd`, `productdisplayad` and `sponsoredproducts` are ads.
 */
internal object PdpSectionEnumFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    strings = listOf("advertisement", "considerationDisplayAd", "productdisplayad", "sponsoredproducts")
)

/**
 * Returns the ordered list of PDP sections: parsed from remote config, or a hardcoded default list.
 */
internal object PdpSectionsFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    strings = listOf("android_config_pdp_phone_configuration")
)

/**
 * Apollo adapter of the `DisplayAdsAndroid` query data: `data class Data(val displayAds: List<DisplayAd>?)`.
 * This is the serializer (`toJson`), the only string in it is the field name.
 * Its sibling `fromJson` is patched. Display ads are the banners on the home page, search, browse and PDP.
 */
internal object DisplayAdsDataToJsonFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "L", "Ljava/lang/Object;"),
    strings = listOf("displayAds"),
    custom = { method, _ ->
        method.instructionsOrNull?.count { it.opcode == Opcode.CONST_STRING } == 1
    }
)
