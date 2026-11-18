package app.brokenn.patches.jiohotstar.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import app.brokenn.patches.jiohotstar.watchpage.AdaptiveTabConverterFingerprint

@Suppress("unused")
val hidePlayerButtonsPatch = bytecodePatch(
    name = "Hide player buttons",
    description = "Hides selected buttons from the fullscreen player's bottom bar."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    val hideWatchNext by booleanOption(
        key = "hide_watch_next", title = "Hide Watch Next",
        description = "Hides the Watch Next button.", default = false
    )
    val hideEpisodes by booleanOption(
        key = "hide_episodes", title = "Hide Episodes",
        description = "Hides the Episodes button.", default = false
    )
    val hideShop by booleanOption(
        key = "hide_shop", title = "Hide Shop",
        description = "Hides the Shop / Order Food button.", default = false
    )
    val hideSpeed by booleanOption(
        key = "hide_speed", title = "Hide Speed",
        description = "Hides the Speed button.", default = false
    )
    val hideRate by booleanOption(
        key = "hide_rate", title = "Hide Rate",
        description = "Hides the Rate button.", default = false
    )
    val hideNextEpisode by booleanOption(
        key = "hide_next_episode", title = "Hide Next Episode",
        description = "Hides the Next Episode button.", default = false
    )

    execute {
        val titles = buildList {
            if (hideWatchNext == true) add("Watch Next")
            if (hideEpisodes == true) add("Episodes")
            if (hideShop == true) add("Shop")
            if (hideSpeed == true) add("Speed")
            if (hideRate == true) add("Rate")
            if (hideNextEpisode == true) add("Next Episode")
        }
        if (titles.isEmpty()) return@execute

        // PlayerWidget converts menu items into settings sheet entries, 
        // ignoring hidden titles. Reverse-order patching preserves indices and ensures
        // safe register reassignment.
        val dConv = PlayerWidgetConverterFingerprint.method
        val dImpl = dConv.implementation!!.instructions

        data class Site(val idx: Int, val elemReg: Int, val loopHead: Int, val itemType: String)
        val sites = mutableListOf<Site>()
        dImpl.forEachIndexed { idx, ins ->
            if (ins.opcode == Opcode.INVOKE_STATIC) {
                val ref = (ins as? ReferenceInstruction)?.reference.toString()
                if (ref.contains("PlayerControlMenuItem;)")) {
                    val elemReg = dConv.getInstruction<OneRegisterInstruction>(idx + 1).registerA
                    var head = -1
                    for (j in idx downTo 0) {
                        val l = dImpl[j]
                        if (l.opcode == Opcode.INVOKE_INTERFACE &&
                            (l as? ReferenceInstruction)?.reference.toString().contains("Iterator;->hasNext")
                        ) { head = j; break }
                    }
                    require(head >= 0) { "PlayerWidgetConverter: loop head not found" }
                    // the item interface type is the converter call's return type — it is
                    // R8-obfuscated and must never be hardcoded
                    val itemType = ref.substringAfterLast(')')
                    sites.add(Site(idx, elemReg, head, itemType))
                }
            }
        }
        require(sites.isNotEmpty()) { "PlayerWidgetConverter: menu item sites not found" }

        for (site in sites.sortedByDescending { it.idx }) {
            val block = buildString {
                append("invoke-interface {v${site.elemReg}}, ${site.itemType}->getTitle()Ljava/lang/String;\n")
                append("move-result-object v13\n")
                titles.forEachIndexed { i, title ->
                    append("const-string v15, \"$title\"\n")
                    append("invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n")
                    append("move-result v15\n")
                    append("if-nez v15, :pi_hidden_$i\n")
                }
                // nop pins the trailing label to a real instruction
                append("goto/16 :pi_keep\n")
                titles.forEachIndexed { i, _ ->
                    append(":pi_hidden_$i\n")
                    append("goto/16 :pi_skip\n")
                }
                append(":pi_keep\n")
                append("nop\n")
            }
            dConv.addInstructionsWithLabels(
                site.idx + 2,
                block,
                ExternalLabel("pi_skip", dImpl[site.loopHead])
            )
        }

        // The fullscreen bottom tab bar uses the landscape converter loop,
        // so it needs a separate title-based filter. The existing patch only handles
        // portrait; side-sheet and peek lists are excluded because they aren't shown on phones.
        val tabContainer = AdaptiveTabConverterFingerprint.method
        val tabImpl = tabContainer.implementation!!.instructions
        val castSites = tabImpl.withIndex().filter { (_, ins) ->
            ins.opcode == Opcode.CHECK_CAST &&
                (ins as? ReferenceInstruction)?.reference.toString()
                    .contains("Lcom/hotstar/ui/model/widget/TabWidget;")
        }
        require(castSites.size >= 2) { "TabConverter: expected portrait and landscape casts" }
        val landscapeSite = castSites[1].index
        val itemReg = tabContainer.getInstruction<OneRegisterInstruction>(landscapeSite).registerA
        var landscapeHead = -1
        for (j in landscapeSite downTo 0) {
            val ins = tabImpl[j]
            if (ins.opcode == Opcode.INVOKE_INTERFACE &&
                (ins as? ReferenceInstruction)?.reference.toString().contains("Iterator;->hasNext")
            ) { landscapeHead = j; break }
        }
        require(landscapeHead >= 0) { "TabConverter: landscape loop head not found" }

        // The row's swiggy tab is titled "Order Food"
        val landscapeTitles = titles.toMutableList()
        if (hideShop == true && !landscapeTitles.contains("Order Food")) landscapeTitles.add("Order Food")

        val landscapeBlock = buildString {
            append("invoke-virtual {v$itemReg}, Lcom/hotstar/ui/model/widget/TabWidget;->getData()Lcom/hotstar/ui/model/widget/TabWidget${'$'}Data;\n")
            append("move-result-object v5\n")
            append("invoke-virtual {v5}, Lcom/hotstar/ui/model/widget/TabWidget${'$'}Data;->getTitle()Ljava/lang/String;\n")
            append("move-result-object v5\n")
            landscapeTitles.forEachIndexed { i, title ->
                append("const-string v6, \"$title\"\n")
                append("invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n")
                append("move-result v6\n")
                append("if-nez v6, :pl_hidden_$i\n")
            }
            append("goto/16 :pl_keep\n")
            landscapeTitles.forEachIndexed { i, _ ->
                append(":pl_hidden_$i\n")
                append("goto/16 :pl_skip\n")
            }
            append(":pl_keep\n")
            append("nop\n")
        }
        tabContainer.addInstructionsWithLabels(
            landscapeSite + 1,
            landscapeBlock,
            ExternalLabel("pl_skip", tabImpl[landscapeHead])
        )
    }
}
