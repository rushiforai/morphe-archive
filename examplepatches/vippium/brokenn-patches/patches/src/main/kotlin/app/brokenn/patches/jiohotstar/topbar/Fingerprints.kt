package app.brokenn.patches.jiohotstar.topbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

// The patch scans version-specific code instead of using obfuscated names.
// The filters must remain in method order.
object TopBarContentFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("L", "Landroidx/compose/runtime/b;", "I"),
    filters = listOf(
        literal(1673754903),
        literal(-673482817)
    )
)

object TopBarContainerFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("L", "Z", "L", "Landroidx/compose/runtime/b;", "I"),
    filters = listOf(
        literal(1318644515),
        methodCall(definingClass = "Landroidx/compose/foundation/layout/i;", name = "g")
    )
)

object TopBarScrollFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        literal(-50)
    )
)
