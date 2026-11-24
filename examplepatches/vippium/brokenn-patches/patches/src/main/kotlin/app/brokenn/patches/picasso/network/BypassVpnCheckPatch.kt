package app.brokenn.patches.picasso.network

import app.brokenn.patches.picasso.shared.Constants.COMPATIBILITY_PICASSO
import app.brokenn.patches.picasso.shared.Constants.MAIN_ACTIVITY
import app.brokenn.patches.shared.instrs
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Interface names the checker looks for, kept here to recognise the class it lives in.
private const val DIALOG_PARAMS = "Landroid/app/Activity;,Ljava/lang/String;,Ljava/lang/String;"

@Suppress("unused")
val bypassVpnCheckPatch = bytecodePatch(
    name = "Bypass VPN check",
    description = "Skips the network interface check that blocks the app on a VPN or proxy.",
) {
    compatibleWith(COMPATIBILITY_PICASSO)

    execute {
        // Every screen runs the same probe on resume, which makes onResume the place to
        // read the probe off instead of hardcoding its obfuscated class.
        val resume = mutableClassDefBy(MAIN_ACTIVITY).methods.firstOrNull { it.name == "onResume" }
            ?: throw PatchException("MainActivity.onResume not found")

        val probe = resume.instrs()
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .firstOrNull {
                it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                    !it.definingClass.startsWith("Landroid") && !it.definingClass.startsWith("Ljava")
            }
            ?: throw PatchException("VPN probe call not found in MainActivity.onResume")

        val checker = mutableClassDefBy(probe.definingClass)
        val showsDialog = checker.methods.any {
            it.returnType == "V" && it.parameters.joinToString(",") == DIALOG_PARAMS
        }
        if (!showsDialog) throw PatchException("${probe.definingClass} does not look like the VPN checker")

        val gate = checker.methods.firstOrNull {
            it.name == probe.name && it.parameterTypes.isEmpty() && it.returnType == "Z"
        } ?: throw PatchException("VPN probe method not found in ${probe.definingClass}")

        gate.returnEarly(false)
    }
}
