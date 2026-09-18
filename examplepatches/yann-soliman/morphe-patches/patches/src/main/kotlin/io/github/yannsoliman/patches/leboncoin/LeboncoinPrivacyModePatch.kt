package io.github.yannsoliman.patches.leboncoin

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val FIREBASE_ANALYTICS =
    "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val ANALYTICS_MANAGER =
    "Lfr/leboncoin/libraries/tracking/analytics/a;"
private const val PIANO_ANALYTICS =
    "Lfr/leboncoin/tracking/domain/pianoAnalytics/a;"
private const val ADJUST = "Lcom/adjust/sdk/Adjust;"
private const val DATADOG_CONFIG =
    "Lfr/leboncoin/libraries/datadog/DatadogConfig;"
private const val MPARTICLE = "Lcom/mparticle/MParticle;"

private data class VoidTelemetryMethod(
    val definingClass: String,
    val name: String,
    val parameters: List<String>,
    val expectedInstructionCount: Int,
)

@Suppress("unused")
val leboncoinPrivacyModePatch = bytecodePatch(
    name = "Leboncoin: privacy mode",
    description = "Suppress behavioral analytics and attribution events sent through Firebase Analytics, Piano Analytics, Adjust and mParticle, and disable Datadog telemetry. Keeps consent, notifications and required SDK startup intact. Leboncoin 100.125.0 only.",
) {
    compatibleWith(Compatibility(
        name = "Leboncoin",
        packageName = "fr.leboncoin",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "100.125.0")),
    ))

    execute {
        val voidMethods = listOf(
            // Firebase's logEvent entry point. Keeping Firebase initialized avoids
            // breaking Remote Config, authentication and other unrelated services.
            VoidTelemetryMethod(
                FIREBASE_ANALYTICS,
                "a",
                listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
                13,
            ),
            // Leboncoin's Firebase user-property writer bypasses logEvent.
            VoidTelemetryMethod(
                ANALYTICS_MANAGER,
                "e",
                listOf("Lnq30;", "Ljava/lang/String;"),
                24,
            ),
            // Application-owned Piano Analytics event dispatcher.
            VoidTelemetryMethod(
                PIANO_ANALYTICS,
                "b",
                listOf("Lkvd;"),
                385,
            ),
            // Explicit Adjust conversion/attribution events.
            VoidTelemetryMethod(
                ADJUST,
                "trackEvent",
                listOf("Lcom/adjust/sdk/AdjustEvent;"),
                4,
            ),
            // mParticle behavior events and screen views. Its initialization is
            // retained because messaging and Rokt integrations also use the SDK.
            VoidTelemetryMethod(
                MPARTICLE,
                "logEvent",
                listOf("Lcom/mparticle/BaseEvent;"),
                34,
            ),
            VoidTelemetryMethod(
                MPARTICLE,
                "logScreen",
                listOf("Lcom/mparticle/MPEvent;"),
                50,
            ),
            VoidTelemetryMethod(
                MPARTICLE,
                "logScreen",
                listOf("Ljava/lang/String;"),
                3,
            ),
            VoidTelemetryMethod(
                MPARTICLE,
                "logScreen",
                listOf("Ljava/lang/String;", "Ljava/util/Map;"),
                3,
            ),
            VoidTelemetryMethod(
                MPARTICLE,
                "logScreen",
                listOf(
                    "Ljava/lang/String;",
                    "Ljava/util/Map;",
                    "Ljava/lang/Boolean;",
                ),
                15,
            ),
        )

        voidMethods.forEach { target ->
            val match = Fingerprint(
                definingClass = target.definingClass,
                name = target.name,
                returnType = "V",
                parameters = target.parameters,
            ).matchAll(1..1).single()
            val instructions = match.method.implementation!!.instructions.toList()
            check(instructions.size == target.expectedInstructionCount) {
                "Unexpected ${target.definingClass}->${target.name} instruction count: " +
                    "${instructions.size}"
            }
            check(instructions.last().opcode == Opcode.RETURN_VOID) {
                "Unexpected ${target.definingClass}->${target.name} return layout"
            }

            // Return before the SDK queues or transmits the event. Leaving the
            // original body in place preserves try/catch and debug metadata.
            match.method.addInstruction(0, "return-void")
        }

        // Datadog already exposes a remote isEnabled gate. Force that gate off
        // rather than removing its classes or content provider from the APK.
        val datadogEnabled = Fingerprint(
            definingClass = DATADOG_CONFIG,
            name = "isEnabled",
            returnType = "Z",
            parameters = emptyList(),
        ).matchAll(1..1).single().method
        val datadogInstructions = datadogEnabled.implementation!!.instructions.toList()
        check(datadogInstructions.map { it.opcode } == listOf(
            Opcode.IGET_BOOLEAN,
            Opcode.RETURN,
        )) { "Unexpected DatadogConfig.isEnabled layout" }
        datadogEnabled.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
