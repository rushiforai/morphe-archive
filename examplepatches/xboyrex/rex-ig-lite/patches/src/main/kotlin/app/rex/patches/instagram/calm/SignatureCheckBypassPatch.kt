package app.rex.patches.instagram.calm

import app.morphe.patcher.patch.patch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM

internal object KeyHashClassFingerprint : Fingerprint(
    strings = listOf("SHA-256", "Unable to get reliability enumeration"),
)

/** Rewrites a method body so it simply returns `true` with zero leftover tryBlocks. */
private fun MutableMethod.replaceBodyToReturnTrue(reason: String) {
    val regCount = maxOf(1, implementation?.registerCount ?: 1)
    val replacement = MutableMethod(
        ImmutableMethod(
            definingClass,
            name,
            parameters,
            returnType,
            accessFlags,
            annotations,
            hiddenApiRestrictions,
            ImmutableMethodImplementation(regCount, emptyList(), emptyList(), emptyList()),
        ),
    ).apply {
        addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
    mutableClassDefBy(definingClass).methods.apply {
        remove(this@replaceBodyToReturnTrue)
        add(replacement)
    }
}

@Suppress("unused")
val signatureCheckBypassPatch = patch(
    name = "Signature check bypass",
    description = "Forces Instagram's signing-certificate trust checks to always pass, so a " +
        "re-signed APK is treated as an official Meta build and deep links route to their " +
        "content instead of falling back to the home feed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        runCatching {
            val keyHashType = KeyHashClassFingerprint.classDef.type

            Fingerprint(
                returnType = "Z",
                parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
                strings = listOf("Caller identity check failed", "TrustedCaller"),
            ).method.replaceBodyToReturnTrue("TrustedCaller check")

            val legacyScopeCheck = Fingerprint(
                returnType = "Z",
                parameters = listOf("Landroid/content/Context;"),
                strings = listOf("ApplicationInfo not found for:"),
                custom = { method, classDef ->
                    !AccessFlags.STATIC.isSet(method.accessFlags) &&
                        method.readsKeyHashFrom(classDef.type, keyHashType)
                },
            ).methodOrNull

            val scopeCheck = legacyScopeCheck ?: Fingerprint(
                returnType = "Z",
                parameters = listOf("L", "Landroid/content/Context;"),
                custom = { method, classDef ->
                    AccessFlags.STATIC.isSet(method.accessFlags) &&
                        method.parameterTypes[0].toString() == classDef.type &&
                        method.readsKeyHashFrom(classDef.type, keyHashType)
                },
            ).method

            scopeCheck.replaceBodyToReturnTrue("Family-package trust check")
        }
    }
}

private fun Method.readsKeyHashFrom(ownerType: String, keyHashType: String): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null &&
            reference.definingClass == ownerType &&
            reference.returnType == keyHashType
    } == true