package patches.bol.tracking

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element
import patches.bol.shared.Constants.COMPATIBILITY_BOL

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

/** Firebase / Google Analytics manifest switches. The "deactivated" flags cannot be overridden at runtime. */
private val MANIFEST_METADATA = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_analytics_collection_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_analytics_storage" to "false",
    "google_analytics_default_allow_ad_storage" to "false",
    "google_analytics_default_allow_ad_user_data" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "firebase_sessions_enabled" to "false",
)

/** Without these the advertising id (GAID) and Privacy Sandbox attribution APIs return nothing. */
private val REMOVED_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
)

private val disableTrackingManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            val permissions = document.getElementsByTagName("uses-permission")
            (permissions.length - 1 downTo 0).map { permissions.item(it) as Element }
                .filter { it.getAttributeNS(ANDROID_NAMESPACE, "name") in REMOVED_PERMISSIONS }
                .forEach { it.parentNode.removeChild(it) }

            val metadata = document.getElementsByTagName("meta-data")
            val existing = (0 until metadata.length).map { metadata.item(it) as Element }
                .filter { it.parentNode == application }
                .associateBy { it.getAttributeNS(ANDROID_NAMESPACE, "name") }

            MANIFEST_METADATA.forEach { (name, value) ->
                val element = existing[name] ?: document.createElement("meta-data").also {
                    it.setAttributeNS(ANDROID_NAMESPACE, "android:name", name)
                    application.appendChild(it)
                }
                element.setAttributeNS(ANDROID_NAMESPACE, "android:value", value)
            }
        }
    }
}

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking",
    description = "Disables analytics and tracking: RudderStack, AppsFlyer, Firebase Analytics, " +
        "Crashlytics, Firebase Performance, Sentry, Airship analytics and the advertising id. " +
        "Push notifications keep working.",
) {
    compatibleWith(COMPATIBILITY_BOL)

    dependsOn(disableTrackingManifestPatch)

    execute {

        // region RudderStack (bol's own analytics pipeline)

        RudderStackEnqueueFingerprint.method.addInstruction(0, "return-void")

        RudderStackAnonymousIdHeaderFingerprint.method.apply {
            val headerIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    it.getReference<StringReference>()?.string == "Bol-App-Rs-Anonymous-Id"
            }
            val putIndex = (headerIndex until instructions.size).first {
                getInstruction(it).getReference<MethodReference>()?.name == "put"
            }
            if (getInstruction(putIndex + 1).opcode == Opcode.MOVE_RESULT_OBJECT) removeInstruction(putIndex + 1)
            removeInstruction(putIndex)
        }

        // endregion

        // region AppsFlyer (install attribution and marketing events)

        mutableClassDefBy { it.superclass == "Lcom/appsflyer/AppsFlyerLib;" }.methods.forEach { method ->
            when {
                // An empty dev key makes init() return before the SDK is set up, so not even its
                // remote settings (cdn-settings.appsflyersdk.com) are fetched.
                method.name == "init" && method.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;" ->
                    method.addInstruction(0, "const-string p1, \"\"")

                method.name == "isStopped" -> method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """
                )

                method.returnType == "V" && method.name in setOf(
                    "start",
                    "logEvent",
                    "logSession",
                    "logAdRevenue",
                    "logLocation",
                    "sendPushNotificationData",
                ) -> method.addInstruction(0, "return-void")
            }
        }

        // endregion

        // region Firebase Crashlytics (the app enables it at runtime, overriding the manifest)

        mutableClassDefBy("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;").methods
            .filter { it.name == "setCrashlyticsCollectionEnabled" }
            .forEach { method ->
                when (method.parameterTypes.single().toString()) {
                    "Z" -> method.addInstruction(0, "const/4 p1, 0x0")
                    else -> method.addInstruction(0, "sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
                }
            }

        // endregion

        // region Sentry (crash reporting, performance tracing and user interaction breadcrumbs)

        SentrySetDsnFingerprint.method.addInstruction(0, "const-string p1, \"\"")

        // endregion

        // region Airship analytics (push notifications and the message center stay enabled)

        val analyticsEnabledField = AirshipConfigBuilderFingerprint.originalMethod.let { method ->
            val instructions = method.instructions.toList()
            val keyIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING && it.getReference<StringReference>()?.string == "analyticsEnabled"
            }
            instructions.drop(keyIndex).first { it.opcode == Opcode.IPUT_BOOLEAN }
                .getReference<FieldReference>()!!
        }

        mutableClassDefBy("Lcom/urbanairship/AirshipConfigOptions;").methods
            .filter { it.name == "<init>" }
            .forEach { constructor ->
                constructor.instructions.withIndex()
                    .filter { (_, instruction) ->
                        instruction.opcode == Opcode.IGET_BOOLEAN &&
                            instruction.getReference<FieldReference>() == analyticsEnabledField
                    }
                    .map { it.index }
                    .sortedDescending()
                    .forEach { index ->
                        val register = constructor.getInstruction<TwoRegisterInstruction>(index).registerA
                        constructor.addInstruction(index + 1, "const/4 v$register, 0x0")
                    }
            }

        // endregion
    }
}
