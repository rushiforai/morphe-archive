package app.zeldrisho.patches.zalo.media

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.methodCall
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_STABLE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** Exposes the native save action for ordinary non-owner photo and video stories. */
@Suppress("unused")
val saveZaloStoriesPatch = bytecodePatch(
    name = "Save Zalo stories",
    description = "Adds the native save action to ordinary photo and video stories from other accounts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO_STABLE)
    execute {
        val method = StoryMenu.matchAll(1..1).single().method
        val implementation = requireNotNull(method.implementation)
        check(implementation.registerCount == 25) { "Story menu register layout changed" }
        val instructions = implementation.instructions
        val reportTitle = instructions.indices.singleOrNull { index ->
            (instructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                "Lrok;->str_bottom_sheet_menu_report_title:I"
        } ?: error("Story report action changed")
        val branch = instructions.indices.firstOrNull { index ->
            index + 1 < instructions.size && instructions[index].opcode == Opcode.IF_NEZ &&
                (instructions[index] as? OneRegisterInstruction)?.registerA == 11 &&
                (instructions[index + 1] as? ReferenceInstruction)?.reference?.toString() ==
                    "Lnc2;->Companion:Lmc2;"
        } ?: error("Story menu non-owner branch changed")
        check(reportTitle > branch) { "Story report action changed" }
        method.addInstructionsAtControlFlowLabel(branch, """
            if-eqz v5, :zeldris_story_continue
            iget v0, v5, Luwo;->p:I
            const/4 v1, 0x1
            if-eq v0, v1, :zeldris_story_continue
            const/4 v1, 0x5
            if-eq v0, v1, :zeldris_story_continue
            iget v0, v5, Luwo;->d:I
            const/4 v1, 0x1
            if-eq v0, v1, :zeldris_story_add
            const/4 v1, 0x2
            if-ne v0, v1, :zeldris_story_continue
            :zeldris_story_add
            sget-object v6, Lnc2;->Companion:Lmc2;
            const/16 v7, 0x24
            sget v8, Lvkk;->ic_bottom_sheet_story_download:I
            sget v9, Lrok;->str_bottom_sheet_story_download_tittle:I
            invoke-virtual {v3, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;
            move-result-object v9
            const/16 v10, 0x0
            const/16 v11, 0x0
            const/16 v12, 0x0
            const/16 v13, 0x0
            const/16 v14, 0x0
            const/16 v15, 0x1f0
            invoke-static/range {v6 .. v15}, Lmc2;->a(Lmc2;IILjava/lang/String;Ljava/lang/String;ZLandroid/graphics/drawable/Drawable;Ljava/lang/String;Lly8;I)Lnc2;
            move-result-object v0
            invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            :zeldris_story_continue
            nop
        """.trimIndent())
    }
}

private object StoryMenu : Fingerprint(
    definingClass = "Lsld;", name = "Q",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/util/List;",
    parameters = listOf("Llc2;"),
    filters = listOf(methodCall(definingClass = "Lkvr;", name = "o", returnType = "Luwo;")),
)
