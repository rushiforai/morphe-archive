package app.brokenn.patches.jiohotstar.feed

import app.brokenn.patches.jiohotstar.settings.openBrokennSettingsPatch
import app.brokenn.patches.jiohotstar.shared.Constants
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import app.brokenn.patches.jiohotstar.shared.enableStatus
import app.brokenn.patches.shared.instructionIndices
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal object TraySpaceAssemblerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lzd/K;",
    parameters = listOf("Lcom/hotstar/bff/api/v2/Space;"),
)

@Suppress("unused")
val feedFilterPatch = bytecodePatch(
    name = "Feed filter",
    description = "Removes selected home feed trays by title, configured in Brokenn settings",
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    dependsOn(openBrokennSettingsPatch)

    execute {
        enableStatus("feedFilter")

        val trayAssembler = TraySpaceAssemblerFingerprint.method
        val trayInstanceofIndex = trayAssembler.instructionIndices { instr ->
            instr.opcode == Opcode.INSTANCE_OF && run {
                val ref = (instr as? ReferenceInstruction)?.reference as? TypeReference
                ref?.type == "LBd/O8;"
            }
        }.firstOrNull() ?: throw IllegalStateException(
            "Feed filter: tray widget instanceof not found (shape changed?)"
        )
        val trayCastIndex = trayAssembler.instructionIndices { instr ->
            instr.opcode == Opcode.CHECK_CAST
        }.filter { it < trayInstanceofIndex }.maxOrNull() ?: throw IllegalStateException(
            "Feed filter: widget list check-cast not found (shape changed?)"
        )
        val trayReg = trayAssembler.getInstruction<OneRegisterInstruction>(trayCastIndex).registerA
        trayAssembler.addInstructions(
            trayCastIndex + 1,
            "invoke-static {v$trayReg}, ${Constants.BROKENN_PREFS_CLASS}" +
                "->filterShelfList(Ljava/util/List;)Ljava/util/List;\n" +
                "move-result-object v$trayReg",
        )
    }
}
