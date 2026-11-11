package app.zeldrisho.patches.zalo.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO

/**
 * Requires exact pinned literal counts; fail closed when app strings drift.
 *
 * @throws IllegalStateException if any expected literal is missing, has a different count,
 * or an unexpected literal is present.
 */
internal fun validateProviderUriReplacementCounts(replacementCounts: Map<String, Int>, expected: Map<String, Int>) {
    check(replacementCounts == expected) {
        "Zalo package rename: expected clone identity string counts $expected, found $replacementCounts"
    }
}

/**
 * Rewrites exact non-jumbo Zalo package-name constants to [packageName], preserving registers.
 *
 * Returns the number of replacements, or zero when [method] has no implementation or matching constants.
 */
internal fun rewriteMainProcessPackageName(method: MutableMethod, packageName: String): Int {
    var replacements = 0
    val instructions = method.implementation?.instructions?.toList().orEmpty()
    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.CONST_STRING) return@forEachIndexed
        val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
            ?: return@forEachIndexed
        if (reference.string != ORIGINAL_ZALO_PACKAGE) return@forEachIndexed
        val register = (instruction as OneRegisterInstruction).registerA
        method.replaceInstruction(index, "const-string v$register, \"$packageName\"")
        replacements++
    }
    return replacements
}

/**
 * Rewrites known non-jumbo provider/resource identity constants to [packageName], preserving registers.
 *
 * Returns a count for every expected literal, including zeros for absent references or a missing body.
 */
internal fun rewriteProviderUriStrings(method: MutableMethod, packageName: String, expected: Map<String, Int>): Map<String, Int> {
    val replacements = expected.keys.associateWith { 0 }.toMutableMap()
    val instructions = method.implementation?.instructions?.toList().orEmpty()
    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.CONST_STRING) return@forEachIndexed
        val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
            ?: return@forEachIndexed
        if (reference.string !in expected) return@forEachIndexed
        val register = (instruction as OneRegisterInstruction).registerA
        val replacement = rewriteZaloProviderUri(reference.string, packageName)
        method.replaceInstruction(index, "const-string v$register, \"$replacement\"")
        replacements[reference.string] = replacements.getValue(reference.string) + 1
    }
    return replacements
}

private val packageNameOption = stringOption(
    key = "packageName",
    default = "$ORIGINAL_ZALO_PACKAGE.morphe",
    title = "Package name",
    description = "The new application package name (for example com.zing.zalo.morphe).",
    required = true,
) { isValidZaloPackageName(it) }

private val changeZaloPackageNameResourcesPatch = resourcePatch(
    name = "Change Zalo package name resources",
    description = "Allows a renamed clone alongside Zalo. Login, push, sharing and deep links " +
        "may be affected.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    val packageName by packageNameOption()

    finalize {
        document("AndroidManifest.xml").use { document ->
            rewriteZaloPackage(document, packageName!!)
        }
    }
}

@Suppress("unused")
val changeZaloPackageNamePatch = bytecodePatch(
    name = "Change Zalo package name",
    description = "Allows a renamed clone alongside Zalo. Login, push, sharing and deep links " +
        "may be affected.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO)
    dependsOn(changeZaloPackageNameResourcesPatch)

    val packageName by packageNameOption()

    execute {
        val expected = expectedCloneStringCounts(packageMetadata.versionName)
        val replacementCounts = expected.keys.associateWith { 0 }.toMutableMap()
        var mainProcessNameReplacements = 0
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions ?: return@forEach
                instructions.forEach instructionLoop@ { instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING) return@instructionLoop
                    val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                        ?: return@instructionLoop
                    if (value in expected) replacementCounts[value] = replacementCounts.getValue(value) + 1
                    if (classDef.type == "Lcom/zing/zalo/MainApplication;" && method.name == "onCreate" &&
                        method.parameterTypes.isEmpty() && method.returnType == "V" && value == ORIGINAL_ZALO_PACKAGE
                    ) mainProcessNameReplacements++
                }
            }
        }
        validateProviderUriReplacementCounts(replacementCounts, expected)
        check(mainProcessNameReplacements == 1) {
            "Zalo package rename: expected one MainApplication process-name guard, found $mainProcessNameReplacements"
        }

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            if (classDef.type == "Lcom/zing/zalo/MainApplication;") {
                val onCreate = classDef.methods.single {
                    it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V"
                }
                val mutableOnCreate = mutableClass.methods.first {
                    it.name == onCreate.name && it.parameterTypes == onCreate.parameterTypes && it.returnType == onCreate.returnType
                }
                rewriteMainProcessPackageName(mutableOnCreate, packageName!!)
            }
            classDef.methods.forEach { method ->
                if (method.implementation == null) return@forEach
                val mutableMethod = mutableClass.methods.first { candidate ->
                    candidate.name == method.name &&
                        candidate.parameterTypes == method.parameterTypes &&
                        candidate.returnType == method.returnType
                }
                rewriteProviderUriStrings(mutableMethod, packageName!!, expected)
            }
        }

    }
}
