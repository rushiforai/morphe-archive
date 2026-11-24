package app.brokenn.patches.picasso.account

import app.brokenn.patches.picasso.shared.Constants.APP_CONFIG
import app.brokenn.patches.picasso.shared.Constants.COMPATIBILITY_PICASSO
import app.brokenn.patches.shared.instrs
import app.brokenn.patches.shared.stringConstants
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val LOGIN_PREFS = "login_status"

private fun Method.callsMandatoryLogin(): Boolean = instrs().any { instruction ->
    val reference = (instruction as? ReferenceInstruction)?.reference
    reference is MethodReference && reference.definingClass == APP_CONFIG &&
        reference.name == "getMandatoryLogin"
}

@Suppress("unused")
val skipLoginPatch = bytecodePatch(
    name = "Skip login",
    description = "Treats the app as signed in and never shows the login screen.",
) {
    compatibleWith(COMPATIBILITY_PICASSO)

    execute {
        // Session state lives in a "login_status" preference read by a single predicate.
        val classes = mutableListOf<ClassDef>()
        classDefForEach { classes.add(it) }

        val loginReaders = classes.flatMap { classDef ->
            classDef.methods.filter {
                it.returnType == "Z" && it.parameters.toList() == listOf("Landroid/content/Context;") &&
                    LOGIN_PREFS in it.stringConstants()
            }.map { classDef to it }
        }
        if (loginReaders.isEmpty()) throw PatchException("Login state predicate not found")
        loginReaders.forEach { (classDef, method) ->
            mutableClassDefBy(classDef).methods
                .first { it.name == method.name && it.parameters.toList() == method.parameters.toList() }
                .returnEarly(true)
        }

        // The server flag that turns the whole flow into a login wall.
        val gates = classes.flatMap { classDef ->
            classDef.methods.filter { it.returnType == "Z" && it.callsMandatoryLogin() }
        }
        if (gates.isEmpty()) throw PatchException("Mandatory login gate not found")
        gates.forEach { method ->
            mutableClassDefBy(method.definingClass).methods
                .first { it.name == method.name && it.parameters.toList() == method.parameters.toList() }
                .returnEarly(false)
        }
    }
}
