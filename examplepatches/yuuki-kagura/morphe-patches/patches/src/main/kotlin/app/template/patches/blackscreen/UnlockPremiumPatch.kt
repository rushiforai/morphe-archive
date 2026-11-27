package app.template.patches.blackscreen

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_BLACKSCREEN
import app.template.patches.shared.disablePairipLicenseCheckPatch

/**
 * Entitlement model of the app (2.0.7):
 *
 *  - Every purchase is persisted as a boolean in `<packageName>_preferences`:
 *    `purchase_in_app` (one-time, includes the "Lifetime" product) and
 *    `purchase_subs` (monthly/yearly products).
 *  - One static helper ORs both keys and is used by ~20 call sites (application, main
 *    activity, splash, tile service, preference screens, floating button/screen modes).
 *  - A handful of other classes (app open ad manager, preference gates) read the two
 *    booleans from `SharedPreferences` directly instead of going through the helper.
 *
 * The patch therefore does two things: it seeds both booleans at startup (covers the
 * raw `getBoolean` readers, which also kills the interstitial/app-open ads) and forces
 * the central helper to `true` (covers every gate even if the prefs are cleared, e.g.
 * by the app's own "premium item no longer owned" cleanup).
 */
@Suppress("unused")
val unlockPremiumPatch = patch(
    name = "Unlock premium",
    description = "Unlocks all premium features (custom clock fonts, floating lock styles, " +
        "extra tap actions, quick settings tile, ...) and removes the ads that are " +
        "shown to non-paying users.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLACKSCREEN)

    dependsOn(disablePairipLicenseCheckPatch)

    execute {
        val premiumClass = PremiumCheckFingerprint.method.definingClass // e.g. Lbm1;
        val prefsInitMethod = PrefsInitFingerprint.method.name
        val prefsGetterMethod = PrefsGetterFingerprint.method.name

        // Seed the purchase flags on startup. The prefs initializer is idempotent,
        // so calling it at the top of onCreate() is safe.
        ApplicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, $premiumClass->$prefsInitMethod(Landroid/content/Context;)V
                invoke-static {}, $premiumClass->$prefsGetterMethod()Landroid/content/SharedPreferences;
                move-result-object v0
                invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v0
                const-string v1, "purchase_in_app"
                const/4 v2, 0x1
                invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                const-string v1, "purchase_subs"
                invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
            """,
        )

        // Central entitlement check.
        PremiumCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
