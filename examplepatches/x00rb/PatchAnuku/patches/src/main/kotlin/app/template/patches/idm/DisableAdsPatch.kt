package app.template.patches.idm

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable Ads",
    description = "Disables Appodeal, Amazon, Smaato and NewBannerView ad controllers in IDM.",
    default = true
) {
    compatibleWith(IdmConstants.COMPATIBILITY_IDM)
      execute {
        IdmDisableAdsPatches.APP_LEVEL_AD_INIT.method.addInstruction(0, "return-void")
        IdmDisableAdsPatches.AMAZON_AD_INIT.method.addInstruction(0, "return-void")
        IdmDisableAdsPatches.SMAATO_AD_INIT.method.addInstruction(0, "return-void")
        IdmDisableAdsPatches.BROWSER_APPODEAL_AD_INIT.method.addInstruction(0, "return-void")
        IdmDisableAdsPatches.NEW_BANNER_AD_INIT.method.addInstruction(0, "return-void")
    }
}
