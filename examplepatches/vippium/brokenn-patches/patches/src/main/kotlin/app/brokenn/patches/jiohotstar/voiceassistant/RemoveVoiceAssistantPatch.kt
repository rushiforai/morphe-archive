package app.brokenn.patches.jiohotstar.voiceassistant

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.findFreeRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val removeVoiceAssistantPatch = bytecodePatch(
    name = "Remove ChatGPT Voice Assistant",
    description = "Strips out the integrated ChatGPT voice assistant module entirely."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        // Search-bar mic: force the server-driven voice-search gate off.
        VoiceSearchEnabledFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // CVD orb in page protos: false makes mappers drop it (watch Ask pill, search-bar mic state).
        for (fingerprint in listOf(
            WatchPageCvdOrbFingerprint,
            ExplorePageCvdOrbFingerprint,
            LandingPageCvdOrbFingerprint,
            LandingV2PageCvdOrbFingerprint
        )) {
            fingerprint.method.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)
        }

        // Fallback mic branch: collapse both equaliser-config readers to disabled (suspension-safe insert).
        val equaliserMethods = listOf(
            CvdEqualiserEventFingerprint.method,
            CvdEqualiserFlowFingerprint.method
        )
        for (method in equaliserMethods) {
            val unboxIndex = method.implementation!!.instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains("booleanValue") == true
            }
            val reg = method.getInstruction<OneRegisterInstruction>(unboxIndex + 1).registerA
            val zero = if (reg <= 15) "const/4 v$reg, 0x0" else "const/16 v$reg, 0x0"
            method.addInstructions(unboxIndex + 2, zero)
        }

        // Unknown-widget cut: rename the CVD wire names so the parser skips them.
        val typeMethod = CvdWidgetTypeFingerprint.method
        val wires = setOf("CVDHeroWidget", "CVDControlUnitWidget", "CVDOrbWidget")
        for ((index, instruction) in typeMethod.implementation!!.instructions.withIndex()) {
            val reference = (instruction as? ReferenceInstruction)?.reference
            if (instruction.opcode == Opcode.CONST_STRING && reference is StringReference) {
                val wire = reference.string
                if (wire in wires) {
                    val reg = typeMethod.getInstruction<OneRegisterInstruction>(index).registerA
                    typeMethod.replaceInstruction(index, "const-string v$reg, \"${wire}Removed\"")
                }
            }
        }

        // Watch Ask pill: skip illustration pills whose lottie is the CVD ask; parser null-guards the result.
        runCatching {
            val parser = CvdSubNavParserFingerprint.method
            val instrs = parser.implementation!!.instructions
            val anchorIdx = CvdSubNavParserFingerprint.instructionMatches[1].index
            val pillReg = parser.getInstruction<OneRegisterInstruction>(anchorIdx - 1).registerA
            val b3Idx = (anchorIdx until instrs.size).first { i ->
                instrs[i].opcode == Opcode.INVOKE_STATIC &&
                    (instrs[i] as? ReferenceInstruction)?.reference.toString().contains("LBd/b3;->a(")
            }
            // Main list-add is the only one followed by a 16-bit goto (loop back-edge).
            val skipIdx = instrs.indices.firstOrNull { i ->
                i > anchorIdx && i + 1 < instrs.size &&
                    instrs[i].opcode == Opcode.INVOKE_VIRTUAL &&
                    (instrs[i] as? ReferenceInstruction)?.reference.toString().contains("ArrayList;->add") &&
                    instrs[i + 1].opcode == Opcode.GOTO_16
            }?.let { it + 1 } ?: error("CvdSubNavParser: main list-add not found")

            val itReg = parser.findFreeRegister(b3Idx)
            val tmpReg = parser.findFreeRegister(b3Idx, itReg)
            val strReg = parser.findFreeRegister(b3Idx, itReg, tmpReg)

            val block = """
                invoke-virtual {v$pillReg}, Lcom/hotstar/ui/model/widget/IllustrationPillWidget;->getData()Lcom/hotstar/ui/model/widget/IllustrationPillWidget${'$'}Data;
                move-result-object v$itReg
                invoke-virtual {v$itReg}, Lcom/hotstar/ui/model/widget/IllustrationPillWidget${'$'}Data;->getSegmentsList()Ljava/util/List;
                move-result-object v$itReg
                invoke-interface {v$itReg}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v$itReg
                :seg_loop
                invoke-interface {v$itReg}, Ljava/util/Iterator;->hasNext()Z
                move-result v$tmpReg
                if-eqz v$tmpReg, :not_ask
                invoke-interface {v$itReg}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v$tmpReg
                check-cast v$tmpReg, Lcom/hotstar/ui/model/widget/IllustrationPillWidget${'$'}Segment;
                invoke-virtual {v$tmpReg}, Lcom/hotstar/ui/model/widget/IllustrationPillWidget${'$'}Segment;->getIllustration()Lcom/hotstar/ui/model/feature/image/Illustration;
                move-result-object v$tmpReg
                invoke-virtual {v$tmpReg}, Lcom/hotstar/ui/model/feature/image/Illustration;->getLottie()Lcom/hotstar/ui/model/feature/image/Lottie;
                move-result-object v$tmpReg
                invoke-virtual {v$tmpReg}, Lcom/hotstar/ui/model/feature/image/Lottie;->getName()Ljava/lang/String;
                move-result-object v$tmpReg
                const-string v$strReg, "cvd_ask"
                invoke-virtual {v$tmpReg, v$strReg}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v$tmpReg
                if-eqz v$tmpReg, :seg_loop
                const/4 v4, 0x0
                goto/16 :skip_ask
                :not_ask
            """
            parser.addInstructionsWithLabels(
                b3Idx,
                block,
                ExternalLabel("skip_ask", instrs[skipIdx])
            )
        }
    }
}
