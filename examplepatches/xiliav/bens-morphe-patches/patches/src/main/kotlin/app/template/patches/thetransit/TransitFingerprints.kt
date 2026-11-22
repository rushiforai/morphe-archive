package app.template.patches.thetransit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val TRANSIT_LIB_CLASS = "Lcom/thetransitapp/droid/shared/data/TransitLib;"
internal const val TRANSIT_APP_CLASS = "Lcom/thetransitapp/droid/shared/TransitApp;"
internal const val ROYALE_STATUS_CLASS = "Lcom/thetransitapp/droid/shared/model/cpp/royale/RoyaleStoreSubscriptionStatus;"
internal const val TRANSIT_HELPER_CLASS = "Lapp/template/extension/extension/TransitHelper;"

// Signatures and exact access flags verified against 6.3.7 (5128316).
val RoyaleIsActiveFingerprint = Fingerprint(
    definingClass = ROYALE_STATUS_CLASS,
    name = "isActive",
    parameters = emptyList(),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val FetchSubscriptionStatusFingerprint = Fingerprint(
    definingClass = TRANSIT_LIB_CLASS,
    name = "fetchSubscriptionStatus",
    parameters = listOf("Z", "J"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(
        string("activate_royale_subscription"),
        methodCall(
            definingClass = TRANSIT_LIB_CLASS,
            name = "isFeatureActivated",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "Z",
            opcodes = listOf(Opcode.INVOKE_STATIC),
            location = InstructionLocation.MatchAfterImmediately()
        ),
        opcode(Opcode.MOVE_RESULT, location = InstructionLocation.MatchAfterImmediately())
    )
)

val TransitAppOnCreateFingerprint = Fingerprint(
    definingClass = TRANSIT_APP_CLASS,
    name = "onCreate",
    parameters = emptyList(),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)
