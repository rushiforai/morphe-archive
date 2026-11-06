package patches.bol.tracking

import app.morphe.patcher.Fingerprint

/**
 * RudderStack Kotlin SDK, `RudderStackDataplanePlugin.enqueue(event)`.
 * Every analytics event (screen views, clicks, searches, basket, ...) is written to the upload queue here.
 * Events are sent to bol's own proxy (app-api.bol.com/rs/), so they cannot be blocked by DNS.
 */
internal object RudderStackEnqueueFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("RudderStackDataplanePlugin: Enqueuing ")
)

/**
 * Adds the RudderStack anonymous id as `Bol-App-Rs-Anonymous-Id` header to every bol API request,
 * which links the (now unsent) analytics id to all API traffic.
 */
internal object RudderStackAnonymousIdHeaderFingerprint : Fingerprint(
    returnType = "Ljava/util/LinkedHashMap;",
    parameters = listOf(),
    strings = listOf("Bol-App-Rs-Anonymous-Id")
)

/**
 * Sentry `SentryOptions.setDsn(String)` (class is obfuscated, the method is not).
 * An empty DSN disables the SDK.
 */
internal object SentrySetDsnFingerprint : Fingerprint(
    name = "setDsn",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Airship `AirshipConfigOptions.Builder.applyProperties(Context, properties)` (obfuscated).
 * The first boolean field written after the `analyticsEnabled` key is the builder's analytics flag.
 */
internal object AirshipConfigBuilderFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("analyticsEnabled", "productionAppSecret")
)
