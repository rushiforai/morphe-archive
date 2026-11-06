package app.template.patches.idm

import app.morphe.patcher.Fingerprint

/**
 * Disable-ads fingerprints for IDM (idm.internet.download.manager).
 *
 * Method identities come from the shipped APK (v18.2, DEX classes9).
 * `c6.mo13964` is the only controller method with a non-unique name in DEX;
 * instead of matching names, the exact parameter descriptors are used.
 *
 * Confirmed signatures (REA `inspect_android_method`):
 * - Lidm/internet/download/manager/e; <init>()V           -> app-level Appodeal init
 * - Li/c0; mo13964(Lacr/browser/lightning/activity/MyAppCompatActivity; Li/m15;)V -> Amazon
 * - Li/nc6; mo13964(Lacr/browser/lightning/activity/MyAppCompatActivity; Li/m15;)V -> Smaato
 * - Li/rm; mo13964(Lacr/browser/lightning/activity/MyAppCompatActivity; Li/m15;)V -> browser Appodeal
 * - Li/s82; mo13964(Lacr/browser/lightning/activity/MyAppCompatActivity; Li/m15;)V -> NewBannerView
 */
object IdmDisableAdsPatches {
    val APP_LEVEL_AD_INIT = Fingerprint(
        definingClass = "Lidm/internet/download/manager/e;",
        name = "<init>",
        parameters = listOf(),
    )

    val AMAZON_AD_INIT = Fingerprint(
        definingClass = "Li/c0;",
        parameters = listOf("Lacr/browser/lightning/activity/MyAppCompatActivity;", "Li/m15;"),
    )

    val SMAATO_AD_INIT = Fingerprint(
        definingClass = "Li/nc6;",
        parameters = listOf("Lacr/browser/lightning/activity/MyAppCompatActivity;", "Li/m15;"),
    )

    val BROWSER_APPODEAL_AD_INIT = Fingerprint(
        definingClass = "Li/rm;",
        parameters = listOf("Lacr/browser/lightning/activity/MyAppCompatActivity;", "Li/m15;"),
    )

    val NEW_BANNER_AD_INIT = Fingerprint(
        definingClass = "Li/s82;",
        parameters = listOf("Lacr/browser/lightning/activity/MyAppCompatActivity;", "Li/m15;"),
    )
}
