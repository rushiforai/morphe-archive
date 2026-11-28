package app.gboardnet.patches.flags

import app.gboardnet.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringsOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import java.util.logging.Logger

/** Flags switched on by default. Google normally enables these remotely, which the network guard prevents. */
internal val DEFAULT_ENABLED_FLAGS = listOf(
    // Scan text (photograph words to type them).
    "enable_ocr",
    // Loads Gboard's device intelligence module, which requests inline autofill suggestions
    // from password managers and other autofill services.
    "enable_device_intelligence",
)

/**
 * Gboard declares its boolean feature flags as  flag("name", default).  This makes the default true.
 * Matched by the flag name only, so it does not depend on obfuscated class names.
 */
@Suppress("unused")
val enableFeatureFlagsPatch = patch(
    name = "Enable feature flags",
    description = "Switches on Gboard features that are off by default and normally enabled remotely by Google, " +
        "which the network guard prevents. By default: Scan text and inline autofill suggestions " +
        "(password manager suggestions in the suggestion strip).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    val enabledFlags by stringsOption(
        key = "enabledFlags",
        default = DEFAULT_ENABLED_FLAGS,
        title = "Flags to enable",
        description = "Names of Gboard boolean flags whose default is set to true.",
    )

    execute {
        val logger = Logger.getLogger("EnableFeatureFlagsPatch")
        val names = (enabledFlags ?: emptyList()).map { it.trim() }.filter { it.isNotEmpty() }.distinct()

        val wrappers = HashMap<Pair<String, MethodReference>, ImmutableMethodReference>()
        val missing = names.filter { name ->
            val patched = enableFlagDeclarations(name, wrappers)
            if (patched > 0) logger.info("Feature flags: enabled '$name' ($patched declaration(s))")
            patched == 0
        }
        if (missing.isNotEmpty()) {
            throw PatchException("Could not find the declaration of flag(s) ${missing.joinToString()} in this Gboard version.")
        }
    }
}

// Gboard declares each flag as  const-string vS, "name"  +  invoke-static {vS, vB}, ->(Ljava/lang/String;Z)
// vB is often a shared "false" register reused by later declarations, so the call is redirected to a
// wrapper that passes true, instead of changing vB.
// [wrappers] is keyed by (class, factory) and shared across flags, so each class gets one wrapper per factory.
private fun enableFlagDeclarations(
    name: String,
    wrappers: MutableMap<Pair<String, MethodReference>, ImmutableMethodReference>,
): Int {
    var patched = 0
    classDefByStrings(name).forEach { classDef ->
        val mutableClass = mutableClassDefBy(classDef)
        mutableClass.methods.toList().forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.CONST_STRING) return@forEachIndexed
                val string = ((instruction as ReferenceInstruction).reference as StringReference).string
                if (string != name) return@forEachIndexed
                val stringRegister = (instruction as OneRegisterInstruction).registerA

                val callIndex = (index + 1..index + 2).firstOrNull { i ->
                    val call = instructions.getOrNull(i) ?: return@firstOrNull false
                    call.opcode == Opcode.INVOKE_STATIC &&
                        ((call as ReferenceInstruction).reference as MethodReference).isFlagFactory() &&
                        (call as Instruction35c).registerCount == 2 &&
                        call.registerC == stringRegister
                } ?: return@forEachIndexed
                val call = instructions[callIndex] as Instruction35c
                val ref = call.reference as MethodReference

                val wrapper = wrappers.getOrPut(mutableClass.type to ref) {
                    addEnabledFlagWrapper(mutableClass, ref, wrappers.size)
                }
                method.replaceInstruction(
                    callIndex,
                    BuilderInstruction35c(
                        Opcode.INVOKE_STATIC, 2, call.registerC, call.registerD, 0, 0, 0, wrapper,
                    ),
                )
                patched++
            }
        }
    }
    return patched
}

private fun MethodReference.isFlagFactory() =
    parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Z") && returnType.startsWith("L")

// static wrapper(String name, boolean ignored) { return factory(name, true); }
private fun addEnabledFlagWrapper(
    mutableClass: MutableClass,
    factory: MethodReference,
    index: Int,
): ImmutableMethodReference {
    val name = "gboardnetEnabledFlag$index"
    val parameters = listOf("Ljava/lang/String;", "Z")
    val method = ImmutableMethod(
        mutableClass.type,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        factory.returnType,
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(3),
    ).toMutable()
    method.addInstructions(
        0,
        """
            const/4 p1, 0x1
            invoke-static { p0, p1 }, ${factory.definingClass}->${factory.name}(Ljava/lang/String;Z)${factory.returnType}
            move-result-object v0
            return-object v0
        """,
    )
    mutableClass.methods.add(method)
    return ImmutableMethodReference(mutableClass.type, name, parameters, factory.returnType)
}
