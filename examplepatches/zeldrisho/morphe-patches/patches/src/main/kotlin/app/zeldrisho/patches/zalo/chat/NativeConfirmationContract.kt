package app.zeldrisho.patches.zalo.chat

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Validates the reflection ABI used by NativeConfirmationDialog on Zalo 26.10.02.
 * [methodsFor] supplies methods for a DEX class descriptor.
 *
 * @throws IllegalStateException if any required public instance signature is missing or duplicated.
 */
internal fun validateNativeConfirmationContract(methodsFor: (String) -> Iterable<Method>) {
    data class Signature(val owner: String, val name: String, val parameters: List<String>, val result: String)
    val builder = "Lw70/e0;"
    val listener = "Lk92/g;"
    val text = "Ljava/lang/CharSequence;"
    val signatures = listOf(
        Signature(builder, "<init>", listOf("Landroid/content/Context;"), "V"),
        Signature(builder, "I", listOf(text), "V"),
        Signature(builder, "y", listOf(text), "V"),
        Signature(builder, "G", listOf(text, listener), "V"),
        Signature(builder, "C", listOf(text, listener), "V"),
        Signature(builder, "j", emptyList(), "Lfs0/e;"),
        Signature(listener, "n3", listOf("I", "Lk92/e;"), "V"),
        Signature("Lk92/e;", "C", emptyList(), "V"),
    )
    for (signature in signatures) {
        check(methodsFor(signature.owner).count {
            it.name == signature.name && it.parameterTypes == signature.parameters && it.returnType == signature.result &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
        } == 1) { "Native confirmation dialog ABI changed: $signature" }
    }
}
