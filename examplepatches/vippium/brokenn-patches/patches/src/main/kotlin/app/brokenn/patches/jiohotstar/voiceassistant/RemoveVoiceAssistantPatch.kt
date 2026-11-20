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
import app.brokenn.patches.jiohotstar.shared.Constants.ILLUSTRATION
import app.brokenn.patches.jiohotstar.shared.Constants.ILLUSTRATION_PILL_DATA
import app.brokenn.patches.jiohotstar.shared.Constants.ILLUSTRATION_PILL_SEGMENT
import app.brokenn.patches.jiohotstar.shared.Constants.ILLUSTRATION_PILL_WIDGET
import app.brokenn.patches.jiohotstar.shared.Constants.LOTTIE
import app.brokenn.patches.shared.instrs
import app.brokenn.patches.shared.instructionIndices
import app.brokenn.patches.shared.referenceText


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

        // CVD orb in page protos: false makes mappers drop it.
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
            val unboxIndex = method.instrs().indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    it.referenceText()?.contains("booleanValue") == true
            }
            val reg = method.getInstruction<OneRegisterInstruction>(unboxIndex + 1).registerA
            val zero = if (reg <= 15) "const/4 v$reg, 0x0" else "const/16 v$reg, 0x0"
            method.addInstructions(unboxIndex + 2, zero)
        }

        // Unknown-widget cut: rename the CVD wire names so the parser skips them.
        val typeMethod = CvdWidgetTypeFingerprint.method
        val typeImpl = typeMethod.instrs()
        val wires = setOf("CVDHeroWidget", "CVDControlUnitWidget", "CVDOrbWidget")
        // replaceInstruction is 1:1, so snapshot indices stay valid across the loop.
        typeMethod.instructionIndices { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                (instruction as? ReferenceInstruction)?.reference.let { it is StringReference && it.string in wires }
        }.forEach { index ->
            val wire = (typeImpl[index] as ReferenceInstruction).reference as StringReference
            val reg = typeMethod.getInstruction<OneRegisterInstruction>(index).registerA
            typeMethod.replaceInstruction(index, "const-string v$reg, \"${wire.string}Removed\"")
        }

        // Watch Ask pill: skip illustration pills whose lottie is the CVD ask; parser null-guards the result.
        runCatching {
            val parser = CvdSubNavParserFingerprint.method
            val impl = parser.instrs()
            val anchorIdx = CvdSubNavParserFingerprint.instructionMatches[1].index
            val pillReg = parser.getInstruction<OneRegisterInstruction>(anchorIdx - 1).registerA
            val b3Idx = (anchorIdx until impl.size).first { i ->
                impl[i].opcode == Opcode.INVOKE_STATIC &&
                    impl[i].referenceText()?.contains("LBd/b3;->a(") == true
            }
            // Main list-add is the only one followed by a 16-bit goto (loop back-edge).
            val skipIdx = impl.indices.firstOrNull { i ->
                i > anchorIdx && i + 1 < impl.size &&
                    impl[i].opcode == Opcode.INVOKE_VIRTUAL &&
                    impl[i].referenceText()?.contains("ArrayList;->add") == true &&
                    impl[i + 1].opcode == Opcode.GOTO_16
            }?.let { it + 1 } ?: error("CvdSubNavParser: main list-add not found")

            val itReg = parser.findFreeRegister(b3Idx)
            val tmpReg = parser.findFreeRegister(b3Idx, itReg)
            val strReg = parser.findFreeRegister(b3Idx, itReg, tmpReg)

            val block = """
                invoke-virtual {v$pillReg}, ${ILLUSTRATION_PILL_WIDGET}->getData()${ILLUSTRATION_PILL_DATA}
                move-result-object v$itReg
                invoke-virtual {v$itReg}, ${ILLUSTRATION_PILL_DATA}->getSegmentsList()Ljava/util/List;
                move-result-object v$itReg
                invoke-interface {v$itReg}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v$itReg
                :seg_loop
                invoke-interface {v$itReg}, Ljava/util/Iterator;->hasNext()Z
                move-result v$tmpReg
                if-eqz v$tmpReg, :not_ask
                invoke-interface {v$itReg}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v$tmpReg
                check-cast v$tmpReg, $ILLUSTRATION_PILL_SEGMENT
                invoke-virtual {v$tmpReg}, ${ILLUSTRATION_PILL_SEGMENT}->getIllustration()${ILLUSTRATION}
                move-result-object v$tmpReg
                invoke-virtual {v$tmpReg}, ${ILLUSTRATION}->getLottie()${LOTTIE}
                move-result-object v$tmpReg
                invoke-virtual {v$tmpReg}, ${LOTTIE}->getName()Ljava/lang/String;
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
                ExternalLabel("skip_ask", impl[skipIdx])
            )
        }

        // Nulls the tray converter result when its first item is a TopicsPill chip; the parser null-guards.
        val tray = HomeSuggestionTrayFingerprint.method
        val trayImpl = tray.instrs()
        val listIdx = trayImpl.indexOfFirst { ins ->
            ins.opcode == Opcode.INVOKE_VIRTUAL &&
                ins.referenceText()?.contains("StaggeredTrayWidget${'$'}Data;->getItemsList") == true
        }
        require(listIdx > 0) { "SuggestionTray: getItemsList not found" }
        val keepInsn = trayImpl[listIdx + 2]

        tray.addInstructionsWithLabels(
            listIdx + 2,
            """
            invoke-interface {v2}, Ljava/util/List;->isEmpty()Z
            move-result v3
            if-nez v3, :keep_tray
            const/4 v3, 0x0
            invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;
            move-result-object v3
            check-cast v3, Lcom/hotstar/ui/model/widget/StaggeredTrayWidget${'$'}Item;
            invoke-virtual {v3}, Lcom/hotstar/ui/model/widget/StaggeredTrayWidget${'$'}Item;->hasTopicsPill()Z
            move-result v3
            if-eqz v3, :keep_tray
            const/4 v0, 0x0
            return-object v0
            """.trimIndent(),
            ExternalLabel("keep_tray", keepInsn)
        )

    }
}
