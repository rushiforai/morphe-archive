package app.template.patches.bitwarden

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val STRING = "Ljava/lang/String;"

/** toString() of a ValidateOriginResult.Error data object; R8 renames the classes but keeps these strings. */
private class OriginErrorToStringFingerprint(name: String) : Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf(name),
)

/**
 * CallingAppInfo.validatePrivilegedApp(relyingPartyId, allowList, isVerifiedSource): checks
 * allowList.contains("\"$packageName\"") and catches IllegalStateException (no matching signature)
 * and IllegalArgumentException (malformed allow list) from CallingAppInfo.getOrigin(allowList).
 */
internal object ValidatePrivilegedAppFingerprint : Fingerprint(
    strings = listOf("\""),
    custom = { method, _ ->
        val handlers = method.implementation?.tryBlocks.orEmpty()
            .flatMap { it.exceptionHandlers }
            .mapNotNull { it.exceptionType }
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.map(CharSequence::toString).takeLast(3) == listOf(STRING, STRING, "Z") &&
            method.parameterTypes.size == 4 &&
            "Ljava/lang/IllegalStateException;" in handlers &&
            "Ljava/lang/IllegalArgumentException;" in handlers
    },
)

/** The singleton field of a ValidateOriginResult.Error data object. */
private fun BytecodePatchContext.originError(name: String): FieldReference {
    val type = OriginErrorToStringFingerprint(name).match().classDef
    return type.staticFields.singleOrNull { it.type == type.type }
        ?: throw PatchException("$name has no singleton instance field")
}

@Suppress("unused")
val trustReSignedBrowsersPatch = bytecodePatch(
    name = "Bitwarden trust re-signed browsers for passkeys",
    description = "Lets you trust Morphe-patched browsers for passkeys instead of failing the signature check.",
    default = true,
) {
    compatibleWith(BITWARDEN_COMPATIBILITY)

    execute {
        val notAllowed = originError("PrivilegedAppNotAllowed")
        val signatureNotFound = originError("PrivilegedAppSignatureNotFound")
        val method = ValidatePrivilegedAppFingerprint.match().method
        val instructions = method.implementation!!.instructions.toList()
        val reads = instructions.indices.filter { index ->
            val field = (instructions[index] as? ReferenceInstruction)?.reference as? FieldReference
            instructions[index].opcode == Opcode.SGET_OBJECT && field?.definingClass == signatureNotFound.definingClass &&
                field.name == signatureNotFound.name
        }
        val index = reads.singleOrNull()
            ?: throw PatchException("Expected one PrivilegedAppSignatureNotFound in $method, found ${reads.size}")

        // A signature mismatch now reads as "not in this allow list", so OriginManager falls through
        // from the Google list to the community and user trusted lists, and the trust prompt (shown
        // only for PrivilegedAppNotAllowed) stores the browser's actual signature.
        val register = (instructions[index] as OneRegisterInstruction).registerA
        method.replaceInstruction(
            index,
            "sget-object v$register, ${notAllowed.definingClass}->${notAllowed.name}:${notAllowed.type}",
        )
    }
}
