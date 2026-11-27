package app.template.patches.blackscreen

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The app is R8 obfuscated so the entitlement helper class has no stable name.
 * It is identified by the SharedPreferences keys every purchase is stored under.
 *
 * Resolves to the static `isPremium()` style method that ORs
 * "purchase_in_app" with "purchase_subs".
 */
object PremiumCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("purchase_in_app"),
        string("purchase_subs"),
    ),
)

/**
 * Static `SharedPreferences` initializer of the same class,
 * called once from `Application.onCreate()`.
 */
object PrefsInitFingerprint : Fingerprint(
    classFingerprint = PremiumCheckFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/** Static accessor that returns the shared preferences instance of the helper class. */
object PrefsGetterFingerprint : Fingerprint(
    classFingerprint = PremiumCheckFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/content/SharedPreferences;",
    parameters = emptyList(),
)

/**
 * App owned (not obfuscated) application class. Runs after PairIP's
 * license check gate, which is why the purchase flags are seeded here.
 */
object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lio/japp/blackscreen/MyApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)
