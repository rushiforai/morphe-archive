package io.github.yannsoliman.patches.keepcool

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

internal const val ORIGINAL_REGEX = """^(([\w-]+\.)+[\w-]+|([a-zA-Z]|[\w-]{2,}))@((([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9]))|([a-zA-Z]+[\w-]+\.)+[a-zA-Z]{2,4})$"""

// Modify only the local part. Domain validation and all original quantifiers stay intact.
internal val PLUS_REGEX = ORIGINAL_REGEX.substringBefore('@')
    .replace("[\\w-]", "[\\w+\\-]") + "@" + ORIGINAL_REGEX.substringAfter('@')

@Suppress("unused")
val keepcoolPlusEmailPatch = bytecodePatch(
    name = "Keepcool: allow plus in email",
    description = "Allow + in the local email part without changing the input or login request. Keepcool 1.8.21 only."
) {
    compatibleWith(KEEPCOOL_COMPATIBILITY)
    execute {
        // Fail closed on zero OR multiple matches; never trust an obfuscated name.
        val match = KeepcoolEmailFingerprint.matchAll(1..1).single()
        val literal = match.instructionMatches.first()
        val register = (literal.instruction as OneRegisterInstruction).registerA
        val reference = ImmutableStringReference(PLUS_REGEX)
        val replacement = when (literal.instruction.opcode) {
            Opcode.CONST_STRING -> BuilderInstruction21c(Opcode.CONST_STRING, register, reference)
            Opcode.CONST_STRING_JUMBO -> BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, reference)
            else -> error("Unexpected email regex instruction")
        }
        match.method.replaceInstruction(literal.index, replacement)
    }
}
