@file:OptIn(app.zeldrisho.patches.shared.bytecode.WholeBodyReplacement::class)

package app.zeldrisho.patches.zalo.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import app.zeldrisho.patches.shared.bytecode.clearBody
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO
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

// Experimental target: 26.11.01 is advertised but not fully device-qualified.
private object SessionInsertCall261101 : Fingerprint(
    definingClass = "Ldfj;", name = "run", returnType = "V", parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Ls8n;", name = "b", type = "Lzfm;"),
        methodCall(definingClass = "Ldk8;", name = "g", parameters = listOf("Ljava/lang/Object;"), returnType = "J")),
)
private object ScreenInsertCall261101 : Fingerprint(
    definingClass = "Lnrq;", name = "run", returnType = "V", parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Lcgm;", name = "b", type = "Ljava/lang/Object;"),
        methodCall(definingClass = "Ldk8;", name = "g", parameters = listOf("Ljava/lang/Object;"), returnType = "J")),
)
private object ViewInsert261101 : Fingerprint(
    definingClass = "Lobs;", name = "d", returnType = "V", parameters = listOf("Lbcs;"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    filters = listOf(methodCall(definingClass = "Ldk8;", name = "g", parameters = listOf("Ljava/lang/Object;"), returnType = "J")),
)
private object EventInsert261101 : Fingerprint(
    definingClass = "Lvn8;", name = "f", returnType = "V", parameters = listOf("Lpo8;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Lvn8;", name = "b", type = "Lsn8;"),
        methodCall(definingClass = "Ldk8;", name = "g", parameters = listOf("Ljava/lang/Object;"), returnType = "J")),
)
private object AnalyticsTables261101 : Fingerprint(
    definingClass = "Lzfm;", name = "b", returnType = "Ljava/lang/String;", parameters = emptyList(),
    filters = listOf(string("INSERT OR ABORT INTO `views`" , app.morphe.patcher.StringComparisonType.CONTAINS),
        string("INSERT OR ABORT INTO `sessions`", app.morphe.patcher.StringComparisonType.CONTAINS),
        string("INSERT OR ABORT INTO `screens`", app.morphe.patcher.StringComparisonType.CONTAINS)),
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
private val RecordExceptionWithKeys261101 = crashlyticsMethod("recordException", listOf("Ljava/lang/Throwable;", "Lri6;"))
private val SetCustomKeys261101 = crashlyticsMethod("setCustomKeys", listOf("Lri6;"))
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

        val version261101 = packageMetadata.versionName == "26.11.01"
        val recordWithKeys: MutableMethod
        val customKeys: MutableMethod
        if (version261101) {
            AnalyticsTables261101.matchAll(1..1)
            val session = SessionInsertCall261101.matchAll(1..1).single().method
            val screen = ScreenInsertCall261101.matchAll(1..1).single().method
            val view = ViewInsert261101.matchAll(1..1).single().method
            val events = EventInsert261101.matchAll(1..1).single().method
            recordWithKeys = RecordExceptionWithKeys261101.matchAll(1..1).single().method
            customKeys = SetCustomKeys261101.matchAll(1..1).single().method
            suppressAnalyticsInsertCall(session, 4, 3, 3)
            suppressAnalyticsInsertCall(screen, 2, 7, 4)
            forceReturnVoid(view)
            forceReturnVoid(events)
        } else {
            val session = oneVersion(SessionInsert, SessionInsert261002)
            val screen = oneVersion(ScreenInsert, ScreenInsert261002)
            val view = oneVersion(ViewInsert, ViewInsert261002)
            val events = oneVersion(EventBatchInsert, EventBatchInsert261002)
            recordWithKeys = oneVersion(RecordExceptionWithKeys, RecordExceptionWithKeys261002)
            customKeys = oneVersion(SetCustomKeys, SetCustomKeys261002)
            forceReturnInt(session)
            forceReturnVoid(screen)
            forceReturnVoid(view)
            forceReturnInt(events)
        }
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

/** Skips only the pinned analytics insert, retaining the surrounding transaction and result flow. */
private fun suppressAnalyticsInsertCall(method: MutableMethod, receiver: Int, argument: Int, result: Int) {
    val instructions = method.implementation?.instructions?.toList() ?: error("Analytics insert has no body")
    val calls = instructions.indices.filter { index ->
        instructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
            (instructions[index] as? ReferenceInstruction)?.reference?.toString() == "Ldk8;->g(Ljava/lang/Object;)J"
    }
    check(calls.size == 1) { "Expected one analytics insert call" }
    val index = calls.single()
    val invoke = instructions[index] as? FiveRegisterInstruction
    val move = instructions.getOrNull(index + 1)
    check(invoke?.registerCount == 2 && invoke.registerC == receiver && invoke.registerD == argument &&
        move?.opcode == Opcode.MOVE_RESULT_WIDE && (move as? OneRegisterInstruction)?.registerA == result
    ) { "Analytics insert register flow changed" }
    method.replaceInstruction(index, "nop")
    method.replaceInstruction(index + 1, "const-wide/16 v$result, 0x0")
}

/** Replaces every supplied void telemetry sink body with an immediate return. */
internal fun neutralizeSinks(methods: Iterable<MutableMethod>) {
    methods.forEach(::forceReturnVoid)
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
