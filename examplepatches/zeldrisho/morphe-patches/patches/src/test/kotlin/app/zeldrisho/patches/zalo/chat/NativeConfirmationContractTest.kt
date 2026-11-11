package app.zeldrisho.patches.zalo.chat

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import kotlin.test.Test
import kotlin.test.assertFailsWith

class NativeConfirmationContractTest {
    private fun method(owner: String, name: String, parameters: List<String>, result: String = "V",
        flags: Int = AccessFlags.PUBLIC.value): Method = ImmutableMethod(
        owner, name, parameters.map {
            com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(it, emptySet(), null)
        }, result, flags, emptySet(), emptySet(), null,
    )

    private fun fixture(): List<Method> = listOf(
        method("Lw70/e0;", "<init>", listOf("Landroid/content/Context;")),
        method("Lw70/e0;", "I", listOf("Ljava/lang/CharSequence;")),
        method("Lw70/e0;", "y", listOf("Ljava/lang/CharSequence;")),
        method("Lw70/e0;", "G", listOf("Ljava/lang/CharSequence;", "Lk92/g;")),
        method("Lw70/e0;", "C", listOf("Ljava/lang/CharSequence;", "Lk92/g;")),
        method("Lw70/e0;", "j", emptyList(), "Lfs0/e;"),
        method("Lk92/g;", "n3", listOf("I", "Lk92/e;")),
        method("Lk92/e;", "C", emptyList()),
    )

    private fun validate(methods: List<Method>) = validateNativeConfirmationContract { owner ->
        methods.filter { it.definingClass == owner }
    }

    @Test fun acceptsVerifiedNativeDialogSignatures() = validate(fixture())

    @Test fun rejectsEveryMissingNativeMember() {
        val methods = fixture()
        for (index in methods.indices) {
            assertFailsWith<IllegalStateException> { validate(methods.filterIndexed { i, _ -> i != index }) }
        }
    }

    @Test fun rejectsWrongReturnTypeAndStaticMethods() {
        val methods = fixture().toMutableList()
        methods[5] = method("Lw70/e0;", "j", emptyList(), "Landroid/app/Dialog;")
        assertFailsWith<IllegalStateException> { validate(methods) }
        methods[5] = fixture()[5]
        methods[6] = method("Lk92/g;", "n3", listOf("I", "Lk92/e;"),
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        assertFailsWith<IllegalStateException> { validate(methods) }
    }
}
