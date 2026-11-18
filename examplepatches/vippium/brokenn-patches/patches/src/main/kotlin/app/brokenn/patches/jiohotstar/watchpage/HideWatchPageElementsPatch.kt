package app.brokenn.patches.jiohotstar.watchpage

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR

@Suppress("unused")
val hideWatchPageElementsPatch = bytecodePatch(
    name = "Hide watch page elements",
    description = "Hides watch page tabs (except Episodes) and the floating sponsored pill."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    val hideForYou by booleanOption(
        key = "hide_for_you", title = "Hide For You tab",
        description = "Removes the For You tab from the watch-page tab strip.", default = false
    )
    val hideJeeto by booleanOption(
        key = "hide_jeeto", title = "Hide Jeeto tab",
        description = "Removes the Jeeto tab from the watch-page tab strip.", default = false
    )
    val hideMemes by booleanOption(
        key = "hide_memes", title = "Hide Memes tab",
        description = "Removes the Memes tab from the watch-page tab strip.", default = false
    )
    val hideLiveChat by booleanOption(
        key = "hide_live_chat", title = "Hide Live Chat tab",
        description = "Removes the Live Chat tab from the watch-page tab strip.", default = false
    )
    val hideBrandTabs by booleanOption(
        key = "hide_brand_tabs", title = "Hide brand tabs",
        description = "Removes sponsored brand tabs (Shop, Order Food, etc.) from the watch-page tab strip.", default = false
    )
    val hideSponsoredPills by booleanOption(
        key = "hide_sponsored_pills", title = "Hide sponsored pills",
        description = "Removes the floatingsponsored pill from the watch-page.", default = false
    )

    execute {
        // Tabs: branded ad tabs ride the ad_identifier=*BrandTab url marker; content
        // tabs go by their title, one comparison per enabled option.
        val hiddenTitles = buildList {
            if (hideForYou == true) add("For You")
            if (hideJeeto == true) add("Jeeto")
            if (hideMemes == true) add("Memes")
            if (hideLiveChat == true) add("Live Chat")
        }
        val brandCut = hideBrandTabs == true

        val tabContainer = AdaptiveTabConverterFingerprint.method
        val tabImpl = tabContainer.implementation!!.instructions
        val castIdx = tabImpl.indexOfFirst { ins ->
            ins.opcode == Opcode.CHECK_CAST &&
                (ins as? ReferenceInstruction)?.reference.toString()
                    .contains("Lcom/hotstar/ui/model/widget/TabWidget;")
        }
        require(castIdx > 0) { "TabConverter: TabWidget cast not found" }
        val tabReg = tabContainer.getInstruction<OneRegisterInstruction>(castIdx).registerA
        require(tabReg == 1) { "TabConverter: unexpected tab register v$tabReg" }
        var tabHead = -1
        for (j in castIdx downTo 0) {
            val ins = tabImpl[j]
            if (ins.opcode == Opcode.INVOKE_INTERFACE &&
                (ins as? ReferenceInstruction)?.reference.toString().contains("Iterator;->hasNext")
            ) { tabHead = j; break }
        }
        require(tabHead >= 0) { "TabConverter: loop head not found" }

        val block = buildString {
            if (brandCut) {
                // v4 = tab data url, v5 = needle/result; v4 is reused for the title below.
                append("invoke-virtual {v1}, Lcom/hotstar/ui/model/widget/TabWidget;->getData()Lcom/hotstar/ui/model/widget/TabWidget${'$'}Data;\n")
                append("move-result-object v4\n")
                append("invoke-virtual {v4}, Lcom/hotstar/ui/model/widget/TabWidget${'$'}Data;->getUrl()Lcom/hotstar/ui/model/widget/TabWidget${'$'}Url;\n")
                append("move-result-object v4\n")
                append("if-eqz v4, :tab_titles\n")
                append("invoke-virtual {v4}, Lcom/hotstar/ui/model/widget/TabWidget${'$'}Url;->getSpaceUrl()Ljava/lang/String;\n")
                append("move-result-object v4\n")
                append("const-string v5, \"BrandTab\"\n")
                append("invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z\n")
                append("move-result v5\n")
                append("if-eqz v5, :tab_titles\n")
                append("goto/16 :tab_skip\n")
            }
            append(":tab_titles\n")
            append("invoke-virtual {v1}, Lcom/hotstar/ui/model/widget/TabWidget;->getData()Lcom/hotstar/ui/model/widget/TabWidget${'$'}Data;\n")
            append("move-result-object v4\n")
            append("invoke-virtual {v4}, Lcom/hotstar/ui/model/widget/TabWidget${'$'}Data;->getTitle()Ljava/lang/String;\n")
            append("move-result-object v4\n")
            hiddenTitles.forEachIndexed { i, title ->
                append("const-string v5, \"$title\"\n")
                append("invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n")
                append("move-result v5\n")
                append("if-eqz v5, :tab_next$i\n")
                append("goto/16 :tab_skip\n")
                append(":tab_next$i\n")
            }
            // nop pins the trailing label to a real instruction; a block-final label
            // otherwise resolves to the external target (every tab gets skipped).
            append(":tab_keep\n")
            append("nop\n")
        }
        tabContainer.addInstructionsWithLabels(
            castIdx + 1,
            block,
            ExternalLabel("tab_skip", tabImpl[tabHead])
        )

        // Pills: the converter drops swiggy/instamart-branded segments at the source, and
        // the row parser skips pills left with no segments. Uses the loop's own scratch
        // regs (v5/v6, rewritten each iteration before use); addFreeRegisters + labeled
        // insertion silently loses the block in the patcher.
        if (hideSponsoredPills == true) {
            val conv = PillConverterFingerprint.method

            val convImpl = conv.implementation!!.instructions
            val hasIllIdx = convImpl.indexOfFirst { ins ->
                ins.opcode == Opcode.INVOKE_VIRTUAL &&
                    (ins as? ReferenceInstruction)?.reference.toString().contains("Segment;->hasIllustration")
            }
            require(hasIllIdx > 0) { "PillConverter: segment loop not found" }
            val segReg = conv.getInstruction<FiveRegisterInstruction>(hasIllIdx).registerC
            require(segReg == 3) { "PillConverter: unexpected segment register v$segReg" }
            var head = -1
            for (j in hasIllIdx downTo 0) {
                val ins = convImpl[j]
                if (ins.opcode == Opcode.INVOKE_INTERFACE &&
                    (ins as? ReferenceInstruction)?.reference.toString().contains("Iterator;->hasNext")
                ) { head = j; break }
            }
            require(head >= 0) { "PillConverter: loop head not found" }

            val pillBlock = buildString {
                append("invoke-virtual {v3}, Lcom/hotstar/ui/model/widget/IllustrationPillWidget" + '$' + "Segment;->getIllustration()Lcom/hotstar/ui/model/feature/image/Illustration;\n")
                append("move-result-object v5\n")
                append("invoke-virtual {v5}, Lcom/hotstar/ui/model/feature/image/Illustration;->getLottie()Lcom/hotstar/ui/model/feature/image/Lottie;\n")
                append("move-result-object v5\n")
                append("invoke-virtual {v5}, Lcom/hotstar/ui/model/feature/image/Lottie;->getName()Ljava/lang/String;\n")
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
                // nop pins the trailing label to a real instruction; a block-final label
                // otherwise resolves to the external target (every segment gets skipped).
                append(":sw_ok\n")
                append("nop\n")
            }
            conv.addInstructionsWithLabels(
                hasIllIdx,
                pillBlock,
                ExternalLabel("sw_skip", convImpl[head])
            )

            val parser = SubNavParserFingerprint.method
            val parserImpl = parser.implementation!!.instructions
            val convIdx = parserImpl.indexOfFirst { ins ->
                ins.opcode == Opcode.INVOKE_STATIC &&
                    (ins as? ReferenceInstruction)?.reference.toString()
                        .contains("(Lcom/hotstar/ui/model/widget/IllustrationPillWidget;)Lcom/hotstar/bff/models/widget/BffIllustrationPillWidget;")
            }
            require(convIdx > 0) { "SubNavParser: pill converter call not found" }
            val pillReg = parser.getInstruction<OneRegisterInstruction>(convIdx + 1).registerA
            val wrapperReg = (0 until convIdx).last { i ->
                parserImpl[i].opcode == Opcode.NEW_INSTANCE &&
                    (parserImpl[i] as? ReferenceInstruction)?.reference.toString().contains("BffIllustrationPillSubMenuItem")
            }.let { parser.getInstruction<OneRegisterInstruction>(it).registerA }
            var head2 = -1
            for (j in convIdx downTo 0) {
                val ins = parserImpl[j]
                if (ins.opcode == Opcode.INVOKE_INTERFACE &&
                    (ins as? ReferenceInstruction)?.reference.toString().contains("Iterator;->hasNext")
                ) { head2 = j; break }
            }
            require(head2 >= 0) { "SubNavParser: loop head not found" }

            // The wrapper register doubles as the scratch: at this point it holds an
            // uninitialized ref (legal to overwrite); the non-empty path re-allocates it
            // before the original ctor, and the empty path nulls it (verifier-safe).
            parser.addInstructionsWithLabels(
                convIdx + 2,
                """
                iget-object v$wrapperReg, v$pillReg, Lcom/hotstar/bff/models/widget/BffIllustrationPillWidget;->d:Ljava/util/ArrayList;
                invoke-virtual {v$wrapperReg}, Ljava/util/ArrayList;->isEmpty()Z
                move-result v$wrapperReg
                if-nez v$wrapperReg, :sw_keep
                const/4 v$wrapperReg, 0x0
                goto/16 :sw_loop_head
                :sw_keep
                new-instance v$wrapperReg, Lcom/hotstar/bff/models/widget/BffIllustrationPillSubMenuItem;
                """.trimIndent(),
                ExternalLabel("sw_loop_head", parserImpl[head2])
            )
        }
    }
}
