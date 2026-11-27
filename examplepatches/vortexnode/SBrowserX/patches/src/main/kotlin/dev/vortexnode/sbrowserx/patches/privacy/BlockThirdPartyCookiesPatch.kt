package dev.vortexnode.sbrowserx.patches.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow

private const val SETTING_PREFERENCE_CLASS =
    "Lcom/sec/android/app/sbrowser/common/device/setting_preference/SettingPreference;"
private const val BROWSER_SETTINGS_CLASS =
    "Lcom/sec/android/app/sbrowser/settings/BrowserSettings;"

@Suppress("unused")
val blockThirdPartyCookiesPatch = bytecodePatch(
    name = "Block third-party cookies by default",
    description = "Blocks third-party cookies by default across all websites, with an option to re-enable them in Settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)

    execute {
        val prefMethod = findMethodOrThrow(
            classType = SETTING_PREFERENCE_CLASS,
            methodName = "isAllowThirdPartyCookiesEnabled",
            parameterTypes = emptyList(),
            returnType = "Z",
        )
        val prefInsns = prefMethod.implementation?.instructions
            ?: error("Missing implementation in isAllowThirdPartyCookiesEnabled")
        val litIdx = prefInsns.indexOfFirst { insn ->
            insn.opcode == Opcode.CONST_4 && (insn as? NarrowLiteralInstruction)?.narrowLiteral == 1
        }
        check(litIdx >= 0) { "Missing default true literal in isAllowThirdPartyCookiesEnabled" }
        val reg = (prefInsns[litIdx] as OneRegisterInstruction).registerA
        prefMethod.replaceInstruction(litIdx, "const/4 v$reg, 0x0")

        val bsClass = mutableClassDefBy(BROWSER_SETTINGS_CLASS)
        for (method in bsClass.methods) {
            val insns = method.implementation?.instructions ?: continue
            for (i in 0 until insns.size - 2) {
                val cur = insns[i]
                if (cur.opcode != Opcode.CONST_STRING && cur.opcode != Opcode.CONST_STRING_JUMBO) continue
                val str = ((cur as? ReferenceInstruction)?.reference as? StringReference)?.string ?: continue
                if (str != "third_party_cookies") continue
                val next = insns[i + 1]
                val mRef = (next as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                if (mRef.name != "getPersistedBoolean") continue
                val move = insns[i + 2]
                if (move.opcode != Opcode.MOVE_RESULT) continue
                val dstReg = (move as OneRegisterInstruction).registerA
                method.addInstructions(
                    i + 3,
                    """
                        invoke-static {}, Lcom/sec/android/app/sbrowser/common/device/setting_preference/SettingPreference;->getInstance()Lcom/sec/android/app/sbrowser/common/device/setting_preference/SettingPreference;
                        move-result-object v$dstReg
                        invoke-virtual {v$dstReg}, Lcom/sec/android/app/sbrowser/common/device/setting_preference/SettingPreference;->isAllowThirdPartyCookiesEnabled()Z
                        move-result v$dstReg
                    """.trimIndent(),
                )
                break
            }
        }
    }
}
