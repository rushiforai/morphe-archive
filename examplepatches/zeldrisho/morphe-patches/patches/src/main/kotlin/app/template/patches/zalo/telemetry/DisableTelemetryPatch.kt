package app.template.patches.zalo.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import app.template.patches.shared.bytecode.clearBody
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO
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

/** Analytics Room insertion methods in Zalo 26.10.02. */
private object SessionInsert261002 : Fingerprint(
    definingClass = "Lal/n;", name = "c", accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I", parameters = listOf("Lal/o;"), filters = listOf(methodCall(definingClass = "Lf7/d;", name = "f")),
)
private object ScreenInsert261002 : Fingerprint(
    definingClass = "Lal/l;", name = "F", accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V", parameters = listOf("Lal/m;"), filters = listOf(methodCall(definingClass = "Lf7/d;", name = "f")),
)
private object ViewInsert261002 : Fingerprint(
    definingClass = "Lal/p;", name = "d", accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V", parameters = listOf("Lal/q;"), filters = listOf(methodCall(definingClass = "Lf7/d;", name = "i")),
)
private object EventBatchInsert261002 : Fingerprint(
    definingClass = "Lal/g;", name = "b", accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I", parameters = listOf("Ljava/util/ArrayList;"), filters = listOf(methodCall(definingClass = "Lf7/d;", name = "g")),
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
private val RecordExceptionWithKeys261002 = crashlyticsMethod(
    "recordException", listOf("Ljava/lang/Throwable;", "Lqf/c;"),
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
private val SetCustomKeys261002 = crashlyticsMethod("setCustomKeys", listOf("Lqf/c;"))
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
    description = "Stops selected Zalo analytics and crash reporting. Messaging is unaffected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)
    dependsOn(disableCrashlyticsManifestPatch)

    execute {
        fun oneVersion(old: Fingerprint, current: Fingerprint): MutableMethod {
            val matches = old.matchAll(0..1) + current.matchAll(0..1)
            check(matches.size == 1) { "Expected one version-specific telemetry target" }
            return matches.single().method
        }

        val session = oneVersion(SessionInsert, SessionInsert261002)
        val screen = oneVersion(ScreenInsert, ScreenInsert261002)
        val view = oneVersion(ViewInsert, ViewInsert261002)
        val events = oneVersion(EventBatchInsert, EventBatchInsert261002)
        val recordWithKeys = oneVersion(RecordExceptionWithKeys, RecordExceptionWithKeys261002)
        val customKeys = oneVersion(SetCustomKeys, SetCustomKeys261002)
        forceReturnInt(session)
        forceReturnVoid(screen)
        forceReturnVoid(view)
        forceReturnInt(events)
        NativeCrashHandlerInitCall.matchAllMethodIndicesForEach(requireMatches = false) { index ->
            replaceInstruction(index, "nop")
        }

        neutralizeSinks(
            listOf(
                RecordException,
                CrashLog,
                SetCustomKeyDouble,
                SetCustomKeyFloat,
                SetCustomKeyInt,
                SetCustomKeyLong,
                SetCustomKeyString,
                SetCustomKeyBoolean,
                SetUserId,
                SetCrashlyticsCollectionEnabled,
            ).map { fingerprint -> fingerprint.matchAll(1..1).single().method } + listOf(recordWithKeys, customKeys),
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
