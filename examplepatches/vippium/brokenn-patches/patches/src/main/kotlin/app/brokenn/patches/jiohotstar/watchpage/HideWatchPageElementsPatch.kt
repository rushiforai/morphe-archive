package app.brokenn.patches.jiohotstar.watchpage

import app.brokenn.patches.jiohotstar.settings.openBrokennSettingsPatch
import app.brokenn.patches.jiohotstar.shared.Constants
import app.brokenn.patches.jiohotstar.shared.Constants.BFF_PILL_SUB_MENU_ITEM
import app.brokenn.patches.jiohotstar.shared.Constants.BFF_PILL_WIDGET
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import app.brokenn.patches.jiohotstar.shared.Constants.ILLUSTRATION
import app.brokenn.patches.jiohotstar.shared.Constants.ILLUSTRATION_PILL_SEGMENT
import app.brokenn.patches.jiohotstar.shared.Constants.LOTTIE
import app.brokenn.patches.jiohotstar.shared.Constants.TAB_WIDGET
import app.brokenn.patches.jiohotstar.shared.Constants.TAB_WIDGET_DATA
import app.brokenn.patches.jiohotstar.shared.Constants.TAB_WIDGET_URL
import app.brokenn.patches.jiohotstar.shared.enableStatus
import app.brokenn.patches.shared.instrs
import app.brokenn.patches.shared.prevInstructionIndex
import app.brokenn.patches.shared.referenceText
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val hideWatchPageElementsPatch = bytecodePatch(
    name = "Hide watch page elements",
    description = "Hides selected tabs and sponsored elements from the watch page."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    dependsOn(openBrokennSettingsPatch)

    execute {
        enableStatus("hideWatchPageElements")

        // Tab visibility is controlled at runtime by BrokennPrefs, without re-patching.
        // Brand tabs use the ad_identifier=*BrandTab marker; content tabs use title-based filtering.
        val tabContainer = AdaptiveTabConverterFingerprint.method
        val tabImpl = tabContainer.instrs()
        val castIdx = tabImpl.indexOfFirst { ins ->
            ins.opcode == Opcode.CHECK_CAST &&
                ins.referenceText()?.contains(TAB_WIDGET) == true
        }
        require(castIdx > 0) { "TabConverter: TabWidget cast not found" }
        val tabReg = tabContainer.getInstruction<OneRegisterInstruction>(castIdx).registerA
        require(tabReg == 1) { "TabConverter: unexpected tab register v$tabReg" }
        val tabHead = tabContainer.prevInstructionIndex(castIdx) { ins ->
            ins.opcode == Opcode.INVOKE_INTERFACE &&
                ins.referenceText()?.contains("Iterator;->hasNext") == true
        }
        require(tabHead >= 0) { "TabConverter: loop head not found" }

        val block = buildString {
            // v4/v5 are the loop's scratch registers, reused for the title below.
            append("invoke-static {}, ${Constants.BROKENN_PREFS_CLASS}->hideBrandTabs()Z\n")
            append("move-result v5\n")
            append("if-eqz v5, :tab_titles\n")
            append("invoke-virtual {v1}, ${TAB_WIDGET}->getData()${TAB_WIDGET_DATA}\n")
            append("move-result-object v4\n")
            append("invoke-virtual {v4}, ${TAB_WIDGET_DATA}->getUrl()${TAB_WIDGET_URL}\n")
            append("move-result-object v4\n")
            append("if-eqz v4, :tab_titles\n")
            append("invoke-virtual {v4}, ${TAB_WIDGET_URL}->getSpaceUrl()Ljava/lang/String;\n")
            append("move-result-object v4\n")
            append("const-string v5, \"BrandTab\"\n")
            append("invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z\n")
            append("move-result v5\n")
            append("if-eqz v5, :tab_titles\n")
            append("goto/16 :tab_skip\n")
            append(":tab_titles\n")
            append("invoke-virtual {v1}, ${TAB_WIDGET}->getData()${TAB_WIDGET_DATA}\n")
            append("move-result-object v4\n")
            append("invoke-virtual {v4}, ${TAB_WIDGET_DATA}->getTitle()Ljava/lang/String;\n")
            append("move-result-object v4\n")
            append(Constants.prefsStringCall("isTabHidden", "4", "5"))
            append("if-eqz v5, :tab_keep\n")
            append("goto/16 :tab_skip\n")
            // nop anchors the trailing label; a block-final label would resolve to the external target.
            append(":tab_keep\n")
            append("nop\n")
        }
        tabContainer.addInstructionsWithLabels(
            castIdx + 1,
            block,
            ExternalLabel("tab_skip", tabImpl[tabHead])
        )

        // Pills: converter drops swiggy/instamart segments at the source; the parser skips empty pills.
        // Uses the loop's own scratch registers — addFreeRegisters + labeled insertion loses the block.
        run {
            val conv = PillConverterFingerprint.method

            val convImpl = conv.instrs()
            val hasIllIdx = convImpl.indexOfFirst { ins ->
                ins.opcode == Opcode.INVOKE_VIRTUAL &&
                    ins.referenceText()?.contains("Segment;->hasIllustration") == true
            }
            require(hasIllIdx > 0) { "PillConverter: segment loop not found" }
            val segReg = conv.getInstruction<FiveRegisterInstruction>(hasIllIdx).registerC
            require(segReg == 3) { "PillConverter: unexpected segment register v$segReg" }
            val head = conv.prevInstructionIndex(hasIllIdx) { ins ->
                ins.opcode == Opcode.INVOKE_INTERFACE &&
                    ins.referenceText()?.contains("Iterator;->hasNext") == true
            }
            require(head >= 0) { "PillConverter: loop head not found" }

            val pillBlock = buildString {
                append("invoke-static {}, ${Constants.BROKENN_PREFS_CLASS}->hideSponsoredPills()Z\n")
                append("move-result v6\n")
                append("if-eqz v6, :sw_ok\n")
                append("invoke-virtual {v3}, ${ILLUSTRATION_PILL_SEGMENT}->getIllustration()${ILLUSTRATION}\n")
                append("move-result-object v5\n")
                append("invoke-virtual {v5}, ${ILLUSTRATION}->getLottie()${LOTTIE}\n")
                append("move-result-object v5\n")
                append("invoke-virtual {v5}, ${LOTTIE}->getName()Ljava/lang/String;\n")
                append("move-result-object v5\n")
                append("const-string v6, \"swiggy\"\n")
                append("invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z\n")
                append("move-result v6\n")
                append("if-eqz v6, :sw2\n")
                append("const/4 v4, 0x0\n")
                append("goto/16 :sw_skip\n")
                append(":sw2\n")
                append("const-string v6, \"instamart\"\n")
                append("invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z\n")
                append("move-result v6\n")
                append("if-eqz v6, :sw_ok\n")
                append("const/4 v4, 0x0\n")
                append("goto/16 :sw_skip\n")
                // nop anchors the trailing label; a block-final label would resolve to the external target.
                append(":sw_ok\n")
                append("nop\n")
            }
            conv.addInstructionsWithLabels(
                hasIllIdx,
                pillBlock,
                ExternalLabel("sw_skip", convImpl[head])
            )

            val parser = SubNavParserFingerprint.method
            val parserImpl = parser.instrs()
            val convIdx = parserImpl.indexOfFirst { ins ->
                ins.opcode == Opcode.INVOKE_STATIC &&
                    ins.referenceText()?.contains("(Lcom/hotstar/ui/model/widget/IllustrationPillWidget;)Lcom/hotstar/bff/models/widget/BffIllustrationPillWidget;") == true
            }
            require(convIdx > 0) { "SubNavParser: pill converter call not found" }
            val pillReg = parser.getInstruction<OneRegisterInstruction>(convIdx + 1).registerA
            val wrapperReg = (0 until convIdx).last { i ->
                parserImpl[i].opcode == Opcode.NEW_INSTANCE &&
                    parserImpl[i].referenceText()?.contains("BffIllustrationPillSubMenuItem") == true
            }.let { parser.getInstruction<OneRegisterInstruction>(it).registerA }
            val head2 = parser.prevInstructionIndex(convIdx) { ins ->
                ins.opcode == Opcode.INVOKE_INTERFACE &&
                    ins.referenceText()?.contains("Iterator;->hasNext") == true
            }
            require(head2 >= 0) { "SubNavParser: loop head not found" }

            // Reuses the wrapper register as scratch, ensuring verifier-safe initialization.
            parser.addInstructionsWithLabels(
                convIdx + 2,
                """
                iget-object v$wrapperReg, v$pillReg, ${BFF_PILL_WIDGET}->d:Ljava/util/ArrayList;
                invoke-virtual {v$wrapperReg}, Ljava/util/ArrayList;->isEmpty()Z
                move-result v$wrapperReg
                if-nez v$wrapperReg, :sw_keep
                const/4 v$wrapperReg, 0x0
                goto/16 :sw_loop_head
                :sw_keep
                new-instance v$wrapperReg, $BFF_PILL_SUB_MENU_ITEM
                """.trimIndent(),
                ExternalLabel("sw_loop_head", parserImpl[head2])
            )
        }
    }
}
