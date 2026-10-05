package app.ynotzort.patches.symfonium

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.ynotzort.patches.shared.Constants.COMPATIBILITY_SYMFONIUM
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// The "beta build expired" screen is a navigation destination whose class is constructed
// with the plain name string "ExpiredBeta" (not R8-renamed, like "ExpiredTrial" for the
// trial). The navigation resolver redirects ANY requested screen to it when
// `licenseState != 0` AND a 1-in-10 random roll hits — an intermittent "this beta version
// has expired, update the app" nag. We anchor on the name string and defuse the redirect.
private const val BETA_STATE_NAME_PREFIX = "ExpiredBeta"

@Suppress("unused")
val disableBetaExpiryPatch = bytecodePatch(
    name = "Disable Symfonium beta expiry",
    description = "Stops the intermittent \"this beta version has expired\" screen. The navigation " +
        "resolver randomly (≈10% of screen changes, when in a particular licence state) hijacks " +
        "navigation to the ExpiredBeta destination; this forces the guard that enables that " +
        "redirect to fail, so navigation always goes to the requested screen. Nothing else " +
        "(licence state, the random source) is modified. Validated on 15.0.1 (versionCode 127798).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SYMFONIUM)

    execute {
        // 1. The ExpiredBeta destination class, anchored on its "ExpiredBeta" name string.
        val betaState = classDefBy { cd ->
            cd.methods.any { method ->
                method.instructionsOrNull?.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string?.startsWith(BETA_STATE_NAME_PREFIX) == true
                } == true
            }
        }.type

        // 2. The gate: the method that reads the ExpiredBeta singleton (an sget of a field
        //    declared in betaState) to redirect navigation to it. The redirect is guarded by
        //    `licenseState != 0`, where licenseState is the result of the first int-returning
        //    call in the method (`j14.f()`), tested by an if-eqz. Null that result so the
        //    guard always fails and the redirect branch is dead. The underlying call still
        //    runs; only the value feeding this one decision is discarded. The 10% random roll
        //    is thereby mooted, so the screen never appears.
        var patched = 0
        classDefForEach { cd ->
            if (cd.type == betaState) return@classDefForEach
            cd.methods.forEach { method ->
                val insns = method.instructionsOrNull?.toList() ?: return@forEach

                val readsBetaSingleton = insns.any { insn ->
                    insn.opcode == Opcode.SGET_OBJECT &&
                        ((insn as? ReferenceInstruction)?.reference as? FieldReference)
                            ?.definingClass == betaState
                }
                if (!readsBetaSingleton) return@forEach

                // First `invoke …()I` immediately followed by a move-result = the guard value.
                val invokeIndex = (0 until insns.size - 1).firstOrNull { i ->
                    val invoke = insns[i]
                    invoke is ReferenceInstruction &&
                        (invoke.reference as? MethodReference)?.returnType == "I" &&
                        insns[i + 1].opcode == Opcode.MOVE_RESULT
                } ?: throw PatchException(
                    "ExpiredBeta redirect found but its guard call was not — logic changed.",
                )

                val dest = (insns[invokeIndex + 1] as OneRegisterInstruction).registerA
                mutableClassDefBy(cd.type).methods
                    .first { it.name == method.name && it.parameterTypes == method.parameterTypes }
                    .replaceInstruction(invokeIndex + 1, "const/16 v$dest, 0x0")
                patched++
            }
        }

        if (patched == 0) {
            throw PatchException(
                "No ExpiredBeta redirect gate found — the beta-expiry logic likely changed.",
            )
        }
    }
}
