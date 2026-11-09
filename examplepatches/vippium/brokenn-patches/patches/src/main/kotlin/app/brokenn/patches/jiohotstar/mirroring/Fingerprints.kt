package app.brokenn.patches.jiohotstar.mirroring

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object MultipleDisplayCheckFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(
        methodCall(definingClass = "Landroid/hardware/display/DisplayManager;", name = "getDisplays"),
        opcode(Opcode.ARRAY_LENGTH),
        literal(1)
    )
)
