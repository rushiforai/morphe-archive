package app.brokenn.patches.picasso.ads

import app.brokenn.patches.picasso.shared.Constants.ADS_CONFIG
import app.brokenn.patches.picasso.shared.Constants.BANNER_ADS
import app.brokenn.patches.picasso.shared.Constants.COMPATIBILITY_PICASSO
import app.brokenn.patches.picasso.shared.Constants.INTERSTITIAL_ADS
import app.brokenn.patches.picasso.shared.Constants.NATIVE_ADS
import app.brokenn.patches.picasso.shared.Constants.REWARDED_ADS
import app.brokenn.patches.shared.instrs
import app.brokenn.patches.shared.readsField
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Ad formats the server can arm, plus the unit ids only read once an ad is requested.
private val AD_SWITCHES = listOf("bannerAd", "interstitialAd", "nativeAd", "rewordAd")
private val AD_UNIT_IDS = listOf("bannerAdId", "interstitialAdId", "nativeAdId", "rewordAdId")
private val AD_FIELDS = (AD_SWITCHES + AD_UNIT_IDS).map { "$ADS_CONFIG->$it:Ljava/lang/String;" }

private val AD_WRAPPERS = listOf(BANNER_ADS, INTERSTITIAL_ADS, NATIVE_ADS, REWARDED_ADS)

// Wrappers consume the switches through getters, so an ad request shows up as a call
// on the config type rather than as a field read.
private fun Method.touchesAdsConfig(): Boolean = instrs().any { instruction ->
    val reference = (instruction as? ReferenceInstruction)?.reference
    reference is MethodReference && reference.definingClass == ADS_CONFIG
}

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes banner, native, interstitial and rewarded ads.",
) {
    compatibleWith(COMPATIBILITY_PICASSO)

    execute {
        // Layer 1: the server switches every format reads before requesting an ad.
        val config = mutableClassDefBy(ADS_CONFIG)
        var switchesCleared = 0
        config.methods.toList().forEach { method ->
            val readsSwitch = AD_FIELDS.any { method.readsField(it) }
            if (readsSwitch && method.parameters.isEmpty() && method.returnType == "Ljava/lang/String;") {
                method.returnEarly("")
                switchesCleared++
            }
        }
        if (switchesCleared < AD_FIELDS.size) {
            throw PatchException("Expected ${AD_FIELDS.size} ad config getters, cleared $switchesCleared")
        }

        // Layer 2: the wrappers themselves, so a stale config can never render an ad.
        var wrappersStubbed = 0
        for (type in AD_WRAPPERS) {
            val wrapper = mutableClassDefBy(type)
            var stubbed = 0
            wrapper.methods.toList().forEach { method ->
                val touchesAd = method.touchesAdsConfig() || AD_FIELDS.any { method.readsField(it) }
                if (touchesAd && method.returnType == "V" && method.name != "<init>") {
                    method.returnEarly()
                    stubbed++
                }
            }
            if (stubbed == 0) throw PatchException("No ad entry point found in $type")
            wrappersStubbed += stubbed
        }

        println("Picasso: cleared $switchesCleared ad switches, stubbed $wrappersStubbed ad entry points")
    }
}
