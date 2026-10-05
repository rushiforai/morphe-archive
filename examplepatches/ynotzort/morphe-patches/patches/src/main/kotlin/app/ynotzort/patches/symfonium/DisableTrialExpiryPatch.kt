package app.ynotzort.patches.symfonium

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.ynotzort.patches.shared.Constants.COMPATIBILITY_SYMFONIUM
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// The expired-trial state's toString() embeds the literal "ExpiredTrial(expiredDate=…)".
// Kotlin generates that string from the *source* class name, which R8 does not rename
// (it is not string-encrypted in this app), so it anchors the obfuscated state class
// far more durably than any obfuscated name or analytics string. We match on the
// class-name prefix only, so a change to the field name (expiredDate) does not matter.
private const val EXPIRED_STATE_TOSTRING_PREFIX = "ExpiredTrial"

@Suppress("unused")
val disableTrialExpiryPatch = bytecodePatch(
    name = "Disable Symfonium trial expiry",
    description = "Neutralises the expired-trial block screen. The welcome screen gates entry " +
        "with a single `state instanceof ExpiredTrial` check; this forces that check to false, " +
        "so the app proceeds on every launch (online, offline, or with a server-expired trial). " +
        "The server handshake, billing/licence machinery and the offline fail-open path are left " +
        "untouched. Validated on 15.0.1 (versionCode 127798).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SYMFONIUM)

    execute {
        // 1. The expired-trial state class: the one whose bytecode embeds a string
        //    starting with "ExpiredTrial" (its compiler-generated toString). Direct,
        //    single-hop, and independent of every obfuscated name.
        val expiredState = classDefBy { cd ->
            cd.methods.any { method ->
                method.instructionsOrNull?.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string?.startsWith(EXPIRED_STATE_TOSTRING_PREFIX) == true
                } == true
            }
        }.type

        // 2. The gate(s). The expired state is `instance-of`-checked in exactly two
        //    kinds of place: its own generated equals(), and the welcome screen that
        //    keeps the block screen up for it. Force every check *outside the state
        //    class itself* to a constant 0, so "is the trial expired?" is never true
        //    and the app always enters. Forcing the test to false is correct whatever
        //    the branch polarity. The instance-of destination register is already
        //    allocated (format 22c, dest <= v15), so no extra register is needed.
        var patched = 0
        classDefForEach { cd ->
            if (cd.type == expiredState) return@classDefForEach // leave the state's own equals() intact
            cd.methods.forEach { method ->
                method.instructionsOrNull?.forEachIndexed { index, insn ->
                    val isExpiredCheck = insn.opcode == Opcode.INSTANCE_OF &&
                        ((insn as? ReferenceInstruction)?.reference as? TypeReference)?.type == expiredState
                    if (isExpiredCheck) {
                        val dest = (insn as OneRegisterInstruction).registerA
                        mutableClassDefBy(cd.type).methods
                            .first { it.name == method.name && it.parameterTypes == method.parameterTypes }
                            .replaceInstruction(index, "const/4 v$dest, 0x0")
                        patched++
                    }
                }
            }
        }

        if (patched == 0) {
            throw PatchException(
                "No `instance-of <expired trial state>` gate found — the trial UI logic " +
                    "likely changed in this build.",
            )
        }
    }
}
