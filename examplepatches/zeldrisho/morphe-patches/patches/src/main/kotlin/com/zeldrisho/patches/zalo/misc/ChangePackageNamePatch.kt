package com.zeldrisho.patches.zalo.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

private val PROVIDER_URIS = setOf(
    "content://$ORIGINAL_ZALO_PACKAGE.db.preferencesprovider",
    "content://$ORIGINAL_ZALO_PACKAGE.provider.InternalProvider",
)

private val packageNameOption = stringOption(
    key = "packageName",
    default = "$ORIGINAL_ZALO_PACKAGE.morphe",
    title = "Package name",
    description = "The new application package name (for example com.zing.zalo.morphe).",
    required = true,
) { isValidZaloPackageName(it) }

private val changeZaloPackageNameResourcesPatch = resourcePatch(
    name = "Change Zalo package name resources",
    description = "Changes Zalo's package name so a clone can be installed beside stock Zalo. " +
        "WARNING: package- and certificate-bound login, push, sharing, deep links, and backup " +
        "may not work with the renamed application.",
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
    description = "Changes Zalo's package name so a clone can be installed beside stock Zalo, " +
        "including package-owned provider references used after login. " +
        "WARNING: package- and certificate-bound login, push, sharing, deep links, and backup " +
        "may not work with the renamed application.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO)
    dependsOn(changeZaloPackageNameResourcesPatch)

    val packageName by packageNameOption()

    execute {
        val replacementCounts = PROVIDER_URIS.associateWith { 0 }.toMutableMap()

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            classDef.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                val mutableMethod = mutableClass.methods.first { candidate ->
                    candidate.name == method.name &&
                        candidate.parameterTypes == method.parameterTypes &&
                        candidate.returnType == method.returnType
                }
                implementation.instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING) return@forEachIndexed
                    val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
                        ?: return@forEachIndexed
                    if (reference.string !in PROVIDER_URIS) return@forEachIndexed
                    val register = (instruction as OneRegisterInstruction).registerA
                    val replacement = rewriteZaloProviderUri(reference.string, packageName!!)
                    mutableMethod.replaceInstruction(index, "const-string v$register, \"$replacement\"")
                    replacementCounts[reference.string] =
                        replacementCounts.getValue(reference.string) + 1
                }
            }
        }

        check(replacementCounts.values.all { it == 1 }) {
            "Zalo package rename: expected one reference per provider URI, found $replacementCounts"
        }
    }
}
