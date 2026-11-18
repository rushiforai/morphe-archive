package app.brokenn.patches.jiohotstar.screenshot

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

object UseSecureViewFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/player/models/config/ABConfig;",
    name = "getUseSecureView",
    returnType = "Z"
)

// The Activity window `FLAG_SECURE` (0x2000) setter.

object ComposeFlagSecureFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("null cannot be cast to non-null type android.app.Activity"),
        methodCall(definingClass = "Landroid/app/Activity;", name = "getWindow"),
        literal(0x2000),
        methodCall(definingClass = "Landroid/view/Window;", name = "addFlags")
    )
)

object SurfaceSetSecureFingerprint : Fingerprint(
    custom = { method, _ -> method.callsSurfaceViewSetSecure() }
)

/** True when [method] invokes `SurfaceView.setSecure`, regardless of obfuscation. */
private fun Method.callsSurfaceViewSetSecure(): Boolean =
    implementation?.instructions?.any { instruction ->
        instruction is ReferenceInstruction &&
            (instruction.reference as? MethodReference)?.let { reference ->
                reference.name == "setSecure" &&
                    reference.definingClass == "Landroid/view/SurfaceView;" &&
                    reference.parameterTypes == listOf("Z") &&
                    reference.returnType == "V"
            } == true
    } == true

