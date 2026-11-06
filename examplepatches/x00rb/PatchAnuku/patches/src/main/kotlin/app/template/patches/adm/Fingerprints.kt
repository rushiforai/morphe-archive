package app.template.patches.adm

import app.morphe.patcher.Fingerprint

object AdmDisableAdsPatches {
    val t5INTERSTITIAL_INIT = Fingerprint(
        definingClass = "Lg3/t5;",
        name = "c",
        parameters = listOf("Landroid/app/Activity;"),
    )

    val t5BANNER_SHOW = Fingerprint(
        definingClass = "Lg3/t5;",
        name = "b",
        parameters = listOf(),
    )

    val t5INTERSTITIAL_SHOW = Fingerprint(
        definingClass = "Lg3/t5;",
        name = "d",
        parameters = listOf("Landroid/app/Activity;"),
    )

    val APPBRAIN_BANNER_INIT = Fingerprint(
        definingClass = "Lcom/applovin/impl/sdk/x;",
        name = "d",
        parameters = listOf(),
    )
}
