package dev.vortexnode.sbrowserx.patches.tabs

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.vortexnode.sbrowserx.patches.core.sbrowserXCorePatch
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow

private const val AUTO_CLOSE_SETTINGS_CLASS =
    "Lcom/sec/android/app/sbrowser/settings/auto_close_unused_tabs/AutoCloseUnusedTabsSettings;"
private const val UNUSED_TAB_CLOSER_CLASS =
    "Lcom/sec/android/app/sbrowser/tab_manager/UnusedTabCloser;"

@Suppress("unused")
val autoClose1DayPatch = bytecodePatch(
    name = "Auto-close unused tabs: After 1 day",
    description = "Adds an 'After 1 day' option to the Auto-close unused tabs setting.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)
    dependsOn(sbrowserXCorePatch)

    execute {
        // 1. Add "close_after_1day" at index 1 in AutoCloseUnusedTabsSettings.getKeys()
        findMethodOrThrow(
            classType = AUTO_CLOSE_SETTINGS_CLASS,
            methodName = "getKeys",
            parameterTypes = emptyList(),
            returnType = "Ljava/util/List;",
        ).addInstructions(
            0,
            """
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->getAutoCloseKeys()Ljava/util/List;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )

        // 2. Insert localized "After 1 day" at index 1 in AutoCloseUnusedTabsSettings.getTitles()
        val getTitles = findMethodOrThrow(
            classType = AUTO_CLOSE_SETTINGS_CLASS,
            methodName = "getTitles",
            parameterTypes = emptyList(),
            returnType = "Ljava/util/List;",
        )
        val titleInsns = getTitles.implementation?.instructions?.toList()
            ?: error("Missing implementation in AutoCloseUnusedTabsSettings.getTitles")
        val retIdx = titleInsns.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        if (retIdx < 0) error("No return-object found in AutoCloseUnusedTabsSettings.getTitles")
        val retReg = (titleInsns[retIdx] as OneRegisterInstruction).registerA
        getTitles.addInstructions(
            retIdx,
            """
                invoke-static {v$retReg}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->insertAutoClose1DayTitle(Ljava/util/List;)Ljava/util/List;
                move-result-object v$retReg
            """.trimIndent(),
        )

        // 3. Delegate UnusedTabCloser.getTabStatusByLastUsedTime(JI)I to SBrowserXHooks
        findMethodOrThrow(
            classType = UNUSED_TAB_CLOSER_CLASS,
            methodName = "getTabStatusByLastUsedTime",
            parameterTypes = listOf("J", "I"),
            returnType = "I",
        ).addInstructions(
            0,
            """
                invoke-static {p1, p2, p3}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->getAutoCloseTabStatus(JI)I
                move-result v0
                return v0
            """.trimIndent(),
        )

        // 4. Update Smart Tab Delete index check (3 -> 4) in UnusedTabCloser
        listOf(
            "closeUnusedTabsBySmartTabDelete" to "Z",
            "closeUnusedTabsIfNeeded" to "V",
        ).forEach { (methodName, returnType) ->
            val method = findMethodOrThrow(
                classType = UNUSED_TAB_CLOSER_CLASS,
                methodName = methodName,
                parameterTypes = emptyList(),
                returnType = returnType,
            )
            val insns = method.implementation?.instructions?.toList()
                ?: error("Missing implementation in UnusedTabCloser.$methodName")
            val getterIdx = insns.indexOfFirst { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ref?.name == "getAutoCloseUnusedTabsSettings"
            }
            if (getterIdx < 0) error("Missing getAutoCloseUnusedTabsSettings call in $methodName")
            var patched = false
            for (i in getterIdx + 1 until minOf(insns.size, getterIdx + 10)) {
                val insn = insns[i]
                if (insn.opcode == Opcode.CONST_4 && (insn as NarrowLiteralInstruction).narrowLiteral == 3) {
                    val reg = (insn as OneRegisterInstruction).registerA
                    method.replaceInstruction(i, "const/4 v$reg, 0x4")
                    patched = true
                    break
                }
            }
            if (!patched) error("Could not find Smart Tab Delete index 3 constant in UnusedTabCloser.$methodName")
        }
    }
}
