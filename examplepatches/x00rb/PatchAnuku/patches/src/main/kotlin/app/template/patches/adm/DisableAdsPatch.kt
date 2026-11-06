package app.template.patches.adm

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable Ads",
    description = "Disables Appodeal and AppBrain ads in Advanced Download Manager.",
    default = true
) {
    compatibleWith(AdmConstants.COMPATIBILITY_ADM)

    execute {
        AdmDisableAdsPatches.t5INTERSTITIAL_INIT.method.addInstruction(0, "return-void")
        AdmDisableAdsPatches.t5BANNER_SHOW.method.addInstruction(0, "return-void")
        AdmDisableAdsPatches.t5INTERSTITIAL_SHOW.method.addInstruction(0, "return-void")
        AdmDisableAdsPatches.APPBRAIN_BANNER_INIT.method.addInstruction(0, "return-void")
    }
}
