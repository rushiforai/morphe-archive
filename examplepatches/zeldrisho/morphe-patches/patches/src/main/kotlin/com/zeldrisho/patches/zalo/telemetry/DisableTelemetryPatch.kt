package com.zeldrisho.patches.zalo.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.zeldrisho.patches.shared.bytecode.clearBody
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO
import org.w3c.dom.Element

private const val CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"

/*
 * Zalo 26.08.01 (versionCode 260801903, arm64-v8a).
 *
 * Zalo's first-party analytics names mentioned in older builds are not present
 * here. The stable database implementation is the recording boundary: its
 * four DAOs write only the sessions/screens/views/events analytics tables.
 * FirebaseCrashlytics is the app's diagnostic sink in this artifact. The
 * native crash handler exposes a native declaration, so its Java call sites
 * are NOPed rather than rewriting the declaration (which has no bytecode
 * implementation).
 */

private object SessionInsert : Fingerprint(
    definingClass = "Lpj/i;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    parameters = listOf("Lpj/j;"),
    filters = listOf(methodCall(definingClass = "Lu5/d;", name = "f")),
)

private object ScreenInsert : Fingerprint(
    definingClass = "Lpj/g;",
    name = "F",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lpj/h;"),
    filters = listOf(methodCall(definingClass = "Lu5/d;", name = "f")),
)

private object ViewInsert : Fingerprint(
    definingClass = "Lpj/k;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lpj/l;"),
    filters = listOf(methodCall(definingClass = "Lu5/d;", name = "i")),
)

private object EventBatchInsert : Fingerprint(
    definingClass = "Lpj/c;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    parameters = listOf("Ljava/util/ArrayList;"),
    filters = listOf(methodCall(definingClass = "Lu5/d;", name = "g")),
)

private object NativeCrashHandlerInitCall : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lcom/zing/zalo/utils/NativeCrashReporter;",
            name = "initSignalHandler",
            returnType = "V",
        ),
    ),
)

private fun crashlyticsMethod(name: String, parameters: List<String>) = Fingerprint(
    definingClass = CRASHLYTICS,
    name = name,
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = parameters,
)

private val RecordException = crashlyticsMethod("recordException", listOf("Ljava/lang/Throwable;"))
private val RecordExceptionWithKeys = crashlyticsMethod(
    "recordException",
    listOf("Ljava/lang/Throwable;", "Lfe/c;"),
)
private val CrashLog = crashlyticsMethod("log", listOf("Ljava/lang/String;"))
private val SetCustomKeyDouble = crashlyticsMethod("setCustomKey", listOf("Ljava/lang/String;", "D"))
private val SetCustomKeyFloat = crashlyticsMethod("setCustomKey", listOf("Ljava/lang/String;", "F"))
private val SetCustomKeyInt = crashlyticsMethod("setCustomKey", listOf("Ljava/lang/String;", "I"))
private val SetCustomKeyLong = crashlyticsMethod("setCustomKey", listOf("Ljava/lang/String;", "J"))
private val SetCustomKeyString = crashlyticsMethod(
    "setCustomKey",
    listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)
private val SetCustomKeyBoolean = crashlyticsMethod("setCustomKey", listOf("Ljava/lang/String;", "Z"))
private val SetCustomKeys = crashlyticsMethod("setCustomKeys", listOf("Lfe/c;"))
private val SetUserId = crashlyticsMethod("setUserId", listOf("Ljava/lang/String;"))
private val SetCrashlyticsCollectionEnabled =
    crashlyticsMethod("setCrashlyticsCollectionEnabled", listOf("Z"))

internal val telemetryFingerprints = listOf(
    SessionInsert,
    ScreenInsert,
    ViewInsert,
    EventBatchInsert,
    NativeCrashHandlerInitCall,
    RecordException,
    RecordExceptionWithKeys,
    CrashLog,
    SetCustomKeyDouble,
    SetCustomKeyFloat,
    SetCustomKeyInt,
    SetCustomKeyLong,
    SetCustomKeyString,
    SetCustomKeyBoolean,
    SetCustomKeys,
    SetUserId,
    SetCrashlyticsCollectionEnabled,
)

private val disableCrashlyticsManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            application.appendChild(
                doc.createElement("meta-data").apply {
                    setAttribute("android:name", "firebase_crashlytics_collection_enabled")
                    setAttribute("android:value", "false")
                },
            )
        }
    }
}

@Suppress("unused")
val disableZaloTelemetryPatch = bytecodePatch(
    name = "Disable telemetry and crash reporting",
    description = "Stops Zalo's first-party analytics records and diagnostic crash data by " +
        "suppressing its Room analytics writes, Firebase Crashlytics logs/keys, and native " +
        "crash-handler registration. Messaging, sockets, and database initialization remain intact.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)
    dependsOn(disableCrashlyticsManifestPatch)

    execute {
        forceReturnInt(SessionInsert.matchAll(1..1).single().method)
        forceReturnVoid(ScreenInsert.matchAll(1..1).single().method)
        forceReturnVoid(ViewInsert.matchAll(1..1).single().method)
        forceReturnInt(EventBatchInsert.matchAll(1..1).single().method)
        val crashHandlerCalls = NativeCrashHandlerInitCall.matchAll(0..Int.MAX_VALUE)
        crashHandlerCalls.forEach { match ->
            removeTelemetryCalls(match.method, match.instructionMatches.map { it.index })
        }

        neutralizeSinks(
            listOf(
                RecordException,
                RecordExceptionWithKeys,
                CrashLog,
                SetCustomKeyDouble,
                SetCustomKeyFloat,
                SetCustomKeyInt,
                SetCustomKeyLong,
                SetCustomKeyString,
                SetCustomKeyBoolean,
                SetCustomKeys,
                SetUserId,
                SetCrashlyticsCollectionEnabled,
            ).map { fingerprint -> fingerprint.matchAll(1..1).single().method },
        )
    }
}

/** Replaces the selected telemetry instructions with NOPs, preserving their list positions. */
internal fun removeTelemetryCalls(method: MutableMethod, instructionIndexes: List<Int>) {
    instructionIndexes.forEach { method.replaceInstruction(it, "nop") }
}

/** Replaces every supplied void telemetry sink body with an immediate return. */
internal fun neutralizeSinks(methods: Iterable<MutableMethod>) {
    methods.forEach(::forceReturnVoid)
}

/** Replaces the selected native crash-handler registration instruction with a NOP. */
internal fun disableNativeCrashHandler(method: MutableMethod, instructionIndex: Int) {
    removeTelemetryCalls(method, listOf(instructionIndex))
}

/** Clears the method body and try blocks, then emits a single void return. */
internal fun forceReturnVoid(method: MutableMethod) {
    method.clearBody()
    method.addInstructions(0, "return-void")
}

/** Clears the method body and try blocks, then returns integer zero through v0. */
internal fun forceReturnInt(method: MutableMethod) {
    method.clearBody()
    method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
}
