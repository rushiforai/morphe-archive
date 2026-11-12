package app.template.patches.bare.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.Method

internal fun isChromiumLibraryLoader(method: Method): Boolean {
    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "V" ||
        method.parameterTypes.map(CharSequence::toString) !=
        listOf("Landroid/content/pm/ApplicationInfo;")) return false
    val references = method.implementation?.instructions?.mapNotNull {
        (it as? ReferenceInstruction)?.reference
    } ?: return false
    return references.any {
        it is FieldReference && it.definingClass == "Landroid/content/pm/ApplicationInfo;" &&
            it.name == "packageName"
    } && references.any {
        it is MethodReference && it.definingClass == "Lorg/chromium/base/library_loader/ProcessInitException;" &&
            it.name == "<init>"
    } && references.any {
        it is MethodReference && it.definingClass == "Ljava/lang/System;" &&
            it.name == "loadLibrary" && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }
}

internal object LibraryLoaderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/pm/ApplicationInfo;"),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/lang/System;",
            name = "loadLibrary",
        ),
    ),
    // Chromium 153 renamed its tracing label from loadMainDexAlreadyLocked
    // to loadAlreadyLocked. Match the loader's behavior, not diagnostic text.
    custom = { method, _ -> isChromiumLibraryLoader(method) },
)
